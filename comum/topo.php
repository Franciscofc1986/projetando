<!DOCTYPE html>
<html lang="pt-BR">
   <head>
      <meta charset="utf-8">
      <title >Projetando</title>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="css/style.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   </head>
   <body class="cor_fundo_tela">
      <header>
         <nav class="z-depth-5">
            <a href="" data-activates="slide-out" class="button-collapse menu-1 show-on-large"><i class="material-icons">menu</i></a>
            <div class="nav-wrapper fundo_topo_blueprint">
               <div class="container">
                  <img src="imagem/logo.png" style="width: 40px; height: 40px; margin-top: 10px;" alt="imagem"> 
                  <a href="index.php" style="margin-left: 10px;" class="brand-logo title-1">Projetando</a>
               </div>
            </div>
         </nav>
         <ul id="slide-out" class="side-nav fundo_menu_blueprint white-text">
            <li>
               <div class="user-view">
                  <div class="background">
                  </div>
                  <a href="#modal3" class="modal-trigger" id="imagemUsuario"><img class="circle" src="imagem/logo.png"></a>
                  <a href="#"><span class="bold white-text name" id="nomeUsuario">
                  Projetando
                  </span></a>
                  <a href="#"><span class="white-text email" id="emailUsuario">
                  projetando.org
                  </span></a>
               </div>
            </li>
            <li >
               <div class="divider"></div>
            </li>
            <li><a class="subheader white-text">Acesso rápido</a></li>
            <li><a href="index.php" class="white-text"><i class="material-icons white-text">home</i>Pagina inicial</a></li>
            <li><a href="favoritos.php" class="white-text logado hide"><i class="material-icons white-text">thumb_up</i>Projetos favoritos</a></li>
            <li><a href="#modal1" class="white-text modal-trigger deslogado"><i class="material-icons white-text">vpn_key</i>Logar</a></li>
            <li><a href="#modal2" class="white-text modal-trigger deslogado"><i class="material-icons white-text">person_add</i>Cadastrar usuário</a></li>

            <li><a href="criarDebate.php" class="white-text admin hide"><i class="material-icons white-text">playlist_add</i>Criar projeto</a></li>
            <li><a href="criarFalacia.php" class="white-text admin hide"><i class="material-icons white-text">fiber_new</i>Criar grupo</a></li>
            <li><a href="criarFalacia.php" class="white-text admin hide"><i class="material-icons white-text">fiber_new</i>Criar tag</a></li>

            <li>
               <div class="divider white-text logado hide"></div>
            </li>
            <li><a class="subheader white-text logado hide">Sair</a></li>
            <li><a class="waves-effect white-text logado hide"  onclick="deslogar()"><i class="material-icons white-text">exit_to_app</i>Deslogar</a></li>
         </ul>

         <!-- Modal de Login -->
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h4>Login</h4>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nome_usuario_logar" type="text" class="validate">
                            <label class="active" for="nome_usuario_logar">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <input id="senha_logar" type="password" class="validate">
                        <label for="senha_logar">Senha</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button class="btn waves-effect waves-light light-blue darken-4 modal-close" onclick="logar()" >Logar
                            <i class="material-icons right">send</i>
                        </button>
                </div>
            </div>

            <!--Modal de Criação de Usuário-->
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <h4>Cadastrar Usuário</h4>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nome_usuario" type="text" class="validate">
                            <label class="active" for="nome_usuario">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <input id="email" type="email" class="validate">
                        <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <input id="senha_cadastrar" type="password" class="validate">
                        <label for="senha_cadastrar">Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <input id="senha_cadastrar2" type="password" class="validate">
                        <label for="senha_cadastrar2">Repita a senha</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button class="btn waves-effect waves-light light-blue darken-4" onclick="cadastrarUsuario()" >Cadastrar
                            <i class="material-icons right">send</i>
                        </button>
                </div>
            </div>

            <!-- Modal de Edição de Imagem do usuário -->
            <div id="modal3" class="modal">
                <form method="post" enctype="multipart/form-data" id="formEditarImagem">
                <div class="modal-content">
                    <h4>Editar foto</h4>
                        <div>
                            <input type="hidden" id="id" name="id" />
                            <br>
                           <div class="file-field input-field">
                                <div class="btn">
                                    <span>Foto</span>
                                    <input type="file" id="imagem" name="imagem">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text">
                                </div>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn waves-effect waves-light light-blue darken-4 modal-close">Salvar Imagem
                        <i class="material-icons right">send</i>
                    </button>
                </div>
                </form>
            </div>
           
      </header>