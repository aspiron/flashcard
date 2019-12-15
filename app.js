import http from 'http';
import express from 'express';
import logger from 'morgan';
import bodyParser from 'body-parser';


const hostname =  '127.0.0.23';
const port = 9000;
const app = express();
const server = http.createServer(app);

app.use(logger('dev'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

require('./routes')(app);

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}`)
})