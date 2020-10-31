const express  = require('express');
const cors = require('cors');

const app = express();
app.use(cors());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//Import Routes
app.use('/api/user', require('./routes/user'));
app.use('/api/profile', require('./routes/profile'));
app.use('/api/testing', require('./routes/test'));
app.use('/api/record', require('./routes/record'))

//Setup Error Handlers
const errorHandlers = require('./handlers/errorHandlers');
app.use(errorHandlers.notFound);
app.use(errorHandlers.mongoseErrors);
if(process.env.ENV === "DEVELOPMENT") {
    app.use(errorHandlers.developmentErrors);
} else {
    app.use(errorHandlers.productionErrors);
}

module.exports = app;