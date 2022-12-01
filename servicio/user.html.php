<?php
//Si no está con una sesión, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
  header('Location: ./login.html.php');
  exit();
}

$user = $_SESSION['username'];

//Se conecta a la base de datos y recupera los datos del docente
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = "SELECT dc_nombramiento, rol_user FROM docente WHERE user = '$user';";
    $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar el nombramiento del usuario; ' . $e->getMessage();
  include './error.html.php';
  exit();
}
//Llena el arreglo usuarios con lo recuperado de la base de datos
while ($row = $result->fetch())
{
  $nombra = $row['dc_nombramiento'];
  $rol = $row['rol_user'];
}
?>

<!DOCTYPE html>

<head>
  <title>Usuario</title>
  <meta charset="UTF-8">
  <!-- Fuentes e íconos de google -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
  <!-- Estilos propios -->
  <link rel="stylesheet" type="text/css" href="./css/estilos.css">
</head>

<body>
  <!--Barra de navegación-->
  <nav>
    <div class="nav-wrapper #1a237e indigo darken-2">
      <a href="#" class="brand-logo">Usuario</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li class="active"><a href="user.html.php">Panel de control</a></li>
        <li><a href="./usuario/perfil.html.php">Perfil</a></li>
        <?php
          if($nombra == "Coordinador"  || $nombra == "coordinador")
          {
            ?>
              <li><a href="./usuario/crear_minuta.html.php">Crear minutas</a></li>
            <?php
          }
        ?>
        <li><a href="logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>

     <!-- Modal para panel de control -->
      <div id="modal1" class="modal">
        <div class="modal-content">
          <center>
            <h5>Panel de control usuario</h5>
            <div class="section"></div>
            <div class="container">
              <div class="#eeeeee grey lighten-3 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                <a class="waves-effect waves-light btn #1a237e indigo darken-2" href="./usuario/perfil.html.php"><i class="material-icons left">account_box</i>Perfil</a>
                <div class="section"></div>
                <?php
                  if($nombra == "Coordinador" || $nombra == "coordinador")
                  {
                    ?>
                      <a class="waves-effect waves-light btn #1a237e indigo darken-2" href="./usuario/crear_minuta.html.php"><i class="material-icons left">account_box</i>Crear minutas</a>
                    <?php
                  }
                ?>
                <div class="section"></div>
              </div>
              <div>
                <?php
                  if($rol == 1)
                  {
                    ?>
                      <a class="waves-effect waves-light btn-large #d32f2f red darken-1" href="adminuser.html.php"><i class="material-icons left">menu</i>Panel de control administrador</a>
                    <?php
                  }
                ?>
              </div>
            </div>
          </center>
        </div>
      </div>
      
  </main>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
  <script type="text/javascript" src="./js/script_time.js"></script>
  <script type="text/javascript" src="./js/script_date.js"></script>
  <script type="text/javascript" src="./js/script_select_multiple.js"></script>
  <script type="text/javascript" src="./js/script_modal.js"></script>
  <script>
    $('#closeChangePass').click(function(){
        $('#modalChangePass').modal('close');
    });
    $('#closeSendMinutas').click(function(){
        $('#modalSendMinutas').modal('close');
    });
    window.onload = function()
    {
      $('#modal1').modal('open');
    };
  </script>
</body>

</html>