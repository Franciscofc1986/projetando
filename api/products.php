<?php
	// Connect to database
	//$connection=mysqli_connect('localhost','root','','rest_api');

	$request_method=$_SERVER["REQUEST_METHOD"];
	switch($request_method)
	{
		case 'GET':
			// Retrive Products
			if(!empty($_GET["product_id"]))
			{
				$product_id=intval($_GET["product_id"]);
				echo "GET";
			}
			else
			{
				echo "GETs";
			}
			break;
		case 'POST':
			// Insert Product
			echo "POST";
			break;
		case 'PUT':
			// Update Product
			$product_id=intval($_GET["product_id"]);
			echo "PUT";
			break;
		case 'DELETE':
			// Delete Product
			$product_id=intval($_GET["product_id"]);
			echo "DELETE";
			break;
		default:
			// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
?>