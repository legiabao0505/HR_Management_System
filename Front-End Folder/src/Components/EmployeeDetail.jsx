import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams, Link, Outlet, useLocation } from 'react-router-dom'
import EmployeeProfile from './EmployeeProfile'
import EmployeeReports from './EmployeeReports'

const EmployeeDetail = () => {
  const [employee, setEmployee] = useState({})
  const { id } = useParams()
  const navigate = useNavigate()
  const location = useLocation()

  useEffect(() => {
    axios.get('http://localhost:3000/employee/detail/' + id)
      .then(result => {
        setEmployee(result.data[0])
      })
      .catch(err => console.log(err))
  }, [id])

  const handleLogout = () => {
    axios.get('http://localhost:3000/employee/logout')
      .then(result => {
        if (result.data.Status) {
          localStorage.removeItem("valid")
          navigate('/')
        }
      }).catch(err => console.log(err))
  }

  return (
    <div className="container-fluid">
      <div className="row flex-nowrap">
        {/* Sidebar */}
        <div className="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark min-vh-100">
          <div className="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white">
            <span className="fs-5 fw-bolder d-none d-sm-inline mb-4 mt-3">Employee Dashboard</span>
            <ul className="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
              <li className="w-100">
                <Link
                  to={`/employee_detail/${id}`}
                  className={`nav-link px-0 align-middle text-white${location.pathname === `/employee_detail/${id}` ? ' active' : ''}`}
                >
                  <i className="fs-5 bi-person-circle ms-2"></i>
                  <span className="ms-2 d-none d-sm-inline">Profile</span>
                </Link>
              </li>
              <li className="w-100">
                <Link
                  to={`/employee_detail/${id}/schedule`}
                  className={`nav-link px-0 align-middle text-white${location.pathname.includes('schedule') ? ' active' : ''}`}
                >
                  <i className="fs-5 bi-calendar-check ms-2"></i>
                  <span className="ms-2 d-none d-sm-inline">Schedule</span>
                </Link>
              </li>
              <li className="w-100">
                <Link
                  to={`/employee_detail/${id}/reports`}
                  className={`nav-link px-0 align-middle text-white${location.pathname.includes('reports') ? ' active' : ''}`}
                >
                  <i className="fs-5 bi-file-earmark-text ms-2"></i>
                  <span className="ms-2 d-none d-sm-inline">Reports</span>
                </Link>
              </li>
              <li className="w-100" onClick={handleLogout}>
                <span className="nav-link px-0 align-middle text-white" style={{ cursor: "pointer" }}>
                  <i className="fs-5 bi-power ms-2"></i>
                  <span className="ms-2 d-none d-sm-inline">Logout</span>
                </span>
              </li>
            </ul>
          </div>
        </div>
        {/* Main Content */}
        <div className="col p-0 m-0">
          <div className="p-2 d-flex justify-content-center shadow">
            <h4>HR Management System</h4>
          </div>
          {/* Nếu là trang profile thì hiển thị profile, nếu là schedule thì Outlet sẽ render lịch */}
          {location.pathname === `/employee_detail/${id}` ? (
            <EmployeeProfile employee={employee} />
          ) : location.pathname.includes('reports') ? (
            <EmployeeReports employeeId={id} />
          ) : (
            <Outlet />
          )}
        </div>
      </div>
    </div>
  )
}

export default EmployeeDetail