const fs = require('fs');
const id = "m";

// index.json was generated with macros in vim
const index = JSON.parse(fs.readFileSync('./json/index.json'));

/* Get all titles 

for (let i = 1; i < 51; i++) {
  fs.readFile(`./json/m${i}.json`, 'utf8', (err, dados) => {
    if (!err && index.ind[i-1]) {
      const file = JSON.parse(dados);
      index.ind[i-1].titulo = file.titulo;
      console.log(JSON.stringify(index.ind[i-1]));
    }
  });
}

*/

/* Sort
index.ind.sort((a,b) => a.titulo.localeCompare(b.titulo));
console.log(JSON.stringify(index)); 
*/