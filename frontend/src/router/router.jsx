import React from "react";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import LoginUser from "../app/login.";
import Principal from "../app/dashboard";
import Table from "../app/table";
import Users from "../app/usuarios";
import Employees from "../app/empleados";
import Percepciones from "../app/percepciones";

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
            <Route path="/percepciones" element={<Percepciones/>}></Route>
        </Routes>
    </Router>
    </>
  )
}

export default Path