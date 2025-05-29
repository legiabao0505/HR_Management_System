import './App.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Login from './Components/Login'
import Dashboard from './Components/Dashboard'
import Home from './Components/Home'
import Employee from './Components/Employee'
import Category from './Components/Category'
import Profile from './Components/Profile'
import AddCategory from './Components/AddCategory'
import AddEmployee from './Components/AddEmployee'
import EditEmployee from './Components/EditEmployee'
import Start from './Components/Start'
import EmployeeLogin from './Components/EmployeeLogin'
import EmployeeDetail from './Components/EmployeeDetail'
import PrivateRoute from './Components/PrivateRoute'
import AutoSchedule from './Components/AutoSchedule'
import EmployeeSchedule from './Components/EmployeeSchedule'
import EditProfile from './Components/EditProfile'
import EmployeeReports from './Components/EmployeeReports'
import AIAnalyze from './Components/AIAnalyze'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Start />} />
        <Route path='/adminlogin' element={<Login />} />
        <Route path='/employee_login' element={<EmployeeLogin />} />
        <Route path='/employee_detail/:id' element={<EmployeeDetail />}>
          <Route path='edit' element={<EditProfile />} />
          <Route path='schedule' element={<EmployeeSchedule />} />
          <Route path='reports' element={<EmployeeReportsWrapper />} />
        </Route>
        <Route path='/dashboard' element={
          <PrivateRoute>
            <Dashboard />
          </PrivateRoute>
        }>
          <Route path='' element={<Home />} />
          <Route path='employee' element={<Employee />} />
          <Route path='category' element={<Category />} />
          <Route path='profile' element={<Profile />} />
          <Route path='add_category' element={<AddCategory />} />
          <Route path='add_employee' element={<AddEmployee />} />
          <Route path='edit_employee/:id' element={<EditEmployee />} />
          <Route path='auto-schedule' element={<AutoSchedule />} />
          <Route path='ai-analyze' element={<AIAnalyze />} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}

// Wrapper to get employeeId from URL params and pass to EmployeeReports
import { useParams } from 'react-router-dom';
function EmployeeReportsWrapper() {
  const { id } = useParams();
  return <EmployeeReports employeeId={id} />;
}


export default App
