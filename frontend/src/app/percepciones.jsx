import React from "react";
import NavbarSystem from "../components/navabar";
import Sliderbar from "../components/sidebar";
import PanelPercepciones from "../components/panelPercepciones";


const Percepciones = () => {
  return (
    <>
      <header>
        <nav>
          <NavbarSystem />
        </nav>
      </header>
      <section>
        <Sliderbar />
        <PanelPercepciones></PanelPercepciones>
      </section>
    </>
  );
};

export default Percepciones;
