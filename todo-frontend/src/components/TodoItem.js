import React from "react"
const TodoItem = ({todo,onDelete,onComplete})=>{
    return(
        <li>
            {todo.title} {todo.completed}
            {/*   deletion logic implementation*/ }
            <button>Delete</button>
        </li>
    )
}

export default TodoItem