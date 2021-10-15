<head >
<title>Anubis 2.1</title>
<link href="styles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles/bootstrap/css/style.css" />
<script src="styles/bootstrap/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/images/icon3.png" type="image/png"/>
</head>
 <body bgcolor="#1A2028">
<?php
include_once "config.php";
	try {
	    $conn = new  PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		 header("Location:index.php");
	} catch(PDOException $e) {}
	echo "</br></br></br></br></br></br></br></br></br></br></br></br></br></br>
	<center><a style='font-size: 30px; '>No connection to the database!<a></center>";
?>
</body>
</html>
