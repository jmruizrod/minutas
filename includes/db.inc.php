<?php
try {
	$pdo = new PDO('mysql:host=localhost;dbname=sad', 'root', '');
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->exec('SET NAMES "utf8"');
	
} catch (PDOExeption $e) {
	$output = 'No puede hacer la conexión ' . $e->getMessage();
	include 'output.html.php';
	exit();
}
?>
