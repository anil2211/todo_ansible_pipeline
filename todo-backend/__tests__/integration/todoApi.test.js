const request = require("supertest")
const {MongoMemoryServer} = require("mongodb-memory-server")
const mongoose = require("mongoose")

const app = require("../../server")
const Todo = require("../../models/todoModels")

describe("Todo API Integration test",()=>{
     let mongoServer;

     beforeAll(async()=>{
        mongoServer = await MongoMemoryServer.create();
        const mongoUri = mongoServer.getUri();
        await mongoose.disconnect()
        await mongoose.connect(mongoUri)
     })

     afterAll(async ()=>{
        await mongoose.disconnect();
        await mongoServer.stop()
     })

    describe("GET /api/get-todos",()=>{
            it("should return all the todo",async()=>{
            await Todo.create({title: "Todo 1"})
            await Todo.create({title: "Todo 2"})

            const response = await request(app).get("/api/get-todos");
            // console.log("response is",response.body);
            expect(response.status).toBe(200)
            expect(response.body.length).toBe(2)
            expect(response.body[0].title).toBe("Todo 1")
            expect(response.body[1].title).toBe("Todo 2")
           })
    } )

    describe("POST /api/add-todo",()=>{
        it("should create a new todo",async ()=>{
            const response = await request(app).post("/api/add-todo").send({title:"New todo"})
        
            console.log("Response is ",response.body)
            expect(response.status).toBe(200);
            expect(response.body.title).toBe("New todo");
            expect(response.body.completed).toBe(false);

            const todo = await Todo.findById(response.body._id)
            console.log("Response is ",todo);
            expect(todo).toBeTruthy();
            expect(todo.title).toBe("New todo")

        })
    })


})