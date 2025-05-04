const mongoose = require("mongoose")
const logger = require("./utils/loggers")

const connectDB = async()=>{
    try{
    await mongoose.connect(process.env.MONGO_URI)
    // console.log("mongoDb connected")
    logger.info("mongoDb connected")
    } catch(error){
        // console.error("MongoDb connection failed", error)
        logger.error("MongoDb connection failed", error)
    }
    
}

module.exports = connectDB
