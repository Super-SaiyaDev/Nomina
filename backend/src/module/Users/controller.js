const db = require("../../database/DbUsers");

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
  return db.deleteUser(id);
};


const loginUsers = (data) => {
  return db.loginUsers(data);
}

module.exports = { listUsers, searchUsers, createUsers, updateUsers, delteUsers, loginUsers};
