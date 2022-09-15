<?php
	include('Crypt/RSA.php');
	// Le doy margen de ejecucion
	ini_set('max_execution_time', 3600);

	$rsa = new Crypt_RSA();

	define('CRYPT_RSA_EXPONENT', 65537);
	define('CRYPT_RSA_SMALLEST_PRIME', 64);
	extract($rsa->createKey(2048));

	// Clave unica
	$id = uniqid();
	// Guardo la clave privada
	$fp = fopen("claves/privada_".$id.".pem","wb");
	fwrite($fp,$privatekey);
	fclose($fp);

	// Devuelvo la clave publica con su id
	echo $publickey;
	echo PHP_EOL;
	echo '----- Clave con ID: '.$id.'-----';
?>