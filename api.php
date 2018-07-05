<?php
	include 'ChromePhp.php';
	session_start();
    $pdo = new PDO('mysql:host=127.0.0.1;dbname=projetando;charset=utf8', 'francisco', 'francisco');
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
					case '1': //retorna os grupos que possuem o pai com id = x
						$sql = "select tbGrupo.* ".
								"FROM tbGrupo, tbGrupoGrupo ".
								"WHERE tbGrupo.id = tbGrupoGrupo.idFilho ".
								"AND tbGrupoGrupo.idPai = $idRegistro ".
								"GROUP BY tbGrupo.nome";
						break;
					case '2': //retorna os projetos que são filhos do grupo com id = x
						$sql = "select tbProjeto.* ".
								"FROM tbProjeto, tbGrupoProjeto ".
								"WHERE tbProjeto.id = tbGrupoProjeto.idProjeto ".
								"AND tbGrupoProjeto.idGrupo = $idRegistro ".
								"GROUP BY tbProjeto.nome";
						break;
					case '3': //retorna os projetos que possuem a tag x
						$sql = "select tbProjeto.* ".
							   "FROM tbProjeto, tbTag, tbTagProjeto ".
							   "WHERE tbProjeto.id = tbTagProjeto.idProjeto ".
							   "AND tbTagProjeto.idTag = tbTag.id ".
							   "AND tbTag.nome = '$idRegistro' ".
							   "GROUP BY tbProjeto.nome";
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
	ChromePhp::log("SQL: ".$sql);
	$statement = $pdo->prepare($sql);
	$result = null;

	switch ($method) {
		case 'GET':
			$statement->execute();
			$result = $statement->fetchAll(PDO::FETCH_ASSOC);

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

	ChromePhp::log($result);




	// $input = json_decode(file_get_contents('php://input'),true);
	// $request_body = file_get_contents('php://input');
	// ChromePhp::log("Input stram:");
	// ChromePhp::log($request_body);
	// echo "<br>";
	
	// echo trim($_SERVER["PATH_INFO"]);
	// $method = $_SERVER['REQUEST_METHOD'];
	// echo "<br>";

	// $request = explode('/', trim($_SERVER["PATH_INFO"],'/'));
	
		
	// //$url = "https://api.gdax.com/products/BTC-USD/stats";
	// //fetch the url and convert the JSON into an associative array
	// //$fgc = json_decode(file_get_contents($url), true);

	// //assign values to variables
	// //$open = $fgc["open"];
	// echo "Request body: ".$request_body;
	// echo "<br>";
	// foreach($_POST as $key=>$value){
	// 	echo $key.' '.$value."\n";
	// }

	// // build the SET part of the SQL command

	// echo "<br>";
	// // for($i=0;$i<count($_POST);$i++){
	// // 	echo $_POST[$i];
	// // }
	// echo "Valores: ".serialize(array_values($_POST));
	// echo "<br>";
	// echo "Chaves: ".serialize(array_keys($_POST));
	// echo "<br>";
	// echo "Testando: ".$input["name"];
	// echo "<br>";
	// ChromePhp::log("Input :");
	// ChromePhp::log($input);
	// $table = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
	// $key = array_shift($request)+0;
	
    // echo 'Tabela: '.$table;
	// echo "<br>";
    // echo 'Chave: '.$key;
	// echo "<br>";

	// $set = '';
	// $contador = 0;
	// foreach($_POST as $key=>$value){
	// 	$contador++;
	// 	$set.=($contador>1?',':'').'`'.$key.'`=';
	// 	$set.=($value===null?'NULL':'"'.$value.'"');
	// }
	// echo "SET: ".$set;
	// $request_method=$_SERVER["REQUEST_METHOD"];
	// switch($request_method)
	// {
	// 	case 'GET':
	// 		echo "<br>";
	// 		echo "GET";

	// 		$data = array('a'=>1,'b'=>2,'c'=>3,'d'=>4,'e'=>5);
	// 		header('Content-Type: application/json');
	// 		http_response_code(201);
	// 		echo json_encode($data);
	// 		break;
	// 	case 'POST':
	// 		// Insert Product
	// 		ChromePhp::log("POST: ");
	// 		ChromePhp::log($_POST);
	// 		echo $_POST["name"];
	// 		echo "<br>";
	// 		echo "POST";
	// 		break;
	// 	case 'PUT':
	// 		// Update Product
	// 		echo $input["name"];
	// 		echo "<br>";
	// 		echo "PUT";
	// 		break;
	// 	case 'DELETE':
	// 		// Delete Product
	// 		echo "<br>";
	// 		echo "DELETE";
	// 		break;
	// 	default:
	// 		// Invalid Request Method
	// 		header("HTTP/1.0 405 Method Not Allowed");
	// 		break;
	// }
?>