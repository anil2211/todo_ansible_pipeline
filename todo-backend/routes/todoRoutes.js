const express = require("express")
const {getTodos,addTodo} = require("../controllers/todoControllers")


const router = express.Router()
router.get("/get-todos",getTodos)
router.post("/add-todo",addTodo)
// router.delete("/id",)


module.exports= router;