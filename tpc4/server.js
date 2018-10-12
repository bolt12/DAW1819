const http = require('http');
const fs = require('fs');
const url = require('url');

http.createServer((req, res) => {
  res.writeHead(200, {
    'Content-Type': 'text/html'
  });

  const myObj = url.parse(req.url, true);
  const path = myObj.path === '/' ? '/website/index.html' : myObj.path;

  fs.readFile(`./${path}`, (err, file) => {
    if (!err) {
      res.write(file);
    }
    else {
      res.write(`<h1>${err}</h1><h2>:(</h2>`);
    }
    res.end();
  })
}).listen(12345);