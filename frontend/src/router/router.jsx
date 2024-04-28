import React from "react";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import LoginUser from "../app/login.";
import Principal from "../app/dashboard";
import Table from "../app/table";
import Users from "../app/usuarios";
import Employees from "../app/empleados";

const Path = () => {
  return (
    <>
    <Router>
        <Routes>
            <Route path="/login" element={<LoginUser/>}/>
            <Route path="/home" element={<Principal/>}></Route>
            <Route path="/table" element={<Table/>}></Route>
            <Route path="/usuarios" element={<Users/>}></Route>
            <Route path="/empleados" element={<Employees/>}></Route>
            <Route path="*" element={<h1>Hola mundo</h1>}></Route>
        </Routes>
    </Router>
    </>
  )
}

export default Path