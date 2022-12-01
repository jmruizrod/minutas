<?php
//Si no está con una sesión como adminitrador, se manda a login
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: ../login.html.php');
    exit();
}
else if($_SESSION['admin']== 0){
  header('Location: ../user.html.php');
}

if(!isset($cuerpos)){
  $cuerpos[] = 'Vacio';
}
//Verifica si se presionó el botón
if(empty($_POST['id']))
{
    header('Location: ./cuerpos_colegiados.html.php');
    exit();
}
else
{
  $id = $_POST['id'];
  //Recuper los datos del cuerpo colegiado seleccionado
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $sql ="SELECT comision_id, c_nombre, c_funciones, dc_nombres, cargo, dc_codigo, user FROM comision_cuerpos_colegiados, docente, integrantes_comision WHERE comision_cuerpos_colegiados_comision_id = '$id' AND dc_codigo = docente_dc_codigo AND comision_id = comision_cuerpos_colegiados_comision_id;";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar los datos del cuerpo colegiado seleccionado; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Llena cuerpos con los datos recupedados de la consulta
  while ($row = $result->fetch())
  {
    $cuerpo_integrantes[] = array('docente' => $row['dc_nombres'], 'cargo' => $row['cargo'], 'id' => $row['dc_codigo'], 'user' => $row['user']);

    $nombre = $row['c_nombre'];
    $funciones = $row['c_funciones'];
    $comi_id = $row['comision_id'];
  }

  if(!isset($cuerpo_integrantes))
  {
    $cuerpo_integrantes[] = array('docente' => 'Vacío', 'cargo' => 'Vacío');
    $nombre = "Vacío";
    $funciones = "Vacío";
    $comi_id = "Vacío";
  }

  //Recupera las minutas del cuerpo colegiado
  try
  {
    $sql = "SELECT id_minutas, hora_fin, asunto FROM minutas, comision_cuerpos_colegiados WHERE comision_id = '$comi_id' AND minutas_comision_cuerpos_colegiados_comision_id = '$comi_id';";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar las minutas del cuerpo colegiado seleccionado; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Se llena el arreglo con lo recuperado dde la consulta
  while ($row2 = $result->fetch())
  {
    $minutas[] = array('id' => $row2['id_minutas'], 'hora' => $row2['hora_fin'], 'asunto' => $row2['asunto']);
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
    $hora_fin = date("H:i", strtotime($hora_fin));
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
    //Close and output PDF document
    $pdf->Output('Minuta.pdf', 'D');
  //
}

?>

<!DOCTYPE html>

<head>
  <title>Cuerpos colegiados</title>
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
        <li class="active"><a href="cuerpos_colegiados.html.php">Cuerpos colegiados</a></li>
        <li><a href="../docentes/docentes.html.php">Docentes</a></li>
        <li><a href="../programaacademico/programa_ademicos.html.php">Programas académicos</a></li>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <div class="container">
      <center>
        <h4><?php echo $nombre; ?></h4>
      </center>         
      <div class="section"></div>
        <h5>Funciones</h5>
        <p><?php echo nl2br($funciones); ?></p>
        <table class="striped">
          <thead>
            <tr>
              <th>Integrantes</th>
              <th>Cargo</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($cuerpo_integrantes as $row): ?>     
              <tr>
                <td><?php echo $row['docente']; ?></td>
                <td><?php echo $row['cargo']; ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
          <h5>Historial de minutas</h5>
          <?php
            if(isset($minutas))
            {
              ?>
              <table class="striped">
                <thead>
                  <tr>
                    <th>Fecha</th>
                    <th>Asunto</th>
                    <th>Imprimir minuta</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($minutas as $minuta): ?>
                    <tr>
                      <td><?php echo $minuta['hora']; ?></td>
                      <td><?php echo $minuta['asunto']; ?></td>
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
                  <?php endforeach; ?>
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
      </center>   
    </div>

    <!-- Modals -->
      <!-- Modal para reenviar minutas-->
      <div id="modalReenviarMiutas" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn" name='close' id="closeReeviarMinutas">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h5>Seleccione a quienes reenviar la minuta</h5>
          <form method="post" action="ver_cuerpos_colegiados.html.php">
            <div class="input-field col s12">
              <input type="hidden" name="id" value="<?php echo htmlspecialchars($id); ?>">
               <select name="emails[]" multiple required>
                  <option value="" disabled>Selecciona a quienes enviar la minuta</option>
                  <?php foreach ($cuerpo_integrantes as $cuerpo_integrante): ?>
                    <option value="<?php echo htmlspecialchars($cuerpo_integrante['user']); ?>"><?php echo htmlspecialchars($cuerpo_integrante['user']); ?></option>
                  <?php endforeach; ?>
                </select>
              <label>Asistentes</label>
            </div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="section"></div>
            <button type='submit' name='Action' value="Enviar" class='indigo btn'>
              Enviar
              <i class="material-icons left">send</i>
            </button>
          </form>
        </div>
      </div>

  </main>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
  <script type="text/javascript" src="../js/script_modal.js"></script>
  <script type="text/javascript" src="../js/script_select_multiple.js"></script>
  <script>
    $('#closeReeviarMinutas').click(function(){
        $('#modalReenviarMiutas').modal('close');
    });
  </script>
</body>

</html>