const dynamoose = require("dynamoose");
const connectDb = () => {
    const ddb = new dynamoose.aws.ddb.DynamoDB({
        accessKeyId: process.env.AWS_ACCESS_KEY_ID,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
        region: process.env.REGION
      });
      dynamoose.aws.ddb.set(ddb);
}

module.exports = { connectDb }