const dynamoose = require("dynamoose");
const uuidv4 = require("uuidv4");

const userInfoSchema = new dynamoose.Schema(
    
)

const userSchema = new dynamoose.Schema(
    {
        id:{
            type: String,
            default: () => uuidv4()
        },
        email: {
            type: String,
            required: [true, "hereglegchiin email zaawal oruulna uu!"],
            unique: true,
            trim: true,
            match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, "email hayg buruu bn!"]
        },
        name:{
            type: String,
            required: true,
            trim: true,
        },
        lastName:{
            type: String,
            required: true,
            trim: true,
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
            // type: Schema.Types.ObjectId,
            // ref: "userInfo"
        },
        // experience:{
        //     type: Array,
        // },
        resetPasswordToken: String,
        resetPasswordExpire: Date,
    },
    {
        saveUnknown: true,
        timestamps: true,
    }
);

const User = dynamoose.model("User", userSchema);
const UserTable = new dynamoose.Table("UserTable", [User]);

module.exports = {
    User,
    UserTable
}