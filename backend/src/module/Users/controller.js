const db = require("../../database/database");

const listUsers = () => {
  return db.listUsers();
};

const searchUsers = (id) => {
  return db.searchUsers(id);
};

const createUsers = (data) => {
  return db.createUsers(data);
}

const updateUsers = (id,data) => {
  return db.updateUsers(id,data);
};

const delteUsers = (id) => {
  return db.deletUser(id);
};




module.exports = { listUsers, searchUsers, createUsers, updateUsers, delteUsers};
