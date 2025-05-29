import React, { useEffect, useState } from "react";
import axios from "axios";

const PAGE_SIZE = 3;

const AIAnalyze = () => {
  const [evaluations, setEvaluations] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [page, setPage] = useState(1);
  const [search, setSearch] = useState("");

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

  return (
    <div className="container mt-4">
      <h2>AI Employee Evaluation Results</h2>
      <form className="mb-3 d-flex" onSubmit={handleSearch}>
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
      </form>
      {loading && <div>Loading evaluations...</div>}
      {error && <div style={{ color: "red" }}>{error}</div>}
      <div className="table-responsive">
        <table className="table table-bordered align-middle">
          <thead className="table-light">
            <tr>
              <th>Employee ID</th>
              <th>Name</th>
              <th>Comment</th>
              <th>Type</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            {paginated.length > 0 ? (
              paginated.map((ev) => (
                <tr key={ev.id || `${ev.employee_id}-${ev.created_at}`}>
                  <td>{ev.employee_id}</td>
                  <td>{ev.name}</td>
                  <td>{ev.comment}</td>
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
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={5} className="text-center">
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
    </div>
  );
};

export default AIAnalyze;

