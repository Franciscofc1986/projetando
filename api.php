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
	$keyId = array_shift($request)+0;
	
	
	switch ($method) {
		case 'GET':
		 	if($table == "filtro"){
				 $idRegistro = array_shift($request)+0;
				switch ($keyId) {
					case 'grupos_no_grupo': //retorna os grupos que possuem o pai com id = x   - /filter/grupos_no_grupo/2
						$sql = "select tbgrupo.* ".
								"FROM tbgrupo, tbgrupogrupo ".
								"WHERE tbgrupo.id = tbgrupogrupo.idFilho ".
								"AND tbgrupogrupo.idPai = $idRegistro ".
								"GROUP BY tbgrupo.nome";
						break;
					case 'projetos_no_grupo': //retorna os projetos que são filhos do grupo com id = x
						$sql = "select tbprojeto.* ".
								"FROM tbprojeto, tbgrupoprojeto ".
								"WHERE tbprojeto.id = tbgrupoprojeto.idProjeto ".
								"AND tbgrupoprojeto.idGrupo = $idRegistro ".
								"GROUP BY tbprojeto.nome";
						break;
					case 'projetos_com_tag': //retorna os projetos que possuem a tag x
						$sql = "select tbprojeto.* ".
							   "FROM tbprojeto, tbtag, tbtagprojeto ".
							   "WHERE tbProjeto.id = tbtagprojeto.idProjeto ".
							   "AND tbtagprojeto.idTag = tbtag.id ".
							   "AND tbtag.nome = '$idRegistro' ".
							   "GROUP BY tbprojeto.nome";
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