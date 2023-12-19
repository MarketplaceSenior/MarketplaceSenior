const Route = require("express").Router();
const controller = require("../controllers/controller");


Route.get("/alluser", controller.getAll);
Route.get("/oneuser/:idu",controller.getone)
Route.post("/adduser",controller.adduser)

module.exports = Route;
