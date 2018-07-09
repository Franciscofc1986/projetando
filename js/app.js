//menu lateral
var historicoGrupo = [];
var historicoNomeGrupo = [];

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

function carregarItens(idGrupo, voltou=false, nomeGrupo=""){
    //var url = "http://temlogica.com/api.php/filtro/grupos_no_grupo/"+idGrupo;
    var url = "http://localhost/api.php/filtro/grupos_no_grupo/"+idGrupo;
    
    if(nomeGrupo=="") $("#tituloGrupo").html("Grupos de Projetos");
    else $("#tituloGrupo").html(nomeGrupo);
    if(voltou){ 
        
        var remover = true;
        do {
            var grupoRemovido = historicoGrupo.pop();    
            var nomegrupoRemovido = historicoNomeGrupo.pop(); 
            if(grupoRemovido == idGrupo){
                remover = false;
                historicoGrupo.push(grupoRemovido); 
                historicoNomeGrupo.push(nomegrupoRemovido); 
            }
        } while (remover); 
    }
    else{ 
        historicoGrupo.push(idGrupo);
        if(nomeGrupo != ""){
            historicoNomeGrupo.push(nomeGrupo);
        }
    }

    $("#navegacaoTopo").html('<a href="#" onclick="carregarItens(0)" class="breadcrumb">Inicio</a>');
    $("#botaoVoltar").html("");
    if(idGrupo != 0){
        preencherNavegacao();
    }else{
        historicoNomeGrupo = [];
        historicoGrupo = [];
    }
    
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
                    var nomeGrupoComAspas = "'" + grupo.nome + "'";
                    if(grupo.imagem == null) grupo.imagem = "padrao.jpeg";
                    var item = '<div class="col s6 m3 l2"><a href="#" onclick="carregarItens('+grupo.id+', false, '+nomeGrupoComAspas+')">'+
                        '<div class="card z-depth-5"><div class="card-image">'+
                            '<img src="imagem/grupo/'+grupo.imagem+'">'+
                            '</div><div class="card-content"><p><div class="grupos">'+
                            grupo.nome+
                            '</div></p></div></div></a></div>';
                    
                    $("#listaGrupos").append(item);
                });
        } 
    });  
}

function preencherNavegacao(){
    $.each(historicoNomeGrupo,function(i, nomeGrupo){
        nomeGrupoComAspas = "'" + nomeGrupo + "'";

        if(nomeGrupo.length > 7) nomeGrupo = nomeGrupo.substring(0, 4) + "...";
        var itemNavagacao = '<a href="#" onclick="carregarItens('+historicoGrupo[i]+', true, '+nomeGrupoComAspas+')" class="breadcrumb">'+nomeGrupo+'</a>';
        $("#navegacaoTopo").append(itemNavagacao);
    });
}

carregarItens(0);


