import React from "react";
import NavbarSystem from "../components/navabar";
import Sliderbar from "../components/sidebar";
import Table from "./table";

const Percepciones = () => {
  const rows = [
    "RNC",
    "NameEmployee",
    "Lastname",
    "Tel",
    "Address",
    "Country",
    "State",
    "City",
    "PostalCode",
    "Email",
    "SalaryBase",
    "Bonus",
    "PayDate",
    "PayTerms",
  ];

  const columns = [
    "RNC",
    "Nombre",
    "Segundo nombre		",
    "Telefono",
    "Direccion		",
    "Pais	",
    "Estado",
    "Ciudad	",
    "Codigo Postal",
    "Email	",
    "Salario Base",
    "Bonificaciones",
    "Fecha de pago",
    "Terminos de pago",
  ];

  const api = {
    url: "http://localhost:3000/api/percepciones",
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
