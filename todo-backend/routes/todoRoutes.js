const express = require("express")
const {getTodos,addTodo} = require("../controllers/todoControllers")


const router = express.Router()
router.get("/get-todos",getTodos)
router.post("/add-todo",addTodo)
// router.delete("/delete/:id", deleteTodo);
router.get("/health", (req,res)=>{
    try{
    return res.status(200).json({ msg:"Healthy"})
    }
    catch(err){
        return res.status(500).json({ msg:"Un Healthy"})
    }
})

module.exports= router;