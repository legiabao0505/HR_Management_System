import express from 'express'
import con from "../utils/db.js";
import pool from "../utils/db_pool.js";
import jwt from "jsonwebtoken";
import bcrypt from 'bcrypt'
import axios from "axios"; 
import OpenAI from "openai";

export const EmployeeRouter = express.Router();

const token = process.env.GITHUB_TOKEN; // Đúng tên biến môi trường
const endpoint = "https://models.github.ai/inference";
const modelName = "openai/gpt-4o";

// Đăng nhập employee (callback style)
EmployeeRouter.post("/employee_login", (req, res) => {
    const sql = "SELECT * from employee Where email = ?";
    con.query(sql, [req.body.email], (err, result) => {
      if (err) return res.json({ loginStatus: false, Error: "Query error" });
      if (result.length > 0) {
        bcrypt.compare(req.body.password, result[0].password, (err, response) => {
            if (err) return res.json({ loginStatus: false, Error: "Wrong Password" });
            if(response) {
                const email = result[0].email;
                const token = jwt.sign(
                    { role: "employee", email: email, id: result[0].id },
                    "jwt_secret_key",
                    { expiresIn: "1d" }
                );
                res.cookie('token', token)
                return res.json({ loginStatus: true, id: result[0].id });
            } else {
                return res.json({ loginStatus: false, Error:"wrong email or password" });
            }
        });
      } else {
          return res.json({ loginStatus: false, Error:"wrong email or password" });
      }
    });
});

// Lấy chi tiết employee (callback style)
EmployeeRouter.get('/detail/:id', (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM employee where id = ?"
    con.query(sql, [id], (err, result) => {
        if(err) return res.json({Status: false});
        return res.json(result)
    })
})

// Đăng xuất
EmployeeRouter.get('/logout', (req, res) => {
    res.clearCookie('token')
    return res.json({Status: true})
})

// Lấy lịch làm việc (callback style)
EmployeeRouter.get('/work_schedule/:id', (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM work_schedules WHERE employee_id = ?";
    con.query(sql, [id], (err, result) => {
      if (err) return res.json({ Status: false, Error: err.message });
      return res.json({ Status: true, Result: result });
    });
});

EmployeeRouter.post('/add_report', async (req, res) => {
    const { employee_id, report } = req.body;
    const date = new Date();
    try {
        // 1. Lưu báo cáo vào bảng reports
        await pool.query(
            "INSERT INTO reports (employee_id, report, date) VALUES (?, ?, ?)",
            [employee_id, report, date]
        );

        // 2. Lấy báo cáo mới nhất vừa lưu
        const [latestReport] = await pool.query(
            "SELECT report, date FROM reports WHERE employee_id = ? ORDER BY date DESC LIMIT 1",
            [employee_id]
        );
        if (latestReport.length) {
            // Kiểm tra đã đánh giá report mới nhất chưa
            const [latestEval] = await pool.query(
                "SELECT * FROM employee_evaluations WHERE employee_id = ? AND DATE(created_at) = ?",
                [employee_id, latestReport[0].date]
            );
            if (!latestEval.length) {
                // Ghép nội dung báo cáo (chỉ lấy báo cáo mới nhất)
                const reportsText = latestReport[0].report;
                const prompt = `
You are an HR expert. Based on the following employee's report, evaluate their performance as a percentage (0-100%), and provide a short justification.
Return JSON: { "performance_percent": ..., "comment": "..." }
Report:
${reportsText}
`;
                // Gọi AI, nếu lỗi thì dùng giá trị mặc định
                let performance_percent = 80;
                let comment = "Good job";
                try {
                    const client = new OpenAI({ baseURL: endpoint, apiKey: process.env.OPENAI_API_KEY });
                    const response = await client.chat.completions.create({
                        messages: [
                            { role: "system", content: "You are an HR expert." },
                            { role: "user", content: prompt }
                        ],
                        temperature: 0.7,
                        top_p: 1.0,
                        max_tokens: 512,
                        model: modelName
                    });
                    // Xử lý content để loại bỏ dấu ``` và ```json nếu có
                    let content = response.choices[0].message.content.trim();
                    // Loại bỏ các dòng bắt đầu bằng ```
                    if (content.startsWith("```")) {
                        content = content.replace(/^```[a-zA-Z]*\n?/, "").replace(/```$/, "").trim();
                    }
                    const aiData = JSON.parse(content);
                    performance_percent = aiData.performance_percent;
                    comment = aiData.comment;
                } catch (e) {
                    console.error("AI error:", e);
                    performance_percent = 80;
                    comment = "AI service unavailable. Default evaluation applied.";
                }
                // Xếp loại và tính thưởng
                let type = "C";
                let bonus_percent = 0.02;
                if (performance_percent >= 90) {
                    type = "A";
                    bonus_percent = 0.10;
                } else if (performance_percent >= 70) {
                    type = "B";
                    bonus_percent = 0.05;
                }
                // Lấy lương employee
                const [emp] = await pool.query("SELECT salary FROM employee WHERE id = ?", [employee_id]);
                const bonus_salary = emp.length ? Math.round(emp[0].salary * bonus_percent) : 0;
                // Lưu kết quả vào DB
                await pool.query(
                    "INSERT INTO employee_evaluations (employee_id, type, performance_percent, bonus_salary, comment) VALUES (?, ?, ?, ?, ?)",
                    [employee_id, type, performance_percent, bonus_salary, comment]
                );
            }
        }

        return res.json({ Status: true, Message: "Report submitted and evaluated successfully" });
    } catch (err) {
        return res.json({ Status: false, Error: err.message });
    }
});

