import http from 'http';
import express from 'express';
import logger from 'morgan';
import bodyParser from 'body-parser';


const hostname =  '127.0.0.2';
const port = 9000;
const app = express();
const server = http.createServer(app);

app.use(logger('dev'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

app.get('*', (req, res) => {
    res.status(200).send({
        message: 'Fuck you',
    });
});

app.get('/user', (req, res) => {
    console.log(req);
    res.status(200).send({
        message: 'bitch',
    });
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}`)
})