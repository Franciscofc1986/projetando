<?php 
require_once("comum/topo.php");
?>
<main>
    <nav class="indigo lighten-4" style="height: 40px;">
        <div class="nav-wrapper" style="margin-left: 10px; font-size: 10px;">
            <div class="col s12" id="navegacaoTopo">

            </div>
        </div>
    </nav>
    <div class="row container">
        <section class="col s12 m6 l9">
            </br>
            <h5 class="light titulo" id="tituloGrupo">Grupos de Projetos</h5>
            <div id="botaoVoltar"></div>
        </section>
    </div>
    <!--<div class="container">
        <div class="section">
            <div class="row" id="listaGrupos">
            </div>
        </div>
    </div>-->
    <div class="row container">
        <div class="section center" style="padding: 10px; line-height: 30px;" id="listaGrupos">
            <!--<div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/bichanos.png" height="42px" width="42px"><br>Animais Domésticos</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/drone.png" height="42px" width="42px"><br>Aeromodelos e Drones</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/agropecuaria.png" height="42px" width="42px"><br>Agricultura e Pecuaria</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/cavalinho.png" height="42px" width="42px"><br>Brinquedos</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/experimento.png" height="42px" width="42px"><br>Experimentos</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/casa.png" height="42px" width="42px"><br>Casa e Construção</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/sofa.png" height="42px" width="42px"><br>&nbsp;&nbsp;&nbsp;&nbsp;Moveis&nbsp;&nbsp;&nbsp;&nbsp;</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/ferramentas.png" height="42px" width="42px"><br>Ferramentas</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/vestuario.png" height="42px" width="42px"><br>Vestuario</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/jardinagem.png" height="42px" width="42px"><br>Jardinagem</div></a>
            </div>
            <div class="col s6 m4 l3">
            <a class="waves-effect waves-light btn-large botaoGrupo z-depth-5" ><div style="width: 105px;" ><img src="imagem/grupo/culinaria.png" height="42px" width="42px"><br>Culinária</div></a>
            </div>-->
        </section>
    </div>
    <div class="row container">
        <section class="col s12 m6 l9">
            </br>
            <h5 class="light titulo" id="tituloProjeto">Projetos desse grupo</h5>
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

