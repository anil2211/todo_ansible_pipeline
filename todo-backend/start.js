const app = require("./server")

const PORT = process.env.PORT || 3002;
// PORT=3002
// const PORT = PORT;
app.listen(PORT,()=>{
    console.log(`server is running on the port ${PORT}`)
})
