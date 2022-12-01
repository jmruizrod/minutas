<?php
	session_start();
	session_unset();
	session_destroy();

	header('Location: ./login.html.php');
?>

<!DOCTYPE html>

<head>
  <title>Usuarios</title>
  <meta charset="UTF-8">
  <!-- Fuentes e íconos de google -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
  <!--Barra de navegación-->
  <p><a href="login.html.php">Sesión cerrada, inicia sesión</a></p>
</body>

</html>