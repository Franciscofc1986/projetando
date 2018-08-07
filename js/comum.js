$(document).ready(function () {
    $('.modal').modal();
});

console.log("Armazenamento local: ");
console.log(sessionStorage);

$("#formEditarImagem").submit(function () {
    var formData = new FormData(this);

    $.ajax({
        url: urlBase+'/api.php/imagem/usuario',
        type: 'POST',
        data: formData,
        success: function (data) {
            //alert(data)
        },
        cache: false,
        contentType: false,
        processData: false,
        xhr: function() {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                myXhr.upload.addEventListener('progress', function () {
                    /* faz alguma coisa durante o progresso do upload */
                }, false);
            }
        return myXhr;
        }
    });
});


function cadastrarUsuario() {

    var nome_usuario = $('#nome_usuario').val().trim();
    var email_usuario = $('#email').val().trim();
    var senha_usuario = $('#senha_cadastrar').val().trim();
    var senha_usuario2 = $('#senha_cadastrar2').val().trim();

    if (nome_usuario == "" || email_usuario == "" || senha_usuario == "" || senha_usuario2 == "") {
        Materialize.toast('Preencha todos os campos corretamente.', 3000, 'red');
    }
    else if ($('#email').hasClass("invalid")) {
        Materialize.toast('Insira um email válido.', 3000, 'red');
    }
    else if (senha_usuario != senha_usuario2) {
        Materialize.toast('Insira a mesma senha nos campos de senha.', 3000, 'red');
    }
    else {
        sessionStorage.setItem("nomeUsuario", nome_usuario);

        var dadosConcatenados = nome_usuario + senha_usuario;
        var hashSenha = criarHash(dadosConcatenados);

        // Exemplo de requisição POST
        var ajax = new XMLHttpRequest();

        // Seta tipo de requisição: Post e a URL da API
        var url = urlBase + "/api.php/tbusuario/";

        ajax.open("POST", url, true);
        ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        // Seta paramêtros da requisição e envia a requisição
        var parametros = "nome=" + nome_usuario + "&email=" + email_usuario + "&hashSenha=" + hashSenha;
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
        
        $('#modal2').modal('close');
        verificar_usuario(hashSenha, false);
        Materialize.toast('Usuário cadastrado com sucesso.', 3000, 'green');
    }
}

function verificarLogin() {

    if (sessionStorage.getItem("idUsuarioLogado") === null) {
        sessionStorage.removeItem('nomeUsuario');
        sessionStorage.removeItem('idUsuarioLogado');
        sessionStorage.removeItem('hashUsuario');
        sessionStorage.removeItem('emailUsuario');
        sessionStorage.removeItem('fotoUsuario');
        $(".deslogado").removeClass("hide");
        $(".logado").addClass("hide");
    } else {
        verificar_usuario(sessionStorage.getItem('hashUsuario'), false);        
    }
}

$('.menu-1').sideNav({
    menuWidth: 300, // Default is 300
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
    draggable: true, // Choose whether you can drag to open on touch screens,
    onOpen: function (el) { /* Do Stuff*/ }, // A function to be called when sideNav is opened
    onClose: function (el) { /* Do Stuff*/ }, // A function to be called when sideNav is closed
});

function criarHash(s) {
    var hashCode = s.split("").reduce(function (a, b) { a = ((a << 5) - a) + b.charCodeAt(0); return a & a }, 0);
    if (hashCode < 0) hashCode = hashCode * -1;

    return hashCode;
}

function deslogar() {
    sessionStorage.removeItem('nomeUsuario');
    sessionStorage.removeItem('idUsuarioLogado');
    sessionStorage.removeItem('hashUsuario');
    sessionStorage.removeItem('emailUsuario');
    sessionStorage.removeItem('fotoUsuario');
    
    $("#imagemUsuario").html('<img class="circle" src="imagem/logo.png">');
    $("#nomeUsuario").html('Projetando');
    $("#emailUsuario").html('projetando.org');

    $(".deslogado").removeClass("hide");
    $(".logado").addClass("hide");
    Materialize.toast('Deslogado com sucesso!', 3000, 'green');
}

function logar() {
    var usuarioNome = $('#nome_usuario_logar').val().trim();

    sessionStorage.setItem("nomeUsuario", usuarioNome);
    var usuarioSenha = $('#senha_logar').val().trim();
    var dadosConcatenados = usuarioNome + usuarioSenha;

    var hashSenha = criarHash(dadosConcatenados);

    verificar_usuario(hashSenha, true);
}

function verificar_usuario(hashSenha, mostrarMsg){
    var url = urlBase + "/api.php/filtro/logar/" + hashSenha;

    $.ajax({
        type: "GET",
        url: url,
        timeout: 3000,
        contentType: "application/json; charset=utf-8",
        cache: false,
        beforeSend: function () {
        },
        error: function () {
            Materialize.toast('Falha ao tentar logar', 3000, 'red');
        },
        success: function (retorno) {
            console.log(retorno);

            var nomeArmazenadoLocal = sessionStorage.nomeUsuario;
            if (retorno.length < 1) {
                Materialize.toast('Usuário não encontrado!', 3000, 'red');
            } else {
                if (retorno[0].nome == nomeArmazenadoLocal) {
                    sessionStorage.setItem("idUsuarioLogado", retorno[0].id);
                    sessionStorage.setItem("hashUsuario", retorno[0].hashSenha);
                    sessionStorage.setItem("emailUsuario", retorno[0].email);
                    sessionStorage.setItem("fotoUsuario", retorno[0].foto);
                    $(".logado").removeClass("hide");
                    $(".deslogado").addClass("hide");

                    if (sessionStorage.getItem("fotoUsuario") != "null") {
                        var imagemUsuario = '<img class="circle" src="imagem/usuario/'+sessionStorage.getItem("fotoUsuario")+'">';
                        $("#imagemUsuario").html(imagemUsuario);
                    }else{
                        $("#imagemUsuario").html('<img class="circle" src="/imagem/usuario/user.png">');
                    }
                    $("#id").val(sessionStorage.getItem('idUsuarioLogado'));
                    $("#nomeUsuario").html(sessionStorage.getItem("nomeUsuario"));
                    $("#emailUsuario").html(sessionStorage.getItem("emailUsuario"));
                    if(mostrarMsg) Materialize.toast('Logado com sucesso!', 3000, 'green');
                }

                console.log(sessionStorage);
            }
        }
    });
}

verificarLogin();
