import axios from "axios"; 
import express from "express";
import pool from "../utils/db_pool.js";
import jwt from "jsonwebtoken";
import bcrypt from 'bcrypt'
import multer from "multer";
import path from "path";
import moment from "moment";

const router = express.Router();

// Đăng nhập admin
router.post("/adminlogin", async (req, res) => {
  const sql = "SELECT * from admin Where email = ? and password = ?";
  try {
    const [result] = await pool.query(sql, [req.body.email, req.body.password]);
    if (result.length > 0) {
      const email = result[0].email;
      const token = jwt.sign(
        { role: "admin", email: email, id: result[0].id },
        "jwt_secret_key",
        { expiresIn: "1d" }
      );
      res.cookie('token', token)
      return res.json({ loginStatus: true });
    } else {
      return res.json({ loginStatus: false, Error:"wrong email or password" });
    }
  } catch (err) {
    return res.json({ loginStatus: false, Error: "Query error" });
  }
});

// Lấy category
router.get('/category', async (req, res) => {
  const sql = "SELECT * FROM category";
  try {
    const [result] = await pool.query(sql);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"});
  }
});

// Thêm category
router.post('/add_category', async (req, res) => {
  const sql = "INSERT INTO category (`name`) VALUES (?)"
  try {
    await pool.query(sql, [req.body.category]);
    return res.json({Status: true});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"});
  }
});

// image upload 
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'Public/Images')
  },
  filename: (req, file, cb) => {
    cb(null, file.fieldname + "_" + Date.now() + path.extname(file.originalname))
  }
})
const upload = multer({
  storage: storage
})
// end image upload 

router.post('/add_employee', upload.single('image'), async (req, res) => {
  const sql = `INSERT INTO employee 
    (name,email,password, address, salary,image, category_id) 
    VALUES (?)`;
  try {
    const hash = await bcrypt.hash(req.body.password, 10);
    const values = [
      req.body.name,
      req.body.email,
      hash,
      req.body.address,
      req.body.salary, 
      req.file.filename,
      req.body.category_id
    ]
    await pool.query(sql, [values]);
    return res.json({Status: true});
  } catch (err) {
    return res.json({Status: false, Error: err});
  }
});

router.get('/employee', async (req, res) => {
  const search = req.query.search || '';
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 10;
  const offset = (page - 1) * limit;

  let where = '';
  let params = [];

  if (search) {
    where = 'WHERE name LIKE ? OR email LIKE ? OR address LIKE ?';
    params.push(`%${search}%`, `%${search}%`, `%${search}%`);
  }

  const sql = `SELECT * FROM employee ${where} LIMIT ? OFFSET ?`;
  params.push(limit, offset);

  const countSql = `SELECT COUNT(*) as total FROM employee ${where}`;

  try {
    const [result] = await pool.query(sql, params);
    const [countResult] = await pool.query(countSql, params.slice(0, -2));
    res.json({
      Status: true,
      Result: result,
      Total: countResult[0].total
    });
  } catch (err) {
    return res.json({ Status: false, Error: err });
  }
});

router.get('/employee/:id', async (req, res) => {
  const id = req.params.id;
  const sql = "SELECT * FROM employee WHERE id = ?";
  try {
    const [result] = await pool.query(sql, [id]);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"});
  }
});

router.put('/edit_employee/:id', async (req, res) => {
  const id = req.params.id;
  const sql = `UPDATE employee 
    set name = ?, email = ?, salary = ?, address = ?, category_id = ? 
    Where id = ?`
  const values = [
    req.body.name,
    req.body.email,
    req.body.salary,
    req.body.address,
    req.body.category_id
  ]
  try {
    const [result] = await pool.query(sql, [...values, id]);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.delete('/delete_employee/:id', async (req, res) => {
  const id = req.params.id;
  const sql = "delete from employee where id = ?"
  try {
    const [result] = await pool.query(sql, [id]);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.get('/admin_count', async (req, res) => {
  const sql = "select count(id) as admin from admin";
  try {
    const [result] = await pool.query(sql);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.get('/employee_count', async (req, res) => {
  const sql = "select count(id) as employee from employee";
  try {
    const [result] = await pool.query(sql);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.get('/salary_count', async (req, res) => {
  const sql = "select sum(salary) as salaryOFEmp from employee";
  try {
    const [result] = await pool.query(sql);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.get('/admin_records', async (req, res) => {
  const sql = "select * from admin"
  try {
    const [result] = await pool.query(sql);
    return res.json({Status: true, Result: result});
  } catch (err) {
    return res.json({Status: false, Error: "Query Error"+err});
  }
});

router.get('/logout', (req, res) => {
  res.clearCookie('token')
  return res.json({Status: true})
})

// Auto-schedule work shifts for all employees (Monday-Saturday, 2 shifts/day)
router.post('/auto_schedule', async (req, res) => {
  try {
    // 1. Get all employees
    const [employees] = await pool.query("SELECT id FROM employee");
    if (!employees.length) return res.json({ Status: false, Error: "No employees found" });

    // 2. Prepare schedule parameters
    const startDate = moment().startOf('isoWeek'); // Monday this week
    const days = 6; // Monday to Saturday
    const shifts = ['morning', 'night'];
    let schedule = [];

    // 3. Remove old schedules for this week (optional)
    const weekDates = [];
    for (let d = 0; d < days; d++) {
      weekDates.push(startDate.clone().add(d, 'days').format('YYYY-MM-DD'));
    }
    await pool.query(
      "DELETE FROM work_schedules WHERE date IN (?)",
      [weekDates]
    );

    // 4. Round-robin assignment: Each employee works one shift per day, not two consecutive shifts
    let empIdx = 0;
    let lastShift = {}; // employee_id: 'morning'/'night'

    for (let d = 0; d < days; d++) {
      const date = startDate.clone().add(d, 'days').format('YYYY-MM-DD');
      // Shuffle employees for fairness
      const empOrder = [...employees];
      for (let i = empOrder.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [empOrder[i], empOrder[j]] = [empOrder[j], empOrder[i]];
      }
      // Assign shifts
      let morningCount = 0, nightCount = 0;
      for (let i = 0; i < empOrder.length; i++) {
        const emp = empOrder[i];
        // Alternate shift for each employee, avoid consecutive same shift
        let shift = (i % 2 === 0) ? 'morning' : 'night';
        if (lastShift[emp.id] === shift) shift = (shift === 'morning') ? 'night' : 'morning';
        if (shift === 'morning') morningCount++; else nightCount++;
        schedule.push([emp.id, date, shift]);
        lastShift[emp.id] = shift;
      }
    }

    // 5. Insert schedule into DB
    await pool.query(
      "INSERT INTO work_schedules (employee_id, date, shift) VALUES ?",
      [schedule]
    );

    res.json({ Status: true, Message: "Auto-scheduling completed", ScheduleCount: schedule.length });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

router.get('/work_schedules_this_week_with_employee', async (req, res) => {
  const sql = `
    SELECT ws.*, e.name
    FROM work_schedules ws
    JOIN employee e ON ws.employee_id = e.id
    WHERE YEARWEEK(ws.date, 1) = YEARWEEK(CURDATE(), 1)
  `;
  try {
    const [result] = await pool.query(sql);
    return res.json({ Status: true, Result: result });
  } catch (err) {
    return res.json({ Status: false, Error: err.message });
  }
});

router.get('/employee_evaluations', async (req, res) => {
  try {
    const search = req.query.search || '';
    let sql = `
      SELECT ee.id, ee.employee_id, e.name, ee.comment, ee.type, ee.performance_percent, ee.bonus_salary, ee.created_at
      FROM employee_evaluations ee
      JOIN employee e ON ee.employee_id = e.id
    `;
    let params = [];
    if (search) {
      sql += ` WHERE e.name LIKE ? OR ee.employee_id LIKE ? `;
      params.push(`%${search}%`, `%${search}%`);
    }
    sql += ` ORDER BY ee.created_at DESC`;
    const [rows] = await pool.query(sql, params);
    res.json({ Status: true, Result: rows });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

export { router as adminRouter };
