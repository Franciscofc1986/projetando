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
   <body class="grey lighten-4">
      <header>
         <nav class="z-depth-5">
            <a href="" data-activates="slide-out" class="button-collapse menu-1 show-on-large"><i class="material-icons">menu</i></a>
            <div class="nav-wrapper light-blue darken-3">
               <div class="container">
                  <img src="imagem/logo.png" style="width: 40px; height: 40px; margin-top: 10px;" alt="imagem"> 
                  <a href="index.php" style="margin-left: 10px;" class="brand-logo title-1">Projetando</a>
               </div>
            </div>
         </nav>
         <ul id="slide-out" class="side-nav light-blue darken-4 white-text">
            <li>
               <div class="user-view">
                  <div class="background">
                  </div>
                  <a href="#"><img class="circle" src="imagem/usuario/img_1.jpeg"></a>
                  <a href="#"><span class="bold white-text name">
                  Francisco
                  </span></a>
                  <a href="#"><span class="white-text email">
                  losdefetones@yahoo.com.br
                  </span></a>
               </div>
            </li>
            <li >
               <div class="divider"></div>
            </li>
            <li><a class="subheader white-text">Acesso rápido</a></li>
            <li><a href="index.php" class="white-text"><i class="material-icons white-text">home</i>Minha pagina inicial</a></li>
            <li><a href="criarDebate.php" class="white-text"><i class="material-icons white-text">playlist_add</i>Criar um debate</a></li>
            <li><a href="criarFalacia.php" class="white-text"><i class="material-icons white-text">fiber_new</i>Criar uma falácia</a></li>
            <li><a href="#!" class="white-text"><i class="material-icons white-text">notifications</i>Notificações</a></li>
            <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">Logar</a></li>
            <li>
               <div class="divider white-text"></div>
            </li>
            <li><a class="subheader white-text">Sair</a></li>
            <li><a class="waves-effect white-text" href="comum/deslogar.php"><i class="material-icons white-text">exit_to_app</i>Deslogar</a></li>
         </ul>

         <!-- Modal Structure -->
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
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancelar</a>
                <button class="btn waves-effect waves-light light-blue darken-4" onclick="logar()" >Logar
                            <i class="material-icons right">send</i>
                        </button>
                </div>
            </div>


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
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancelar</a>
                <button class="btn waves-effect waves-light light-blue darken-4" onclick="logar()" >Cadastrar
                            <i class="material-icons right">send</i>
                        </button>
                </div>
            </div>
           
      </header>
      <main>
          <button data-target="modal1" class="btn modal-trigger">Modal</button>
          <button data-target="modal2" class="btn modal-trigger">Modal</button>
           


      </main>
      <footer class="page-footer grey darken-3">
         <div class="container">
            <div class="row">
               <div class="col s12">
                <h5 class="white-text">Projetando</h5>
                <p class="grey-text text-lighten-4">Todo o conteúdo desse site é publico e deve ser utilizado com responsabilidade.</p>
              </div>
            </div>
         </div>
         <div class="footer-copyright">
            <div class="container">
               © 2018 Copyright Text
            </div>
         </div>
      </footer>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/comum.js"></script>
      <script type="text/javascript" src="js/usuario.js"></script>
   </body>
</html>

