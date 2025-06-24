import React, { useState, useEffect } from "react";
import axios from "axios";
import "./style.css";

const LeaveRequest = ({ employeeId }) => {
  const [date, setDate] = useState("");
  const [toDate, setToDate] = useState("");
  const [reason, setReason] = useState("");
  const [message, setMessage] = useState("");
  const [leaveRequests, setLeaveRequests] = useState([]);
  const [loading, setLoading] = useState(false);// Lấy danh sách leave requests của employee
  useEffect(() => {
    if (employeeId) {
      fetchLeaveRequests();
    }
  }, [employeeId]);
  const fetchLeaveRequests = async () => {
    try {
      const res = await axios.get(`http://localhost:3000/employee/leave_requests/${employeeId}`);
      if (res.data.Status) {
        setLeaveRequests(res.data.Result);
      } else {
        console.error("API Error:", res.data.Error);
        setLeaveRequests([]); // Set empty array if error
      }
    } catch (error) {
      console.error("Error fetching leave requests:", error);
      setLeaveRequests([]); // Set empty array if error
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMessage("");    try {
      const res = await axios.post("http://localhost:3000/employee/leave_request", {
        employee_id: employeeId,
        date,
        to_date: toDate,
        reason,
      });
      
      if (res.data.Status) {
        setMessage({ type: "success", text: res.data.Message });
        setDate("");
        setToDate("");
        setReason("");
        fetchLeaveRequests(); // Refresh danh sách
      } else {
        setMessage({ type: "error", text: res.data.Error });
      }
    } catch (error) {
      setMessage({ type: "error", text: "Server error!" });
    } finally {
      setLoading(false);
    }
  };

  const getStatusBadge = (status) => {
    const badges = {
      pending: "badge bg-warning text-dark",
      approved: "badge bg-success",
      rejected: "badge bg-danger"
    };
    return badges[status] || "badge bg-secondary";
  };

  // Early return if no employeeId
  if (!employeeId) {
    return (
      <div className="container mt-4">
        <div className="alert alert-warning">
          <i className="bi bi-exclamation-triangle me-2"></i>
          Employee ID not found. Please try again.
        </div>
      </div>
    );
  }  return (
    <div className="leave-request-container">
      <div className="container mt-4">
        <div className="row">
          {/* Form đăng ký nghỉ phép */}
          <div className="col-md-6">
            <div className="card leave-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-calendar-plus me-2"></i>
                  Submit Leave Request
                </h4>
              </div>
              <div className="card-body">
                <form onSubmit={handleSubmit}>                  <div className="row">
                    <div className="col-md-6">
                      <div className="leave-form-group">
                        <label htmlFor="date" className="form-label">
                          <i className="bi bi-calendar-event me-2"></i>
                          From Date *
                        </label>
                        <input
                          type="date"
                          id="date"
                          className="form-control"
                          value={date}
                          onChange={e => setDate(e.target.value)}
                          min={new Date().toISOString().split('T')[0]} // Không cho chọn ngày quá khứ
                          required
                        />
                      </div>
                    </div>
                    <div className="col-md-6">
                      <div className="leave-form-group">
                        <label htmlFor="toDate" className="form-label">
                          <i className="bi bi-calendar-check me-2"></i>
                          To Date (Optional)
                        </label>
                        <input
                          type="date"
                          id="toDate"
                          className="form-control"
                          value={toDate}
                          onChange={e => setToDate(e.target.value)}
                          min={date || new Date().toISOString().split('T')[0]} // Không cho chọn ngày trước from date
                        />
                      </div>
                    </div>
                  </div>
                  <div className="leave-form-group">
                    <label htmlFor="reason" className="form-label">
                      <i className="bi bi-text-paragraph me-2"></i>
                      Reason *
                    </label>
                    <textarea
                      id="reason"
                      className="form-control"
                      placeholder="Please provide a detailed reason for your leave request..."
                      value={reason}
                      onChange={e => setReason(e.target.value)}
                      rows="4"
                      required
                    />
                  </div>
                  <button 
                    type="submit" 
                    className="leave-btn-primary w-100"
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
                        Submit Request
                      </>
                    )}
                  </button>
                </form>
                
                {message && (
                  <div className={`leave-alert mt-3 ${message.type === 'success' ? 'alert-success' : 'alert-danger'}`}>
                    <i className={`bi ${message.type === 'success' ? 'bi-check-circle' : 'bi-exclamation-triangle'} me-2`}></i>
                    {message.text}
                  </div>
                )}
              </div>
            </div>
          </div>          {/* Danh sách leave requests */}
          <div className="col-md-6">
            <div className="card leave-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-list-check me-2"></i>
                  My Leave Requests
                </h4>
              </div>
              <div className="card-body">                {leaveRequests.length === 0 ? (
                  <div className="leave-empty-state">
                    <i className="bi bi-inbox"></i>
                    <h6>No Leave Requests</h6>
                    <p>You haven't submitted any leave requests yet. Use the form to submit your first request.</p>
                  </div>
                ) : (
                  <div className="table-responsive">
                    <table className="table leave-table">
                      <thead>
                        <tr>
                          <th><i className="bi bi-calendar-range me-2"></i>Leave Period</th>
                          <th><i className="bi bi-chat-text me-2"></i>Reason</th>
                          <th><i className="bi bi-flag me-2"></i>Status</th>
                          <th><i className="bi bi-clock me-2"></i>Submitted</th>
                        </tr>
                      </thead>
                      <tbody>                        {leaveRequests.map((request) => (
                          <tr key={request.id}>
                            <td>
                              <div className="leave-period-display">
                                <span className="leave-date-badge">
                                  <i className="bi bi-calendar-day me-1"></i>
                                  {new Date(request.from_date).toLocaleDateString('en-US', { 
                                    month: 'short', 
                                    day: 'numeric', 
                                    year: 'numeric' 
                                  })}
                                </span>
                                {request.to_date && (
                                  <>
                                    <i className="bi bi-arrow-right mx-2 text-muted"></i>
                                    <span className="leave-date-badge">
                                      <i className="bi bi-calendar-check me-1"></i>
                                      {new Date(request.to_date).toLocaleDateString('en-US', { 
                                        month: 'short', 
                                        day: 'numeric', 
                                        year: 'numeric' 
                                      })}
                                    </span>
                                  </>
                                )}
                              </div>
                            </td>
                            <td>
                              <span className="leave-reason-text" title={request.reason}>
                                {request.reason.length > 40 
                                  ? request.reason.substring(0, 40) + '...' 
                                  : request.reason}
                              </span>
                            </td>
                            <td>
                              <span className={`leave-status-badge leave-status-${request.status}`}>
                                <i className={`bi ${
                                  request.status === 'approved' ? 'bi-check-circle' :
                                  request.status === 'rejected' ? 'bi-x-circle' :
                                  'bi-clock'
                                } me-1`}></i>
                                {request.status.charAt(0).toUpperCase() + request.status.slice(1)}
                              </span>
                            </td>
                            <td>
                              <span className="text-muted">
                                <i className="bi bi-calendar-plus me-1"></i>
                                {new Date(request.created_at).toLocaleDateString('en-US', { 
                                  month: 'short', 
                                  day: 'numeric' 
                                })}
                              </span>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default LeaveRequest;
