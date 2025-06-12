import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";

const EmployeeProfile = () => {
  const { id } = useParams();
  const [employee, setEmployee] = useState({});

  useEffect(() => {
    fetch(`http://localhost:3000/employee/profile/${id}`)
      .then(res => res.json())
      .then(data => {
        if (data.Status) setEmployee(data.Result);
      });
  }, [id]);

  return (
    <div className='d-flex flex-column align-items-center mt-4'>
      <img
        src={`http://localhost:3000/Images/${employee.image}`}
        alt="Employee"
        style={{ width: 320, height: 320, objectFit: "cover", borderRadius: "50%", marginBottom: 16 }}
      />
      <div className="w-auto">
        <h5>Name: {employee.name}</h5>
        <h5>Email: {employee.email}</h5>
        <h5>Address: {employee.address}</h5>
        <h5>Salary: ${employee.salary}</h5>
        <h5>Bonus: ${employee.bonus_salary || 0}</h5>
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