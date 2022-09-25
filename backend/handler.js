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

module.exports.hello = async (event, context) => {
  context.callbackWaitsForEmptyEventLoop = false;
  connectDB();
  const route = event.pathParameters.routeName;
  const paramsId = event.pathParameters.id;
  const met = event.requestContext.http.method;
  if (met === "GET") {
    switch(route){
      case "userInfo":
        await protect(event)
        return getUserInfo(event, paramsId)
    }
    return dflt();
  }
  if(met === "POST"){
    switch(route){
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
  }
  // return {
  //   statusCode: 200,
  //   body: JSON.stringify(
  //     {
  //       message: "Go Serverless v3.0! Your function executed successfully!",
  //     },
  //     null,
  //     2
  //   ),
  // };
};
