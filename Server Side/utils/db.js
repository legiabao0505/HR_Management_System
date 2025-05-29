import mysql from 'mysql2';

// Kết nối dạng callback (cho code cũ)
const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "employeems"
});

con.connect(function(err) {
    if (err) {
        console.log("connection error");
    } else {
        console.log("Connected");
    }
});

export default con;