const mongoose = require('mongoose');

const testSchema = new mongoose.Schema({
    symptoms: {
        type: Array,
        required: "Symptoms are required!"
    },
    predictions: {
        type: Object,
        required: "Prediction is required!"
    },
    outcome: {
        type: Object
    },
    disease: {
        type: String
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('Test', testSchema);