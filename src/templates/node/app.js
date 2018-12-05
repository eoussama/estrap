/**
*
* @name:       iPhone 5 Emulator
* @version:    0.1.0
* @author:     EOussama
* @license     MIT
* @source:     https://github.com/EOussama/iPhone 5 Emulator
* 
* The main entry of the app.
*
*/

const http = require('http');

http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello, world!');
}).listen(8080);
