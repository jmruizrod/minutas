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
if (!isset($_POST['print']))
{
  //Se conecta a la base de datos y recupera los datos del usuario
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $user = $_POST['id'];
    $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno, dc_foto, user, password, cargo, dc_nacimiento, dc_nombramiento, dc_nivel, dc_categoria, dc_adscripcion FROM docente, integrantes_comision, comision_cuerpos_colegiados WHERE dc_codigo = '$user' AND comision_id = comision_cuerpos_colegiados_comision_id AND dc_codigo = docente_dc_codigo;";
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
      $user = $_POST['id'];
      $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno, dc_foto, user, password, dc_nacimiento, dc_nombramiento, dc_nivel, dc_categoria, dc_adscripcion FROM docente WHERE dc_codigo = '$user';";
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
    $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Llena el arreglo cuerpos con lo recuperado de la consulta
  while ($row = $result->fetch())
  {
    $cuerpos[] = array('id' => $row['comision_id'], 'nombre' => $row['c_nombre']);
  }
  //Si no se recuperó algo, se llena con texto
  if(!isset($cuerpos))
  {
    $cuerpos[] = array('id' => 'Vacío', 'nombre' => 'Vacío');
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
    <h1 align="center"><b>del programa académico ' . $programa . '</b></h1>
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
    //Close and output PDF document
    $pdf->Output('M' . $fecha . $hora_fin . '.pdf', 'D');
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
    <div class="nav-wrapper #d32f2f red darken-1">
      <a href="#" class="brand-logo">Administrador <?php echo $_SESSION['username']; ?></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../adminuser.html.php">Panel de control</a></li>
        <li><a href="../usuario/usuario.html.php">Usuarios</a></li>
        <li><a href="../cuerposcolegiados/cuerpos_colegiados.html.php">Cuerpos colegiados</a></li>
        <li class="active"><a href="docentes.html.php">Docentes</a></li>
        <li><a href="../programaacademico/programa_ademicos.html.php">Programas académicos</a></li>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <div id="rigth_section">
      <div class="col s12 m8 offset-m2 l6 offset-l3">
        <div id="left-section">
          <a class="waves-effect waves-light #ef5350 red lighten-1 btn-large" href="docentes.html.php"><i class="material-icons left">arrow_back</i>Regresar</a>
        </div>
       <div class="">
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
    </div>
    <div id="center-section">
        <center>
          <h4>Historial de minutas</h4>
        </center>
      <!-- Se muestran los cuerpos colegiados a los que pertenece y se mustran sus minutas -->
      <?php foreach ($cuerpos as $cuerpo): ?>
      <h5><?php echo $cuerpo['nombre']; ?></h5>
        <?php
          $comi_id = $cuerpo['id'];
          unset($result_cuerpos);
          //Para las minutas
          try
          {
            $sql = "SELECT id_minutas, hora_fin, asunto, cargo FROM minutas, docente, integrantes_comision, comision_cuerpos_colegiados WHERE dc_codigo = '$id_user' AND dc_codigo = docente_dc_codigo AND comision_id = '$comi_id'  AND comision_id = '$comi_id' AND comision_cuerpos_colegiados_comision_id = '$comi_id' AND minutas_comision_cuerpos_colegiados_comision_id = '$comi_id';";
            $result = $pdo->query($sql);
          }
          catch (PDOException $e)
          {
            $error = 'Error al recuperar las minutas; ' . $e->getMessage();
            include '../error.html.php';
            exit();
          }
          //Se llena el arreglo con lo recuperado de la consulta
          while ($row2 = $result->fetch())
          {
            $minutas[] = array('id' => $row2['id_minutas'], 'hora' => $row2['hora_fin'], 'asunto' => $row2['asunto'], 'cargo' => $row2['cargo']);
          }
          //Si sí se recuperaron las minutas, se crea la tabla con sus datos
          if(isset($minutas))
          {
            ?>
              <table class="striped">
              <thead>
                  <tr>
                    <th>Fecha</th>
                    <th>Asunto</th>
                    <th>Cargo</th>
                  </tr>
              </thead>
              <tbody>
                <!-- Aquí aparecen los datos de las minutas-->
                <?php foreach ($minutas as $minuta): ?>
                  <tr>
                    <td><?php echo $minuta['hora']; ?></td>
                    <td><?php echo $minuta['asunto']; ?></td>
                    <td><?php echo $minuta['cargo']; ?></td>
                    <td>
                      <form method="post" action="?">
                        <input type="hidden" name="id" value="<?php echo($minuta['id']); ?>">
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
            //Si no se recuperaron minutas, se indica que no hay
            ?>
              <label>Sin minutas</label>
             <?php
          }
        ?>
      <?php endforeach; ?>
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
  </script>
</body>

</html>