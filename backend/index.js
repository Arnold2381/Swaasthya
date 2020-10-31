require('dotenv').config();

const mongoose = require('mongoose');
mongoose.connect(process.env.DATABASE, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

mongoose.connection.on('error', (err) => {
  console.log("Mongoose Connection error" + err.message);
});

mongoose.connection.once('open', () => {
  console.log("MongoDB connected");
});

require('./models/User');
require('./models/Test');
require('./models/Record');
require('./models/Profile');

const app = require('./app');

app.listen(process.env.PORT || 8000, () => {
  console.log('Listening on port 8000');
})