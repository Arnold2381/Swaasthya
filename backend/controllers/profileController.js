const mongoose = require('mongoose');
const Profile = mongoose.model('Profile');
const User = mongoose.model('User');

exports.createProfile = async(req, res) => {
  const { height, weight, sex, blood, Dob } = req.body;
  const id = req.token.id
  var userProfile = await Profile.findOne({ id })

  if(userProfile) {
    res.json({ 
      message: "Profile already created!"
    })
  } else {
    var dob = new Date(Dob.split('/').reverse().join('-'))

    var newProfile = new Profile({
      id,
      height,
      weight,
      sex,
      dob,
      blood
    })

    await newProfile.save()
    res.json({
      message: "Profile created!"
    })
  }
}

exports.updateProfile = async(req, res) => {
  const { height, weight, sex, blood, Dob } = req.body
  const id = req.token.id
  var userProfile = await Profile.findOne({ id })
  
  if(userProfile) {
    var dob = new Date(Dob.split('/').reverse().join('-'))
    userProfile = {
      id,
      height,
      weight,
      sex,
      dob,
      blood
    }
    await userProfile.save()

    res.json({ 
      message: "Profile updated!"
    })
  } else {
    res.json({
      message: "Profile not Found!"
    })
  }
}

exports.fetchProfile = async(req, res) => {
  const id = req.token.id
  const user = await User.findById(id);
  const profile = await Profile.findOne({ id });

  if(user && profile) {
    var tmp = profile.dob.toLocaleDateString().split('/')
    var DOB = [(tmp[1].length<=1 ? '0' : '')+tmp[1], (tmp[0].length<=1 ? '0' : '')+tmp[0], tmp[2]].join('/')
    var data = {
      name: user.name,
      email: user.email,
      height: profile.height,
      weight: profile.weight,
      sex: profile.sex,
      dob: DOB,
      blood: profile.blood
    }

    res.status(200).json({ message: "User profile sent", profile: data })
  } else {
    res.status(404).json({ message: "User doesn't exist" })
  }
}