import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Bar, Line, Pie, Scatter } from "react-chartjs-2";
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
        <h5 className="mb-3">NUMBER OF EMPLOYEES PER DEPARTMENT</h5>        <div className="chart-container">
          <Bar
            data={{
              labels,
              datasets: [
                { 
                  label: "Number of Employees", 
                  data: employeeCountByCat, 
                  backgroundColor: "rgba(30, 166, 154, 0.8)",
                  borderColor: "#1ea69a",
                  borderWidth: 2,
                  borderRadius: 8,
                  borderSkipped: false,
                }
              ]
            }}
            options={{
              responsive: true,
              plugins: {
                legend: {
                  display: true,
                  position: 'top',
                },
                tooltip: {
                  backgroundColor: 'rgba(30, 166, 154, 0.9)',
                  titleColor: '#fff',
                  bodyColor: '#fff',
                  borderColor: '#1ea69a',
                  borderWidth: 1,
                }
              },
              scales: {
                y: {
                  beginAtZero: true,
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                  }
                },
                x: {
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                  }
                }
              }
            }}
            height={220}
          />
        </div><h5 className="mt-5 mb-3">TOTAL SALARY PER DEPARTMENT</h5>
        <div className="chart-container">
          <Bar
            data={{
              labels,
              datasets: [
                { 
                  label: "Total Salary ($)", 
                  data: totalSalaryByCat, 
                  backgroundColor: "rgba(38, 208, 206, 0.8)",
                  borderColor: "#26d0ce",
                  borderWidth: 2,
                  borderRadius: 8,
                  borderSkipped: false,
                }
              ]
            }}
            options={{
              responsive: true,
              plugins: {
                legend: {
                  display: true,
                  position: 'top',
                },
                tooltip: {
                  backgroundColor: 'rgba(30, 166, 154, 0.9)',
                  titleColor: '#fff',
                  bodyColor: '#fff',
                  borderColor: '#1ea69a',
                  borderWidth: 1,
                }
              },
              scales: {
                y: {
                  beginAtZero: true,
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                    callback: function(value) {
                      return '$' + value.toLocaleString();
                    }
                  }
                },
                x: {
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                  }
                }
              }
            }}
            height={220}
          />
        </div>
        <h5 className="mt-5 mb-3">PERFORMANCE</h5>        <div className="chart-container">
          <Line
            data={{
              labels,
              datasets: [
                { 
                  label: "Grade A", 
                  data: gradeA, 
                  backgroundColor: "rgba(40, 167, 69, 0.2)",
                  borderColor: "#28a745",
                  borderWidth: 3,
                  fill: true,
                  tension: 0.4,
                  pointBackgroundColor: "#28a745",
                  pointBorderColor: "#fff",
                  pointBorderWidth: 2,
                  pointRadius: 6,
                },
                { 
                  label: "Grade B", 
                  data: gradeB, 
                  backgroundColor: "rgba(255, 193, 7, 0.2)",
                  borderColor: "#ffc107",
                  borderWidth: 3,
                  fill: true,
                  tension: 0.4,
                  pointBackgroundColor: "#ffc107",
                  pointBorderColor: "#fff",
                  pointBorderWidth: 2,
                  pointRadius: 6,
                },
                { 
                  label: "Grade C", 
                  data: gradeC, 
                  backgroundColor: "rgba(220, 53, 69, 0.2)",
                  borderColor: "#dc3545",
                  borderWidth: 3,
                  fill: true,
                  tension: 0.4,
                  pointBackgroundColor: "#dc3545",
                  pointBorderColor: "#fff",
                  pointBorderWidth: 2,
                  pointRadius: 6,
                }
              ]
            }}
            options={{
              responsive: true,
              plugins: {
                legend: {
                  display: true,
                  position: 'top',
                },
                tooltip: {
                  backgroundColor: 'rgba(30, 166, 154, 0.9)',
                  titleColor: '#fff',
                  bodyColor: '#fff',
                  borderColor: '#1ea69a',
                  borderWidth: 1,
                }
              },
              scales: {
                y: {
                  beginAtZero: true,
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                  }
                },
                x: {
                  grid: {
                    color: 'rgba(30, 166, 154, 0.1)',
                  },
                  ticks: {
                    color: '#1ea69a',
                  }
                }
              }
            }}
            height={220}
          />
        </div>
          <h5 className="mt-5 mb-3">EMPLOYEE PERFORMANCE RATIO</h5>          <div className="chart-container mt-5">
          <Pie
            data={{
              labels: ["Grade A", "Grade B", "Grade C"],
              datasets: [{
                data: [
                  categoryStats.reduce((sum, c) => sum + c.grade_A, 0),
                  categoryStats.reduce((sum, c) => sum + c.grade_B, 0),
                  categoryStats.reduce((sum, c) => sum + c.grade_C, 0)
                ],
                backgroundColor: [
                  "rgba(40, 167, 69, 0.8)",
                  "rgba(255, 193, 7, 0.8)", 
                  "rgba(220, 53, 69, 0.8)"
                ],
                borderColor: [
                  "#28a745",
                  "#ffc107",
                  "#dc3545"
                ],
                borderWidth: 3,
                hoverBackgroundColor: [
                  "rgba(40, 167, 69, 0.9)",
                  "rgba(255, 193, 7, 0.9)",
                  "rgba(220, 53, 69, 0.9)"
                ],
                hoverBorderWidth: 4,
              }]
            }}
            options={{
              responsive: true,
              plugins: {
                legend: {
                  display: true,
                  position: 'bottom',
                  labels: {
                    padding: 20,
                    color: '#1ea69a',
                    font: {
                      size: 14,
                      weight: 'bold'
                    }
                  }
                },
                tooltip: {
                  backgroundColor: 'rgba(30, 166, 154, 0.9)',
                  titleColor: '#fff',
                  bodyColor: '#fff',
                  borderColor: '#1ea69a',
                  borderWidth: 1,
                  callbacks: {
                    label: function(context) {
                      const total = context.dataset.data.reduce((a, b) => a + b, 0);
                      const percentage = ((context.parsed / total) * 100).toFixed(1);
                      return context.label + ': ' + context.parsed + ' (' + percentage + '%)';
                    }
                  }
                }
              }
            }}
            height={180}
          />
        </div>
      </div>
    </div>
  )
}

export default Home