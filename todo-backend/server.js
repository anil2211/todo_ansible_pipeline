const express = require("express")
const cors = require("cors")
const bodyParser = require("body-parser")
const dotenv = require("dotenv")
const connectDB = require("./db")
const todoRoutes = require("./routes/todoRoutes")
const path = require("path")
const fs = require("fs")

dotenv.config()

const app = express()
app.use(cors())
app.use(bodyParser.json())
app.use(express.json())

app.use('/api', todoRoutes)

const buildPath = path.join(__dirname, "../todo-frontend/build")

if (fs.existsSync(buildPath)) {
    app.use(express.static(buildPath))
    app.get("/*", (req, res) => {
        res.sendFile(path.join(buildPath, "index.html"))
    })
} else {
    console.warn("⚠️ Frontend build not found. Skipping static file serving.")
}

connectDB()
module.exports = app













// const express = require("express")
// const cors = require("cors")
// const bodyParser = require("body-parser")

// const dotenv = require("dotenv")
// const connectDB = require("./db")
// const todoRoutes = require("./routes/todoRoutes")
// const path = require("path")
// dotenv.config()

// const app = express();
// app.use(cors())
// app.use(bodyParser.json())
// app.use(express.json())

// app.use('/api', todoRoutes);
// // app.use('/', todoRoutes);


// // app.use(express.static(path.join(__dirname, "../todo-frontend/build")))

// // app.get("*", (req, res) =>{
// //     res.sendFile(path.join(__dirname, "../todo-frontend/build", "index.html"))
// // })

// const fs = require("fs");
// const buildPath = path.join(__dirname, "../todo-frontend/build");

// if (fs.existsSync(buildPath)) {
//     app.use(express.static(buildPath));
//     app.get("*", (req, res) => {
//         res.sendFile(path.join(buildPath, "index.html"));
//     });
// } else {
//     console.warn("⚠️ Frontend build not found. Skipping static file serving.");
// }

// // app.use()


// connectDB()
// module.exports = app;
