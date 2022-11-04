/*
Author: Murtadha Marzouq
*/

// Importing the required modules
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Creating an instance of express
const app = express();

// Setting up the port
const port = process.env.PORT || 8080;

// Setting up the middlewares
app.use(bodyParser.json());
app.use(cors());

// Setting up the routes
app.use('/api', (req, res) => {
   
      // Getting the data from the request body
      const data = req.body;

      // Sending the data back to the client
      res.send(data);
});



// Listening to the port
app.listen(port, () => {
      console.log(`Server started on port ${port}`);
   }
);


app.get('/', (req, res) => {
   // returning the index.html file
   res.sendFile(__dirname + '/templates/index.html');
});








