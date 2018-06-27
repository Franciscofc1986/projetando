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
				echo "GET um produto";
				$product_id=intval($_GET["product_id"]);
				echo $product_id;
			}
			else
			{
				echo "GET todos os produtos";
				$product_id=intval($_GET["product_id"]);
				echo $product_id;
			}
			break;
		case 'POST':
			// Insert Product		
			echo "POST um produto";
			break;
		case 'PUT':
			// Update Product
			echo "PUT um produto";
			break;
		case 'DELETE':
			// Delete Product
			echo "DELETE um produto";
			break;
		default:
			// Invalid Request Method
			echo "DEFAULT um produto";
			break;
	}
?>