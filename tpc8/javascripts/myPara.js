$(()=>{
    $('#ficheiros').load('http://localhost:1234/para') //carregar a lista do ficheiro

    $('#adicionar').click(e => { //tem de se barrar o pedido de refresh da página para não haver refresh randoms (pedidos assíncronos)
        e.preventDefault()
        const file = $('#ficheiro')[0].files[0];
        $('#ficheiros').append('<tr>' + 
        '<td>' + `<a href="/${file.name}">` + file.name + '</a>' + '</td>' 
        + '<td>' + $('#descricao').val() + '</td>' 
        + '<td>' + new Date() + '</td>' 
        + '</tr>') //adicionar o pedido à lista, sendo necessário buscar do textarea (id=texto)
        ajaxPost()
    }) 

    function ajaxPost(){

        const file = $('#ficheiro')[0].files[0];
        const formData = new FormData();
        formData.append('ficheiro', file);

        $.ajax({ //parametrizada em javascript
            url: "http://localhost:1234/upload",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            //contentType: "multipart/form-data",
            mimeType: 'multipart/form-data',
            success: p => alert(JSON.stringify(p)),
            error: e => {
                alert('Erro no post: ' + JSON.stringify(e))
                console.log("Erro no post: " + JSON.stringify(e)) //imprimir na consola do browser
            }
        })
    }
})