import React, { useState, useEffect } from "react";
import axios from "axios";

const EmployeeReports = ({ employeeId }) => {
  const [report, setReport] = useState("");
  const [message, setMessage] = useState("");
  const [reports, setReports] = useState([]);
  const [showHistoryPopup, setShowHistoryPopup] = useState(false);
  const [expandedDates, setExpandedDates] = useState({});
  const fetchReports = () => {
    axios.get(`http://localhost:3000/employee/reports/${employeeId}`)
      .then(res => {
        console.log("Fetch reports response:", res.data);
        if (res.data.Status) setReports(res.data.Result);
      })
      .catch(err => {
        console.error("Error fetching reports:", err);
      });
  };
  useEffect(() => {
    if (employeeId) {
      fetchReports();
    }
    // eslint-disable-next-line
  }, [employeeId]);
  const handleSubmit = (e) => {
    e.preventDefault();
    if (!report.trim()) {
      setMessage("Please enter your report.");
      return;
    }
    
    console.log("Submitting report for employee:", employeeId);
    
    axios.post("http://localhost:3000/employee/add_report", {
      employee_id: employeeId,
      report: report.trim()
    }).then(res => {
      console.log("Submit response:", res.data);
      setMessage(res.data.Message || res.data.Error);
      if (res.data.Status) {
        setReport("");
        // Refresh reports list after successful submission
        setTimeout(() => {
          fetchReports();
        }, 500);
      }
    }).catch(err => {
      console.error("Error submitting report:", err);
      setMessage("Error submitting report. Please try again.");
    });
  };
  
  // Group reports by date
  const groupReportsByDate = () => {
    const grouped = {};
    reports.forEach(report => {
      const date = new Date(report.date).toDateString();
      if (!grouped[date]) {
        grouped[date] = [];
      }
      grouped[date].push(report);
    });
    return grouped;
  };

  const toggleDateExpansion = (date) => {
    setExpandedDates(prev => ({
      ...prev,
      [date]: !prev[date]
    }));
  };

  const ReportsHistoryPopup = () => {
    if (!showHistoryPopup) return null;
    
    const groupedReports = groupReportsByDate();
    
    return (
      <div className="reports-popup-overlay" onClick={() => setShowHistoryPopup(false)}>
        <div className="reports-popup" onClick={e => e.stopPropagation()}>
          <div className="reports-popup-header">
            <h4 className="reports-popup-title">
              <i className="bi bi-clock-history me-2"></i>
              Reports History
            </h4>
            <button 
              className="reports-popup-close"
              onClick={() => setShowHistoryPopup(false)}
            >
              <i className="bi bi-x"></i>
            </button>
          </div>
          <div className="reports-popup-body">
            {Object.keys(groupedReports).length > 0 ? (
              <div className="reports-by-date">
                {Object.entries(groupedReports).map(([date, dayReports]) => (
                  <div key={date} className="report-date-group">
                    <div 
                      className="report-date-header"
                      onClick={() => toggleDateExpansion(date)}
                    >
                      <div className="report-date-title">
                        {new Date(date).toLocaleDateString('en-US', { 
                          weekday: 'long', 
                          year: 'numeric', 
                          month: 'long', 
                          day: 'numeric' 
                        })}
                        <span style={{marginLeft: '8px', color: 'var(--gray-500)', fontSize: '0.9rem'}}>
                          ({dayReports.length} report{dayReports.length > 1 ? 's' : ''})
                        </span>
                      </div>
                      <i className={`bi bi-chevron-down report-date-icon ${expandedDates[date] ? 'expanded' : ''}`}></i>
                    </div>
                    <div className={`report-date-content ${expandedDates[date] ? 'expanded' : ''}`}>
                      {dayReports.map((r, index) => (
                        <div key={r.id} className="report-detail">
                          <div className="report-text">{r.report}</div>
                          <div className="report-time">
                            Submitted at: {new Date(r.date).toLocaleTimeString('en-US', {
                              hour: '2-digit',
                              minute: '2-digit'
                            })}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div style={{textAlign: 'center', padding: '40px', color: 'var(--gray-500)'}}>
                <i className="bi bi-journal-text" style={{fontSize: '3rem', display: 'block', marginBottom: '16px'}}></i>
                <p>No reports found. Submit your first report to see history here.</p>
              </div>
            )}
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="reports-container">
      <div className="reports-card">
        <h3 className="reports-title">Submit Your Daily Report</h3>
        <div className="report-form">
          <form onSubmit={handleSubmit}>
            <div className="mb-3">
              <textarea
                className="form-control2"
                rows={6}
                value={report}
                onChange={e => setReport(e.target.value)}
                placeholder="Enter your daily report here... Describe your tasks, achievements, and any challenges you faced today."
              />
            </div>
            <button type="submit" className="enhanced-btn-primary">
              <i className="bi bi-send me-2"></i>
              Submit Report
            </button>
          </form>
          {message && <div className="report-message">{message}</div>}
        </div>
          <div className="reports-history">
          <h4 className="reports-history-title">
            <i className="bi bi-clock-history me-2"></i>
            Recent Activity
          </h4>
          <p style={{color: 'var(--gray-600)', marginBottom: '16px'}}>
            {reports.length > 0 ? 
              `You have submitted ${reports.length} report${reports.length > 1 ? 's' : ''} so far.` :
              'No reports submitted yet.'
            }
          </p>
          <button 
            className="view-history-btn"
            onClick={() => setShowHistoryPopup(true)}
          >
            <i className="bi bi-list-ul"></i>
            View History Reports
          </button>
        </div>

        <ReportsHistoryPopup />
      </div>
    </div>
  );
};

export default EmployeeReports;