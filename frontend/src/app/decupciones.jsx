import React from "react";
import NavbarSystem from "../components/navabar";
import Sliderbar from "../components/sidebar";
import Table from "./table";

const Decuciones = () => {
  const columns = [
    "# ",
    "Name",
    "Last Name",
    "User",
    "Clave",
    "Estado",
    "# role",
    "Name Role",
    "Descriptions",
    "Name Permission",
    "Descripcions Permission",
  ];
  const rows = [
    "IdUsers",
    "NameUser",
    "LastName",
    "Users",
    "Clave",
    "activo",
    "IDrole",
    "NameRole",
    "Descriptions",
    "NamePermission",
    "DP",
  ];
  const input = [
    { type: "text", lblName: "usuario", name: "usuario" },
    { type: "password", lblName: "clave", name: "clave" },
    { type: "email", lblName: "correo", name: "correo" },
  ];
  const api = { url: "http://localhost:3000/api/users/" };

  return (
    <>
      <header>
        <nav>
          <NavbarSystem />
        </nav>
      </header>
      <section>
        <Sliderbar />
        <Table rows={rows} columns={columns} api={api} input={input} />
      </section>
    </>
  );
};

export default Decuciones;
