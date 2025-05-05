const mongoose = require("mongoose")
const logger = require("./utils/loggers")

MONGO_URI="mongodb+srv://anil:anil2211@cluster0.cqvrpoh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

const connectDB = async()=>{
    try{
    // await mongoose.connect(process.env.MONGO_URI)
    await mongoose.connect(MONGO_URI)
    // console.log("mongoDb connected")
    logger.info("mongoDb connected")
    } catch(error){
        // console.error("MongoDb connection failed", error)
        logger.error("MongoDb connection failed", error)
    }
    
}

module.exports = connectDB
