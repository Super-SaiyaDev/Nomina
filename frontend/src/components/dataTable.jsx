import React, { useState } from "react";
import { Link } from "react-router-dom";
import { RiEdit2Fill } from "react-icons/ri";
import { MdDelete } from "react-icons/md";
import axios from "axios";

const handlerDelete = async (id, setData) => {
  try {
    const response = await axios.delete(
      `http://localhost:3000/api/clientes/${id}`
    );
    if (response.status === 200) {
      location.reload();
      na;
      console.log(response);
    } else {
      console.log(responlse.data);
    }
  } catch (error) {
    console.log(error);
  }
};

function DataTable({ data, rows, columns }) {
  const rowsPerPage = 8; // Cambia esto al número de filas que quieres por tabla
  const [currentTable, setCurrentTable] = useState(0);
  const tables = [];
  for (let i = 0; i < data.length; i += rowsPerPage) {
    tables.push(data.slice(i, i + rowsPerPage));
  }

  return (
    <div>
      <table>
        <thead>
          <tr>
            {columns.map((column, key) => (
              <th key={key}>{column}</th>
            ))}
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          {data.length > 0 ? (
            tables[currentTable].map((item, key) => (
              <tr key={key}>
                {rows.map((cell, key) => (
                  <td key={key}>{item[cell]}</td>
                ))}
                <td>
                  <Link to={`/update/${item.IdUsers}`}>
                    <button>
                      <RiEdit2Fill />
                    </button>
                  </Link>
                </td>
                <td>
                  <button onClick={() => handlerDelete(item.IdUsers)}>
                    <MdDelete />
                  </button>
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td style={{ textAlign: "center" }} colSpan={columns.length + 2}>
                No data
              </td>
            </tr>
          )}
        </tbody>
      </table>
      <div className="container-btn-next">
        {data.length > 0 &&
          tables.map((_, index) => (
            <button className="btn-next" key={index} onClic={() => setCurrentTable(index)}>
              {index + 1}
            </button>
          ))}
      </div>
    </div>
  );
}

export default DataTable;
