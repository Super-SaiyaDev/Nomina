const db = require("mysql");
const config = require("../config");

const conection = {
  host: config.mysql.host,
  user: config.mysql.user,
  password: config.mysql.password,
  database: config.mysql.database,
};

const Database = db.createConnection(conection);

Database.connect((err) => {
  if (err) return console.log("Error connexion in the data of base :", err);
  console.log("connexion is runnig");
});

Database.on("error", (err) => {
  console.log("Error en la base de datos", err);
  if (err.code === "PROTOCOL_CONNECTION_LOST") {
    console.log("Error in the CONNECTION LOST");
  } else {
    throw err;
  }
});

//? Users

const listUsers = () => {
  return new Promise((resolve, reject) => {
    Database.query(`CALL ListUsers();`, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res[0]);
      }
    });
  });
};
const searchUsers = (id) => {
  return new Promise((resolve, reject) => {
    Database.query(`CALL SearchUsers(${id});`, (err, res) => {
      err ? reject(err) : resolve(res);
    });
  });
};

const createUsers = (data) => {
  return new Promise((resolve, reject) => {
    const { NameUser, LastName, Users, Clave, IdRole } = data;
    Database.query(
      `CALL CreateUsers(?, ?, ?, ?, ?);`,
      [NameUser, LastName, Users, Clave, IdRole],
      (err, res) => {
        err ? reject(err) : resolve(res);
      }
    );
  });
};

const updateUsers = (id, data) => {
  return new Promise((resolve, reject) => {
    const { NameUser, LastName, Users, Clave, IdRole } = data;
    const sql = `CALL UpdateUsers(?,?,?,?,?,?);`;
    Database.query(
      sql,
      [id, NameUser, LastName, Users, Clave, IdRole],
      (err, res) => {
        err ? reject(err) : resolve(res);
      }
    );
  });
};

const deletUser = (id) => {
  return new Promise((resolve, reject) => {
    const sql = `CALL DeleteUsers(${id});`;
    Database.query(sql, (err, res) => {
      err ? reject(err) : resolve(res);
    });
  });
};

// const listInactive = () => {
//   return new Promise((resolve, reject) => {
//     Database.query(
//       `SELECT * FROM ${table} WHERE activo = 'inactivo'`,
//       (err, res) => {
//         err ? reject(err) : resolve(res);
//       }
//     );
//   });
// };

// const reactivated = (table, id) => {
//   return new Promise((resolve, reject) => {
//     Database.query(
//       `update ${table} set activo = 'activo' WHERE id = ${id};`,
//       (err, res) => {
//         err ? reject(err) : resolve(res);
//       }
//     );
//   });
// };

// const login = (table, data) => {
//   return new Promise((resolve, reject) => {
//     Database.query(
//       `SELECT * FROM ${table} WHERE user = "${data.user}" and clave = "${data.clave}"`,
//       (err, res) => {
//         err ? reject(err) : resolve(res);
//       }
//     );
//   });
// };

//? employees

const listEmployees = (table) => {
  return new Promise((resolve, reject) => {
    Database.query(`SELECT * FROM ${table}`, (err, res) => {
      err ? reject(err) : resolve(res);
    });
  });
};

// const list_inactive = (table) => {
//   return new Promise((resolve, reject) => {
//     Database.query(
//       `SELECT * FROM ${table} WHERE activo = 'inactivo'`,
//       (err, res) => {
//         err ? reject(err) : resolve(res);
//       }
//     );
//   });
// };

// const reactivated = (table, id) => {
//   return new Promise((resolve, reject) => {
//     Database.query(
//       `update ${table} set activo = 'activo' WHERE id = ${id};`,
//       (err, res) => {
//         err ? reject(err) : resolve(res);
//       }
//     );
//   });
// };

// const search = (table, id) => {
//   return new Promise((resolve, reject) => {
//     Database.query(`SELECT * FROM ${table} WHERE id = ${id}`, (err, res) => {
//       err ? reject(err) : resolve(res);
//     });
//   });
// };

// const add = (table, data) => {
//   return new Promise((resolve, reject) => {
//     Database.query(`INSERT INTO ${table} SET ?;`, [data], (err, res) => {
//       err ? reject(err) : resolve(res);
//     });
//   });
// };

// const update = (table, data, id) => {
//   return new Promise((resolve, reject) => {
//     const sql = `UPDATE ${table} SET ? where id = ${id};`;
//     Database.query(sql, [data], (err, res) => {
//       err ? reject(err) : resolve(res);
//     });
//   });
// };

// const delet = (table, id) => {
//   return new Promise((resolve, reject) => {
//     const sql = `update ${table} set activo = 'inactivo' WHERE id =  ${id};`;
//     Database.query(sql, (err, res) => {
//       err ? reject(err) : resolve(res);
//     });
//   });
// };

module.exports = {
  listUsers,
  searchUsers,
  createUsers,
  updateUsers,
  deletUser,
  // login,
  // list_inactive,
  // reactivated,
  // delet,
  // update,
  // listEmployees,
};
