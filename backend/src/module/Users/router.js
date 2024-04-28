const express = require("express");
const router = express.Router();
const respuesta = require("../../red/respuesta");
const controlador = require("./controller");

//? listar Users
router.get("/", async (req, res) => {
  const items = await controlador.listUsers();
  respuesta.success(req, res, items, 200);
});

//? search Users
router.get("/:id", async (req, res) => {
  try {
    console.log(req.params.id);
    const items = await controlador.searchUsers(req.params.id);
    respuesta.success(req, res, items, 200);
  } catch (err) {
    respuesta.error(req, res, err, 500);
  }
});

//? Create Users
router.post("/", async (req, res) => {
  try {
    const items = await controlador.createUsers(req.body);
    console.log(items);
    respuesta.success(req, res, items, 200);
  } catch (err) {
    respuesta.error(req, res, err, 500);
  }
});

//? Update Users
router.post("/:id", async (req, res) => {
  try {
    const items = await controlador.updateUsers(req.params.id, req.body);
    respuesta.success(req, res, items, 200);
  } catch (err) {
    respuesta.error(req, res, err, 500);
  }
});

//? Delete Users
router.delete("/:id", async (req, res) => {
  try {
    const items = await controlador.delteUsers(req.params.id);
    respuesta.success(req, res, "datos eliminados correctamente", 200);
  } catch (err) {
    respuesta.error(req, res, err, 500);
  }
});

module.exports = router;
