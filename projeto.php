<?php
 if (!empty($_GET['projeto'])) {
    $projetoID = $_GET['projeto'];
 }

?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="utf-8">
    <title>Projetando</title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
            <li>
                <div class="divider"></div>
            </li>
            <li><a class="subheader white-text">Acesso rápido</a></li>
            <li><a href="index.php" class="white-text"><i class="material-icons white-text">home</i>Minha pagina inicial</a></li>
            <li><a href="criarDebate.php" class="white-text"><i class="material-icons white-text">playlist_add</i>Criar um debate</a></li>
            <li><a href="criarFalacia.php" class="white-text"><i class="material-icons white-text">fiber_new</i>Criar uma falácia</a></li>
            <li><a href="#!" class="white-text"><i class="material-icons white-text">notifications</i>Notificações</a></li>
            <li><a href="#!" class="white-text"><i class="material-icons white-text">person_add</i>Convidar amigo</a></li>
            <li>
                <div class="divider white-text"></div>
            </li>
            <li><a class="subheader white-text">Sair</a></li>
            <li><a class="waves-effect white-text" href="comum/deslogar.php"><i class="material-icons white-text">exit_to_app</i>Deslogar</a></li>
        </ul>
    </header>
    <div class="container">
        <div class="section">
            <div class="row" id="Projeto">
                <div class="col s12 ">
                    <br>
                    <h5 class="left" id="tituloProjeto">Projeto de aquaponia</h5>
                    <div class="right z-depth-3" id="qtdCurtidas">
                    </div>
                    <br>
                    <br>
                    <div class="card z-depth-3" style="padding: 20px;">
                        <div id="dificuldadeTecnica">
                        </div>
                        <br>
                        <div id="listaAlertas">
                        </div>
                    </div>
                    <br>
                    <ul class="tabs grey darken-3 z-depth-5">
                        <li class="tab col s4">
                            <a href="#test1" class="active grey-text" ><i class="material-icons icons_menu white-text">play_circle_filled</i></a>
                        </li>
                        <li class="tab col s2"><a href="#test2"><i class="material-icons icons_menu white-text">assignment</i></a></li>
                        <li class="tab col s2"><a href="#test3"><i class="material-icons icons_menu white-text">format_list_numbered</i></a></li>
                        <li class="tab col s2"><a href="#test4"><i class="material-icons icons_menu white-text">monetization_on</i></a></li>
                        <li class="tab col s2">
                            <a href="#test5" onclick="carregarComentarios()"><i class="material-icons icons_menu white-text">sms</i></a>
                        </li>
                    </ul>
                    <div id="test1" class="col s12 ">
                        <br>
                        <h5 class="center">Vídeo</h5>
                        <br>
                        <div class="video-container" id="videoProjeto">
                            
                        </div>
                    </div>
                    <div id="test2">
                        <br>
                        <h5 class="center">Materiais utilizados</h5>
                        <br>
                        <ul class="collection with-header" id="materiais">
                        </ul>
                        <br>
                         <ul class="collection with-header" id="ferramentas">
                         </ul>
                    </div>
                    <div id="test3">
                        <br>
                        <h5 class="center">Passo-a-passo</h5>
                        <br>
                            <ul class = "collection" id="passoapasso">         
                                <li class = "collection-item avatar">
                                    <i class="material-icons circle light-blue darken-4" id="icone_passo1" style="font-size:20px;">forward</i>
                                    <span class = "title grey-text darken-3" style="font-size:14px; font-weight: bold;">1º Passo</span>
                                    <p>HTML5 is the next major revision of the HTML standard superseding
                                    HTML 4.01, XHTML 1.0, and XHTML 1.1.<br/> HTML5 is a standard for
                                    structuring and presenting content on the World Wide Web.</p>
                                    <i id="passo1" class="secondary-content material-icons grey-text" onclick="mudarPasso('passo1')">
                                    check_box</i>
                                </li>
                                <li class = "collection-item avatar">
                                    <i class = "material-icons circle light-blue darken-4" id="icone_passo2" style="font-size:20px;">forward</i>
                                    <span class = "title grey-text darken-3" style="font-size:14px; font-weight: bold;">2º Passo</span>
                                    <p>HTML5 is the next major revision of the HTML standard superseding
                                    HTML 4.01, XHTML 1.0, and XHTML 1.1.<br/> HTML5 is a standard for
                                    structuring and presenting content on the World Wide Web.</p>
                                    <i id="passo2" class="secondary-content material-icons grey-text" onclick="mudarPasso('passo2')">
                                    check_box</i>
                                </li>
                                <li class = "collection-item avatar">
                                    <i class = "material-icons circle light-blue darken-4" id="icone_passo3"style="font-size:20px;">forward</i>
                                    <span class = "title grey-text darken-3" style="font-size:14px; font-weight: bold;">3º Passo</span>
                                    <p>HTML5 is the next major revision of the HTML standard superseding
                                    HTML 4.01, XHTML 1.0, and XHTML 1.1.<br/> HTML5 is a standard for
                                    structuring and presenting content on the World Wide Web.</p>
                                    <i id="passo3" class="secondary-content material-icons grey-text" onclick="mudarPasso('passo3')">
                                    check_box</i>
                                </li>
                            </ul>
                    </div>
                    <div id="test4">
                        <br>
                        <h5 class="center">Custos</h5>
                        <br>
                         <table class="striped">
                            <thead>
                            <tr>
                                <th>Item</th>
                                <th>Preço</th>
                            </tr>
                            </thead>

                            <tbody id="custoItens">
                            </tbody>
                        </table>
                    </div>
                    <div id="test5">
                        <br>
                        <h5 class="center">Comentários</h5>
                        <br>
                        <ul class="collection" id="listaDeComentarios">
                        </ul>
                        <br>

                        <form >
                            <div class="input-field col s12">
                                <textarea id="textarea1" class="materialize-textarea"></textarea>
                                <label for="textarea1" >Comentário</label>
                                <button class="btn waves-effect waves-light light-blue darken-4" type="submit" name="action">Enviar
                                    <i class="material-icons right">send</i>
                                </button>
                                <br>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <script type="text/javascript" src="js/projeto.js"></script>
    <?php
        if (empty($_GET['projeto'])) {
            echo '<script type="text/javascript">alert("Nenhum projeto foi selecionado");</script>';
        
        }else{
            $projetoID = $_GET['projeto'];
            echo'<script type="text/javascript">carregarProjeto('.$projetoID.');</script>';
        }
        
    ?>
</body>

</html>