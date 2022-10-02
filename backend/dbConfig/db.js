const mongoose = require("mongoose");

const connectDB = async () => {
  const conn = await mongoose.connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
    //     useCreateIndex: true,
    //   useFindAndModify: false,
    useUnifiedTopology: true,
  }); 
  console.log(`MongoDB холбогдлоо : ${conn.connection.host}`);
}
module.exports = { connectDB }


// const dynamoose = require("dynamoose");
// const connectDb = () => {
//     const ddb = new dynamoose.aws.ddb.DynamoDB({
//         accessKeyId: process.env.AWS_ACCESS_KEY_ID,
//         secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
//         region: process.env.REGION
//       });
//       dynamoose.aws.ddb.set(ddb);
// }
