import React from "react";
import { Link, useParams } from "react-router-dom";

const EmployeeProfile = ({ employee }) => {
  const { id } = useParams();
  return (
    <div className='d-flex flex-column align-items-center mt-4'>
      <img
        src={`http://localhost:3000/Images/${employee.image}`}
        alt="Employee"
        style={{ width: 120, height: 120, objectFit: "cover", borderRadius: "50%", marginBottom: 16 }}
      />
      <div className="w-auto">
        <h5>Name: {employee.name}</h5>
        <h5>Email: {employee.email}</h5>
        <h5>Address: {employee.address}</h5>
        <h5>Salary: ${employee.salary}</h5>
      </div>
      <div>
        <Link to={`/employee_detail/${id}/edit`}>
          <button className='btn btn-primary mt-3'>Edit</button>
        </Link>
      </div>
    </div>
  );
};

export default EmployeeProfile;