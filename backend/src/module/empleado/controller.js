const db = require("../../database/DbEmployees");

const listEmployees = () => {
  return db.listEmployees("employees");
};

// const list_inactive = () => {
//   return db.list_inactive(table);
// };  

// const reactivated = (id) => {
//   return db.reactivated(table, id);
// };

// const search = (id) => {
//   return db.search(table, id);
// };

// const add = (data) => {
//   return db.add(table, data);
// };

// const delet = (id) => {
//   return db.delet("usuario", id);
// };

// const update = (data, id) => {
//   return db.update(table, data, id);
// };


module.exports = {
  listEmployees,
//   search,
//   list_inactive,
//   reactivated,
//   add,
//   delet,
//   update,
};