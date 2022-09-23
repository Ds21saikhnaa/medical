"use strict";
const AWS = require("aws-sdk")
const {connectDb} = require("./dbConfig/db");
const { userLogin, userRegister, createUserTable } = require("./controller/userController");
const dflt = () => {
  return {
    statusCode: 200,
    body: "api is runnig...",
  }
}

module.exports.hello = async (event) => {
  await connectDb();
  const route = event.pathParameters.routeName;
  const paramsId = event.pathParameters.id;
  const met = event.requestContext.http.method;
  if (met === "GET") {
    return dflt();
  }
  if(met === "POST"){
    switch(route){
      case "new": 
        return createUserTable();
      case "login":
        return userLogin(event);
      case "register":
        return userRegister(event);
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
