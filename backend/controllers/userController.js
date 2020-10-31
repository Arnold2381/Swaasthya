const mongoose = require('mongoose');
const User = mongoose.model('User');
const sha256 = require('js-sha256');
const jwt = require('jsonwebtoken');

exports.signup = async (req, res) => {
    const { name, email, password } = req.body;
    const userExists = await User.findOne({
        email,
    });
    if(userExists) {
        res.send({
            valid: true,
            message: "A user with the same e-mail already exists."
        });
    } else {
        const user = new User({ 
            name,
            email,
            password: sha256(password + process.env.SALT)
        });
    
        await user.save();
        const token = await jwt.sign({id: user.id}, process.env.SECRET);

        res.json({
            message: "User " + name + " Registered Successfully!",
            token
        });
    }
};

exports.login = async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findOne({
        email,
        password: sha256(password + process.env.SALT)
    });

    if(!user) throw "Email and Password did not match"

    const token = await jwt.sign({id: user.id}, process.env.SECRET);

    res.json({
        message: "User logged successfully",
        token
    });
};