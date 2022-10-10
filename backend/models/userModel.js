//const dynamoose = require("dynamoose");
const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const { Schema } = mongoose;

const userInfoSchema = new Schema(
    {
        age:{
            type: Number,
            required: true
        },
        education:{
            type: [Object]
        },
        experience: {
            type: [Object] 
        },
        healtHistory: {
            type: [Object]
        },
        gender: {
            type: String,
            required: true
        },
        doctorType:{
            type: mongoose.Schema.ObjectId,
            ref: "DoctorType"
        }
    }
);

const userSchema = new Schema(
    {
        email: {
            type: String,
            required: [true, "hereglegchiin email zaawal oruulna uu!"],
            unique: true,
            trim: true,
            match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, "email hayg buruu bn!"]
        },
        firstName:{
            type: String,
            required: true,
            trim: true,
        },
        lastName:{
            type: String,
            required: true,
            trim: true,
        },
        proFilePhoto :{
            type: String,
            default: "https://secure.gravatar.com/avatar/4b21ce3917fcb75324268ba4d3143c37?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Fdefault-avatar-0.png",
        },
        role:{
            type: String,
            required: [true, "hereglegchiin erhiig oruulna uu!"],
            enum:["user", "doctor"],
        },
        password:{
            type: String,
            minlength: 6,
            required: [true, "nuuts ugee oruulna uu!"],
            select: false
        },
        userInfo:{
            type: [userInfoSchema],
            default: []
            // type: Array, dynamoose der
            // schema: [userInfoSchema],
            // default: []
            // type: Schema.Types.ObjectId,
            // ref: "userInfo"
        },
        resetPasswordToken: String,
        resetPasswordExpire: Date,
    },
    {
        timestamps: true,
    }
);

userSchema.pre("save", async function(next) {
    if(!this.isModified("password")) next();
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
});

userSchema.methods.getJsonWebToken = function(){
    const token = jwt.sign({id: this._id, firstName: this.firstName}, process.env.JWT_SECRET, {
        expiresIn: process.env.JWT_EXPIRESIN
    });
    return token;
};

userSchema.methods.checkPassword = async function(enteredPassword){
    return await bcrypt.compare(enteredPassword, this.password);
}

const User = mongoose.model("User", userSchema);
//const UserTable = new dynamoose.Table("UserTable", [User]);


module.exports = {
    User
}