import React, { useState, useEffect } from "react";
import axios from "axios";
import "./style.css";

const LeaveManagement = () => {
  const [leaveRequests, setLeaveRequests] = useState([]);
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState("");
  const [filter, setFilter] = useState("all"); // all, pending, approved, rejected

  useEffect(() => {
    fetchLeaveRequests();
  }, []);

  const fetchLeaveRequests = async () => {
    setLoading(true);
    try {
      const res = await axios.get("http://localhost:3000/auth/leave_requests");
      if (res.data.Status) {
        setLeaveRequests(res.data.Result);
      } else {
        setMessage({ type: "error", text: res.data.Error });
      }
    } catch (error) {
      setMessage({ type: "error", text: "Error fetching leave requests" });
    } finally {
      setLoading(false);
    }
  };

  const handleStatusUpdate = async (requestId, newStatus) => {
    try {
      const res = await axios.put(`http://localhost:3000/auth/leave_request/${requestId}`, {
        status: newStatus
      });

      if (res.data.Status) {
        setMessage({ type: "success", text: res.data.Message });
        fetchLeaveRequests(); // Refresh danh sách
      } else {
        setMessage({ type: "error", text: res.data.Error });
      }
    } catch (error) {
      setMessage({ type: "error", text: "Error updating leave request" });
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

  const getFilteredRequests = () => {
    if (filter === "all") return leaveRequests;
    return leaveRequests.filter(request => request.status === filter);
  };

  const getStatusCounts = () => {
    return {
      all: leaveRequests.length,
      pending: leaveRequests.filter(r => r.status === 'pending').length,
      approved: leaveRequests.filter(r => r.status === 'approved').length,
      rejected: leaveRequests.filter(r => r.status === 'rejected').length
    };
  };

  const counts = getStatusCounts();
  const filteredRequests = getFilteredRequests();
  return (
    <div className="leave-request-container">
      <div className="container-fluid mt-4">
        <div className="row">
          <div className="col-12">
            <div className="card leave-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-calendar-check me-2"></i>
                  Leave Request Management
                </h4>
              </div>
              <div className="card-body">
                {/* Thống kê nhanh */}
                <div className="row mb-4">
                  <div className="col-md-3 mb-3">
                    <div className="leave-stats-card stats-total">
                      <h5>{counts.all}</h5>
                      <span>Total Requests</span>
                    </div>
                  </div>
                  <div className="col-md-3 mb-3">
                    <div className="leave-stats-card stats-pending">
                      <h5>{counts.pending}</h5>
                      <span>Pending</span>
                    </div>
                  </div>
                  <div className="col-md-3 mb-3">
                    <div className="leave-stats-card stats-approved">
                      <h5>{counts.approved}</h5>
                      <span>Approved</span>
                    </div>
                  </div>
                  <div className="col-md-3 mb-3">
                    <div className="leave-stats-card stats-rejected">
                      <h5>{counts.rejected}</h5>
                      <span>Rejected</span>
                    </div>
                  </div>
                </div>

                {/* Filter buttons */}
                <div className="mb-4 text-center">
                  <div className="leave-filter-group">
                    <button
                      type="button"
                      className={`leave-filter-btn ${filter === 'all' ? 'active' : ''}`}
                      onClick={() => setFilter('all')}
                    >
                      All ({counts.all})
                    </button>
                    <button
                      type="button"
                      className={`leave-filter-btn ${filter === 'pending' ? 'active' : ''}`}
                      onClick={() => setFilter('pending')}
                    >
                      Pending ({counts.pending})
                    </button>
                    <button
                      type="button"
                      className={`leave-filter-btn ${filter === 'approved' ? 'active' : ''}`}
                      onClick={() => setFilter('approved')}
                    >
                      Approved ({counts.approved})
                    </button>
                    <button
                      type="button"
                      className={`leave-filter-btn ${filter === 'rejected' ? 'active' : ''}`}
                      onClick={() => setFilter('rejected')}
                    >
                      Rejected ({counts.rejected})
                    </button>
                  </div>
                </div>

                {/* Message alert */}
                {message && (
                  <div className={`leave-alert mb-4 ${message.type === 'success' ? 'alert-success' : 'alert-danger'}`}>
                    <i className={`bi ${message.type === 'success' ? 'bi-check-circle' : 'bi-exclamation-triangle'} me-2`}></i>
                    {message.text}
                    <button type="button" className="btn-close float-end" onClick={() => setMessage("")}></button>
                  </div>
                )}

                {/* Leave requests table */}
                {loading ? (
                  <div className="leave-loading">
                    <div className="spinner-border" role="status">
                      <span className="visually-hidden">Loading...</span>
                    </div>
                    <p className="mt-3">Loading leave requests...</p>
                  </div>
                ) : filteredRequests.length === 0 ? (
                  <div className="leave-empty-state">
                    <i className="bi bi-inbox"></i>
                    <p>No leave requests found for the selected filter</p>
                  </div>
                ) : (
                  <div className="table-responsive">
                    <table className="table leave-table">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Employee</th>
                          <th>Leave Period</th>
                          <th>Reason</th>
                          <th>Status</th>
                          <th>Submitted</th>
                          <th>Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        {filteredRequests.map((request) => (
                          <tr key={request.id}>
                            <td>#{request.id}</td>
                            <td>
                              <div className="leave-employee-info">
                                <span className="leave-employee-name">{request.name}</span>
                                <span className="leave-employee-id">ID: {request.employee_id}</span>
                              </div>
                            </td>
                            <td>
                              <span className="leave-date-badge">
                                {new Date(request.from_date).toLocaleDateString()}
                              </span>
                              {request.to_date && (
                                <>
                                  <br />
                                  <small className="text-muted">
                                    to {new Date(request.to_date).toLocaleDateString()}
                                  </small>
                                </>
                              )}
                            </td>
                            <td>
                              <span className="leave-reason-text" title={request.reason}>
                                {request.reason.length > 50 
                                  ? request.reason.substring(0, 50) + '...' 
                                  : request.reason}
                              </span>
                            </td>
                            <td>
                              <span className={`leave-status-badge leave-status-${request.status}`}>
                                {request.status.charAt(0).toUpperCase() + request.status.slice(1)}
                              </span>
                            </td>
                            <td>{new Date(request.created_at).toLocaleString()}</td>
                            <td>
                              {request.status === 'pending' ? (
                                <div className="d-flex gap-2">
                                  <button
                                    className="leave-action-btn leave-action-approve"
                                    onClick={() => handleStatusUpdate(request.id, 'approved')}
                                    title="Approve"
                                  >
                                    <i className="bi bi-check-lg"></i>
                                  </button>
                                  <button
                                    className="leave-action-btn leave-action-reject"
                                    onClick={() => handleStatusUpdate(request.id, 'rejected')}
                                    title="Reject"
                                  >
                                    <i className="bi bi-x-lg"></i>
                                  </button>
                                </div>
                              ) : (
                                <span className="text-muted">
                                  <i className="bi bi-check-circle"></i> Processed
                                </span>
                              )}
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

export default LeaveManagement;
