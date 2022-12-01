<!DOCTYPE html>
<head>
  <title>Iniciar sesión</title>
  <meta charset="UTF-8">
  <!-- Fuentes e íconos de google -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
  <!-- Estilos propios -->
  <link rel="stylesheet" type="text/css" href="./css/estilos.css">
</head>

<body>
  <div class="section"></div>
  <main>
    <center>
      <!---->
      <h4 class="indigo-text">Iniciar sesión</h4>
      <?php
        //valida el inisio de sesión
        if(isset($_POST['btn_login']))
        {
          include $_SERVER['DOCUMENT_ROOT'] . '/includes/db.inc.php';
          session_start();
          $user=$_REQUEST['user'];
          $pass=$_REQUEST['password'];
          
          try
          {
            $sql = "SELECT password, rol_user FROM docente WHERE user = '$user'";
            $result = $pdo->query($sql);
          }
          catch(PDOException $e)
          {
            $error='Error: '.$e->getMessage();
            include 'error.html.php';
            exit();
          }

          $row = $result->fetch();

          if ($pass == $row['password'])
          {
            $_SESSION['username'] = $user;
            $_SESSION['password'] = $pass;
            if ($row['rol_user'] == 1)
            {
              $_SESSION['admin'] = 1;
              header('Location: ./adminuser.html.php');
            }
            else
            {
              $_SESSION['admin'] = 0;
              header('Location: ./user.html.php'); 
            }
            exit();   
          }   
          else
          {
            ?>
              <h5 class="#f44336 red-text">Usuario o contraseña erroneos para <?php echo $user; ?></h5>
            <?php
          } 
        }
      ?>
      <div class="section"></div>
      <div class="container">
        <div class="#eeeeee grey lighten-3 row" style="display: inline-block; padding: 1px 32px 32px 32px; border: 1px solid #EEE;">
          <!--Formulario para iniciar sesión-->
          <form class="col s12" action="" method="post">
            <div class='row'>
              <div class='col s12'>
              </div>
            </div>
            <!--Lectura para el usuario-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">account_circle</i>
                <input id="username" type="email" name="user" class="validate" required>
                <label for="username">Correo electrónico</label>
              </div>
            </div>
            <!--Lectura para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password' id='password' required>
                <label for='password'>Contraseña</label>
              </div>
            </div>
            <!--Botón que ejecuta la autentificación-->
            <center>
              <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Iniciar sesión</button>
            </center>
          </form>
        </div>
      </div>
    </center>
  </main>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>

</html>