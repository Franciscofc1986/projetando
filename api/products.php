<?php
include 'ChromePhp.php';
	$input = json_decode(file_get_contents('php://input'),true);
	$request_body = file_get_contents('php://input');
	ChromePhp::log("Input stram:");
	ChromePhp::log($request_body);
	echo "<br>";
	
	echo trim($_SERVER["PATH_INFO"]);
	$method = $_SERVER['REQUEST_METHOD'];
	echo "<br>";

	$request = explode('/', trim($_SERVER["PATH_INFO"],'/'));
	
		
	//$url = "https://api.gdax.com/products/BTC-USD/stats";
	//fetch the url and convert the JSON into an associative array
	//$fgc = json_decode(file_get_contents($url), true);

	//assign values to variables
	//$open = $fgc["open"];
	echo "Request body: ".$request_body;
	echo "<br>";
	foreach($_POST as $key=>$value){
		echo $key.' '.$value."\n";
	}

	// build the SET part of the SQL command

	echo "<br>";
	// for($i=0;$i<count($_POST);$i++){
	// 	echo $_POST[$i];
	// }
	echo "Valores: ".serialize(array_values($_POST));
	echo "<br>";
	echo "Chaves: ".serialize(array_keys($_POST));
	echo "<br>";
	echo "Testando: ".$input["name"];
	echo "<br>";
	ChromePhp::log("Input :");
	ChromePhp::log($input);
	$table = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
	$key = array_shift($request)+0;
	
    echo 'Tabela: '.$table;
	echo "<br>";
    echo 'Chave: '.$key;
	echo "<br>";

	$set = '';
	$contador = 0;
	foreach($_POST as $key=>$value){
		$contador++;
		$set.=($contador>1?',':'').'`'.$key.'`=';
		$set.=($value===null?'NULL':'"'.$value.'"');
	}
	echo "SET: ".$set;
	$request_method=$_SERVER["REQUEST_METHOD"];
	switch($request_method)
	{
		case 'GET':
			echo "<br>";
			echo "GET";

			$data = array('a'=>1,'b'=>2,'c'=>3,'d'=>4,'e'=>5);
			header('Content-Type: application/json');
			http_response_code(201);
			echo json_encode($data);
			break;
		case 'POST':
			// Insert Product
			ChromePhp::log("POST: ");
			ChromePhp::log($_POST);
			echo $_POST["name"];
			echo "<br>";
			echo "POST";
			break;
		case 'PUT':
			// Update Product
			echo $input["name"];
			echo "<br>";
			echo "PUT";
			break;
		case 'DELETE':
			// Delete Product
			echo "<br>";
			echo "DELETE";
			break;
		default:
			// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
?>