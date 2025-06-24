import React from 'react';
import './style.css';

const EmployeeProfileCard = ({ employee }) => {
    // Default data if no employee prop is provided
    const defaultEmployee = {
        id: '#78',
        fullName: 'Beo',
        email: 'beo@gmail.com',
        address: '1291',
        phone: '0359383995',
        baseSalary: '$999',
        bonus: '$100',
        avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face'
    };

    const employeeData = employee || defaultEmployee;

    return (
        <div className="employee-profile-container">
            <div className="employee-profile-card">
                {/* Profile Header */}
                <div className="employee-profile-header">
                    <h2>
                        <i className="fas fa-user-circle"></i>
                        Employee Profile
                    </h2>
                    
                    {/* Profile Avatar */}
                    <div className="employee-profile-avatar">
                        <img 
                            src={employeeData.avatar} 
                            alt={`${employeeData.fullName} Avatar`}
                            onError={(e) => {
                                e.target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiBmaWxsPSIjMWVhNjlhIi8+Cjx0ZXh0IHg9IjUwIiB5PSI1NSIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Tm8gSW1hZ2U8L3RleHQ+Cjwvc3ZnPg==';
                            }}
                        />
                    </div>
                </div>
                
                {/* Profile Body */}
                <div className="employee-profile-body">
                    {/* Employee Info Grid */}
                    <div className="employee-profile-grid">
                        {/* Employee ID */}
                        <div className="employee-info-item employee-id">
                            <div className="employee-info-header">
                                <i className="fas fa-id-badge employee-info-icon"></i>
                                <p className="employee-info-label">Employee ID</p>
                            </div>
                            <p className="employee-info-value">{employeeData.id}</p>
                        </div>
                        
                        {/* Full Name */}
                        <div className="employee-info-item">
                            <div className="employee-info-header">
                                <i className="fas fa-user employee-info-icon"></i>
                                <p className="employee-info-label">Full Name</p>
                            </div>
                            <p className="employee-info-value">{employeeData.fullName}</p>
                        </div>
                        
                        {/* Email Address */}
                        <div className="employee-info-item">
                            <div className="employee-info-header">
                                <i className="fas fa-envelope employee-info-icon"></i>
                                <p className="employee-info-label">Email Address</p>
                            </div>
                            <p className="employee-info-value">{employeeData.email}</p>
                        </div>
                        
                        {/* Address */}
                        <div className="employee-info-item">
                            <div className="employee-info-header">
                                <i className="fas fa-map-marker-alt employee-info-icon"></i>
                                <p className="employee-info-label">Address</p>
                            </div>
                            <p className="employee-info-value">{employeeData.address}</p>
                        </div>
                        
                        {/* Phone Number */}
                        <div className="employee-info-item">
                            <div className="employee-info-header">
                                <i className="fas fa-phone employee-info-icon"></i>
                                <p className="employee-info-label">Phone Number</p>
                            </div>
                            <p className="employee-info-value">{employeeData.phone}</p>
                        </div>
                        
                        {/* Base Salary */}
                        <div className="employee-info-item salary">
                            <div className="employee-info-header">
                                <i className="fas fa-dollar-sign employee-info-icon"></i>
                                <p className="employee-info-label">Base Salary</p>
                            </div>
                            <p className="employee-info-value">{employeeData.baseSalary}</p>
                        </div>
                        
                        {/* Bonus */}
                        <div className="employee-info-item bonus full-width">
                            <div className="employee-info-header">
                                <i className="fas fa-gift employee-info-icon"></i>
                                <p className="employee-info-label">Bonus</p>
                            </div>
                            <p className="employee-info-value">{employeeData.bonus}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default EmployeeProfileCard;
