import React, { useState } from "react";
import "../css/sidebar.css";
import { IoExitOutline } from "react-icons/io5";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

function Sliderbar() {
  const navigate = useNavigate();
  const [activeMenu, setActiveMenu] = useState("Inicio");

  const handleMenuClick = (menu) => {
    setActiveMenu(menu);
  };

  const handleLogout = async () => {
    try {
      await axios.get("http://localhost:3000/api/user/logout");
      console.log("logout success");
      navigate('/login');
    } catch (error) {
      console.log("logout error"), error;
    }
  };

  return (
    <div className="dashboard">
      <div className="sidebar">
        <ul className="ul">
          <li
            className={activeMenu === "Inicio" ? "active" : ""}
            onClick={() => handleMenuClick("Inicio")}
          >
            <Link className="lnk-sidebar" to="/home">
              Dashboard
            </Link>
          </li>
          <li
            className={activeMenu === "usuario" ? "active" : ""}
            onClick={() => handleMenuClick("usuario")}
          >
            <Link className="lnk-sidebar" to="/usuarios">
              Usuario
            </Link>
          </li>
          <li
            className={activeMenu === "propiedad" ? "active" : ""}
            onClick={() => handleMenuClick("propiedad")}
          >
            <Link className="lnk-sidebar" to="/empleados">
              Empleados
            </Link>
          </li>
          <li
            className={activeMenu === "visitas" ? "active" : ""}
            onClick={() => handleMenuClick("visitas")}
          >
            <Link className="lnk-sidebar" to="/contracto">
              Contracto
            </Link>
          </li>
          <li
            className={activeMenu === "ventas" ? "active" : ""}
            onClick={() => handleMenuClick("ventas")}
          >
            <Link className="lnk-sidebar" to="/deducciones">
              Deducciones
            </Link>
          </li>
          <li
            className={activeMenu === "compra" ? "active" : ""}
            onClick={() => handleMenuClick("compra")}
          >
            <Link className="lnk-sidebar" to="/Percepciones">
              Percepciones
            </Link>
          </li>
          <li
            className={activeMenu === "postventa" ? "active" : ""}
            onClick={() => handleMenuClick("postventa")}
          >
            <Link className="lnk-sidebar" to="/Nomina">
              Nomina
            </Link>
          </li>
          <li
            className={activeMenu === "registroActividad" ? "active" : ""}
            onClick={() => handleMenuClick("registroActividad")}
          >
            <Link className="lnk-sidebar" to="/RegistroActividad">
              Registro de Actividad
            </Link>
          </li>
          <li
            className={activeMenu === "Reportes" ? "active" : ""}
            onClick={() => handleMenuClick("Reportes")}
          >
            <Link className="lnk-sidebar" to="/Reportes">
              Reportes
            </Link>
          </li>
        </ul>
        <div className="content-btn-logout">
          <button onClick={handleLogout} className="btn-logout">
            <IoExitOutline /> Logout
          </button>
        </div>
      </div>
    </div>
  );
}

export default Sliderbar;
