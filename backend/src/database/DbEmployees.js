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


//? employees

const listEmployees = (table) => {
  return new Promise((resolve, reject) => {
    Database.query(`SELECT * FROM ${table}`, (err, res) => {
      err ? reject(err) : resolve(res);
    });
  });
};


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
  listEmployees,
  // searchUsers,
  // createUsers,
  // updateUsers,
  // deleteUser,
  // loginUsers,
  // login,
  // list_inactive,
  // reactivated,
  // delet,
  // update,
  // listEmployees,
};
