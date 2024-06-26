import React from "react";
import Sliderbar from "../components/sidebar";
import NavbarSystem from "../components/navabar";
import Table from "./table";

const Users = () => {
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

  const api = {
    url: "http://localhost:3000/api/users/",
  };

  return (
    <>
      <header>
        <nav>
          <NavbarSystem />
        </nav>
      </header>
      <section>
        <Sliderbar />
        <Table rows={rows} columns={columns} api={api}></Table>
      </section>
    </>
  );
};

export default Users;
