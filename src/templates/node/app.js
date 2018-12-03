/**
*
* @name:       MyProjet
* @version:    0.1.0
* @author:     EOussama
* @license     MIT
* @source:     github.com/EOussama/MyProjet
* 
* The main entry of the app.
*/

const http = require('http');

http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello, world!');
}).listen(8080);
