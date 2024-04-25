const express = require("express");
const router = express.Router();
const respuesta = require("../../red/respuesta");
const controlador = require("./controller");

//! listar Users
router.get("/", async (req, res) => {
  const items = await controlador.listUsers();
  respuesta.success(req, res, items, 200);
});


module.exports = router;