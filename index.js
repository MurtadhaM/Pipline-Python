
// Create an express app
const express = require('express');
const app = express();


// Create a server
const server = require('http').createServer(app);

// Create a socket.io server

const port = 8080

function printinformation(port){
    console.log(`running on port ${port}`)
}

o
server.listen(port, printinformation(port));


app.get('/', (req,res) =>{

    res.write('Welcome Friend');
    res.end('hello');
}
)