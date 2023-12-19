const Route = require("express").Router();
const controller = require("../controllers/controller");






Route.get("/hello", controller.getAll);

module.exports = Route;
