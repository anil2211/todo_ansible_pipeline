import { useEffect, useState } from "react";

import BACKEND_URL from "../config/config";
import AddTodo from "./AddTodo";
import TodoItem from "./TodoItem";


const TodoList=()=>{
    const [todos,setTodos] = useState([]);
    useEffect(()=>{
        fetchTodos();
    },[])

    const fetchTodos = async ()=>{
        try {
            const response = await fetch(`${BACKEND_URL}/get-todos`)
            const data = await response.json()
            setTodos(data)

            console.log(data)
        } catch (error) {
            console.error("Error fetching the data",error)
        }
    }
    
const addTodo = async (title)=>{
    try {
        const response = await fetch(`${BACKEND_URL}/add-todo`,{
            method: "POST",
            headers:{'Content-Type':'application/json'},
            // body: JSON.stringify({todo})    
            body: JSON.stringify({title})    

        })
        const newTodo=await response.json();
        setTodos((prev)=> [...prev, newTodo])
        console.log("Response received",response)
    } catch (error) {
        console.error("Error while creating the todo",error)
    }
}

    return(
        <div>
            <h1>Todo List</h1>
            <AddTodo onAdd={addTodo}/>
            <ul>
                {
                    todos.map( todo =>(
                        <TodoItem key ={todo._id} todo={todo}></TodoItem>
                        // console.log("Todo item ", todo)
                        // todo item component added here
                    ))
                }
            </ul>
        </div>
    )
}

export default TodoList
