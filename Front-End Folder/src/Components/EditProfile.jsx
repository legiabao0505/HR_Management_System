import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import "./style.css";

const EditProfile = () => {
    const {id} = useParams();
    const [employee, setEmployee] = useState({
        name: "",
        email: "",
        address: "",
        phone: "",
    });
    const navigate = useNavigate();

      useEffect(()=> {
        axios.get('http://localhost:3000/auth/employee/'+id)
        .then(result => {
            setEmployee({
                name: result.data.Result[0].name,
                email: result.data.Result[0].email,
                address: result.data.Result[0].address,
                phone: result.data.Result[0].phone,
            })
        }).catch(err => console.log(err))
    }, []);    const handleSubmit = (e) => {
        e.preventDefault()
        axios.put('http://localhost:3000/auth/edit_employee_profile/'+id, employee)
        .then(result => {
            if(result.data.Status) {
                alert('Profile updated successfully!');
                // Navigate back to employee profile after a short delay
                setTimeout(() => {
                    navigate(`/employee_detail/${id}`);
                }, 1000);
            } else {
                alert(result.data.Error)
            }
        }).catch(err => {
            console.log(err);
            alert('An error occurred while updating profile. Please try again.');
        })
    }
      return (
    <div className="enhanced-container">
      <div className="container mt-4">
        <div className="row justify-content-center">
          <div className="col-lg-6 col-md-8">
            <div className="enhanced-card">
              <div className="card-header">
                <h4>
                  <i className="bi bi-person-gear me-2"></i>
                  Edit Profile
                </h4>
              </div>
              <div className="card-body p-4">
                <form className="row g-3" onSubmit={handleSubmit}>
                  <div className="col-12">
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
                  <div className="col-12">
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
                    <button type="submit" className="enhanced-btn-primary w-100">
                      <i className="bi bi-check-circle me-2"></i>
                      Update Profile
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

export default EditProfile