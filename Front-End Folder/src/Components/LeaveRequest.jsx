import React, { useState } from "react";
import axios from "axios";

const LeaveRequest = () => {
  const [date, setDate] = useState("");
  const [reason, setReason] = useState("");
  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    // Giả sử employee_id lấy từ localStorage/session hoặc props
    const employee_id = localStorage.getItem("employee_id") || 1;
    try {
      const res = await axios.post("http://localhost:3000/auth/leave_request", {
        employee_id,
        date,
        reason,
      });
      setMessage(res.data.Message || res.data.Error);
      setDate("");
      setReason("");
    } catch {
      setMessage("Server error!");
    }
  };

  return (
    <div className="container mt-4">
      <h3 style={{ color: "#1ea69a", fontWeight: 700, letterSpacing: 1, textAlign: "center" }}>
        Leave Request
      </h3>
      <form className="mt-3" onSubmit={handleSubmit}>
        <input
          type="date"
          className="form-control mb-2"
          value={date}
          onChange={e => setDate(e.target.value)}
          required
        />
        <textarea
          className="form-control mb-2"
          placeholder="Reason"
          value={reason}
          onChange={e => setReason(e.target.value)}
          required
        />
        <button className="btn btn-primary">Submit</button>
      </form>
      {message && <div className="mt-2">{message}</div>}
    </div>
  );
};

export default LeaveRequest;