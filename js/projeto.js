var CodigoIDProjeto = null;

function comentar(idUsuario, idProjeto, mensagem, ordem) {
    // Exemplo de requisição POST
    var ajax = new XMLHttpRequest();

    // Seta tipo de requisição: Post e a URL da API
    var url = urlBase + "/api.php/tbcomentario/";

    ajax.open("POST", url, true);
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // Seta paramêtros da requisição e envia a requisição
    var parametros = "mensagem=" + mensagem +"&ordem=" + ordem +"&idUsuario=" + idUsuario + "&idProjeto=" + idProjeto;
    ajax.send(parametros);

    // Cria um evento para receber o retorno.
    ajax.onreadystatechange = function () {

        // Caso o state seja 4 e o http.status for 200, é porque a requisiçõe deu certo.
        if (ajax.readyState == 4 && ajax.status == 200) {

            var data = ajax.responseText;

            // Retorno do Ajax
            console.log(data);
            
        }
    }

    window.location.reload();
    Materialize.toast('Comentário enviado com sucesso', 3000, 'green');
}

function enviarComentario() {

    if (typeof (Storage) !== "undefined") {

        if (sessionStorage.getItem("idUsuarioLogado") === null) {
            Materialize.toast('É necessário logar para enviar um comentário', 3000, 'red');
        }else{
            var usuarioLogado = sessionStorage.idUsuarioLogado;
            var textoComentario = $('#campoComentario').val();
            if (usuarioLogado) {
                var proximaOrdem = Number(sessionStorage.ordemComentario) + 1;

                comentar(usuarioLogado, CodigoIDProjeto, textoComentario, proximaOrdem);

            } else {
                Materialize.toast('É necessário logar para enviar um comentário', 3000, 'red');
            }
        }
    } else {
        Materialize.toast('Esse navegador não suporta armazenamento', 3000, 'red');
    }
}

function mudarPasso(idPasso) {

    var elementoPasso = "#" + idPasso;
    var iconePasso = "#icone_" + idPasso;

    if ($(elementoPasso).hasClass("green-text")) {
        $(elementoPasso).removeClass("green-text").addClass("grey-text");
        $(iconePasso).removeClass("green").addClass("light-blue darken-4");
    } else {
        $(elementoPasso).removeClass("grey-text").addClass("green-text");
        $(iconePasso).removeClass("light-blue darken-4").addClass("green");
    }
}

function carregarComentarios() {

    var url = urlBase + "/api.php/filtro/comentario_completo/" + CodigoIDProjeto;

    $.ajax({
        type: "GET",
        url: url,
        timeout: 3000,
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function () {
            //$("#listaGrupos").html('<div class="progress indigo lighten-4"><div class="indeterminate light-blue darken-3"></div></div>'); //Carregando
        },
        error: function () {
            //$("#listaGrupos").html("O servidor não conseguiu processar o pedido.");
        },
        success: function (retorno) {
            console.log(retorno);
            $('#listaDeComentarios').html(gerarListaComentariosHtml(retorno));
        }
    });
}

function gerarListaComentariosHtml(listaComentarioObj) {
    var comentariosHtml = '';
    sessionStorage.setItem("ordemComentario", 0);
    $.each(listaComentarioObj, function (i, comentario) {
        comentariosHtml += '<li class="collection-item avatar"><img src="imagem/usuario/' + comentario.foto + '" alt="" class="circle">' +
            '<span class="title" style="font-weight: bold;">' + comentario.nome + '</span><p>' + comentario.mensagem + '</p></li>';

        if (typeof (Storage) !== "undefined") {
            sessionStorage.setItem("ordemComentario", comentario.ordem);
        }


    });

    return comentariosHtml;
}

function curtir(idProjeto) {

    var idUsuario = sessionStorage.getItem('idUsuarioLogado');
    // Exemplo de requisição POST
    var ajax = new XMLHttpRequest();

    // Seta tipo de requisição: Post e a URL da API
    var url = urlBase + "/api.php/tbcurtidas/";

    ajax.open("POST", url, true);
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // Seta paramêtros da requisição e envia a requisição
    var parametros = "idUsuario=" + idUsuario + "&idProjeto=" + idProjeto;
    ajax.send(parametros);

    // Cria um evento para receber o retorno.
    ajax.onreadystatechange = function () {

        // Caso o state seja 4 e o http.status for 200, é porque a requisiçõe deu certo.
        if (ajax.readyState == 4 && ajax.status == 200) {

            var data = ajax.responseText;

            // Retorno do Ajax
            console.log(data);
        }
    }

    window.location.reload();
    Materialize.toast('Curtido', 3000, 'green');
}

function carregarProjeto(idProjeto) {
    var url = urlBase + "/api.php/filtro/projeto_completo/" + idProjeto;
    CodigoIDProjeto = idProjeto;
    $.ajax({
        type: "GET",
        url: url,
        timeout: 3000,
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function () {
            //$("#listaGrupos").html('<div class="progress indigo lighten-4"><div class="indeterminate light-blue darken-3"></div></div>'); //Carregando
        },
        error: function () {
            //$("#listaGrupos").html("O servidor não conseguiu processar o pedido.");
        },
        success: function (retorno) {

            console.log(retorno);
            var dificuldadeObjeto = JSON.parse(retorno[0].dificuldadesJson);
            console.log(dificuldadeObjeto);
            var custosObjeto = JSON.parse(retorno[0].custosJson);
            console.log(custosObjeto);
            var materiaisObjeto = JSON.parse(retorno[0].materiaisJson);
            console.log(materiaisObjeto);
            var passosObjeto = JSON.parse(retorno[0].passosJson);
            console.log(passosObjeto);
            $('#tituloProjeto').html(retorno[0].nome);
            var htmlCurtidas = '<a href="" class="blue-text" onclick="curtir(' + idProjeto + ')"><img src="imagem/like.png" id="qtdCurtidas" style="display: inline-flex; vertical-align: top; width: 20px; height: 20px; margin-right: 5px">' + retorno[0].curtidas + '</a>';
            $('#qtdCurtidas').html(htmlCurtidas);
            $('#listaAlertas').html(gerarAlertasHtml(dificuldadeObjeto.alertas));

            $('#dificuldadeTecnica').html(gerarDificuldadeHtml(dificuldadeObjeto.dificuldade));
            var videoHtml = '<iframe width="853" height="480" src="//www.youtube.com/embed/' + retorno[0].codigoVideo + '" frameborder="0" allowfullscreen></iframe>';
            $('#videoProjeto').html(videoHtml);

            $('#materiais').html(gerarListaMateriaisHtml(materiaisObjeto.materiais));

            $('#ferramentas').html(gerarListaFerramentasHtml(materiaisObjeto.ferramentas));

            $('#passoapasso').html(gerarPassoAPassoHtml(passosObjeto));

            $('#custoItens').html(gerarCustoHtml(custosObjeto));
        }
    });
}


function gerarCustoHtml(custoDosItens) {
    var custosHtml = '';

    $.each(custoDosItens, function (item, custo) {
        if (item != "TOTAL") custosHtml += '<tr><td>' + item + '</td><td>R$' + custo + '</td></tr>';
        else custosHtml += '<tr class="grey"><td>' + item + '</td><td>R$' + custo + '</td></tr>';
    });

    return custosHtml;
}

function gerarPassoAPassoHtml(passos) {

    var passosHtml = '';

    var contador = 1;
    $.each(passos, function (indice, passo) {

        var variavelDoIcone = "'passo" + contador + "'";
        passosHtml += '<li class = "collection-item avatar">' +
            '<i class="material-icons circle light-blue darken-4" id="icone_passo' + contador + '" style="font-size:20px;">forward</i>' +
            '<span class = "title grey-text darken-3" style="font-size:14px; font-weight: bold;">' + indice + '</span>' +
            '<p>' + passo + '</p>' +
            '<i id="passo' + contador + '" class="secondary-content material-icons grey-text" style="cursor: pointer;" onclick="mudarPasso(' + variavelDoIcone + ')">' +
            'check_box</i></li>';

        contador++;
    });

    return passosHtml;
}

function gerarListaFerramentasHtml(ferramentas) {

    var listaFerramentasHtml = '<li class="collection-header"><h5><i class="material-icons icone_titulo">build</i>Ferramentas</h5></li>';

    $.each(ferramentas, function (indice, ferramenta) {
        listaFerramentasHtml += '<li class="collection-item">' + ferramenta + '</li>';
    });

    return listaFerramentasHtml;
}

function gerarListaMateriaisHtml(materiais) {

    var listaMateriaisHtml = '<li class="collection-header"><h5><i class="material-icons icone_titulo">local_grocery_store</i> Materiais</h5></li>';

    $.each(materiais, function (unidade, tipoItem) {
        listaMateriaisHtml += '<li class="collection-item"><span class="font-dez">' + unidade + '</span> <p>' + tipoItem + '</p></li>';
    });

    return listaMateriaisHtml;

}

function gerarDificuldadeHtml(valorDificuldade) {

    var dificuldadeTecnicaHtml = "";
    switch (valorDificuldade) {
        case 10:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress light-green lighten-1">' +
                '<div class="determinate green" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 20:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress light-green lighten-2">' +
                '<div class="determinate green lighten-1" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 30:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress light-green lighten-3">' +
                '<div class="determinate green lighten-2" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 40:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress light-green lighten-4">' +
                '<div class="determinate green lighten-3" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 50:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress light-green lighten-5">' +
                '<div class="determinate green lighten-4" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 60:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress orange lighten-5">' +
                '<div class="determinate green lighten-5" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 70:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress red lighten-5">' +
                '<div class="determinate red lighten-3" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 80:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress red lighten-4">' +
                '<div class="determinate red lighten-2" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 90:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress red lighten-3">' +
                '<div class="determinate red lighten-1" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
        case 100:
            dificuldadeTecnicaHtml = 'Dificuldade técnica do projeto: ' + valorDificuldade + '%<div class="progress red">' +
                '<div class="determinate red" style="width: ' + valorDificuldade + '%"></div></div>';
            break;
    }

    return dificuldadeTecnicaHtml;
}

function gerarAlertasHtml(listaIndices) {

    var alertasHtml = "";

    $.each(listaIndices, function (i, codigoAlerta) {
        alertasHtml += convertCodigoAlerta(codigoAlerta);
    });

    return alertasHtml;
}

function convertCodigoAlerta(numeroCodigo) {

    var htmlAlerta = "";

    switch (numeroCodigo) {
        case 1: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index yellow-text" style="margin-right:5px">' +
            'child_care</i>Qualquer criança faz !</div>';
            break;
        case 2: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index orange-text" style="margin-right:5px">warning</i> ' +
            'Tenha atenção e paciência !</div>';
            break;
        case 3: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index red-text" style="margin-right:5px">whatshot</i> ' +
            'Cuidado com o fogo !</div>';
            break;
        case 4: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index blue-text" style="margin-right:5px">pan_tool</i>' +
            'Atenção aos trabalhos manuais !</div>';
            break;
        case 5: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index red-text" style="margin-right:5px">person_add</i>' +
            'Necessita da presença de um adulto ! </div>';
            break;
        case 6: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index yellow-text" style="margin-right:5px">power</i>' +
            'Cuidado com o choque !</div>';
            break;
        case 7: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index white-text" style="margin-right:5px">remove_red_eye</i>' +
            'Atenção aos detalhes de execução !</div>';
            break;
        case 8: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index orange-text" style="margin-right:5px">build</i>' +
            'Exige prática com ferramentas ! </div>';
            break;
        case 9: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index green-text" style="margin-right:5px">nature_people</i>' +
            'Deve ser executado ao ar livre !</div>';
            break;
        case 10: htmlAlerta = '<div class="chip grey darken-3 white-text">' +
            '<i class="material-icons icons_index deep-purple-text" style="margin-right:5px">color_lens</i>' +
            'Exige habilidades artisticas !</div>';
            break;
    }

    return htmlAlerta;
}



