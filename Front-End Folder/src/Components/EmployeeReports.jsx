import React, { useState, useEffect } from "react";
import axios from "axios";

const EmployeeReports = ({ employeeId }) => {
  const [report, setReport] = useState("");
  const [message, setMessage] = useState("");
  const [reports, setReports] = useState([]);

  const fetchReports = () => {
    axios.get(`http://localhost:3000/employee/reports/${employeeId}`)
      .then(res => {
        if (res.data.Status) setReports(res.data.Result);
      });
  };

  useEffect(() => {
    fetchReports();
    // eslint-disable-next-line
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!report.trim()) {
      setMessage("Please enter your report.");
      return;
    }
    axios.post("http://localhost:3000/employee/add_report", {
      employee_id: employeeId,
      report: report,
      date: new Date().toISOString().slice(0, 10) // Thêm trường date
    }).then(res => {
      setMessage(res.data.Message || res.data.Error);
      if (res.data.Status) {
        setReport("");
        fetchReports();
      }
    });
  };

  return (
    <div className="container mt-4">
      <h2>Enter Your Report</h2>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <textarea
            className="form-control2"
            rows={6}
            value={report}
            onChange={e => setReport(e.target.value)}
            placeholder="Enter your report here..."
          />
        </div>
        <button type="submit" className="btn btn-primary">Submit</button>
      </form>
      {message && <div className="mt-2">{message}</div>}
      <ul>
        {reports.map(r => (
          <li key={r.id}>
            <span style={{ whiteSpace: "pre-line" }}>{r.report}</span>
            {" "}({new Date(r.date).toLocaleDateString()})
          </li>
        ))}
      </ul>
    </div>
  );
};

export default EmployeeReports;