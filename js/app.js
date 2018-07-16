var historicoGrupo = [];
var historicoNomeGrupo = [];



function carregarItens(idGrupo, voltou=false, nomeGrupo=""){
    var url = urlBase + "/api.php/filtro/grupos_no_grupo/"+idGrupo;
    
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
                $("#listaGrupos").html('<div class="progress indigo lighten-4"><div class="indeterminate light-blue darken-3"></div></div>'); //Carregando
        },
        error: function() {
            $("#listaGrupos").html("O servidor não conseguiu processar o pedido.");
        },
        success: function(retorno) {
            $("#listaGrupos").html("");
                $.each(retorno,function(i, grupo){
                    var nomeGrupoComAspas = "'" + grupo.nome + "'";
                    if(grupo.foto == null) grupo.foto = "padrao.jpeg";
                    var item = '<div class="col s6 m3 l2"><a href="#" onclick="carregarItens('+grupo.id+', false, '+nomeGrupoComAspas+')">'+
                        '<div class="card cartao_grupo">'+

                            '<div class="card-image">'+
                            '<img src="imagem/grupo/'+grupo.foto+'">'+
                            '</div>'+

                            '<div class="card-content center-align" style="padding: 0px;"><p><div class="grupos">'+
                                grupo.nome+
                            '</div></p></div>'+

                            '</div></a></div>';
                    
                    $("#listaGrupos").append(item);
                });
        } 
    });  

    carregarProjetos(idGrupo);
}

function preencherNavegacao(){
    $.each(historicoNomeGrupo,function(i, nomeGrupo){
        nomeGrupoComAspas = "'" + nomeGrupo + "'";

        if(nomeGrupo.length > 7) nomeGrupo = nomeGrupo.substring(0, 4) + "...";
        var itemNavagacao = '<a href="#" onclick="carregarItens('+historicoGrupo[i]+', true, '+nomeGrupoComAspas+')" class="breadcrumb">'+nomeGrupo+'</a>';
        $("#navegacaoTopo").append(itemNavagacao);
    });
}

function preencherTags(tags, fotos){
    var htmlTags = "";
    var listaTags = tags.split(",");
    var listaFotos = fotos.split(",");

     $.each(listaTags,function(i, tag){

        var htmlTag = '<div class="chip">'+
                    '<img src="imagem/tag/'+listaFotos[i]+'" alt="imagem">'+
                     tag+'</div>';
        htmlTags += htmlTag;
     });

     return htmlTags;


}


function carregarProjetos(idGrupo){
    var url = urlBase + "/api.php/filtro/projetos_no_grupo/"+idGrupo;
    
    $.ajax({
        type: "GET", 
        url: url,
        timeout: 3000,
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function() {
            $("#listaProjetos").html('<div class="progress indigo lighten-4"><div class="indeterminate light-blue darken-3"></div></div>'); //Carregando
        },
        error: function() {
            $("#listaProjetos").html("O servidor não conseguiu processar o pedido.");
        },
        success: function(retorno) {
            if(retorno.length > 0) $("#tituloProjeto").html("Projetos desse grupo");
            else $("#tituloProjeto").html("");

            $("#listaProjetos").html("");
                $.each(retorno,function(i, projeto){


               var projetoTag = '<section class="col s12 m6 l6">'+
                        '<div class="card z-depth-5">'+
                            '<div class="card-image waves-effect waves-block waves-light">'+
                            '<img src="https://img.youtube.com/vi/'+projeto.codigoVideo+'/0.jpg">'+
                            '</div>'+
                            '<div class="card-content">'+
                            '<span class="card-title grey-text text-darken-4" >'+projeto.nome+
                            '<br><br>';
                projetoTag += preencherTags(projeto.tags, projeto.fotos);
          
                projetoTag += '<br><br><img src="imagem/like.png" style="width: 20px; height: 20px;">'+
                            '<span class="blue-text darken-4" style="margin-left: 3px; font-size: 15px; font-weight: bold;">'+
                            projeto.curtidas+'</span>'+
                            '<div class="chip right"><img src="imagem/usuario/'+projeto.fotoAutor+'" alt="foto">'+projeto.autor+
                            '</div></span></div>'+
                            '<a href="projeto.php?projeto='+ projeto.id +'" class="center white-text">'+
                            '<div class="card-action blue darken-4 center">CARREGAR</div></a>'+
                        '</div>'+
                        '</section>';

                $("#listaProjetos").append(projetoTag);

                });
        } 
    });  
}

carregarItens(0);


