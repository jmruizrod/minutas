<?php
//Si no está con una sesión o no se es administrador, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
  header('Location: ../login.html.php');
  exit();
}
else if($_SESSION['admin']== 0)
{
  header('Location: ../user.html.php');
}

//Se conecta a la base de datos y recupera los datos del docente
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = "SELECT dc_codigo, user, password FROM docente WHERE USER != '';";
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Llena el arreglo usuarios con lo recuperado de la base de datos
while ($row = $result->fetch())
{
  $usuarios[] = array('id' => $row['dc_codigo'], 'usuario' => $row['user'], 'contraseña' => $row['password']);
}
if(!isset($usuarios))
{
  $usuarios[] = 'Vacio';
}

//Selecciona solo se seleccionan los docentes que no tengan usuario
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = 'SELECT dc_codigo, dc_nombres FROM docente WHERE user IS NULL';
    $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
while ($row = $result->fetch())
{
  $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres']);
}
if(!isset($docentes))
{
  $docentes[] = array('id' => "", 'nombres' => "Vacío");
}

//Se agrega un nuevo usuario a la base de datos
if (isset($_POST['Agregar']))
{
  $name_user = $_POST['username_add'];
  $pass1_user = $_POST['password1'];
  $docente_user = $_POST['docente_add'];
  //Para agregar usuario
  try
  {
    $sql = "UPDATE docente SET user = '$name_user', password = '$pass1_user' WHERE dc_codigo = '$docente_user';";
    $s = $pdo->prepare($sql);
    $s->execute();
    header('Location: usuario.html.php');
  }
  catch(PDOException $e)
  {
    $error='Error al al agregarel usuario: '.$e->getMessage();
    include '../error.html.php';
    exit();
  }
}

//Toma los datos del docente a editar
if (isset($_POST['Editar']))
{
  $id = $_POST['id'];
  $us = $_POST['usuario'];
}

//Se edita un usuario existente
if (isset($_POST['Guardar']))
{
  $dc_codigo = $_POST['id'];
  $name_user = $_POST['username_edit'];
  $pass2_user = $_POST['password_edit2'];

  //Toma día y hora para el update
  //Zona horaria
  date_default_timezone_set("America/Chihuahua");
  //Hora
  $t = time();
  $t = date("G:i:s", $t);
  //Toma el día
  $d = date("Y-m-d");
  $fecha_hora = $d . " " . $t;

  //Para editar un usuario
  try
  {
    $sql = "UPDATE docente SET user = '$name_user', password = '$pass2_user', updated_at = '$fecha_hora' WHERE dc_codigo = '$dc_codigo';";
    $s = $pdo->prepare($sql);
    $s->execute();
    //Si es el usuario que tiene la sesión iniciada se cierra la sesión si no se va a usuario
    if($_POST['login'] == "yes")
    {
      header('Location: ../login.html.php'); 
    }
    else
    {
      header('Location: usuario.html.php'); 
    }
  }
  catch(PDOException $e)
  {
    $error='Error al editar usuario: '.$e->getMessage();
    include '../error.html.php';
    exit();
  }
} 

//Para crear el PDF              
if (isset($_GET['print']))
{
  ob_start();
  // Include the main TCPDF library.
  require_once('../tcpdf.php');
  // create new PDF document
  $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
  // set document information
  $pdf->SetTitle('Usuarios');
  // set default monospaced font
  $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
  //set margins
  $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
  $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
  $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
  // set auto page breaks
  $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
  // set image scale factor
  $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
  // set font
  $pdf->SetFont('helvetica', 'B', 20);
  // add a page
  $pdf->AddPage();
  $pdf->SetFont('helvetica', '', 8);

  $tbl = "";
  $tbl .= '
  <h1 align="center">Usuarios</h1>
  <br>
    <table border="1" cellpadding="4">
      <thead>
        <tr>
          <th><b>Nombre</b></th>
          <th><b>Contraseña</b></th>
          <th><b>Cuerpo colegiado</b></th>
        </tr>
      </thead>  
    <tbody>
  ';
  //Se agregan los datos
  foreach ($usuarios as $usuario):
    $tbl .= '
      <tr>
        <td>' . ($usuario["usuario"]) . '</td>
        <td>' . ($usuario["contraseña"]) . '</td>
        <td>';
    //Se  recupera los datos del cuerpo del docente
    try
    {
      $id_user = $usuario['id'];
      unset($result_cuerpos);
      $sql = "SELECT comision_id, c_nombre FROM comision_cuerpos_colegiados, integrantes_comision WHERE docente_dc_codigo = '$id_user' AND comision_id = comision_cuerpos_colegiados_comision_id;";
      $result_cuerpos = $pdo->query($sql);
    }
    catch (PDOException $e)
    {
      $error = 'Error al recuperar las cuerpos colegiados; ' . $e->getMessage();
      include '../error.html.php';
      exit();
    }
    //Llena el arreglo usuarios con lo recuperado de la base de datos
    while ($row = $result_cuerpos->fetch())
    {
      $cuerpos[] = array('id' => $row['comision_id'], 'cuerpo' => $row['c_nombre']);
    }
    //Se el resto de datos sacados de la consulta
    foreach ($cuerpos as $cuerpo):
      $tbl .= $cuerpo["cuerpo"] . ', ';
    endforeach;
    unset($cuerpos);
    //Se cierran las etiquetas fr td y tr, se continúa con el ciclo
    $tbl .= '</td></tr>';
  endforeach;
  //Cuando se termina de recorrer todo, se cierran el tbody y el table
  $tbl .= '</tbody></table>';

  $pdf->writeHTML($tbl, true, false, false, false, '');
  ob_end_clean();
  //Close and output PDF document
  $pdf->Output('Usuarios.pdf', 'D');
}
?>


  
<!DOCTYPE html>

<head>
<title>Usuarios</title>
  <meta charset="UTF-8">
  <!-- Fuentes e íconos de google -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
  <!-- Estilos propios -->
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body>
  <!--Barra de navegación-->
  <nav>
    <div class="nav-wrapper #d32f2f red darken-1">
      <a href="#" class="brand-logo">Administrador <?php echo $_SESSION['username']; ?></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../adminuser.html.php">Panel de control</a></li>
        <li class="active"><a href="usuario.html.php">Usuarios</a></li>
        <li><a href="../cuerposcolegiados/cuerpos_colegiados.html.php">Cuerpos colegiados</a></li>
        <li><a href="../docentes/docentes.html.php">Docentes</a></li>
        <li><a href="../programaacademico/programa_ademicos.html.php">Programas académicos</a></li>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <div id="left-section">
      <a class="waves-effect waves-light btn #ef5350 red lighten-1 modal-trigger" href="#modalAddUser"><i class="material-icons left">add</i>Agregar</a>
    </div>
    <center>
          <table class="striped">
            <thead>
              <tr>
                  <th>Nombre</th>
                  <th>Contraseña</th>
                  <th>Cuerpo colegiado</th>
                  <th>Editar</th>
              </tr>
            </thead>

            <tbody>
              
            <?php foreach ($usuarios as $usuario): ?>
                <tr>
                  <td><?php echo htmlspecialchars($usuario['usuario']); ?></td>
                  <td><?php echo htmlspecialchars($usuario['contraseña']); ?></td>
                  <td>
                    <?php 
                        //Se  recupera los datos del cuerpo del docente
                        try
                        {
                          $id_user = $usuario['id'];
                          unset($result_cuerpos);
                          $sql = "SELECT comision_id, c_nombre FROM comision_cuerpos_colegiados, integrantes_comision WHERE docente_dc_codigo = '$id_user' AND comision_id = comision_cuerpos_colegiados_comision_id;";
                          $result_cuerpos = $pdo->query($sql);
                        }
                        catch (PDOException $e)
                        {
                          $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
                          include '../error.html.php';
                          exit();
                        }
                        //Llena el arreglo usuarios con lo recuperado de la base de datos
                        while ($row = $result_cuerpos->fetch()) {
                          $cuerpos[] = array('id' => $row['comision_id'], 'cuerpo' => $row['c_nombre']);
                        }
                        //Ve si tiene cuerpos colegiados para mostrar
                        if(isset($cuerpos))
                        {
                          //Se muestrael contenido de la consulta
                          foreach ($cuerpos as $cuerpo):
                            echo htmlspecialchars($cuerpo['cuerpo'] . ", ");
                          endforeach; 
                        }
                        else
                        {
                          echo htmlspecialchars("Sin cuerpos colegiados");
                        }
                        unset($cuerpos);
                      ?>
                    </td>
                  <td>
                    <form method="post" action="?">
                      <input type="hidden" name="id" value="<?php echo($usuario['id']); ?>">
                      <input type="hidden" name="usuario" value="<?php echo($usuario['usuario']); ?>">
                      <input type="hidden" name="contraseña" value="<?php echo($usuario['contraseña']); ?>">
                      <button class="btn" type="submit" name="Editar">
                        Editar
                        <i class="material-icons left">edit</i>
                      </button>
                    </form>
                  </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
          </table>
    </center>
    <div id="left-section">
      <a class="waves-effect waves-light #ef5350 red lighten-1 btn-large" href="?print"><i class="material-icons left">print</i>Descargar PDF</a>
    </div>

    <!-- Modal para agregar usuario-->
      <div id="modalAddUser" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn" name='close' id="closeAddUser">
              <i class="material-icons">close</i>
            </button>
          </div>
        <h4>Agregar un usuario</h4>
          <form class="col s12" action="?" method="post">
            <!--Lectura del docente al que se le dará un usuario-->
            <div class='row'>
              <div class="input-field col s12">
                <select name="docente_add" required>
                  <?php foreach ($docentes as $docente): ?>
                    <option value=<?php echo htmlspecialchars($docente['id']); ?>><?php echo htmlspecialchars($docente['nombres']); ?></option>
                  <?php endforeach; ?>
                </select>
                <label>Selecciona el docente para el usuario</label>
              </div>
            </div>
            <!--Lectura para el usuario-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">account_circle</i>
                <input name="username_add" type="email" class="validate" required>
                <label for="username">Correo electrónico/nombre de usuario</label>
              </div>
            </div>
            <!--Lectura para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password1' id="password_add1" pattern=".{8,10}" required title="Deben de ser de 8 a 10 caracteres." required>
                <label for='password'>Contraseña</label>
              </div>
            </div>
            <!--Confirmar para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password2' id="password_add2" pattern=".{8,10}" required title="Deben de ser de 8 a 10 caracteres." required>
                <label for='password'>Confirmar contraseña</label>
              </div>
            </div>
            <!--Lectura del rol-->
            <div class="input-field col s12">
              <select>
                <option value="1">Usuario</option>
                <option value="2">Adminitrador</option>
              </select>
              <label>Rol</label>
            </div>
            <center>
              <!--<input class="btn" type="submit" name="Action" value="Agregar">-->
              <button class="btn" type="submit" name="Agregar">
                Agregar usuario
                <i class="material-icons left">person_add</i>
              </button>
            </center>
          </form>
        </div>
      </div>

    <!-- Modal para editar usuario-->
      <div id="modalEditUser" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn" name='close' id="closeEditUser">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h4>Editar un usuario</h4>
          <form class="col s12" action="?" method="post">
            <?php
              if($us == $_SESSION['username'])
              {
                ?>
                  <center>
                    <p class="#d32f2f red-text darken-1"><b>Atención: </b>Si se cambia este nombre de usuario o contraseña se cerrará la sesión.</p>
                  </center>
                  <input type="hidden" name="login" value="yes">
                <?php
              }
            ?>
            <!--Lectura para el usuario-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">account_circle</i>
                <input type="hidden" name="id" value="<?php echo($_POST['id']); ?>">
                <input name="username_edit" type="email" class="validate" required value="<?php echo htmlspecialchars($us); ?>">
                <label for="username">Correo electrónico/nombre de usuario</label>
              </div>
            </div>
            <!--Confirmar para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password_edit2' id='password_edit2' pattern=".{8,10}" required title="Deben de ser de 8 a 10 caracteres." required>
                <label for='password'>Nueva contraseña</label>
              </div>
            </div>
            <center>
              <input class="btn" type="submit" name="Guardar">
            </center>
          </form>
        </div>
      </div>

  </main>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
  <script type="text/javascript" src="../js/script_modal.js"></script>
  <script type="text/javascript" src="../js/script_select_multiple.js"></script>
  <script>
    $('#closeAddUser').click(function(){
        $('#modalAddUser').modal('close');
    });
    $('#closeEditUser').click(function(){
        $('#modalEditUser').modal('close');
    });
    
    //Valida las contraseñas para agregar
    var password = document.getElementById("password_add1"), confirm_password = document.getElementById("password_add2");
    function validatePassword(){
      if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("La contraseña no coincide.");
      } else {
        confirm_password.setCustomValidity('');
      }
    }
    password.onchange = validatePassword;
    confirm_password.onKeyup = validatePassword;

    

    //Se abre modal a cargarse la página
    window.onload = function()
    {
      $('#modalEditUser').modal('open');
    };
  </script>
</body>

</html>