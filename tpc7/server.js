const express = require('express');
const fs = require('fs');
const formidable = require('formidable')
const logger = require('morgan')
const jsonfile = require('jsonfile')

const myDB = 'catalogo.json';
const catalogo = jsonfile.readFileSync(myDB);

const app = express();
const port = 1234;

app.set('view engine', 'pug');

app.use(logger('combined'));
app.use(express.static('stylesheets'));
app.use(express.static('uploaded'));

app.get('/', (req, res, next) => {
  res.render('form-file');
});

app.get('/catalogo', (req, res, next) => {
  res.render('catalogo', catalogo);
})

app.post('/upload', (req, res, next) => {
  var form = new formidable.IncomingForm()
  form.parse(req, (erro, fields, files) => {
    var fenviado = files.ficheiro.path
    var fnovo = '/home/bolt/Desktop/Bolt/UMinho/4ºAno/Complementares/DAW/DAW1819/tpc7/uploaded/' + files.ficheiro.name
    console.log(fnovo);

    fs.copyFile(fenviado, fnovo, err => {
      if (!err) {
        catalogo.ficheiros.push({
          path: fnovo,
          name: files.ficheiro.name,
          desc: fields.desc,
          timestamp: new Date()
        });
        jsonfile.writeFile(myDB, catalogo, erro => {
          if (!erro) {
            res.render('ficheiro-recebido', {
              ficheiro: files.ficheiro.name,
              status: 'Ficheiro Recebido e guardado com sucesso'
            });
          } else {
            res.render('error', {
              e: 'Ocorreram erros no armazenamento do ficheiro'
            });
          }
        });
      } else {
        res.render('error', {
          e: 'Ocorreram erros no armazenamento do ficheiro'
        });
      }
    });
  });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));