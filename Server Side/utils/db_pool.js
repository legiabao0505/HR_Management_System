import mysql from 'mysql2/promise';

// Kết nối dạng promise (cho async/await)
const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "employeems",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

export default pool;