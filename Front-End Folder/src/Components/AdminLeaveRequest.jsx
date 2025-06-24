import React, { useState, useEffect } from "react";
import axios from "axios";

const AdminLeaveRequest = () => {
  const [employees, setEmployees] = useState([]);
  const [selectedEmployeeId, setSelectedEmployeeId] = useState("");
  const [date, setDate] = useState("");
  const [reason, setReason] = useState("");
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);

  // Lấy danh sách employees
  useEffect(() => {
    fetchEmployees();
  }, []);

  const fetchEmployees = async () => {
    try {
      const res = await axios.get("http://localhost:3000/auth/employee");
      if (res.data.Status) {
        setEmployees(res.data.Result);
      }
    } catch (error) {
      console.error("Error fetching employees:", error);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!selectedEmployeeId) {
      setMessage({ type: "error", text: "Please select an employee" });
      return;
    }

    setLoading(true);
    setMessage("");

    try {
      const res = await axios.post("http://localhost:3000/employee/leave_request", {
        employee_id: selectedEmployeeId,
        date,
        reason,
      });
      
      if (res.data.Status) {
        setMessage({ type: "success", text: "Leave request submitted successfully" });
        setSelectedEmployeeId("");
        setDate("");
        setReason("");
      } else {
        setMessage({ type: "error", text: res.data.Error });
      }
    } catch (error) {
      setMessage({ type: "error", text: "Server error!" });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="container mt-4">
      <div className="row justify-content-center">
        <div className="col-md-8">
          <div className="card">
            <div className="card-header">
              <h4 style={{ color: "#1ea69a", fontWeight: 700 }}>
                <i className="bi bi-calendar-plus me-2"></i>
                Submit Leave Request (Admin)
              </h4>
              <p className="text-muted mb-0">Submit leave request on behalf of an employee</p>
            </div>
            <div className="card-body">
              <form onSubmit={handleSubmit}>
                <div className="mb-3">
                  <label htmlFor="employee" className="form-label">Select Employee *</label>
                  <select
                    id="employee"
                    className="form-select"
                    value={selectedEmployeeId}
                    onChange={e => setSelectedEmployeeId(e.target.value)}
                    required
                  >
                    <option value="">Choose an employee...</option>
                    {employees.map((employee) => (
                      <option key={employee.id} value={employee.id}>
                        {employee.name} (ID: {employee.id}) - {employee.email}
                      </option>
                    ))}
                  </select>
                </div>
                
                <div className="mb-3">
                  <label htmlFor="date" className="form-label">Leave Date *</label>
                  <input
                    type="date"
                    id="date"
                    className="form-control"
                    value={date}
                    onChange={e => setDate(e.target.value)}
                    min={new Date().toISOString().split('T')[0]}
                    required
                  />
                </div>
                
                <div className="mb-3">
                  <label htmlFor="reason" className="form-label">Reason *</label>
                  <textarea
                    id="reason"
                    className="form-control"
                    placeholder="Enter reason for leave"
                    value={reason}
                    onChange={e => setReason(e.target.value)}
                    rows="4"
                    required
                  />
                </div>
                
                <div className="d-grid">
                  <button 
                    type="submit" 
                    className="btn btn-primary"
                    disabled={loading}
                  >
                    {loading ? (
                      <>
                        <span className="spinner-border spinner-border-sm me-2" role="status"></span>
                        Submitting...
                      </>
                    ) : (
                      <>
                        <i className="bi bi-send me-2"></i>
                        Submit Leave Request
                      </>
                    )}
                  </button>
                </div>
              </form>
              
              {message && (
                <div className={`alert ${message.type === 'success' ? 'alert-success' : 'alert-danger'} mt-3`}>
                  <i className={`bi ${message.type === 'success' ? 'bi-check-circle' : 'bi-exclamation-triangle'} me-2`}></i>
                  {message.text}
                </div>
              )}
            </div>
          </div>

          {/* Quick Actions */}
          <div className="card mt-4">
            <div className="card-header">
              <h5>Quick Actions</h5>
            </div>
            <div className="card-body">
              <div className="row">
                <div className="col-md-6">
                  <div className="d-grid">
                    <a href="/dashboard/leave_management" className="btn btn-outline-primary">
                      <i className="bi bi-calendar-check me-2"></i>
                      Manage Leave Requests
                    </a>
                  </div>
                </div>
                <div className="col-md-6">
                  <div className="d-grid">
                    <a href="/dashboard/employee" className="btn btn-outline-secondary">
                      <i className="bi bi-people me-2"></i>
                      Manage Employees
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminLeaveRequest;
