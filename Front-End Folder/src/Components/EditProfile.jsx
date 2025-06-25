import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import "./style.css";

const EditProfile = () => {
    const {id} = useParams();
    const [employee, setEmployee] = useState({
        name: "",
        address: "",
        phone: "",
        image: "" // Add image field to preserve image preview
    });
    const [selectedImage, setSelectedImage] = useState(null);
    const [errors, setErrors] = useState({ name: '', phone: '', address: '' });
    const navigate = useNavigate();

      useEffect(()=> {
        axios.get('http://localhost:3000/auth/employee/'+id)
        .then(result => {
            setEmployee({
                name: result.data.Result[0].name || '',
                address: result.data.Result[0].address || '',
                phone: result.data.Result[0].phone || '',
                image: result.data.Result[0].image || ''
            })
        }).catch(err => console.log(err))
    }, [id]);    const handleImageChange = (e) => {
      if (e.target.files && e.target.files[0]) {
        setSelectedImage(e.target.files[0]);
      }
    }

    // In handleSubmit, always send the current image if no new image is selected
    const handleSubmit = (e) => {
      e.preventDefault();
      let newErrors = { name: '', phone: '', address: '' };
      let hasError = false;
      if (!employee.name.trim()) {
        newErrors.name = 'Full Name is required.';
        hasError = true;
      }
      if (!employee.phone.trim()) {
        newErrors.phone = 'Phone Number is required.';
        hasError = true;
      }
      if (!employee.address.trim()) {
        newErrors.address = 'Address is required.';
        hasError = true;
      }
      setErrors(newErrors);
      if (hasError) {
        return;
      }
      const formData = new FormData();
      formData.append('name', employee.name);
      formData.append('address', employee.address);
      formData.append('phone', employee.phone);
      if (selectedImage) {
        formData.append('image', selectedImage);
      } else if (employee.image) {
        formData.append('oldImage', employee.image);
      }
      axios.put('http://localhost:3000/auth/edit_employee_profile/' + id, formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      })
        .then(result => {
          if (result.data.Status) {
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
                <form className="row g-3" onSubmit={handleSubmit} encType="multipart/form-data">
                  <div className="edit-employee-image-section" style={{textAlign:'center'}}>
                    <div className="edit-employee-image-wrapper" style={{margin:'0 auto'}}>
                      {selectedImage ? (
                        <img
                          src={URL.createObjectURL(selectedImage)}
                          alt="Employee"
                          className="edit-employee-image"
                        />
                      ) : (
                        <img
                          src={`http://localhost:3000/Images/${employee.image || ''}`}
                          alt="Employee"
                          className="edit-employee-image"
                          style={{opacity: employee.image ? 1 : 0.5}}
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
                      style={{display:'none'}}
                    />
                  </div>
                  <div className="col-12">
                    <label htmlFor="inputName" className="form-label">
                      <i className="bi bi-person me-2"></i>
                      Full Name
                    </label>
                    <input
                      type="text"
                      className={`enhanced-form-control${errors.name ? ' is-invalid' : ''}`}
                      id="inputName"
                      placeholder="Enter Name"
                      value={employee.name}
                      onChange={(e) => {
                        setEmployee({ ...employee, name: e.target.value });
                        if (errors.name) setErrors({ ...errors, name: '' });
                      }}
                    />
                    {errors.name && <div className="invalid-feedback" style={{display:'block'}}>{errors.name}</div>}
                  </div>
                  <div className="col-12">
                    <label htmlFor="inputPhone" className="form-label">
                      <i className="bi bi-telephone me-2"></i>
                      Phone Number
                    </label>
                    <input
                      type="tel"
                      className={`enhanced-form-control${errors.phone ? ' is-invalid' : ''}`}
                      id="inputPhone"
                      placeholder="Enter Phone Number"
                      autoComplete="off"
                      value={employee.phone}
                      onChange={(e) => {
                        setEmployee({ ...employee, phone: e.target.value });
                        if (errors.phone) setErrors({ ...errors, phone: '' });
                      }}
                    />
                    {errors.phone && <div className="invalid-feedback" style={{display:'block'}}>{errors.phone}</div>}
                  </div>
                  <div className="col-12">
                    <label htmlFor="inputAddress" className="form-label">
                      <i className="bi bi-geo-alt me-2"></i>
                      Address
                    </label>
                    <input
                      type="text"
                      className={`enhanced-form-control${errors.address ? ' is-invalid' : ''}`}
                      id="inputAddress"
                      placeholder="1234 Main St"
                      autoComplete="off"
                      value={employee.address}
                      onChange={(e) => {
                        setEmployee({ ...employee, address: e.target.value });
                        if (errors.address) setErrors({ ...errors, address: '' });
                      }}
                    />
                    {errors.address && <div className="invalid-feedback" style={{display:'block'}}>{errors.address}</div>}
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