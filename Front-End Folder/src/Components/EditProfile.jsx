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
        image: ""
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
    }, [id]);

    const handleImageChange = (e) => {
      if (e.target.files && e.target.files[0]) {
        setSelectedImage(e.target.files[0]);
      }
    }

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
        <div style={{
            background: 'linear-gradient(135deg, rgba(30,166,154,0.1) 0%, #ffffff 50%, #f8f9fa 100%)',
            minHeight: '100vh',
            padding: '40px 0 60px 0',
            position: 'relative'
        }}>
            <style>{`
                .edit-profile-container::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: radial-gradient(circle at 20% 80%, rgba(30,166,154,0.1) 0%, transparent 50%),
                                radial-gradient(circle at 80% 20%, rgba(59,130,246,0.1) 0%, transparent 50%);
                    pointer-events: none;
                }
            `}</style>
            
            <div className="container mt-4">
                <div className="row justify-content-center">
                    <div className="col-lg-6 col-md-8">
                        <div style={{
                            background: 'rgba(255, 255, 255, 0.9)',
                            borderRadius: '16px',
                            boxShadow: '0 20px 60px rgba(30,166,154,0.15), 0 8px 32px rgba(0,0,0,0.1)',
                            border: '1.5px solid rgba(255,255,255,0.2)',
                            backdropFilter: 'blur(20px)',
                            WebkitBackdropFilter: 'blur(20px)',
                            overflow: 'hidden',
                            position: 'relative',
                            animation: 'slideInUp 0.8s cubic-bezier(.4,0,.2,1)'
                        }}>
                            {/* Header with shimmer effect */}
                            <div style={{
                                background: 'linear-gradient(135deg, #1ea69a 0%, #3b82f6 100%)',
                                color: 'white',
                                padding: '24px 28px',
                                borderBottom: 'none',
                                position: 'relative',
                                overflow: 'hidden'
                            }}>
                                <h4 style={{
                                    fontSize: '1.5rem',
                                    fontWeight: '700',
                                    margin: '0',
                                    display: 'flex',
                                    alignItems: 'center',
                                    position: 'relative',
                                    zIndex: 1
                                }}>
                                    <i className="bi bi-person-gear me-2" style={{fontSize: '1.3rem', opacity: 0.9}}></i>
                                    Edit Profile
                                </h4>
                            </div>

                            <div style={{
                                padding: '32px 28px 24px 28px',
                                background: 'white',
                                position: 'relative'
                            }}>
                                <form className="row g-3" onSubmit={handleSubmit} encType="multipart/form-data">
                                    {/* Image Section */}
                                    <div style={{
                                        marginBottom: '24px',
                                        padding: '20px',
                                        background: 'linear-gradient(135deg, rgba(30,166,154,0.1) 0%, #f8f9fa 100%)',
                                        borderRadius: '12px',
                                        border: '2px dashed #1ea69a',
                                        transition: 'all 0.3s ease',
                                        textAlign: 'center',
                                        position: 'relative',
                                        overflow: 'hidden'
                                    }}>
                                        <div style={{
                                            width: '120px',
                                            height: '120px',
                                            borderRadius: '50%',
                                            overflow: 'hidden',
                                            border: '4px solid white',
                                            boxShadow: '0 8px 25px rgba(30,166,154,0.2)',
                                            transition: 'all 0.3s ease',
                                            margin: '0 auto',
                                            position: 'relative',
                                            zIndex: 1
                                        }}>
                                            {selectedImage ? (
                                                <img
                                                    src={URL.createObjectURL(selectedImage)}
                                                    alt="Employee"
                                                    style={{
                                                        width: '100%',
                                                        height: '100%',
                                                        objectFit: 'cover',
                                                        transition: 'all 0.3s ease'
                                                    }}
                                                />
                                            ) : (
                                                <img
                                                    src={`http://localhost:3000/Images/${employee.image || ''}`}
                                                    alt="Employee"
                                                    style={{
                                                        width: '100%',
                                                        height: '100%',
                                                        objectFit: 'cover',
                                                        opacity: employee.image ? 1 : 0.5,
                                                        transition: 'all 0.3s ease'
                                                    }}
                                                />
                                            )}
                                        </div>
                                        <label htmlFor="edit-employee-upload" style={{
                                            margin: '12px auto 0 auto',
                                            display: 'inline-block',
                                            textAlign: 'center',
                                            fontWeight: '600',
                                            fontSize: '1rem',
                                            cursor: 'pointer',
                                            color: '#1ea69a',
                                            transition: 'all 0.3s ease',
                                            padding: '8px 16px',
                                            borderRadius: '8px',
                                            background: 'rgba(30,166,154,0.1)',
                                            border: '2px solid transparent',
                                            position: 'relative',
                                            zIndex: 1
                                        }}>
                                            <i className="bi bi-image me-2"></i>
                                            Change Image
                                        </label>
                                        <input
                                            type="file"
                                            id="edit-employee-upload"
                                            accept="image/*"
                                            onChange={handleImageChange}
                                            style={{display: 'none'}}
                                        />
                                    </div>

                                    {/* Name Field */}
                                    <div className="col-12">
                                        <label htmlFor="inputName" style={{
                                            fontWeight: '600',
                                            color: '#2d3748',
                                            marginBottom: '8px',
                                            fontSize: '1rem',
                                            display: 'flex',
                                            alignItems: 'center'
                                        }}>
                                            <i className="bi bi-person me-2" style={{color: '#1ea69a', fontSize: '1.1rem'}}></i>
                                            Full Name
                                        </label>
                                        <input
                                            type="text"
                                            className={`form-control${errors.name ? ' is-invalid' : ''}`}
                                            id="inputName"
                                            placeholder="Enter Name"
                                            value={employee.name}
                                            onChange={(e) => {
                                                setEmployee({ ...employee, name: e.target.value });
                                                if (errors.name) setErrors({ ...errors, name: '' });
                                            }}
                                            style={{
                                                background: 'white',
                                                border: '2px solid #e2e8f0',
                                                borderRadius: '8px',
                                                padding: '14px 16px',
                                                fontSize: '1rem',
                                                fontWeight: '500',
                                                color: '#2d3748',
                                                transition: 'all 0.3s ease',
                                                boxShadow: '0 2px 8px rgba(0,0,0,0.05)'
                                            }}
                                            onFocus={(e) => {
                                                e.target.style.borderColor = '#1ea69a';
                                                e.target.style.boxShadow = '0 0 0 3px rgba(30,166,154,0.1), 0 4px 12px rgba(30,166,154,0.15)';
                                                e.target.style.transform = 'translateY(-1px)';
                                            }}
                                            onBlur={(e) => {
                                                e.target.style.borderColor = '#e2e8f0';
                                                e.target.style.boxShadow = '0 2px 8px rgba(0,0,0,0.05)';
                                                e.target.style.transform = 'translateY(0)';
                                            }}
                                        />
                                        {errors.name && (
                                            <div style={{
                                                color: '#dc3545',
                                                fontSize: '0.9rem',
                                                fontWeight: '500',
                                                marginTop: '6px',
                                                padding: '4px 8px',
                                                background: 'rgba(220,53,69,0.1)',
                                                borderRadius: '6px',
                                                borderLeft: '3px solid #dc3545',
                                                display: 'block'
                                            }}>
                                                {errors.name}
                                            </div>
                                        )}
                                    </div>

                                    {/* Phone Field */}
                                    <div className="col-12">
                                        <label htmlFor="inputPhone" style={{
                                            fontWeight: '600',
                                            color: '#2d3748',
                                            marginBottom: '8px',
                                            fontSize: '1rem',
                                            display: 'flex',
                                            alignItems: 'center'
                                        }}>
                                            <i className="bi bi-telephone me-2" style={{color: '#1ea69a', fontSize: '1.1rem'}}></i>
                                            Phone Number
                                        </label>
                                        <input
                                            type="tel"
                                            className={`form-control${errors.phone ? ' is-invalid' : ''}`}
                                            id="inputPhone"
                                            placeholder="Enter Phone Number"
                                            autoComplete="off"
                                            value={employee.phone}
                                            onChange={(e) => {
                                                setEmployee({ ...employee, phone: e.target.value });
                                                if (errors.phone) setErrors({ ...errors, phone: '' });
                                            }}
                                            style={{
                                                background: 'white',
                                                border: '2px solid #e2e8f0',
                                                borderRadius: '8px',
                                                padding: '14px 16px',
                                                fontSize: '1rem',
                                                fontWeight: '500',
                                                color: '#2d3748',
                                                transition: 'all 0.3s ease',
                                                boxShadow: '0 2px 8px rgba(0,0,0,0.05)'
                                            }}
                                            onFocus={(e) => {
                                                e.target.style.borderColor = '#1ea69a';
                                                e.target.style.boxShadow = '0 0 0 3px rgba(30,166,154,0.1), 0 4px 12px rgba(30,166,154,0.15)';
                                                e.target.style.transform = 'translateY(-1px)';
                                            }}
                                            onBlur={(e) => {
                                                e.target.style.borderColor = '#e2e8f0';
                                                e.target.style.boxShadow = '0 2px 8px rgba(0,0,0,0.05)';
                                                e.target.style.transform = 'translateY(0)';
                                            }}
                                        />
                                        {errors.phone && (
                                            <div style={{
                                                color: '#dc3545',
                                                fontSize: '0.9rem',
                                                fontWeight: '500',
                                                marginTop: '6px',
                                                padding: '4px 8px',
                                                background: 'rgba(220,53,69,0.1)',
                                                borderRadius: '6px',
                                                borderLeft: '3px solid #dc3545',
                                                display: 'block'
                                            }}>
                                                {errors.phone}
                                            </div>
                                        )}
                                    </div>

                                    {/* Address Field */}
                                    <div className="col-12">
                                        <label htmlFor="inputAddress" style={{
                                            fontWeight: '600',
                                            color: '#2d3748',
                                            marginBottom: '8px',
                                            fontSize: '1rem',
                                            display: 'flex',
                                            alignItems: 'center'
                                        }}>
                                            <i className="bi bi-geo-alt me-2" style={{color: '#1ea69a', fontSize: '1.1rem'}}></i>
                                            Address
                                        </label>
                                        <input
                                            type="text"
                                            className={`form-control${errors.address ? ' is-invalid' : ''}`}
                                            id="inputAddress"
                                            placeholder="1234 Main St"
                                            autoComplete="off"
                                            value={employee.address}
                                            onChange={(e) => {
                                                setEmployee({ ...employee, address: e.target.value });
                                                if (errors.address) setErrors({ ...errors, address: '' });
                                            }}
                                            style={{
                                                background: 'white',
                                                border: '2px solid #e2e8f0',
                                                borderRadius: '8px',
                                                padding: '14px 16px',
                                                fontSize: '1rem',
                                                fontWeight: '500',
                                                color: '#2d3748',
                                                transition: 'all 0.3s ease',
                                                boxShadow: '0 2px 8px rgba(0,0,0,0.05)'
                                            }}
                                            onFocus={(e) => {
                                                e.target.style.borderColor = '#1ea69a';
                                                e.target.style.boxShadow = '0 0 0 3px rgba(30,166,154,0.1), 0 4px 12px rgba(30,166,154,0.15)';
                                                e.target.style.transform = 'translateY(-1px)';
                                            }}
                                            onBlur={(e) => {
                                                e.target.style.borderColor = '#e2e8f0';
                                                e.target.style.boxShadow = '0 2px 8px rgba(0,0,0,0.05)';
                                                e.target.style.transform = 'translateY(0)';
                                            }}
                                        />
                                        {errors.address && (
                                            <div style={{
                                                color: '#dc3545',
                                                fontSize: '0.9rem',
                                                fontWeight: '500',
                                                marginTop: '6px',
                                                padding: '4px 8px',
                                                background: 'rgba(220,53,69,0.1)',
                                                borderRadius: '6px',
                                                borderLeft: '3px solid #dc3545',
                                                display: 'block'
                                            }}>
                                                {errors.address}
                                            </div>
                                        )}
                                    </div>

                                    {/* Submit Button */}
                                    <div className="col-12">
                                        <button 
                                            type="submit" 
                                            className="w-100"
                                            style={{
                                                background: 'linear-gradient(135deg, #1ea69a 0%, #3b82f6 100%)',
                                                color: 'white',
                                                border: 'none',
                                                borderRadius: '8px',
                                                padding: '16px 24px',
                                                fontSize: '1.1rem',
                                                fontWeight: '600',
                                                transition: 'all 0.3s ease',
                                                position: 'relative',
                                                overflow: 'hidden',
                                                boxShadow: '0 4px 15px rgba(30,166,154,0.3)',
                                                cursor: 'pointer'
                                            }}
                                            onMouseEnter={(e) => {
                                                e.target.style.transform = 'translateY(-2px)';
                                                e.target.style.boxShadow = '0 8px 25px rgba(30,166,154,0.4)';
                                                e.target.style.background = 'linear-gradient(135deg, #3b82f6 0%, #1ea69a 100%)';
                                            }}
                                            onMouseLeave={(e) => {
                                                e.target.style.transform = 'translateY(0)';
                                                e.target.style.boxShadow = '0 4px 15px rgba(30,166,154,0.3)';
                                                e.target.style.background = 'linear-gradient(135deg, #1ea69a 0%, #3b82f6 100%)';
                                            }}
                                            onMouseDown={(e) => {
                                                e.target.style.transform = 'translateY(0)';
                                                e.target.style.boxShadow = '0 4px 15px rgba(30,166,154,0.3)';
                                            }}
                                        >
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

            <style>{`
                @keyframes slideInUp {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }
                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
            `}</style>
        </div>
    )
}

export default EditProfile