import React from "react";
import NavbarSystem from "../components/navabar";
import Sliderbar from "../components/sidebar";
import Table from "./table";

const Percepciones = () => {
  const rows = [
    "RNC",
    "NameEmployee",
    "Lastname",
    "Gender",
    "BirthDate",
    "CivilStatus",
    "Tel",
    "Address",
    "Country",
    "City",
    "State",
    "PostalCode",
    "Email",
    "TypeContract",
    "ContractTerms",
    "WorkingTime",
    "InitialDate",
    "Descriptions",
    "SalaryBase",
    "Bonus",
    "PayDate",
    "PayTerms",
    "OverTime",
  ];

  const columns = [
    "RNC",
    "Nombre",
    "Segundo nombre		",
    "Genero	",
    "Fecha de Nacimiento",
    "Estado Civil 	",
    "Telefono",
    "Direccion		",
    "Pais	",
    "Estado",
    "Ciudad	",
    "Codigo Postal",
    "Email	",
    "Tipo de contracto",
    "Terminos del contrato",
    "Tiempo Trabajo",
    "Dia Inicial",
    "Descripcion",
    "Salario Base",
    "Bonificaciones",
    "Fecha de pago",
    "Terminos de pago",
    "OverTime",
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
