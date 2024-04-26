import React, { useState } from "react";
import { useEffect } from "react";
import axios from "axios";
import DataTable from "../components/dataTable";
import "../css/table.css";
import { IoSearchOutline } from "react-icons/io5";
import { IoMdPersonAdd } from "react-icons/io";
import { Link } from "react-router-dom";
import Modal from "react-modal";
import Create from "../components/create";

const Table = ({ columns, rows, api }) => {
  const [isInputFocused, setInputFocused] = useState(false);
  const [datos, setData] = useState([{}]);
  const [modalIsOpen, setModalIsOpen] = useState(false);

  useEffect(() => {
    const fechData = async () => {
      const response = await axios.get(api.url);
      const data = response.data.body;
      console.log(data);
      setData(data);
    };

    fechData();
  }, []);

  return (
    <div className="datatable ">
      <div className="container-datatable">
        <div className="header-table ">
          <div className="title-table">
            <h1>Users Management</h1>
          </div>

          <div className="navigate-table">
            <div className="btn-navigate">
              <button onClick={() => setModalIsOpen(true)}>
                <IoMdPersonAdd /> New User
              </button>
              <Modal
                isOpen={modalIsOpen}
                onRequestClose={() => setModalIsOpen(false)}
              >
                <Create setModalIsOpen={setModalIsOpen} />
              </Modal>

              <button>
                <Link to="/history">
                  <IoMdPersonAdd /> Historial
                </Link>
              </button>
            </div>

            <div className="input-feild-s">
              <i className={`lbl-search ${isInputFocused ? "desactived" : ""}`}>
                <IoSearchOutline />
              </i>
              <input
                className="input-search"
                type="text"
                onFocus={() => setInputFocused(true)}
                onBlur={() => setInputFocused(false)}
              />
            </div>
          </div>
        </div>

        <div className="content-Table scrollable-table">
          <div className=" table-responsive ">
            <DataTable data={datos} columns={columns} rows={rows} />
          </div>

          {/* <table>
          <thead>
            <tr>
            <th>id</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>telefono</th>
            <th>email</th>
            <th>presupuesto</th>
            </tr>
            </thead>
            <tbody>
            {datos.map((items, key) => (
              <tr key={key}>
              <td>{items.id}</td>
              <td>{items.nombre}</td>
              <td>{items.usuario}</td>
              <td>{items.clave}</td>
              <td>{items.activo}</td>
              <td>
              <Link to={`/update/${items.id}`}>
              <button>
              <RiEdit2Fill />
              </button>
              </Link>
              </td>
              <td>
              <button onClick={() => handlerDelete(items.id)}>
              <MdDelete />
              </button>
              </td>
              </tr>
            ))}
            </tbody>
          </table> */}
        </div>
        {/* Aquí va el contenido principal */}
      </div>
    </div>
  );
};

export default Table;
