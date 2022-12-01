<?php
//Librerías de PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require $_SERVER['DOCUMENT_ROOT'] . '/includes/Exception.php';
require $_SERVER['DOCUMENT_ROOT'] . '/includes/PHPMailer.php';
require $_SERVER['DOCUMENT_ROOT'] . '/includes/SMTP.php';

//Si no está con una sesión, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
  header('Location: ../login.html.php');
  exit();
}

//Asigna el id de la minuta a enviar
if (isset($_POST['reenviar_minuta']))
{
  $reenviar_id = $_POST['reenviar_id'];
}

//Se conecta a la base de datos y recupera los datos del usuario
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $user = $_SESSION['username'];
  $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno, dc_foto, user, password, cargo, dc_nacimiento, dc_nombramiento, dc_nivel, dc_categoria, dc_adscripcion FROM docente, integrantes_comision, comision_cuerpos_colegiados WHERE user = '$user' AND comision_id = comision_cuerpos_colegiados_comision_id AND dc_codigo = docente_dc_codigo;";
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Llena el arreglo usuario con lo recuperado de la base de datos
while ($row = $result->fetch())
{
  $id_user = $row['dc_codigo'];
  $password = $row['password'];
  $nombre = $row['dc_nombres'];
  $ape_pate = $row['dc_paterno'];
  $ape_mate = $row['dc_materno'];
  $usuario = $row['user'];
  $cargo = $row['cargo'];
  $nac = $row['dc_nacimiento'];
  $nac = date("d-m-Y", strtotime($nac));
  $nombramiento = $row['dc_nombramiento'];
  $nivel = $row['dc_nivel'];
  $categoria = $row['dc_categoria'];
  $adscripcion = $row['dc_adscripcion'];

  $image = $row['dc_foto'];
}
//Si no se recupera algo con la consulta anterior, se realiza otra que sólo toma la tabla de docente
if(!isset($id_user))
{
  //Se conecta a la base de datos y recupera los datos del usuario
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $user = $_SESSION['username'];
    $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno, dc_foto, user, password, dc_nacimiento, dc_nombramiento, dc_nivel, dc_categoria, dc_adscripcion FROM docente WHERE user = '$user';";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Llena el arreglo usuario con lo recuperado de la base de datos
  while ($row = $result->fetch())
  {
    $id_user = $row['dc_codigo'];
    $password = $row['password'];
    $nombre = $row['dc_nombres'];
    $ape_pate = $row['dc_paterno'];
    $ape_mate = $row['dc_materno'];
    $usuario = $row['user'];
    $nac = $row['dc_nacimiento'];
    $nac = date("d-m-Y", strtotime($nac));
    $nombramiento = $row['dc_nombramiento'];
    $nivel = $row['dc_nivel'];
    $categoria = $row['dc_categoria'];
    $adscripcion = $row['dc_adscripcion'];

    $image = $row['dc_foto'];
  } 
}

//Recupera los cuerpos colegiados
try
{
  $sql = "SELECT comision_id, c_nombre FROM comision_cuerpos_colegiados, integrantes_comision, docente WHERE dc_codigo = '$id_user' AND docente_dc_codigo = '$id_user' AND comision_id = comision_cuerpos_colegiados_comision_id;";
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los cuerpos colegiados; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Llena el arreglo cuerpos con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $cuerpos[] = array('id' => $row['comision_id'], 'nombre' => $row['c_nombre']);
}
//Si no se recupera algo, se llena con texto
if(!isset($cuerpos))
{
  $cuerpos[] = array('id' => 'Vacío', 'nombre' => 'Vacío');
}

//Consulta para recuperar los docentes del cuerpo colegiado
try
{
  $sql = 'SELECT dc_codigo, user FROM docente WHERE user IS NOT NULL';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los udocentes; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Llena el arreglo docentes con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $docentes[] = array('id' => $row['dc_codigo'], 'user' => $row['user']);
}

//Se edita un usuario existente
if (isset($_POST['Guardar']))
{
  $dc_codigo = $_POST['id'];
  $name_user = $_POST['username_edit'];

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
    $sql = "UPDATE docente SET user = '$name_user', updated_at = '$fecha_hora' WHERE dc_codigo = '$dc_codigo';";
    $s = $pdo->prepare($sql);
    $s->execute();
    header('Location: ../login.html.php'); 
  }
  catch(PDOException $e)
  {
    $error='Error al editar usuario: '.$e->getMessage();
    include '../error.html.php';
    exit();
  }
}

//Descarga el PDF de la minuta seleccionada
if (isset($_POST['print']))
{
  //Recupera la minuta
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $id_minuta = $_POST['id'];
    $sql = "SELECT fecha, hora_inicio, hora_fin, lugar, orden_del_dia, acuerdos, asunto, asistentes, c_nombre, ctpa_nombre FROM minutas, comision_cuerpos_colegiados, cat_prog_acad WHERE id_minutas = '$id_minuta' AND comision_id = minutas_comision_cuerpos_colegiados_comision_id AND ctpa_id = cat_prog_acad_ctpa_id;";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar las minutas; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Toma los datos de la minuta y los guarda en distintas variables
  while ($row = $result->fetch())
  {
    $fecha = $row['fecha'];
    $fecha = date("d-m-Y", strtotime($fecha));
    $hora = $row['hora_inicio'];
    $hora = date("H:i", strtotime($hora));
    $hora_fin = $row['hora_fin'];
    $hora_fin = date("H:i:s", strtotime($hora_fin));
    $lugar = $row['lugar'];
    $orden = $row['orden_del_dia'];
    $acuerdos = $row['acuerdos'];
    $asunto = $row['asunto'];
    $asistentes = $row['asistentes'];
    $cuerpo = $row['c_nombre'];
    $programa = $row['ctpa_nombre'];

    if ($acuerdos == "")
    {
      $acuerdos = "Sin registrar";
    }
  }
  //Recupera las actividades de la minuta
  try
  {
    $sql = "SELECT actividades, dc_nombres FROM actividad, docente WHERE minutas_id_minutas = '$id_minuta' AND dc_codigo = docente_dc_codigo;";
    $result2 = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar las actividades de las minutas; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Llena el arreglo actividades con todas las actividades de la minuta
  while ($row = $result2->fetch())
  {
    $actividades[] = array('actividad' => $row['actividades'], 'responsable' => $row['dc_nombres']);
  }
  if (!isset($actividades))
  {
    $actividades[] = array('actividad' => "No registrado", 'responsable' => "No registrado");
  }
  //TCPDF
    ob_start();
    // Include the main TCPDF library.
    require_once('../tcpdf.php');
    // create new PDF document
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
    // set document information
    $pdf->SetTitle('Minuta');
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
    <h1 align="center"><b>' . $cuerpo . '</b></h1>
    <h1 align="center"><b>del programa académico de' . $programa . '</b></h1>
    <h1 align="center"><b>Registro de reuniones</b></h1>
    ';
    //Tala de fecha y hora
    $tbl .= '
      <table border="1" cellpadding="4">
        <tbody>  
          <tr>
            <td><b>Fecha: </b>' . $fecha . '</td>
            <td><b>Hora: </b>' . $hora . '</td>
          </tr>
        </tbody>
      </table>
      <p>Se realizó reunión en <b>' . $lugar . '</b> donde se reunieron los integrantes de la comisión:  <b>' . $asistentes . '</b> bajo el siguiente:</p>
      <h2><b>Orden del día:</b></h2>
      <table border="1" cellpadding="4">
        <tbody>
        <tr>
          <td>' . nl2br($orden) . '</td>
        </tr>
        </tbody>
      </table>
      <h2><b>Actividades/Acuerdos</b></h2>
      <table border="1" cellpadding="4">
        <thead>
          <tr>
            <th colspan="2"><b>Actividades</b></th>
            <th><b>Responsable</b></th>
          </tr>
        </thead>
        <tbody>
    ';
    //Muestra las actividades
    foreach ($actividades as $actividad):
      $tbl .= '
        <tr>
          <td colspan="2">' . $actividad['actividad'] . '</td>
          <td>' . $actividad['responsable'] . '</td>
        </tr>
      ';
    endforeach;
    //Loa acuerdos después del ciclo
    $tbl .= '
      </tbody>
    </table>
    ';

    $tbl .= '
      <table border="1" cellpadding="4">
        <thead>
          <tr>
            <th><b>Acuerdos</b></th>
          </tr>
        </thead>
        <tbody>
        <tr>
          <td>' . nl2br($acuerdos) . '</td>
        </tr>
        </tbody>
      </table>
      <p>Una vez establecidos los acuerdos se da por terminada la reunión siendo las <b>' . $hora_fin . '</b> horas del mismo día <b>' . $fecha . '</b>.</p>
    ';
    $pdf->writeHTML($tbl, true, false, false, false, '');
    ob_end_clean();
    $fecha = date("dmY", strtotime($fecha));
    $hora_fin = date("His", strtotime($hora_fin));
    $minuta_nombre = 'M' . $fecha . $hora_fin . '.pdf';
    //Close and output PDF document
    $pdf->Output($minuta_nombre, 'D');
  //
}
?>


  
<!DOCTYPE html>

<head>
<title>Perfil de usuario</title>
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
    <div class="nav-wrapper #1a237e indigo darken-2">
      <a href="perfil.html.php" class="brand-logo">Usuario</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../user.html.php">Panel de control</a></li>
        <li class="active"><a href="perfil.html.php">Perfil</a></li>
        <?php
          if($nombramiento == "Coordinador" || $nombramiento == "coordinador")
          {
            ?>
            <li><a href="crear_minuta.html.php">Crear minutas</a></li>
            <?php
          }
        ?>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <div id="rigth_section">
      <div class="col s12 m8 offset-m2 l6 offset-l3">
        <div id="left-section">
          <a class="waves-effect waves-light btn #1a237e indigo darken-1 modal-trigger" href="#modalChangePass"><i class="material-icons left">swap_vert</i>Cambiar contraseña</a>
        </div>
          <div class="section"></div>
          <div class="row">
            <div class="col s1">
              <?php echo '<img class="responsive-img" src="data:dc_foto/jpeg;base64,'.base64_encode( $image ).'"/>'; ?>
            </div>
            <div class="col s6">
              <h5><b>Nombre: </b><?php echo($nombre . " " . $ape_pate . " " . $ape_mate); ?></h5>
              <h5><b>E-mail/usuario: </b><?php echo($usuario); ?></h5>
              <p><b>Nombramiento: </b><?php echo($nombramiento); ?></p>
              <p><b>Nivel: </b><?php echo($nivel); ?></p>
              <p><b>Categoría: </b><?php echo($categoria); ?></p>
              <p><b>Abscripción: </b><?php echo($adscripcion); ?></p>
              <p><b>Fecha de nacimiento: </b><?php echo($nac); ?></p>
            </div>
          </div>
      </div>
    </div>
    <div id="center-section">
      <center>
        <h4>Historial de minutas</h4>
      </center>
      <?php foreach ($cuerpos as $cuerpo): ?>
      <h5><?php echo $cuerpo['nombre']; ?></h5>
        <?php
          $comi_id = $cuerpo['id'];
          unset($result_cuerpos);
          //Para las minutas del cuerpo colegiado que esté en $cuerpo
          try
          {
            $sql = "SELECT id_minutas, hora_fin, asunto, cargo, ctpa_id FROM minutas, docente, integrantes_comision, comision_cuerpos_colegiados, cat_prog_acad WHERE dc_codigo = '$id_user' AND dc_codigo = docente_dc_codigo AND comision_id = '$comi_id' AND comision_id = '$comi_id' AND comision_cuerpos_colegiados_comision_id = '$comi_id' AND minutas_comision_cuerpos_colegiados_comision_id = '$comi_id' AND ctpa_id = cat_prog_acad_ctpa_id;";
            $result = $pdo->query($sql);
          }
          catch (PDOException $e)
          {
            $error = 'Error al recuperar la minuta; ' . $e->getMessage();
            include '../error.html.php';
            exit();
          }
          //Llena el arreglo con los datos de la minuta
          while ($row2 = $result->fetch())
          {
            $minutas[] = array('id' => $row2['id_minutas'], 'hora' => $row2['hora_fin'], 'asunto' => $row2['asunto'], 'cargo' => $row2['cargo'], 'programa' => $row2['ctpa_id']);
          }
          if(isset($minutas))
          {
            foreach ($minutas as $minuta):
              if($minuta['cargo'] == "Responsable" || $minuta['cargo'] == "responsable")
              {
                $cargo = "responsable";
              }
            endforeach;
            if($cargo == "responsable")
            {
              ?>
                <div id="left-section">
                  <a class="waves-effect waves-light btn #1a237e indigo darken-1 modal-trigger" href="#modalChangeEmail"><i class="material-icons left">mail</i>Cambiar correo de envio de minutas</a>
                </div>
              <?php
              $cargo = "";
            }
            ?>
            <!-- Tabla con los datos de las minutas-->
            <table class="striped">
              <thead>
                <tr>
                  <th>Fecha</th>
                  <th>Asunto</th>
                  <th>Cargo</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($minutas as $minuta): ?>
                  <tr>
                    <td><?php echo $minuta['hora']; ?></td>
                    <td><?php echo $minuta['asunto']; ?></td>
                    <td><?php echo $minuta['cargo']; ?></td>
                    <?php 
                      if($minuta['cargo'] == "Responsable")
                      {
                        ?>
                          <td>
                            <form method="post" action="perfil2.html.php">
                              <input type="hidden" name="reenviar_id" value="<?php echo($minuta['id']); ?>">
                              <button class="btn" type="submit" name="reenviar_minuta">
                                Enviar minutas
                                <i class="material-icons left">send</i>
                              </button>
                            </form>
                          </td>
                          <td>
                            <form method="post" action="editar_minuta.html.php">
                              <input type="hidden" name="id" value="<?php echo($minuta['id']); ?>">
                              <input type="hidden" name="select_programa" value="<?php echo($minuta['programa']); ?>">
                              <input type="hidden" name="select_cuerpo" value="<?php echo htmlspecialchars($cuerpo['nombre']); ?>">
                              <button class="btn" type="submit" name="editar">
                                Editar minuta
                                <i class="material-icons left">edit</i>
                              </button>
                            </form>
                          </td>
                        <?php
                      }
                    ?>
                    <td>
                      <form method="post" action="?">
                        <input type="hidden" name="id" value="<?php echo($minuta['id']); ?>">
                        <input type="hidden" name="select_programa" value="<?php echo($minuta['programa']); ?>">
                        <button class="btn" type="submit" name="print" value="print">
                          Descargar PDF
                          <i class="material-icons left">print</i>
                        </button>
                      </form>
                    </td>
                  </tr>
                <?php endforeach;
                  unset($minutas)
                ?>
              </tbody>
            </table>
          <?php
          }
          else
          {
            ?>
              <label>Sin minutas</label>
            <?php
          }
        ?>
      <?php endforeach; ?>
    </div>

    <!-- Modals -->
    <!-- Modal para cambiar contraseña-->
      <div id="modalChangePass" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn #1a237e indigo darken-1" name='close' id="closeChangePass">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h5>Cambiar contraseña</h5>
          <form class="col s12" action="perfil.html.php" method="post">
            <!--Lectura para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input type="hidden" name="pass_old" value="<?php echo $password; ?>">
                <input class='validate' type='password' name='password_old' id='password_old' pattern=".{8,10}" required title="Deben de ser de 8 a 10 caracteres." required>
                <label for='password'>Contraseña antigua</label>
              </div>
            </div>
            <!--Confirmar para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password_new' id='password_new' pattern=".{8,10}" required title="Deben de ser de 8 a 10 caracteres." required>
                <label for='password'>Nueva contraseña</label>
              </div>
            </div>
            <center>
              <input class="btn #1a237e indigo darken-1" type="submit" name="pass">
            </center>
          </form>
        </div>
      </div>

      <!-- Modal para reenviar minutas-->
      <div id="modalReenviarMiutas" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn #1a237e indigo darken-1" name='close' id="closeReeviarMinutas">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h5>Seleccione a quienes enviar la minuta</h5>
          <form method="post" action="perfil.html.php">
            <div class="input-field col s12">
              <input type="hidden" name="reenviar_id" value="<?php echo htmlspecialchars($reenviar_id); ?>">
               <select name="emails[]" multiple required>
                  <?php foreach ($docentes as $docente): ?>
                    <option value="<?php echo htmlspecialchars($docente['user']); ?>" name="checkbox" selected ><?php echo htmlspecialchars($docente['user']); ?></option>
                  <?php endforeach; ?>
                </select>
              <label>Correos</label>
            </div>
            <p><b><?php echo htmlspecialchars($usuario); ?></b> enviará la minuta.</p>
            <!--Confirmar para la contraseña-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">vpn_key</i>
                <input class='validate' type='password' name='password_email' id='password_edit2' required>
                <label for='password'>Contraseña de <?php echo htmlspecialchars($usuario); ?></label>
              </div>
            </div>
            <center>
              <a class="waves-effect waves-light btn #1a237e indigo darken-1 modal-trigger" href="#modalChangeEmail"><i class="material-icons left">mail</i>Cambiar correo de envio</a>
            </center>
            <div id="left-section">
              <button type='submit' name='Action' value="Enviar" class='#1a237e indigo darken-1 btn'>
                Enviar
                <i class="material-icons left">send</i>
              </button>  
            </div>
          </form>
        </div>
      </div>

      <!-- Modal para cambiar correo de envio-->
      <div id="modalChangeEmail" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="btn #1a237e indigo darken-1 waves-effect" name='close' id="modalCloseEmail">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h4>Cambiar correo de envío</h4>
          <form class="col s12" action="?" method="post">
            <p class="#d32f2f red-text darken-1"><b>Atención: </b>Si se cambia el correo se cerrará la sesión.</p>
            <!--Lectura para el usuario-->
            <div class='row'>
              <div class='input-field col s12'>
                <i class="material-icons prefix">mail</i>
                <input type="hidden" name="id" value="<?php echo($id_user); ?>">
                <input name="username_edit" type="email" class="validate" required value="<?php echo htmlspecialchars($usuario); ?>">
                <label for="username">Correo electrónico/nombre de usuario</label>
              </div>
            </div>
            <center>
              <input class="btn #1a237e indigo darken-1" type="submit" name="Guardar" value="Guardar">
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
    $('#closeChangePass').click(function(){
        $('#modalChangePass').modal('close');
    });
    $('#modalCloseEmail').click(function(){
        $('#modalChangeEmail').modal('close');
    });
    $('#closeReeviarMinutas').click(function(){
        $('#modalReenviarMiutas').modal('close');
    });
    window.onload = function()
    {
      $('#modalReenviarMiutas').modal('open');
    };
  </script>
</body>

</html>