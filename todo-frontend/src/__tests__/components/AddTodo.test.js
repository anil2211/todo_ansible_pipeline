import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import React from 'react';
import AddTodo from "../../components/AddTodo";


afterEach(()=>{
    cleanup();
    jest.resetAllMocks();
})

describe("Testing the Add Todo component",()=>{
    test("Render the input and add button",()=>{
        render(<AddTodo onAdd={()=>{}}/>)
        expect(screen.getByPlaceholderText("Add a new todo")).toBeInTheDocument();
        expect(screen.getByRole("button",{name:"Add Todo"})).toBeInTheDocument

    })

    test("when form is submitted,the onAdd function to be invoked",()=>{
        const  mockOnAdd=jest.fn();
        render(<AddTodo onAdd={mockOnAdd}/>)

        const input = screen.getByPlaceholderText("Add a new todo");
        const button = screen.getByRole("button",{name:"Add Todo"});
        fireEvent.change(input,{ target: {value: "New Todo"}});
        fireEvent.click(button);

        expect(mockOnAdd).toHaveBeenCalledWith("New Todo");

    })
})