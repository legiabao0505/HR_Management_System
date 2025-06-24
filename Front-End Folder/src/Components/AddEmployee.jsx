import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./style.css";

const AddEmployee = () => {
  const [employee, setEmployee] = useState({
    name: "",
    email: "",
    password: "",
    salary: "",
    address: "",
    phone: "",
    category_id: "",
    image: "",
  });
  const [category, setCategory] = useState([]);
  const navigate = useNavigate()

  useEffect(() => {
    axios
      .get("http://localhost:3000/auth/category")
      .then((result) => {
        if (result.data.Status) {
          setCategory(result.data.Result);
        } else {
          alert(result.data.Error);
        }
      })
      .catch((err) => console.log(err));
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!employee.category_id) {
      alert("Please select a category!");
      return;
    }
    const formData = new FormData();
    formData.append('name', employee.name);
    formData.append('email', employee.email);
    formData.append('password', employee.password);
    formData.append('address', employee.address);
    formData.append('phone', employee.phone);
    formData.append('salary', employee.salary);
    formData.append('image', employee.image);
    formData.append('category_id', employee.category_id);

    axios.post('http://localhost:3000/auth/add_employee', formData)
    .then(result => {
        if(result.data.Status) {
            navigate('/dashboard/employee')
        } else {
            alert(typeof result.data.Error === "string" ? result.data.Error : JSON.stringify(result.data.Error))
        }
    })
    .catch(err => console.log(err))
  }

  return (
    <div className="enhanced-container">
      <div className="container mt-4">
        <div className="row justify-content-center">
          <div className="col-lg-6 col-md-8">
            <div className="enhanced-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-person-plus me-2"></i>
                  Add New Employee
                </h4>
              </div>
              <div className="card-body p-4">
                <form className="row g-3" onSubmit={handleSubmit}>
                  <div className="col-md-6">
                    <label htmlFor="inputName" className="form-label">
                      <i className="bi bi-person me-2"></i>
                      Full Name
                    </label>
                    <input
                      type="text"
                      className="enhanced-form-control"
                      id="inputName"
                      placeholder="Enter Full Name"
                      required
                      onChange={(e) =>
                        setEmployee({ ...employee, name: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="inputEmail4" className="form-label">
                      <i className="bi bi-envelope me-2"></i>
                      Email Address
                    </label>
                    <input
                      type="email"
                      className="enhanced-form-control"
                      id="inputEmail4"
                      placeholder="Enter Email Address"
                      autoComplete="off"
                      required
                      onChange={(e) =>
                        setEmployee({ ...employee, email: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="inputPassword4" className="form-label">
                      <i className="bi bi-lock me-2"></i>
                      Password
                    </label>
                    <input
                      type="password"
                      className="enhanced-form-control"
                      id="inputPassword4"
                      placeholder="Enter Password"
                      required
                      onChange={(e) =>
                        setEmployee({ ...employee, password: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="inputSalary" className="form-label">
                      <i className="bi bi-currency-dollar me-2"></i>
                      Salary
                    </label>
                    <input
                      type="number"
                      className="enhanced-form-control"
                      id="inputSalary"
                      placeholder="Enter Salary"
                      autoComplete="off"
                      required
                      onChange={(e) =>
                        setEmployee({ ...employee, salary: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-12">
                    <label htmlFor="inputAddress" className="form-label">
                      <i className="bi bi-geo-alt me-2"></i>
                      Address
                    </label>
                    <input
                      type="text"
                      className="enhanced-form-control"
                      id="inputAddress"
                      placeholder="Enter Complete Address"
                      autoComplete="off"
                      onChange={(e) =>
                        setEmployee({ ...employee, address: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="inputPhone" className="form-label">
                      <i className="bi bi-telephone me-2"></i>
                      Phone Number
                    </label>
                    <input
                      type="tel"
                      className="enhanced-form-control"
                      id="inputPhone"
                      placeholder="Enter Phone Number"
                      autoComplete="off"
                      onChange={(e) =>
                        setEmployee({ ...employee, phone: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="category" className="form-label">
                      <i className="bi bi-tags me-2"></i>
                      Category
                    </label>
                    <select
                      name="category"
                      id="category"
                      className="enhanced-form-control"
                      value={employee.category_id}
                      onChange={(e) => setEmployee({ ...employee, category_id: e.target.value })}
                      required
                    >
                      <option value="">-- Select Category --</option>
                      {category.map((c) => (
                        <option key={c.id} value={c.id}>
                          {c.name}
                        </option>
                      ))}
                    </select>
                  </div>
                  <div className="col-12">
                    <label className="form-label" htmlFor="inputGroupFile01">
                      <i className="bi bi-image me-2"></i>
                      Profile Image
                    </label>
                    <input
                      type="file"
                      className="enhanced-form-control"
                      id="inputGroupFile01"
                      name="image"
                      accept="image/*"
                      onChange={(e) => setEmployee({...employee, image: e.target.files[0]})}
                    />
                  </div>
                  <div className="col-12">
                    <button type="submit" className="enhanced-btn-primary w-100">
                      <i className="bi bi-person-plus me-2"></i>
                      Add Employee
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AddEmployee;
