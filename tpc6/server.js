const http = require('http');
const pug = require('pug');
const url = require('url');
const { parse } = require('querystring');

const list = {
  tasks: []
}

const myServer = http.createServer((req, res) => {
  const purl = url.parse(req.url);

  if (purl.pathname === '/') {
    res.write(pug.renderFile('index.pug', list));
    res.end();
  } else if (purl.pathname === '/list') {
    if (req.method == 'GET') {
      res.write(pug.renderFile('list.pug', list));
      res.end();
    }
    if (req.method == 'POST') {
        recuperaInfo(req, result => {
          const newTask = {
            id: list.tasks.length,
            type: result.type,
            description: result.desc,
            due: result.due,
            registed: new Date().toISOString().slice(0,10)
          };
          list.tasks.push(newTask);
          res.write(pug.renderFile('list.pug', list));
          res.end();
        });
    }
  } else if (purl.pathname === '/register') {
    if (req.method == 'GET') {
      res.write(pug.renderFile('register.pug', list));
      res.end();
    }
  } else if (purl.pathname === '/delete') {
        recuperaInfo(req, result => {
          list.tasks = list.tasks.filter(t => t.id != result.id);
          res.write(pug.renderFile('list.pug', list));
          res.end();
        });
  }

}).listen(1234);

function recuperaInfo(req, callback) {
    let body = '';
    req.on('data', chunk => {
        body += chunk.toString();
    });
    req.on('end', () => {
        callback(parse(body));
    });
};