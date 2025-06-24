import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import "./style.css";

const EmployeeProfile = () => {
  const { id } = useParams();
  const [employee, setEmployee] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    fetch(`http://localhost:3000/employee/profile/${id}`)
      .then(res => res.json())
      .then(data => {
        if (data.Status) setEmployee(data.Result);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching employee profile:', error);
        setLoading(false);
      });
  }, [id]);

  if (loading) {
    return (
      <div className="employee-profile-container">
        <div className="employee-profile-loading">
          <div className="spinner-border text-primary" role="status">
            <span className="visually-hidden">Loading...</span>
          </div>
          <p className="mt-3">Loading employee profile...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="employee-profile-container">
      <div className="container mt-4">
        <div className="row justify-content-center">
          <div className="col-lg-8 col-md-10">
            <div className="employee-profile-card">
              <div className="employee-profile-header">
                <h3>
                  <i className="bi bi-person-circle me-2"></i>
                  Employee Profile
                </h3>
              </div>
              
              <div className="employee-profile-body">                <div className="employee-image-section">
                  <div className="employee-image-wrapper">
                    <img
                      src={`http://localhost:3000/Images/${employee.image}`}
                      alt="Employee Profile"
                      className="employee-profile-image"
                      onError={(e) => {
                        e.target.style.display = 'none';
                        e.target.nextSibling.style.display = 'flex';
                      }}
                    />
                    <div className="employee-image-overlay" style={{display: 'none'}}>
                      <i className="bi bi-person-fill"></i>
                    </div>
                  </div>

                </div>

                <div className="employee-info-section">
                  <div className="employee-info-grid">                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-person-badge me-2"></i>
                        Employee ID
                      </div>
                      <div className="info-value employee-id-value">#{employee.id || 'N/A'}</div>
                    </div>

                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-person me-2"></i>
                        Full Name
                      </div>
                      <div className="info-value">{employee.name || 'N/A'}</div>
                    </div>

                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-envelope me-2"></i>
                        Email Address
                      </div>
                      <div className="info-value">{employee.email || 'N/A'}</div>
                    </div>                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-geo-alt me-2"></i>
                        Address
                      </div>
                      <div className="info-value">{employee.address || 'N/A'}</div>
                    </div>

                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-telephone me-2"></i>
                        Phone Number
                      </div>
                      <div className="info-value">{employee.phone || 'Not provided'}</div>
                    </div>

                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-currency-dollar me-2"></i>
                        Base Salary
                      </div>
                      <div className="info-value salary-value">
                        ${employee.salary ? employee.salary.toLocaleString() : '0'}
                      </div>
                    </div>

                    <div className="employee-info-item">
                      <div className="info-label">
                        <i className="bi bi-gift me-2"></i>
                        Bonus
                      </div>
                      <div className="info-value bonus-value">
                        ${employee.bonus_salary ? employee.bonus_salary.toLocaleString() : '0'}
                      </div>
                    </div>                    <div className="employee-info-item total-compensation">
                      <div className="info-label">
                        <i className="bi bi-calculator me-2"></i>
                        Total Annual Compensation
                      </div>
                      <div className="info-value total-value">
                        ${((employee.salary || 0) + (employee.bonus_salary || 0)).toLocaleString()}
                      </div>
                      <div className="compensation-breakdown">
                        <small className="text-muted">
                          Base: ${(employee.salary || 0).toLocaleString()} + 
                          Bonus: ${(employee.bonus_salary || 0).toLocaleString()}
                        </small>
                      </div>
                    </div>
                  </div>
                </div>                <div className="employee-actions">
                  <Link to={`/employee_detail/${id}/edit`} className="employee-edit-btn">
                    <i className="bi bi-pencil-square me-2"></i>
                    Edit Profile
                  </Link>
                  <button className="employee-print-btn ms-3" onClick={() => window.print()}>
                    <i className="bi bi-printer me-2"></i>
                    Print Profile
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default EmployeeProfile;