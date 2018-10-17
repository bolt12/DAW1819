const http = require('http');
const url = require('url');
const fs = require('fs');
const pug = require('pug');

http.createServer((req, res) => {
  const urlObj = url.parse(req.url);
  
  const puburl = /\/json\//;
  // puburl.test(...) :: String -> Bool
  // puburl.match(...) :: String -> String
    console.log(puburl.test(urlObj.pathname));

  if (urlObj.pathname == '/') {
    res.writeHead(200, {
      'Content-Type': 'text/html'
    });
    fs.readFile('./json/index.json', 'utf8', (erro, dados) => {
      if(!erro) {
        res.write(pug.renderFile('index.pug', JSON.parse(dados)));
      } else {
        res.write(`<p><b>ERRO: ${erro}!</b></p>`);
      }
      res.end();
    });
  }
  else if (puburl.test(urlObj.pathname)){
    const file = urlObj.pathname.split('/')[2];
    res.writeHead(200, {
      'Content-Type': 'text/html'
    });
    fs.readFile(`./json/${file}`, 'utf8',(erro, dados) => {
      if(!erro) {
        res.write(pug.renderFile('template.pug', {pub: JSON.parse(dados)}));
      } else {
        res.write(`<p><b>ERRO: ${erro}!</b></p>`);
      }
    res.end();
    });
  }
  else if (urlObj.pathname == '/w3.css') {
    res.writeHead(200, {
      'Content-Type': 'text/css'
    });
    fs.readFile(`w3.css`, 'utf8', (erro, dados) => {
      if(!erro) {
        res.write(dados);
      } else {
        res.write(`<p><b>ERRO: ${erro}!</b></p>`);
      }
    res.end();
    });
  }
  else {
    res.writeHead(200, {
      'Content-Type': 'text/html'
    });
    res.write(`<p><b>ERRO: Caminho não encontrado!</b></p>`);
    res.end();
  }
}).listen(12345);
