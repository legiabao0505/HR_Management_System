import express from "express";
import con from "../utils/db.js";
import jwt from "jsonwebtoken";
import bcrypt from 'bcrypt'
import multer from "multer";
import path from "path";
import moment from "moment";

const router = express.Router();

router.post("/adminlogin", (req, res) => {
  const sql = "SELECT * from admin Where email = ? and password = ?";
  con.query(sql, [req.body.email, req.body.password], (err, result) => {
    if (err) return res.json({ loginStatus: false, Error: "Query error" });
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
  });
});

router.get('/category', (req, res) => {
    const sql = "SELECT * FROM category";
    con.query(sql, (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"})
        return res.json({Status: true, Result: result})
    })
})

router.post('/add_category', (req, res) => {
    const sql = "INSERT INTO category (`name`) VALUES (?)"
    con.query(sql, [req.body.category], (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"})
        return res.json({Status: true})
    })
})

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
// end imag eupload 

router.post('/add_employee',upload.single('image'), (req, res) => {
    const sql = `INSERT INTO employee 
    (name,email,password, address, salary,image, category_id) 
    VALUES (?)`;
    bcrypt.hash(req.body.password, 10, (err, hash) => {
        if(err) return res.json({Status: false, Error: "Query Error"})
        const values = [
            req.body.name,
            req.body.email,
            hash,
            req.body.address,
            req.body.salary, 
            req.file.filename,
            req.body.category_id
        ]
        con.query(sql, [values], (err, result) => {
            if(err) return res.json({Status: false, Error: err})
            return res.json({Status: true})
        })
    })
})

router.get('/employee', (req, res) => {
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

    con.query(sql, params, (err, result) => {
        if (err) return res.json({ Status: false, Error: err });

        con.query(countSql, params.slice(0, -2), (err2, countResult) => {
            if (err2) return res.json({ Status: false, Error: err2 });
            res.json({
                Status: true,
                Result: result,
                Total: countResult[0].total
            });
        });
    });
})

router.get('/employee/:id', (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM employee WHERE id = ?";
    con.query(sql,[id], (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"})
        return res.json({Status: true, Result: result})
    })
})

router.put('/edit_employee/:id', (req, res) => {
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
    con.query(sql,[...values, id], (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.delete('/delete_employee/:id', (req, res) => {
    const id = req.params.id;
    const sql = "delete from employee where id = ?"
    con.query(sql,[id], (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.get('/admin_count', (req, res) => {
    const sql = "select count(id) as admin from admin";
    con.query(sql, (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.get('/employee_count', (req, res) => {
    const sql = "select count(id) as employee from employee";
    con.query(sql, (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.get('/salary_count', (req, res) => {
    const sql = "select sum(salary) as salaryOFEmp from employee";
    con.query(sql, (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.get('/admin_records', (req, res) => {
    const sql = "select * from admin"
    con.query(sql, (err, result) => {
        if(err) return res.json({Status: false, Error: "Query Error"+err})
        return res.json({Status: true, Result: result})
    })
})

router.get('/logout', (req, res) => {
    res.clearCookie('token')
    return res.json({Status: true})
})

// Auto-schedule work shifts for all employees (Monday-Saturday, 2 shifts/day)
router.post('/auto_schedule', async (req, res) => {
    try {
        // 1. Get all employees
        const [employees] = await con.promise().query("SELECT id FROM employee");
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
        await con.promise().query(
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
        await con.promise().query(
            "INSERT INTO work_schedules (employee_id, date, shift) VALUES ?",
            [schedule]
        );

        res.json({ Status: true, Message: "Auto-scheduling completed", ScheduleCount: schedule.length });
    } catch (err) {
        res.json({ Status: false, Error: err.message });
    }
});

router.get('/work_schedules_this_week_with_employee', (req, res) => {
  const sql = `
    SELECT ws.*, e.name
    FROM work_schedules ws
    JOIN employee e ON ws.employee_id = e.id
    WHERE YEARWEEK(ws.date, 1) = YEARWEEK(CURDATE(), 1)
  `;
  con.query(sql, (err, result) => {
    if (err) return res.json({ Status: false, Error: err.message });
    return res.json({ Status: true, Result: result });
  });
});

export { router as adminRouter };
