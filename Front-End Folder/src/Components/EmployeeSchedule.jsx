import React, { useEffect, useState } from "react";
import { Calendar, momentLocalizer } from "react-big-calendar";
import { addHours, parseISO } from "date-fns";
import "react-big-calendar/lib/css/react-big-calendar.css";
import axios from "axios";
import { useParams } from "react-router-dom";
import moment from "moment";

const EmployeeSchedule = () => {
  const { id } = useParams();
  const [events, setEvents] = useState([]);

  useEffect(() => {
    axios
      .get(`http://localhost:3000/employee/work_schedule/${id}`)
      .then((res) => {
        if (res.data.Status) {
          const mapped = res.data.Result.map((item) => {
            // shift: morning, night, afternoon (chữ thường)
            let startHour = 8,
              endHour = 12;
            const shift = (item.shift || "").toLowerCase();
            if (shift === "morning") {
              startHour = 6;
              endHour = 18;
            } else if (shift === "night") {
              startHour = 18;
              endHour = 6;
            }
            return {
              title: shift.charAt(0).toUpperCase() + shift.slice(1) + " Shift",
              start: addHours(parseISO(item.date), startHour),
              end: addHours(parseISO(item.date), endHour),
            };
          });
          setEvents(mapped);
        } else setEvents([]);
      })
      .catch(() => setEvents([]));
  }, [id]);

  const localizer = momentLocalizer(moment);

  return (
    <div className="schedule-container">
      <div className="schedule-card">
        <h3 className="schedule-title">Your Work Schedule</h3>
        <Calendar
          localizer={localizer}
          events={events}
          startAccessor="start"
          endAccessor="end"
          style={{ height: 500, background: 'transparent', borderRadius: 12 }}
        />
      </div>
    </div>
  );
};

export default EmployeeSchedule;