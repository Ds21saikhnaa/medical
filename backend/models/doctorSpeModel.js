const mongoose = require("mongoose");

const {Schema} = mongoose;
const doctorTypeSchema = new Schema(
    {
        name: {
            type: String,
            required: [true, "type-in neriig oruulna uu!"],
            unique: true,
            trim: true,
        },
        image: {
            type: String,
            default: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRARJVivcbgJNL4nAbL2m99xRySiSKvtLY6QA&usqp=CAU"
        }
    },
    {
        timestamps: true,
    }
);

const DoctorType = mongoose.model("DoctorType", doctorTypeSchema);

module.exports = { DoctorType }