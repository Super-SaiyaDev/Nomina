import React from "react";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom'
import LoginUser from "../app/login.";
import Principal from "../app/dashboard";

const Path = () => {
  return (
    <>
    <Router>
        <Routes>
            <Route path="/login" element={<LoginUser/>}/>
            <Route path="/home" element={<Principal/>}></Route>
        </Routes>
    </Router>
    </>
  )
}

export default Path