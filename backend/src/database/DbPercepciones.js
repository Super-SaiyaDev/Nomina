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

const listPercepciones = () => {
  return new Promise((resolve, reject) => {
    Database.query(`CALL ListEmployeespPercepciones();`, (err, res) => {
      if (err) {
        reject(err);
      } else {
        resolve(res[0]);
      }
    });
  });
};

module.exports = {
  listPercepciones,
};
