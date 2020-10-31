const mongoose = require('mongoose');

const recordSchema = new mongoose.Schema({
    id: {
        type: String,
        required: "Id is required!"
    },
    history: {
        type: Array,
        required: "History is required"
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('Record', recordSchema);