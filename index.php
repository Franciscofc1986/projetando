<?php 
require_once("comum/topo.php");
?>
<main>
    <nav class="indigo lighten-4" style="height: 40px;">
        <div class="nav-wrapper" style="margin-left: 10px; font-size: 10px;">
            <div class="col s12" id="navegacaoTopo">
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
            </div>
        </div>
    </div>
</main>

<?php
require_once("comum/baixo.php");
?>

<script type="text/javascript" src="js/app.js"></script>
</body>
</html>

