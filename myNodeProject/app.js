/**
*
* @name:       myNodeProject
* @version:    0.1.0
* @author:     EOussama
* @license     MIT
* @source:     github.com/EOussama/myNodeProject
* 
* The main stylesheet of the app.
*/

const http = require('http');

http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello, world!');
}).listen(8080);
    
