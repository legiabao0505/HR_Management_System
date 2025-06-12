import React, { useEffect, useState } from "react";
import axios from "axios";
import { utils, writeFile } from "xlsx";
import jsPDF from "jspdf";
import "jspdf-autotable";

const PAGE_SIZE = 4;

const AIAnalyze = () => {
  const [evaluations, setEvaluations] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [page, setPage] = useState(1);
  const [search, setSearch] = useState("");
  const [showDetail, setShowDetail] = useState(false);
  const [selectedReport, setSelectedReport] = useState("");
  const [selectedSuggestion, setSelectedSuggestion] = useState(""); // New state for suggestion

  const fetchEvaluations = (searchValue = "") => {
    setLoading(true);
    setError("");
    axios
      .get("http://localhost:3000/auth/employee_evaluations", {
        params: { search: searchValue },
      })
      .then((res) => {
        if (res.data && res.data.Status && Array.isArray(res.data.Result)) {
          setEvaluations(res.data.Result);
        } else if (res.data && res.data.Error) {
          setError(res.data.Error);
        } else {
          setError("Unknown error");
        }
        setLoading(false);
      })
      .catch((err) => {
        setError("Server error");
        setLoading(false);
      });
  };

  useEffect(() => {
    fetchEvaluations();
  }, []);

  const handleSearch = (e) => {
    e.preventDefault();
    setPage(1);
    fetchEvaluations(search);
  };

  // Pagination logic
  const totalPages = Math.ceil(evaluations.length / PAGE_SIZE);
  const paginated = evaluations.slice(
    (page - 1) * PAGE_SIZE,
    page * PAGE_SIZE
  );

  // Modal handlers
  const handleShowDetail = async (employee_id) => {
    setSelectedReport("Đang tải...");
    setShowDetail(true);
    try {
      const res = await axios.get(
        `http://localhost:3000/auth/employee_report/${employee_id}`
      );
      if (res.data && res.data.Status) {
        setSelectedReport(res.data.Report || "No report.");
        setSelectedSuggestion(res.data.Suggestion || ""); // Set suggestion if available
      } else {
        setSelectedReport("No report.");
        setSelectedSuggestion(""); // Clear suggestion
      }
    } catch {
      setSelectedReport("Error loading report.");
      setSelectedSuggestion(""); // Clear suggestion on error
    }
  };
  const handleCloseDetail = () => {
    setShowDetail(false);
    setSelectedReport("");
    setSelectedSuggestion(""); // Clear suggestion on close
  };

  return (
    <div className="container mt-4">
      <h3 style={{ color: "#1ea69a", fontWeight: 700, letterSpacing: 1,textAlign: "center" }}>
        AI EMPLOYEE EVALUATION RESULTS
      </h3>
      <form className="mb-3 d-flex justify-content-between align-items-center" onSubmit={handleSearch}>
  <div className="d-flex" style={{ flex: 1 }}>
    <input
      type="text"
      className="form-control me-2"
      placeholder="Search by name or employee ID"
      value={search}
      onChange={(e) => setSearch(e.target.value)}
    />
    <button className="btn btn-primary" type="submit">
      Search
    </button>
  </div>
  <div>
    <button
      className="btn btn-outline-success me-2"
      type="button"
      onClick={() => {
        const ws = utils.json_to_sheet(evaluations);
        const wb = utils.book_new();
        utils.book_append_sheet(wb, ws, "Report");
        writeFile(wb, "report.xlsx");
      }}
    >
      Export Excel
    </button>
    <button
      className="btn btn-outline-danger"
      type="button"
      onClick={() => {
        const doc = new jsPDF();
        doc.text("Report", 10, 10);
        doc.autoTable({ html: "#ai-eval-table" });
        doc.save("report.pdf");
      }}
    >
      Export PDF
    </button>
  </div>
</form>
      {loading && <div>Loading evaluations...</div>}
      {error && <div style={{ color: "red" }}>{error}</div>}
      <div className="table-responsive">
        <table className="table table-bordered align-middle" id="ai-eval-table">
          <thead className="table-light">
            <tr>
              <th>Employee ID</th>
              <th>Name</th>
              <th>Type</th>
              <th>Date</th>
              <th>AI Comment</th>
              <th>AI Suggestion</th>
              <th>View Report</th>
            </tr>
          </thead>
          <tbody>
            {paginated.length > 0 ? (
              paginated.map((ev) => (
                <tr key={ev.id || `${ev.employee_id}-${ev.created_at}`}>
                  <td>{ev.employee_id}</td>
                  <td>{ev.name}</td>
                  <td>
                    <span
                      style={{
                        fontWeight: "bold",
                        color:
                          ev.type === "A"
                            ? "green"
                            : ev.type === "B"
                            ? "#e6b800"
                            : "red",
                      }}
                    >
                      {ev.type}
                    </span>
                  </td>
                  <td>
                    {ev.created_at
                      ? new Date(ev.created_at).toLocaleString()
                      : ""}
                  </td>
                  <td style={{ whiteSpace: "pre-wrap", maxWidth: 620 }}>
                    {ev.comment}
                  </td>
                  <td style={{ whiteSpace: "pre-wrap", maxWidth: 320 }}>
                    {ev.suggestion || ""}
                  </td>
                  <td>
                    <button
                      className="btn btn-info btn-sm"
                      onClick={() => handleShowDetail(ev.employee_id)}
                    >
                      View Report
                    </button>
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={7} className="text-center">
                  No data
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
      {/* Pagination controls */}
      <div className="d-flex justify-content-center align-items-center gap-2">
        <button
          className="btn btn-primary ms-2"
          disabled={page === 1}
          onClick={() => setPage(page - 1)}
        >
          Previous
        </button>
        <span>
          Page {page} / {totalPages || 1}
        </span>
        <button
          className="btn btn-primary ms-2"
          disabled={page === totalPages || totalPages === 0}
          onClick={() => setPage(page + 1)}
        >
          Next
        </button>
      </div>

      {/* Modal popup */}
      {showDetail && (
        <div
          style={{
            position: "fixed",
            top: 0,
            left: 0,
            width: "100vw",
            height: "100vh",
            background: "rgba(0,0,0,0.3)",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 9999,
          }}
          onClick={handleCloseDetail}
        >
          <div
            style={{
              background: "#fff",
              padding: 24,
              borderRadius: 8,
              minWidth: 320,
              maxWidth: 600,
              maxHeight: "80vh",
              overflowY: "auto",
              boxShadow: "0 4px 32px rgba(0,0,0,0.15)",
            }}
            onClick={(e) => e.stopPropagation()}
          >
            <h4 className="mb-3 text-center">Employee Report Details</h4>
            <div style={{ whiteSpace: "pre-line", minHeight: 100 }}>
              {selectedReport || "No report."}
            </div>
            {selectedSuggestion && (
  <div className="alert alert-info mt-3">
    <b>AI Suggestion:</b> {selectedSuggestion}
  </div>
)}
            <div className="d-flex justify-content-end mt-3">
              <button className="btn btn-secondary" onClick={handleCloseDetail}>
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default AIAnalyze;

