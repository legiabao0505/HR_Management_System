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
    return res.json({ Status: false, Error: err.message || String(err) });
  }
});

router.get('/employee', async (req, res) => {
  const search = req.query.search || '';
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 10;
  const offset = (page - 1) * limit;
  const category_id = req.query.category_id || '';
  const min_salary = req.query.min_salary || '';
  const max_salary = req.query.max_salary || '';
  const ai_type = req.query.ai_type || '';

  let where = [];
  let params = [];

  if (search) {
    where.push('(name LIKE ? OR email LIKE ? OR address LIKE ?)');
    params.push(`%${search}%`, `%${search}%`, `%${search}%`);
  }
  if (category_id) {
    where.push('category_id = ?');
    params.push(category_id);
  }
  if (min_salary) {
    where.push('salary >= ?');
    params.push(min_salary);
  }
  if (max_salary) {
    where.push('salary <= ?');
    params.push(max_salary);
  }
  // Nếu lọc theo loại AI (A/B/C)
  if (ai_type) {
    where.push(`id IN (
      SELECT employee_id FROM employee_evaluations
      WHERE type = ?
    )`);
    params.push(ai_type);
  }

  const whereStr = where.length ? 'WHERE ' + where.join(' AND ') : '';
  const sql = `SELECT * FROM employee ${whereStr} LIMIT ? OFFSET ?`;
  params.push(limit, offset);

  const countSql = `SELECT COUNT(*) as total FROM employee ${whereStr}`;

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
  try {
    // Lấy tổng salary từ bảng employee
    const [salaryResult] = await pool.query(
      "SELECT SUM(salary) AS total_salary FROM employee"
    );

    // Lấy tổng bonus_salary mới nhất của mỗi employee từ employee_evaluations
    const [bonusResult] = await pool.query(`
      SELECT IFNULL(SUM(bonus_salary),0) AS total_bonus
      FROM (
        SELECT ee.bonus_salary
        FROM employee_evaluations ee
        INNER JOIN (
          SELECT employee_id, MAX(id) AS max_id
          FROM employee_evaluations
          GROUP BY employee_id
        ) latest ON ee.employee_id = latest.employee_id AND ee.id = latest.max_id
      ) t
    `);

    const total = Number(salaryResult[0].total_salary || 0) + Number(bonusResult[0].total_bonus || 0);

    res.json({ Status: true, Result: [{ salaryOFEmp: total }] });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
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
    const [employees] = await pool.query("SELECT id FROM employee");
    if (!employees.length) return res.json({ Status: false, Error: "No employees found" });

    // Start from the first Monday of the month
    let startDate = moment().startOf('month');
    while (startDate.isoWeekday() !== 1) { // 1 = Monday
      startDate.add(1, 'day');
    }
    const endDate = moment(startDate).endOf('month');
    let schedule = [];

    // Remove old schedules for this month
    await pool.query(
      "DELETE FROM work_schedules WHERE date >= ? AND date <= ?",
      [startDate.clone().startOf('month').format('YYYY-MM-DD'), endDate.format('YYYY-MM-DD')]
    );

    // Generate schedule for each day (skip Sundays)
    let current = startDate.clone();
    let weekNumber = 1;
    let lastWeek = current.isoWeek();

    while (current.isSameOrBefore(endDate, 'day')) {
      const dayOfWeek = current.isoWeekday(); // 1=Monday, 7=Sunday

      // Increase weekNumber when a new week starts
      if (current.isoWeek() !== lastWeek) {
        weekNumber++;
        lastWeek = current.isoWeek();
      }

      if (dayOfWeek !== 7) { // Skip Sunday
        for (let emp of employees) {
          let shift;
          if (emp.id % 2 === 1) { // Odd id
            shift = weekNumber % 2 === 1 ? 'morning' : 'night';
          } else { // Even id
            shift = weekNumber % 2 === 1 ? 'night' : 'morning';
          }
          schedule.push([emp.id, current.format('YYYY-MM-DD'), shift]);
        }
      }
      current.add(1, 'day');
    }

    if (schedule.length > 0) {
      await pool.query(
        "INSERT INTO work_schedules (employee_id, date, shift) VALUES ?",
        [schedule]
      );
    }

    res.json({ Status: true, Message: "Auto-scheduling for 1 month completed", ScheduleCount: schedule.length });
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

router.get('/work_schedules_this_month_with_employee', async (req, res) => {
  try {
    const sql = `
      SELECT ws.id, ws.employee_id, e.name, DATE_FORMAT(ws.date, '%Y-%m-%d') as date, ws.shift
      FROM work_schedules ws
      JOIN employee e ON ws.employee_id = e.id
      WHERE MONTH(ws.date) = MONTH(CURDATE()) AND YEAR(ws.date) = YEAR(CURDATE())
      ORDER BY ws.employee_id, ws.date
    `;
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
      SELECT ee.id, ee.employee_id, e.name, ee.comment, ee.type, ee.performance_percent, ee.bonus_salary, ee.created_at, ee.suggestion
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

// API: Thống kê số lượng user, tổng lương, số nhân viên đạt A/B/C theo category
router.get('/category_stats', async (req, res) => {
  try {
    // Số lượng user và tổng lương từng category
    const [catStats] = await pool.query(`
      SELECT 
        c.id AS category_id,
        c.name AS category_name,
        COUNT(e.id) AS employee_count,
        IFNULL(SUM(e.salary),0) AS total_salary
      FROM category c
      LEFT JOIN employee e ON e.category_id = c.id
      GROUP BY c.id, c.name
    `);

    // Số nhân viên đạt A/B/C từng category (lấy xếp loại mới nhất)
    const [gradeStats] = await pool.query(`
      SELECT 
        c.id AS category_id,
        ee.type,
        COUNT(DISTINCT ee.employee_id) AS count
      FROM category c
      LEFT JOIN employee e ON e.category_id = c.id
      LEFT JOIN (
        SELECT t1.*
        FROM employee_evaluations t1
        INNER JOIN (
          SELECT employee_id, MAX(id) AS max_id
          FROM employee_evaluations
          GROUP BY employee_id
        ) t2 ON t1.employee_id = t2.employee_id AND t1.id = t2.max_id
      ) ee ON ee.employee_id = e.id
      WHERE ee.type IS NOT NULL
      GROUP BY c.id, ee.type
    `);

    // Gộp dữ liệu
    const result = catStats.map(cat => {
      const grades = { A: 0, B: 0, C: 0 };
      gradeStats.forEach(g => {
        if (g.category_id === cat.category_id && g.type) {
          grades[g.type] = g.count;
        }
      });
      return {
        ...cat,
        grade_A: grades.A,
        grade_B: grades.B,
        grade_C: grades.C
      };
    });

    res.json({ Status: true, Result: result });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

router.post('/update_employee_schedule', async (req, res) => {
  try {
    const { employee_id, schedules } = req.body;
    // Xóa lịch cũ của nhân viên trong tháng
    await pool.query(
      "DELETE FROM work_schedules WHERE employee_id = ? AND MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())",
      [employee_id]
    );
    // Thêm lịch mới
    if (schedules.length > 0) {
      const values = schedules.map(item => [employee_id, item.date, item.shift]);
      await pool.query(
        "INSERT INTO work_schedules (employee_id, date, shift) VALUES ?",
        [values]
      );
    }
    res.json({ Status: true });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

router.get('/employee_report/:employee_id', async (req, res) => {
  try {
    const { employee_id } = req.params;
    const [result] = await pool.query(
      "SELECT report FROM reports WHERE employee_id = ? ORDER BY date DESC LIMIT 1",
      [employee_id]
    );
    if (result.length > 0) {
      res.json({ Status: true, Report: result[0].report });
    } else {
      res.json({ Status: false, Error: "No report found" });
    }
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

router.post('/leave_request', async (req, res) => {
  try {
    const { employee_id, date, reason } = req.body;
    await pool.query(
      "INSERT INTO leave_requests (employee_id, date, reason, status) VALUES (?, ?, ?, 'pending')",
      [employee_id, date, reason]
    );
    res.json({ Status: true, Message: "Leave request submitted" });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

router.get('/leave_requests', async (req, res) => {
  try {
    const [result] = await pool.query(`
      SELECT lr.*, e.name FROM leave_requests lr
      JOIN employee e ON e.id = lr.employee_id
      ORDER BY lr.date DESC
    `);
    res.json({ Status: true, Result: result });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});

// API: Lấy lịch làm việc của 1 nhân viên
router.get('/work_schedule/:id', async (req, res) => {
  const employee_id = req.params.id;
  try {
    const [result] = await pool.query(
      "SELECT * FROM work_schedules WHERE employee_id = ? ORDER BY date ASC",
      [employee_id]
    );
    res.json({ Status: true, Result: result });
  } catch (err) {
    res.json({ Status: false, Error: err.message });
  }
});


export { router as adminRouter };
