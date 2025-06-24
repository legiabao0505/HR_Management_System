import React, { useState, useEffect } from "react";
import axios from "axios";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";

const PAGE_SIZE = 10;

const AutoSchedule = () => {
  const [message, setMessage] = useState("");
  const [schedule, setSchedule] = useState([]);
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);
  const [showModal, setShowModal] = useState(false);
  const [selectedSchedules, setSelectedSchedules] = useState([]);
  const [selectedEmployee, setSelectedEmployee] = useState("");
  const [showEditModal, setShowEditModal] = useState(false);
  const [editSchedules, setEditSchedules] = useState([]);
  const [editEmployee, setEditEmployee] = useState("");
  const [editEmployeeId, setEditEmployeeId] = useState(null);

  // Gọi API auto_schedule
  const handleAutoSchedule = async () => {
    setMessage("Scheduling...");
    try {
      const res = await axios.post("http://localhost:3000/auth/auto_schedule");
      if (res.data.Status) {
        setMessage("Auto-scheduling completed! Total shifts: " + res.data.ScheduleCount);
        fetchSchedule();
      } else {
        setMessage("Error: " + res.data.Error);
      }
    } catch (err) {
      setMessage("Server error!");
    }
  };

  // Lấy lịch làm việc vừa phân (tuần hiện tại)
  const fetchSchedule = async () => {
    try {
      const res = await axios.get("http://localhost:3000/auth/work_schedules_this_month_with_employee");
      if (res.data.Status) setSchedule(res.data.Result);
      else setSchedule([]);
    } catch (err) {
      setSchedule([]);
    }
  };

  useEffect(() => {
    fetchSchedule();
  }, []);

  // Gom lịch theo từng nhân viên
  const scheduleByEmployee = schedule.reduce((acc, item) => {
    if (!acc[item.employee_id]) {
      acc[item.employee_id] = {
        name: item.name || `Employee ${item.employee_id}`,
        schedules: [],
      };
    }
    acc[item.employee_id].schedules.push(item);
    return acc;
  }, {});

  // Lọc theo tìm kiếm
  const filteredEmployees = Object.entries(scheduleByEmployee).filter(
    ([empId, empData]) =>
      empData.name.toLowerCase().includes(search.toLowerCase()) ||
      empId.includes(search)
  );

  // Phân trang
  const totalPage = Math.ceil(filteredEmployees.length / PAGE_SIZE);
  const paginatedEmployees = filteredEmployees.slice(
    (page - 1) * PAGE_SIZE,
    page * PAGE_SIZE
  );

  // Show details handler
  const handleShowDetails = (empName, schedules) => {
    setSelectedEmployee(empName);
    setSelectedSchedules(schedules);
    setShowModal(true);
  };

  const handleEditSchedule = (empId, empName, schedules) => {
    setEditEmployeeId(empId);
    setEditEmployee(empName);
    setEditSchedules([...schedules]); // clone để edit
    setShowEditModal(true);
  };
  return (
    <div className="auto-schedule-bg">
      <div className="px-5 mt-3">
        <div className="card enhanced-card">
          <div className="card-header">
            <h3 className="d-flex justify-content-center align-items-center mb-0 auto-schedule-title">AUTO SCHEDULE</h3>
          </div>
          <div className="card-body">
            <button className="btn btn-success mb-3" onClick={handleAutoSchedule}>
              Auto Schedule
            </button>      {message && <div style={{ margin: "16px 0", color: "#1ea69a" }}>{message}</div>}

      <div className="d-flex justify-content-between align-items-center mb-3 mt-3">
        <input
          type="text"
          className="form-control w-25"
          placeholder="Search by name or ID..."
          value={search}
          onChange={e => {
            setSearch(e.target.value);
            setPage(1);
          }}
        />
      </div><table className="table table-bordered enhanced-table auto-schedule-table">
        <thead>
          <tr>
            <th style={{width: 60}}>ID</th>
            <th>Name</th>
            <th>Schedule</th>
          </tr>
        </thead>
        <tbody>
          {paginatedEmployees.length > 0 ? (
            paginatedEmployees.map(([empId, empData]) => (
              <tr key={empId}>
                <td>{empId}</td>
                <td>{empData.name}</td>
                <td>
                  <button
                    className="btn btn-info btn-sm me-2"
                    onClick={() => handleShowDetails(empData.name, empData.schedules)}
                  >
                    View Details
                  </button>
                  <button
                    className="btn btn-warning btn-sm"
                    onClick={() => handleEditSchedule(empId, empData.name, empData.schedules)}
                  >
                    Edit
                  </button>
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan={3} className="text-center text-muted">
                No schedule data.
              </td>
            </tr>
          )}
        </tbody>
      </table>

      <div className="d-flex justify-content-center align-items-center mt-3">
        <button
          className="btn btn-primary me-2"
          disabled={page === 1}
          onClick={() => setPage(page - 1)}
        >
          Previous
        </button>
        <span>
          Page {page} / {totalPage || 1}
        </span>
        <button
          className="btn btn-primary ms-2"
          disabled={page === totalPage || totalPage === 0}
          onClick={() => setPage(page + 1)}
        >
          Next
        </button>
      </div>

      {/* Schedule Details Modal */}
      {showModal && (
        <div
          style={{
            position: "fixed",
            top: 0,
            left: 0,
            width: "100vw",
            height: "100vh",
            background: "rgba(0,0,0,0.3)",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 9999,
          }}
          onClick={() => setShowModal(false)}
        >
          <div
            style={{
              background: "#fff",
              padding: 24,
              borderRadius: 8,
              minWidth: 320,
              maxWidth: 600,
              boxShadow: "0 4px 32px rgba(0,0,0,0.15)",
            }}
            onClick={e => e.stopPropagation()}
          >
            <h5>Schedule Details for {selectedEmployee}</h5>
            <Calendar
              activeStartDate={
                selectedSchedules.length > 0
                  ? new Date(selectedSchedules[0].date)
                  : new Date()
              }
              tileContent={({ date, view }) => {
                if (
                  view === "month" &&
                  selectedSchedules.some(
                    (item) => item.date === date.toISOString().slice(0, 10)
                  )
                ) {
                  const shift = selectedSchedules.find(
                    (item) => item.date === date.toISOString().slice(0, 10)
                  ).shift;
                  return (
                    <div style={{ fontSize: 10, color: shift === "morning" ? "#1ea69a" : "#333" }}>
                      {shift}
                    </div>
                  );
                }
                return null;
              }}
              tileClassName={({ date, view }) => {
                if (
                  view === "month" &&
                  selectedSchedules.some(
                    (item) => item.date === date.toISOString().slice(0, 10)
                  )
                ) {
                  return "highlight-schedule";
                }
                return null;
              }}
            />
            <style>
              {`
                .highlight-schedule {
                  background: #e0f7fa !important;
                  border-radius: 50%;
                }
              `}
            </style>
            <button className="btn btn-secondary" onClick={() => setShowModal(false)}>
              Close
            </button>
          </div>
        </div>
      )}

      {/* Edit Schedule Modal */}
      {showEditModal && (
        <div
          style={{
            position: "fixed",
            top: 0,
            left: 0,
            width: "100vw",
            height: "100vh",
            background: "rgba(0,0,0,0.3)",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 9999,
          }}
          onClick={() => setShowEditModal(false)}
        >
          <div
            style={{
              background: "#fff",
              padding: 24,
              borderRadius: 8,
              minWidth: 420,
              maxWidth: 800,
              width: "60vw",
              maxHeight: "80vh",
              overflowY: "auto",
              boxShadow: "0 4px 32px rgba(0,0,0,0.15)",
            }}
            onClick={e => e.stopPropagation()}
          >
            <div className="d-flex justify-content-between align-items-center mb-3">
              <h5 className="mb-0">Edit Schedule for {editEmployee}</h5>
              <button
                className="btn btn-close"
                style={{ fontSize: 22 }}
                onClick={() => setShowEditModal(false)}
                aria-label="Close"
              />
            </div>
            <table className="table table-bordered">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Shift</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                {editSchedules
                  .sort((a, b) => a.date.localeCompare(b.date))
                  .map((item, idx) => (
                    <tr key={item.id || idx}>
                      <td>{item.date}</td>
                      <td>
                        <select
                          value={item.shift}
                          onChange={e => {
                            const newSchedules = [...editSchedules];
                            newSchedules[idx].shift = e.target.value;
                            setEditSchedules(newSchedules);
                          }}
                        >
                          <option value="morning">Morning (6AM-6PM)</option>
                          <option value="night">Night (6PM-6AM)</option>
                        </select>
                      </td>
                      <td>
                        <button
                          className="btn btn-danger btn-sm"
                          onClick={() => {
                            setEditSchedules(editSchedules.filter((_, i) => i !== idx));
                          }}
                        >
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
              </tbody>
            </table>
            <div className="d-flex justify-content-end mt-3">
              <button
                className="btn btn-primary me-2"
                onClick={async () => {
                  // Gửi API cập nhật lịch
                  try {
                    const res = await axios.post("http://localhost:3000/auth/update_employee_schedule", {
                      employee_id: editEmployeeId,
                      schedules: editSchedules,
                    });
                    if (res.data.Status) {
                      setShowEditModal(false);
                      fetchSchedule();
                    } else {
                      alert(res.data.Error);
                    }
                  } catch {
                    alert("Server error!");
                  }
                }}
              >
                Save
              </button>
            </div>          </div>
        </div>
      )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default AutoSchedule;