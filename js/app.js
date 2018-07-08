//menu lateral
var historicoGrupo = [];

$('.menu-1').sideNav({
    menuWidth: 300, // Default is 300
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
    draggable: true, // Choose whether you can drag to open on touch screens,
    onOpen: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is opened
    onClose: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is closed
});

$('.menu-2').sideNav({
    menuWidth: 300, // Default is 300
    edge: 'right', // Choose the horizontal origin
    closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
    draggable: true, // Choose whether you can drag to open on touch screens,
    onOpen: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is opened
    onClose: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is closed
});

function carregarItens(idGrupo, voltou=false){
    //var url = "http://temlogica.com/api.php/filtro/grupos_no_grupo/"+idGrupo;
    var url = "http://localhost/api.php/filtro/grupos_no_grupo/"+idGrupo;

    if(voltou) historicoGrupo.pop();
    else historicoGrupo.push(idGrupo);


    $("#botaoVoltar").html("");
    if(idGrupo != 0){
        var item = 0;
        if(historicoGrupo[historicoGrupo.length-2] != undefined) item = historicoGrupo[historicoGrupo.length-2];
        var textoBotaoVoltar = '<a href="#" onclick="carregarItens('+item+', true)"><img src="imagem/back.png" style="width:40px; heidth:40px; "></a>';
        $("#botaoVoltar").append(textoBotaoVoltar)
    };
    
    $.ajax({
        type: "GET", 
        url: url,
        timeout: 3000,
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function() {
            $("#listaGrupos").html("Carregando..."); //Carregando
        },
        error: function() {
            $("#listaGrupos").html("O servidor não conseguiu processar o pedido.");
        },
        success: function(retorno) {
            $("#listaGrupos").html("");
                $.each(retorno,function(i, grupo){

                    if(grupo.imagem == null) grupo.imagem = "padrao.jpeg";
                    var item = '<div class="col s6 m3 l2"><a href="#" onclick="carregarItens('+grupo.id+')">'+
                        '<div class="card"><div class="card-image">'+
                            '<img src="imagem/grupo/'+grupo.imagem+'">'+
                            '</div><div class="card-content"><p><div class="grupos">'+
                            grupo.nome+
                            '</div></p></div></div></a></div>';
                    
                    $("#listaGrupos").append(item);
                });
        } 
    });  
}

carregarItens(0);


