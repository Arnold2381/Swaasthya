const mongoose = require('mongoose');

const profileSchema = new mongoose.Schema({
    id: {
        type: String,
        required: "Height is required!"
    },
    height: {
        type: String,
        required: "Height is required!"
    },
    weight: {
        type: String,
        required: "Weight is required!"
    },
    sex: {
        type: String,
        required: "Sex is required!"
    },
    dob: {
        type: Date,
        required: "Date of Birth is required!"
    },
    blood: {
        type: String,
        required: "Blood Group is required!"
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('Profile', profileSchema);