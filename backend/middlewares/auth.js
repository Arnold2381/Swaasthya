const jwt = require('jsonwebtoken')

exports.verify = async(req, res, next) => {
  if(req.headers.authorization) {
    token = req.headers.authorization.split(' ').pop()
    try {
      const decoded = await jwt.verify(token, process.env.SECRET)
      req.token = decoded
      next()
    } catch(err) {
      res.status(401).send('unauthorized')
    }
  } else {
    res.status(400).send('missing authorization header')
  }
}