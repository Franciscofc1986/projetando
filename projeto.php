<?php
 if (!empty($_GET['projeto'])) {
    $projetoID = $_GET['projeto'];
 }

require_once("/comum/topo.php");
?>

<main>
    <div class="container">
        <div class="section">
            <div class="row" id="Projeto">
                <div class="col s12 ">
                    <br>
                    <h5 class="left" id="tituloProjeto">Projeto de aquaponia</h5>
                    <div class="right z-depth-3" id="qtdCurtidas">
                    </div>
                    <br>
                    
                    <ul class="tabs grey darken-3 z-depth-5">
                        <li class="tab col s2"><a href="#test1" class="active"><i class="material-icons icons_menu white-text">info</i></a></li>
                        <li class="tab col s2">
                            <a href="#test2" class="active grey-text" ><i class="material-icons icons_menu white-text">live_tv</i></a>
                        </li>
                        <li class="tab col s2"><a href="#test3"><i class="material-icons icons_menu white-text">assignment</i></a></li>
                        <li class="tab col s2"><a href="#test4"><i class="material-icons icons_menu white-text">format_list_numbered</i></a></li>
                        <li class="tab col s2"><a href="#test5"><i class="material-icons icons_menu white-text">monetization_on</i></a></li>
                        <li class="tab col s2">
                            <a href="#test6" onclick="carregarComentarios()"><i class="material-icons icons_menu white-text">sms</i></a>
                        </li>
                    </ul>
                    <div id="test1" class="col s12 ">
                        <br>
                        <h5 class="center">Detalhes do Projeto</h5>
                        <br>
                        <div class="card z-depth-3" style="padding: 20px;">
                            <div id="dificuldadeTecnica">
                            </div>
                            <br>
                            <div id="listaAlertas">
                            </div>
                        </div>
                        <br>
                    </div>
                    <div id="test2" class="col s12 ">
                        <br>
                        <h5 class="center">Vídeo</h5>
                        <br>
                        <div class="video-container" id="videoProjeto">
                            
                        </div>
                    </div>
                    <div id="test3">
                        <br>
                        <h5 class="center">Materiais utilizados</h5>
                        <br>
                        <ul class="collection with-header" id="materiais">
                        </ul>
                        <br>
                        <ul class="collection with-header" id="ferramentas">
                        </ul>
                    </div>
                    <div id="test4">
                        <br>
                        <h5 class="center">Passo-a-passo</h5>
                        <br>
                            <ul class = "collection" id="passoapasso">         
                            </ul>
                    </div>
                    <div id="test5">
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
                    <div id="test6">
                        <br>
                        <h5 class="center">Comentários</h5>
                        <br>
                        <ul class="collection" id="listaDeComentarios">
                        </ul>
                        <br>
                        <div class="col s12 center">
                            <div class="input-field col s12">
                                <textarea id="campoComentario" class="materialize-textarea"></textarea>
                                <label for="campoComentario">Comentário</label>
                            </div>
                            <button class="btn waves-effect waves-light light-blue darken-4" onclick="enviarComentario()" >Enviar
                                <i class="material-icons right">send</i>
                            </button>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<?php
require_once("/comum/baixo.php");
?>

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