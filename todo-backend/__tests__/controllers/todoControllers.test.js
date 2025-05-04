const todoControllers = require("../../controllers/todoControllers") 

jest.mock("../../models/todoModels.js")

const mockSave = jest.fn();
const mockFind = jest.fn();

const Todo = require("../../models/todoModels")

Todo.find = mockFind
Todo.mockImplementation(()=>({
    save:mockSave
}))
// Todo.save= mockSave

describe("when Todo Controller is Invoked", () => {
    let req, res;

    beforeEach(() => {
        req = {
            body: {},
            params: {}
        };
        res = {
            json: jest.fn(() => res),
            status: jest.fn(() => res),
        };
    });

    describe("For getTodos function", () => {
        it("if everything goes right, should return me all the todos", async () => {
            const mockTodos = [
                { _id: 0, title: "Todo 1", completed: false },
                { _id: 1, title: "Todo 2", completed: false },
                { _id: 3, title: "Todo 3", completed: false }
            ];

            mockFind.mockResolvedValue(mockTodos);

            await todoControllers.getTodos(req, res);

            expect(mockFind).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockTodos);
        });
        it(" if something goes wrong",async () =>{
            const errorMessage="something went wrong...";
            mockFind.mockRejectedValue(new Error(errorMessage))
            
            await todoControllers.getTodos(req, res);
           
            expect(mockFind).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(500);
            expect(res.json).toHaveBeenCalledWith({message:errorMessage})
        })
    });

    describe("for addTodo Function",()=>{
        it("should create a new todo", async ()=>{
            const newTodo={_id: "1",title:"New Todo"}
            req.body = {title: "New Todo"}
            mockSave.mockResolvedValue(newTodo)

            await todoControllers.addTodo(req,res)

            expect(mockSave).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(200)
            expect(res.json).toHaveBeenCalledWith(newTodo)
        })

        it("should handle the error",async ()=>{
            const errorMessage="something went wrong...";
            mockSave.mockRejectedValue(new Error(errorMessage))
            
            await todoControllers.addTodo(req, res);
           
            expect(mockSave).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(500);
            expect(res.json).toHaveBeenCalledWith({message:errorMessage});

        })
    })

});
