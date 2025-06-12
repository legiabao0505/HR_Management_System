import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const Employee = () => {
  const [employee, setEmployee] = useState([]);
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(0);
  const [selectedCategory, setSelectedCategory] = useState("");
  const [categories, setCategories] = useState([]);
  const limit = 8;
  const navigate = useNavigate();

  useEffect(() => {
    axios
      .get(
        `http://localhost:3000/auth/employee?search=${search}&page=${page}&limit=${limit}&category_id=${selectedCategory}`
      )
      .then((result) => {
        if (result.data.Status) {
          setEmployee(result.data.Result);
          setTotal(result.data.Total || 0);
        } else {
          alert(result.data.Error);
        }
      })
      .catch((err) => console.log(err));
  }, [search, page, selectedCategory]);

  // Lấy danh sách category khi load trang
  useEffect(() => {
    axios.get("http://localhost:3000/auth/category").then((res) => {
      if (res.data.Status) setCategories(res.data.Result);
    });
  }, []);

  const handleDelete = (id) => {
    axios
      .delete("http://localhost:3000/auth/delete_employee/" + id)
      .then((result) => {
        if (result.data.Status) {
          setEmployee(employee.filter((emp) => emp.id !== id));
          setTotal(total - 1);
        } else {
          alert(result.data.Error);
        }
      });
  };

  return (
    <div className="px-5 mt-3">
      <div className="d-flex justify-content-center align-items-center mb-3">
        <h3 style={{ color: "#1ea69a", fontWeight: 700, letterSpacing: 1 }}>
          EMPLOYEE LIST
        </h3>
      </div>
      <div className="d-flex justify-content-between align-items-center mb-3">
        <div className="d-flex align-items-center gap-2">
          <input
            type="text"
            className="form-control w-25"
            placeholder="Search employee..."
            value={search}
            onChange={(e) => {
              setSearch(e.target.value);
              setPage(1); // Reset to page 1 when searching
            }}
          />
          <select
            className="form-select"
            style={{ width: 180 }}
            value={selectedCategory}
            onChange={(e) => {
              setSelectedCategory(e.target.value);
              setPage(1);
            }}
          >
            <option value="">All Departments</option>
            {categories.map((cat) => (
              <option key={cat.id} value={cat.id}>
                {cat.name}
              </option>
            ))}
          </select>
        </div>
        <Link to="/dashboard/add_employee" className="btn btn-success">
          Add Employee
        </Link>
      </div>
      <div className="mt-3">
        <table className="table">
          <thead>
            <tr>
              <th>Name</th>
              <th>Image</th>
              <th>Email</th>
              <th>Address</th>
              <th>Salary ($)</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {employee.map((e) => (
              <tr key={e.id}>
                <td>{e.name}</td>
                <td>
                  <img
                    src={`http://localhost:3000/Images/` + e.image}
                    className="employee_image"
                    alt="Employee"
                  />
                </td>
                <td>{e.email}</td>
                <td>{e.address}</td>
                <td>{e.salary} $</td>
                <td>
                  <Link
                    to={`/dashboard/edit_employee/` + e.id}
                    className="btn btn-info btn-sm me-2"
                  >
                    Edit
                  </Link>
                  <button
                    className="btn btn-warning btn-sm"
                    onClick={() => handleDelete(e.id)}
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {/* Pagination */}
        <div className="d-flex justify-content-center mt-3">
          <button
            className="btn btn-primary me-2"
            disabled={page === 1}
            onClick={() => setPage(page - 1)}
          >
            Previous
          </button>
          <span className="align-self-center">
            Page {page} / {Math.ceil(total / limit) || 1}
          </span>
          <button
            className="btn btn-primary ms-2"
            disabled={page >= Math.ceil(total / limit)}
            onClick={() => setPage(page + 1)}
          >
            Next
          </button>
        </div>
      </div>
    </div>
  );
};

export default Employee;