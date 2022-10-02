"use strict";
const AWS = require("aws-sdk")
const {connectDB} = require("./dbConfig/db");
const { userLogin, userRegister, getUserInfo, newUserInfo } = require("./controller/userController");
const { protect } = require("./middleware/protect")
const dflt = () => {
  return {
    statusCode: 200,
    body: "api is runnig...",
  }
}

module.exports.hello = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: "Go SLS v3.0! Your function executed successfully!",
      },
      null,
      2
    ),
  };
}

module.exports.user = async (event, context) => {
  context.callbackWaitsForEmptyEventLoop = false;
  connectDB();
  const route = event.pathParameters.routeName;
  const paramsId = event.pathParameters.id;
  //const met = event.requestContext.http.method;
  switch(route){
    case "userInfo":
      await protect(event)
      return getUserInfo(event, paramsId)
    case "login":
      return userLogin(event);
    case "register":
      return userRegister(event);
    case "newInfo":
      await protect(event)
      return newUserInfo(event, paramsId);
    default:
      return dflt();
  }
};
