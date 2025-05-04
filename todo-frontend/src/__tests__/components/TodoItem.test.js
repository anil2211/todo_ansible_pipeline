import React from "react";

import { cleanup, render, screen } from "@testing-library/react";
import TodoItem from "../../components/TodoItem";

afterEach(()=>{
    cleanup();
    jest.resetAllMocks();
})

describe("Testing the Todo Item component", ()=>{

    const mockTodo = {_id:"1", title: "New Todo", completed: false}

    test("check if the todo title gets rendered", ()=>{
        render(<TodoItem todo={mockTodo}/>)
        expect(screen.getByText("New Todo")).toBeInTheDocument();
    })

    // check if the status of the todo is rendered

    // TODO: check if the onDelete method is invoked when clicked on delete button
})