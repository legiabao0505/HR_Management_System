import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Bar, Pie } from "react-chartjs-2";
import "chart.js/auto";

const Home = () => {
  const [employeeTotal, setemployeeTotal] = useState(0)
  const [salaryTotal, setSalaryTotal] = useState(0)
  const [categoryStats, setCategoryStats] = useState([])

  useEffect(() => {
    employeeCount();
    salaryCount();
    fetchCategoryStats();
  }, [])

  const employeeCount = () => {
    axios.get('http://localhost:3000/auth/employee_count')
    .then(result => {
      if(result.data.Status) {
        setemployeeTotal(result.data.Result[0].employee)
      }
    })
  }
  const salaryCount = () => {
    axios.get('http://localhost:3000/auth/salary_count')
    .then(result => {
      if(result.data.Status) {
        setSalaryTotal(result.data.Result[0].salaryOFEmp)
      } else {
        alert(result.data.Error)
      }
    })
  }

  const fetchCategoryStats = () => {
    axios.get('http://localhost:3000/auth/category_stats')
      .then(res => {
        if (res.data.Status) setCategoryStats(res.data.Result);
      });
  }

  // Chuẩn bị dữ liệu cho biểu đồ
  const labels = categoryStats.map(c => c.category_name);
  const employeeCountByCat = categoryStats.map(c => c.employee_count);
  const totalSalaryByCat = categoryStats.map(c => c.total_salary);
  const gradeA = categoryStats.map(c => c.grade_A);
  const gradeB = categoryStats.map(c => c.grade_B);
  const gradeC = categoryStats.map(c => c.grade_C);

  return (
    <div className="home-dashboard-bg">
      <div className='p-3 d-flex justify-content-around mt-3'>
        <div className="home-summary-box">
          <div className="home-summary-title text-center">Employee</div>
          <hr />
          <div className="d-flex justify-content-between align-items-center">
            <span className="home-summary-label">Total:</span>
            <span className="home-summary-value">{employeeTotal}</span>
          </div>
        </div>
        <div className="home-summary-box">
          <div className="home-summary-title text-center">Salary</div>
          <hr />
          <div className="d-flex justify-content-between align-items-center">
            <span className="home-summary-label">Total:</span>
            <span className="home-summary-value">${salaryTotal}</span>
          </div>
        </div>
      </div>

      {/* Statistics Charts */}
      <div className="container mt-4">
        <h5 className="mb-3">NUMBER OF EMPLOYEES PER DEPARTMENT</h5>
        <div className="chart-container">
          <Bar
            data={{
              labels,
              datasets: [
                { label: "Number of Employees", data: employeeCountByCat, backgroundColor: "#1ea69a" }
              ]
            }}
            height={220}
          />
        </div>
        <h5 className="mt-5 mb-3">TOTAL SALARY PER DEPARTMENT</h5>
        <div className="chart-container">
          <Bar
            data={{
              labels,
              datasets: [
                { label: "Total Salary", data: totalSalaryByCat, backgroundColor: "#26d0ce" }
              ]
            }}
            height={220}
          />
        </div>
        <h5 className="mt-5 mb-3">PERFORMANCE</h5>
        <div className="chart-container">
          <Bar
            data={{
              labels,
              datasets: [
                { label: "A", data: gradeA, backgroundColor: "#28a745" },
                { label: "B", data: gradeB, backgroundColor: "#ffc107" },
                { label: "C", data: gradeC, backgroundColor: "#dc3545" }
              ]
            }}
            height={220}
            options={{ scales: { x: { stacked: true }, y: { stacked: true } } }}
          />
        </div>
        <div className="chart-container mt-5">
          <h5 className="mb-3">EMPLOYEE PERFORMANCE RATIO</h5>
          <Pie
            data={{
              labels: ["A", "B", "C"],
              datasets: [{
                data: [
                  categoryStats.reduce((sum, c) => sum + c.grade_A, 0),
                  categoryStats.reduce((sum, c) => sum + c.grade_B, 0),
                  categoryStats.reduce((sum, c) => sum + c.grade_C, 0)
                ],
                backgroundColor: ["#28a745", "#ffc107", "#dc3545"]
              }]
            }}
            height={180}
          />
        </div>
      </div>
    </div>
  )
}

export default Home