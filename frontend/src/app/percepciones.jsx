import React from "react";
import NavbarSystem from "../components/navabar";
import Sliderbar from "../components/sidebar";
import Table from "./table";

const Percepciones = () => {
  const columns = [
    "RNC",
    "Name",
    "Last",
    "activo",
    "Gender",
    "Civil Status",
    "Tel",
    "BirthDate",
    "Address",
    "Country",
    "State",
    "City",
    "Postal Code",
    "Email",
    "Clave",
  ];

  const rows = [
    "RNC",
    "NameEmployee",
    "Lastname",
    "activo",
    "Gender",
    "CivilStatus",
    "Tel",
    "BirthDate",
    "Address",
    "Country",
    "State",
    "City",
    "PostalCode",
    "Email",
    "Clave",
  ];

  const api = {
    url: "http://localhost:3000/api/employees",
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

export default Percepciones;
