const express = require("express");
const router = express.Router();
const respuesta = require("../../red/respuesta");
const controlador = require("./controller");

//? listar Employees for percpcions
router.get("/", async (req, res) => {
  const items = await controlador.listPercepciones();
  respuesta.success(req, res, items, 200);
});




module.exports = router;
