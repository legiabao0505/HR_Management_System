import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import "./style.css";

const EditEmployee = () => {
    const {id} = useParams()
    const [employee, setEmployee] = useState({
        name: "",
        email: "",
        salary: "",
        address: "",
        phone: "",
        category_id: "",
        image: ""
      });
    const [category, setCategory] = useState([])
    const navigate = useNavigate()

    useEffect(()=> {
      axios.get('http://localhost:3000/auth/category')
      .then(result => {
          if(result.data.Status) {
              setCategory(result.data.Result);
          } else {
              alert(result.data.Error)
          }
      }).catch(err => console.log(err));

      axios.get('http://localhost:3000/auth/employee/'+id)
      .then(result => {
          setEmployee({
              name: result.data.Result[0].name,
              email: result.data.Result[0].email,
              address: result.data.Result[0].address,
              phone: result.data.Result[0].phone,
              salary: Number(result.data.Result[0].salary),
              category_id: Number(result.data.Result[0].category_id),
              image: result.data.Result[0].image || ""
          });
      }).catch(err => console.log(err))
    }, [id])

    const handleImageChange = (e) => {
      const file = e.target.files[0];
      if (file) {
        setEmployee({ ...employee, image: file });
      }
    };

    const handleRemoveImage = () => {
      setEmployee({ ...employee, image: "" });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Validate salary is a valid number
        if (employee.salary === '' || isNaN(Number(employee.salary)) || Number(employee.salary) <= 0) {
          alert('Please enter a valid salary!');
          return;
        }
        // Validate category_id is a valid number and exists in category list
        if (
          employee.category_id === '' ||
          isNaN(Number(employee.category_id)) ||
          !category.some(c => Number(c.id) === Number(employee.category_id))
        ) {
          alert('Please select a valid category!');
          return;
        }
        const formData = new FormData();
        formData.append('name', employee.name);
        formData.append('email', employee.email);
        formData.append('salary', Number(employee.salary));
        formData.append('address', employee.address);
        formData.append('phone', employee.phone);
        formData.append('category_id', Number(employee.category_id));
        // Handle image
        if (employee.image instanceof File) {
          formData.append('image', employee.image);
        } else if (typeof employee.image === 'string' && employee.image !== "") {
          formData.append('oldImage', employee.image);
        } else {
          formData.append('removeImage', true);
        }
        axios.put('http://localhost:3000/auth/edit_employee/'+id, formData, {
          headers: { 'Content-Type': 'multipart/form-data' }
        })
        .then(result => {
            if(result.data.Status) {
                navigate('/dashboard/employee')
            } else {
                alert(result.data.Error)
            }
        }).catch(err => console.log(err))
    }
    
  return (
    <div className="enhanced-container">
      <div className="container mt-4">
        <div className="row justify-content-center">
          <div className="col-lg-6 col-md-8">
            <div className="enhanced-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-pencil-square me-2"></i>
                  Edit Employee
                </h4>
              </div>
              <div className="card-body p-4">
                <form className="row g-3" onSubmit={handleSubmit} encType="multipart/form-data">
                  <div className="edit-employee-image-section">
                    <div className="edit-employee-image-wrapper" style={{margin:'0 auto'}}>
                      {employee.image instanceof File ? (
                        <img
                          src={URL.createObjectURL(employee.image)}
                          alt="Employee"
                          className="edit-employee-image"
                        />
                      ) : employee.image ? (
                        <img
                          src={`http://localhost:3000/Public/Images/${employee.image}`}
                          alt="Employee"
                          className="edit-employee-image"
                        />
                      ) : (
                        <img
                          src="/Images/logo.png"
                          alt="No avatar"
                          className="edit-employee-image"
                          style={{opacity:0.5}}
                        />
                      )}
                    </div>
                    <label htmlFor="edit-employee-upload" className="edit-employee-upload-label" style={{margin:'12px auto 0 auto', display:'block', textAlign:'center', fontWeight:600, fontSize:'1rem', cursor:'pointer'}}>
                      <i className="bi bi-image me-2"></i>
                      Change Image
                    </label>
                    <input
                      type="file"
                      id="edit-employee-upload"
                      className="edit-employee-upload-input"
                      accept="image/*"
                      onChange={handleImageChange}
                    />
                    {(employee.image && (employee.image instanceof File || typeof employee.image === 'string')) && (
                      <button
                        type="button"
                        className="edit-employee-image-remove"
                        onClick={handleRemoveImage}
                        title="Xóa ảnh"
                        style={{top:8, right:8}}
                      >
                        <i className="bi bi-x"></i>
                      </button>
                    )}
                  </div>
                  <div className="col-md-6">
                    <label htmlFor="inputName" className="form-label">
                      <i className="bi bi-person me-2"></i>
                      Full Name
                    </label>
                    <input
                      type="text"
                      className="enhanced-form-control"
                      id="inputName"
                      placeholder="Enter Name"
                      value={employee.name}
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
                      placeholder="Enter Email"
                      autoComplete="off"
                      value={employee.email}
                      onChange={(e) =>
                        setEmployee({ ...employee, email: e.target.value })
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
                      value={employee.salary}
                      onChange={(e) =>
                        setEmployee({ ...employee, salary: Number(e.target.value) })
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
                      value={employee.category_id === '' ? '' : Number(employee.category_id)}
                      onChange={(e) => setEmployee({...employee, category_id: e.target.value === '' ? '' : Number(e.target.value)})}
                      required
                    >
                      <option value="">-- Select Category --</option>
                      {category.map((c) => (
                        <option key={c.id} value={c.id}>{c.name}</option>
                      ))}
                    </select>                  </div>
                  <div className="col-12">
                    <label htmlFor="inputAddress" className="form-label">
                      <i className="bi bi-geo-alt me-2"></i>
                      Address
                    </label>
                    <input
                      type="text"
                      className="enhanced-form-control"
                      id="inputAddress"
                      placeholder="1234 Main St"
                      autoComplete="off"
                      value={employee.address}
                      onChange={(e) =>
                        setEmployee({ ...employee, address: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-12">
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
                      value={employee.phone}
                      onChange={(e) =>
                        setEmployee({ ...employee, phone: e.target.value })
                      }
                    />
                  </div>
                  <div className="col-12">
                    <button type="submit" className="enhanced-btn-primary w-100">
                      <i className="bi bi-check-circle me-2"></i>
                      Update
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default EditEmployee
