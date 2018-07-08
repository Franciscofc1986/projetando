<?php
    echo '<!DOCTYPE html>
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
        <header>';
echo '<nav class="z-depth-5">';


  echo '<a href="#" data-activates="slide-out" class="button-collapse menu-1 show-on-large"><i class="material-icons">menu</i></a>';


echo '<div class="nav-wrapper light-blue darken-3">
        <div class="container">
         <img src="imagem/logo.png" style="width: 40px; height: 40px; margin-top: 10px;" alt="imagem"> <a href="#" style="margin-left: 10px;" class="brand-logo title-1">Projetando</a>
        </div> 
      </div>
    </nav>';

      echo '<ul id="slide-out" class="side-nav light-blue darken-4 white-text">
      <li><div class="user-view">
        <div class="background">
         
        </div>
        <a href="#"><img class="circle" src="imagem/usuario/img_1.jpeg"></a>
        <a href="#"><span class="bold white-text name">'; 
        echo "Francisco";
        echo '</span></a>
        <a href="#"><span class="white-text email">'; 
        echo "losdefetones@yahoo.com.br";
        echo'</span></a>
      </div></li>
      <li ><div class="divider"></div></li>
      <li><a class="subheader white-text">Acesso rápido</a></li>
      <li><a href="index.php" class="white-text"><i class="material-icons white-text">home</i>Minha pagina inicial</a></li>
      <li><a href="criarDebate.php" class="white-text"><i class="material-icons white-text">playlist_add</i>Criar um debate</a></li>';

        echo '<li><a href="criarFalacia.php" class="white-text"><i class="material-icons white-text">fiber_new</i>Criar uma falácia</a></li>';

      echo'<li><a href="#!" class="white-text"><i class="material-icons white-text">notifications</i>Notificações</a></li>
      <li><a href="#!" class="white-text"><i class="material-icons white-text">person_add</i>Convidar amigo</a></li>
      <li><div class="divider white-text"></div></li>
      <li><a class="subheader white-text">Sair</a></li>
      <li><a class="waves-effect white-text" href="comum/deslogar.php"><i class="material-icons white-text">exit_to_app</i>Deslogar</a></li>
     </ul>';

    echo '</header>';
?>
    <nav class="indigo lighten-4">
        <div class="nav-wrapper" style="margin-left: 10px;">
            <div class="col s12">
            <a href="#1" class="breadcrumb">First</a>
            <a href="#2" class="breadcrumb">Second</a>
            <a href="#3" class="breadcrumb">Third</a>
            </div>
        </div>
    </nav>

<div class="row container">
    <section class="col s12 m6 l9">
        </br>
        <h5 class="light" id="tituloGrupo">Grupos de Projetos</h5>
        <div id="botaoVoltar"></div>
    </section>
</div>

    <div class="container">
      <div class="section">
        <div class="row" id="listaGrupos">
        
     </div>
   </div>
  </div>

<div class="row container">
    <section class="col s12 m6 l9">
        </br>
        <h5 class="light" id="tituloProjeto">Projetos desse grupo</h5>
    </section>
</div>

<div class="container">
 <div class="section">
  <div class="row" id="listaProjetos">

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

<section class="col s12 m6 l6">
  <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="https://img.youtube.com/vi/ymknJKeFoLY/0.jpg">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4" >
      Aquaponia passo a passo - Como montar
      <br><br>
        <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
                <div class="chip">
            <img src="imagem/tag/artesanato.jpg" alt="imagem">
            Artesanato
        </div>
        <div class="chip">
            <img src="https://cdn.leroymerlin.com.br/categories/paineis_de_madeira_macica_0960_300x300.jpg" alt="imagem">
            Madeira
        </div>
      
      <i class="material-icons right">dehaze</i></span>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">Detalhes do projeto<i class="material-icons right">close</i></span>
      <p>Esse projeto tem em sua estrutura </p>
    </div>
    <div class="card-action blue darken-4 center">
          <a href="#" class="center white-text">CARREGAR</a>
    </div>
  </div>
</section>

  </div>
 </div>
</div>



<?php
echo '<footer class="page-footer grey darken-3">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="white-text">Tem Lógica ?</h5>
                    <p class="grey-text text-lighten-4">Todo o conteúdo desse site é publico e deve ser utilizado com responsabilidade.</p>
                </div>
                <div class="col l4 offset-l2 s12">
                   
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2018 Copyright Text
                <a class="grey-text text-lighten-4 right" href="#!">Sobre o projeto</a>
            </div>
        </div>
    </footer>
    
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/app.js"></script>';
    
  echo '</body> </html>';
?>