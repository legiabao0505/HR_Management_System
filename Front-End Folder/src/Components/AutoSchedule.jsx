import React, { useState, useEffect } from "react";
import axios from "axios";

const PAGE_SIZE = 10;

const AutoSchedule = () => {
  const [message, setMessage] = useState("");
  const [schedule, setSchedule] = useState([]);
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);

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
      const res = await axios.get("http://localhost:3000/auth/work_schedules_this_week_with_employee");
      console.log("Schedule API result:", res.data);
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

  return (
    <div>
      <h2>Auto Schedule</h2>
      <button className="btn btn-success" onClick={handleAutoSchedule}>
        Auto Schedule
      </button>
      {message && <div style={{ margin: "16px 0", color: "#1ea69a" }}>{message}</div>}

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
       
      </div>

      <table className="table table-bordered">
        <thead>
          <tr>
            <th style={{width: 60}}>ID</th>
            <th>Name</th>
            <th>Schedules</th>
          </tr>
        </thead>
        <tbody>
          {paginatedEmployees.length > 0 ? (
            paginatedEmployees.map(([empId, empData]) => (
              <tr key={empId}>
                <td>{empId}</td>
                <td>{empData.name}</td>
                <td>
                  <table className="table table-sm mb-0">
                    <thead>
                      <tr>
                        <th>Date</th>
                        <th>Shift</th>
                      </tr>
                    </thead>
                    <tbody>
                      {empData.schedules.map((item, idx) => (
                        <tr key={idx}>
                          <td>{item.date}</td>
                          <td>{item.shift}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
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
    </div>
  );
};

export default AutoSchedule;