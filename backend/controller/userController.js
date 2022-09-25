const { User } = require("../models/userModel");
const { success } = require("../utils/mySuccess");
const { MyError } = require("../utils/myError");

const userRegister = async ( event ) => {
    const body = JSON.parse(event.body);
    const user = await User.create(body);
    return success(user)
}

const userLogin = async ( event ) => {
    const body = JSON.parse(event.body);
    const {email, password} = body;
    //orolt shalgana
    if(!email || !password) {
        throw new MyError("email bolon nuuts ugee damjiilna uu!", 404);
    }
    //tuhain hereglegchig haina
    const user = await User.findOne({email}).select("+password");
    if(!user){
        throw new MyError("email bolon nuuts ugee zow oruulna uu!", 401);
    }
    const pass = await user.checkPassword(password);
    if(!pass){
        throw new MyError("email bolon nuuts ugee zow oruulna uu!", 401);
    }
    return{
        statusCode: 200,
        body: JSON.stringify({
          success: true,
          token: user.getJsonWebToken(),
          user: user,
        })
    }
}

const newUserInfo = async(event, id) => {
    const body = JSON.parse(event.body);
    const user = await User.findById(id);
    if (!user) {
        throw new MyError("iim hereglegch oldsongui!!!", 404);
    }
    const result = await user.userInfo.push({...body});
    await user.save()
    return{
        statusCode: 200,
        body: JSON.stringify({
          success: true,
          data: result,
        })
    }
    //return success(result)
}

const getUserInfo = async(event, id) => {
    const userId = event.userId;
    console.log("mni id: ", userId);
    console.log("params: ", id);
    const user = await User.findById(id);
    if (!user) {
        throw new MyError("iim hereglegch oldsongui!!!", 404);
    }
    return success(user);
}


module.exports = {
    userLogin, userRegister, newUserInfo, getUserInfo
}