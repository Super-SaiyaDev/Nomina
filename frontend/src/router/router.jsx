import React from "react";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import LoginUser from "../app/login.";
import Principal from "../app/dashboard";
import Table from "../app/table";

const Path = () => {
  return (
    <>
    <Router>
        <Routes>
            <Route path="/login" element={<LoginUser/>}/>
            <Route path="/home" element={<Principal/>}></Route>
            <Route path="/table" element={<Table/>}></Route>
        </Routes>
    </Router>
    </>
  )
}

export default Path