import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'

const Category = () => {

    const [category, setCategory] = useState([])

    useEffect(()=> {
        axios.get('http://localhost:3000/auth/category')
        .then(result => {
            if(result.data.Status) {
                setCategory(result.data.Result);
            } else {
                alert(result.data.Error)
            }        }).catch(err => console.log(err))
    }, [])
  return (
    <div className='px-5 mt-3'>
      <div className="card enhanced-card">
        <div className="card-header">
          <h3 className='d-flex justify-content-center mb-0'>CATEGORY LIST</h3>
        </div>
        <div className="card-body">
          <Link to="/dashboard/add_category" className='btn btn-success mb-3'>Add Category</Link>
          <div className='mt-3'>
            <table className='table enhanced-table'>
                <thead>
                    <tr>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        category.map(c => (
                            <tr>
                                <td>{c.name}</td>
                            </tr>
                        ))
                    }                </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Category