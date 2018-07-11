<?php
	include 'ChromePhp.php';
	ChromePhp::log("Console ok");
	session_start();
	$pdo = new PDO('mysql:host=127.0.0.1;dbname=projetando;charset=utf8', 'francisco', 'francisco');
	//$pdo = new PDO('mysql:host=localhost;dbname=temlo861_projetando;charset=utf8', 'temlo861_francis', 'francisco');
	
	
	$method=$_SERVER["REQUEST_METHOD"];

	$set = '';
	$contador = 0;
	foreach($_POST as $key=>$value){
		$contador++;
		$set.=($contador>1?',':'').'`'.$key.'`=';
		$set.=($value===null?'NULL':'"'.$value.'"');
	}

	$request = explode('/', trim($_SERVER["PATH_INFO"],'/'));
	          $table = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
	$keyId = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
	
	
	switch ($method) {
		case 'GET':
		 	if($table == "filtro"){
				 $idRegistro = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
				switch ($keyId) {
					case 'grupos_no_grupo': //retorna os grupos que possuem o pai com id = x   - /filter/grupos_no_grupo/2
						$sql = "select tbgrupo.* ".
								"FROM tbgrupo, tbgrupogrupo ".
								"WHERE tbgrupo.id = tbgrupogrupo.idFilho ".
								"AND tbgrupogrupo.idPai = $idRegistro ".
								"GROUP BY tbgrupo.nome";
						break;
					case 'projetos_no_grupo': //retorna os projetos que são filhos do grupo com id = x
						$sql = "select tbprojeto.*, tbusuario.nome as autor, tbusuario.foto as fotoAutor, tbusuario.email as emailAutor, ". 
								"(select count(*) from tbcurtidas where idProjeto = tbprojeto.id) as curtidas, ". 
								"(SELECT group_concat( tbtag.nome ) as nomes ".
								"FROM tbtag, tbtagprojeto ".
								"WHERE tbtagprojeto.idProjeto = tbprojeto.id ". 
								"AND tbtag.id = tbtagprojeto.idTag ".
								"ORDER BY tbtag.nome) as tags, ".
								"(SELECT group_concat( tbtag.foto ) as fotos ".
								"FROM tbtag, tbtagprojeto ".
								"WHERE tbtagprojeto.idProjeto = tbprojeto.id ". 
								"AND tbtag.id = tbtagprojeto.idTag ".
								"ORDER BY tbtag.nome) as fotos ".
								"FROM tbprojeto, tbgrupoprojeto, tbusuario ".
								"WHERE tbprojeto.id = tbgrupoprojeto.idProjeto ". 
								"AND tbusuario.id = tbprojeto.idUsuario ".
								"AND tbgrupoprojeto.idGrupo = $idRegistro ".
								"ORDER BY curtidas DESC";
						break;
					case 'projetos_com_tag': //retorna os projetos que possuem a tag x
						$sql = "select tbprojeto.* ".
							   "FROM tbprojeto, tbtag, tbtagprojeto ".
							   "WHERE tbProjeto.id = tbtagprojeto.idProjeto ".
							   "AND tbtagprojeto.idTag = tbtag.id ".
							   "AND tbtag.nome = '$idRegistro' ".
							   "GROUP BY tbprojeto.nome";
						break;
					case 'projeto_completo': //retorna os projetos que possuem a tag x
						$sql = "select tbprojeto.*, tbusuario.nome as autor, tbusuario.foto as fotoAutor, tbusuario.email as emailAutor, ". 
								"(select count(*) from tbcurtidas where idProjeto = tbprojeto.id) as curtidas, ". 
								"(SELECT group_concat( tbtag.nome ) as nomes ".
								"FROM tbtag, tbtagprojeto ".
								"WHERE tbtagprojeto.idProjeto = tbprojeto.id ". 
								"AND tbtag.id = tbtagprojeto.idTag ".
								"ORDER BY tbtag.nome) as tags, ".
								"(SELECT group_concat( tbtag.foto ) as fotos ".
								"FROM tbtag, tbtagprojeto ".
								"WHERE tbtagprojeto.idProjeto = tbprojeto.id ". 
								"AND tbtag.id = tbtagprojeto.idTag ".
								"ORDER BY tbtag.nome) as fotos ".
								"FROM tbprojeto, tbusuario ".
								"WHERE tbprojeto.id = $idRegistro ". 
								"AND tbusuario.id = tbprojeto.idUsuario ";
						break;
					case 'comentario_completo': //retorna os projetos que possuem a tag x
						$sql = "select tbcomentario.*, tbusuario.foto, tbusuario.nome ".
								"from tbcomentario, tbusuario ".
								"where tbcomentario.idProjeto = $idRegistro ".
								"and tbusuario.id = tbcomentario.idUsuario ". 
								"order by tbcomentario.ordem";
						break;
				}
			}
			else{
				$sql = "select * from `$table`".($keyId?" WHERE id=$keyId":'');
			}
			break;
		case 'POST':
			if($keyId){
				$sql = "update `$table` set $set where id=$keyId";
			}else{
				$sql = "insert into `$table` set $set";
			}
			break;
		case 'DELETE':
			$sql = "delete from `$table` where id = $keyId";  
			break;
	}
	$statement = $pdo->prepare($sql);
	$result = null;

	switch ($method) {
		case 'GET':
			ChromePhp::log($sql);
			$statement->execute();
			$result = $statement->fetchAll(PDO::FETCH_ASSOC);
			ChromePhp::log($result);

			header('Content-Type: application/json');
			http_response_code(200);
			echo json_encode($result);
			break;
		case 'POST':
			$result = $statement->execute();
			if($keyId){
				if($result){
					http_response_code(200);
				}else{
					http_response_code(400);
				}
			}
			else{
				$idCriado = $pdo->lastInsertId(); 
				if($result){
					header('Content-Type: application/json');
					http_response_code(201);
					$data = array('id'=>$idCriado);
					echo json_encode($data);
				}else{
					http_response_code(400);
				}
			}
			break;
		case 'DELETE':
			$statement->execute();
			http_response_code(200);
			echo ($statement->rowCount() > 0 ? "true": "false");
			break;
		default:
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
	$pdo = null;
?>