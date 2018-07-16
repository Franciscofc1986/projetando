function carregarFavoritos(){

    var idUsuario = sessionStorage.getItem("idUsuarioLogado");
    var url = urlBase + "/api.php/filtro/projetos_favoritos/"+idUsuario;
    
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
            if(retorno.length > 0) $("#tituloProjeto").html("Projetos que curti");
            else $("#tituloProjeto").html("Nenhum projeto encontrado");

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

carregarFavoritos();