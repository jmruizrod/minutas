<?php
//Si no está con una sesión o no se es administrador, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
  header('Location: ./login.html.php');
  exit();
}
else if($_SESSION['admin']== 0)
{
  header('Location: ./user.html.php');
}
?>

<!DOCTYPE html>

<head>
  <title>Administrador</title>
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
    <div class="nav-wrapper #d32f2f red darken-1">
      <a href="#" class="brand-logo">Administrador <?php echo $_SESSION['username']; ?></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li class="active"><a href="adminuser.html.php">Panel de control</a></li>
        <li><a href="./usuario/usuario.html.php">Usuarios</a></li>
        <li><a href="./cuerposcolegiados/cuerpos_colegiados.html.php">Cuerpos colegiados</a></li>
        <li><a href="./docentes/docentes.html.php">Docentes</a></li>
        <li><a href="./programaacademico/programa_ademicos.html.php">Programas académicos</a></li>
        <li><a href="logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>

    <!-- Modals -->
     <!-- Modal para panel de control -->
      <div id="modal1" class="modal">
        <div class="modal-content">
          <center>
            <h5>Panel de control adminitrador</h5>
            <div class="section"></div>
            <div class="#eeeeee grey lighten-3 row" id="center-section">
              <div class="section"></div>
              <a class="waves-effect waves-light btn-large #d32f2f red darken-1" href="./usuario/usuario.html.php"><i class="material-icons left">account_box</i>Usuarios</a>
              <a class="waves-effect waves-light btn-large #d32f2f red darken-1" href="./cuerposcolegiados/cuerpos_colegiados.html.php"><i class="material-icons left">group</i>Cuerpos colegiados</a>
              <div class="section"></div>
              <a class="waves-effect waves-light btn-large #d32f2f red darken-1" href="./docentes/docentes.html.php"><i class="material-icons left">school</i>Docentes</a>
              <a class="waves-effect waves-light btn-large #d32f2f red darken-1" href="./programaacademico/programa_ademicos.html.php"><i class="material-icons left">class</i>Programas académicos</a>
              <div class="section"></div>
            </div>
            <div class="section"></div>
            <div>
              <a class="waves-effect waves-light btn-large #1a237e indigo darken-2" href="user.html.php"><i class="material-icons left">account_box</i>Perfil de este usuario</a>
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
    $('#closeAddUser').click(function(){
        $('#modalAddUser').modal('close');
    });
    $('#closeEditUser').click(function(){
        $('#modalEditUser').modal('close');
    });
    $('#closeAddCuerpo').click(function(){
        $('#modalAddCuerpo').modal('close');
    });
    $('#closeEditCuerpo').click(function(){
        $('#modalEditCuerpo').modal('close');
    });
    $('#closeVerCuerpo').click(function(){
        $('#modalVerCuerpo').modal('close');
    });
    $('#closeAddInte').click(function(){
        $('#modalAddInte').modal('close');
    });

    //Se abre el modal al cargarse la página
    window.onload = function()
    {
      $('#modal1').modal('open');
    };
  </script>
</body>
</html>