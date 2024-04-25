const db = require("../../database/database");

const listUsers = () => {
  return db.listUsers("Users");
};

module.exports = { listUsers };
