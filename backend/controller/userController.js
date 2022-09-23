const { User, UserTable } = require("../models/userModel");
const { success } = require("../utils/mySuccess");
const { MyError } = require("../utils/myError");

const createUserTable = async(event) => {
    try {
        await UserTable.create();
        return success({message: "hello"})
    } catch (e) {
        console.log("error");
        throw new MyError(`${e}`, 401)
    }
}
const userLogin = async ( event ) => {
    
}

const userRegister = async ( event ) => {
    const body = JSON.parse(event.body);
    const user = await User.create(body);
    return success(user)
}

module.exports = {
    userLogin, userRegister, createUserTable
}