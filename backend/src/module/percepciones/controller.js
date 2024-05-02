const db = require("../../database/DbPercepciones");

const listPercepciones = () => {
  return db.listPercepciones();
};

module.exports = { listPercepciones,};
