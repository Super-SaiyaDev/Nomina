const db = require("mysql");
const config = require("../config");
const bcrypt = require("bcrypt");

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
    let sql = `CALL SearchUsers(?);`;
    const inserts = [id];
    sql = db.format(sql, inserts);
    Database.query(sql, (err, res) => {
      if (err) {
        reject({ message: "Database error", error: err });
      } else if (res[0].length === 0) {
        reject({ Error: "El usuario no existe" });
      } else {
        resolve(res[0]);
      }
    });
  });
};

const createUsers = async (data) => {
  return new Promise(async (resolve, reject) => {
    const { NameUser, LastName, Users, Clave, IdRole } = data;
    let hashedPassword;
    try {
      hashedPassword = await bcrypt.hash(Clave, 10);
    } catch (error) {
      reject({ message: "Error hashing password", error: err });
      return;
    }
    let sql = `CALL CreateUsers(?, ?, ?, ?, ?);`;
    const inserts = [NameUser, LastName, Users, hashedPassword, IdRole];
    sql = db.format(sql, inserts);
    Database.query(sql, (err, res) => {
      err ? reject({ message: "Database error", error: err }) : resolve(res);
    });
  });
};

const updateUsers = async (id, data) => {
  return new Promise(async (resolve, reject) => {
    const { NameUser, LastName, Users, Clave, IdRole } = data;
    let hashedPassword;
    try {
      hashedPassword = await bcrypt.hash(Clave, 10);
    } catch (error) {
      reject({ message: "Error hashing password", error: err });
      return;
    }
    let sql = `CALL UpdateUsers(?,?,?,?,?,?);`;
    const inserts = [id, NameUser, LastName, Users, hashedPassword, IdRole];
    sql = db.format(sql, inserts);
    Database.query(sql, (err, res) => {
      if (err) {
        console.error(err);
        reject({ message: "Database error", error: err });
      } else {
        resolve(res);
      }
    });
  });
};

const deleteUser = (id) => {
  return new Promise((resolve, reject) => {
    let sql = `CALL DeleteUsers(?);`;
    let inserts = [id];
    sql = db.format(sql, inserts);
    Database.query(sql, (err, res) => {
      err ? reject({ message: "Database error", error: err }) : resolve(res);
    });
  });
};

const loginUsers = (data) => {
  return new Promise((resolve, reject) => {
    let sql = `SELECT * FROM Users WHERE Users = ?`;
    let inserts = [data.user];
    sql = db.format(sql, inserts);
    Database.query(sql, async (err, res) => {
      if (err) {
        reject({ message: "Database error", error: err });
      } else if (res.length === 0) {
        reject({ message: "Invalid username or password" });
      } else {
        const user = res[0];
        const passwordMatches = await bcrypt.compare(data.clave, user.Clave);
        if (passwordMatches) {
          resolve(user);
        } else {
          reject({ message: "Invalid username or password" });
        }
      }
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
  deleteUser,
  loginUsers,
  // login,
  // list_inactive,
  // reactivated,
  // delet,
  // update,
  // listEmployees,
};
