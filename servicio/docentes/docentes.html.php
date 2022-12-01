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
if(!isset($_GET['busca']))
{
  //Recupera los docentes
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $sql = "SELECT dc_codigo, dc_paterno, dc_materno, dc_nombres, user FROM docente;";
    $resultD = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar los docentes; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Llena el arreglo docentes con lo reuperdo de la consulta
  while ($row = $resultD->fetch())
  {
    $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres'], 'paterno' => $row['dc_paterno'], 'materno' => $row['dc_materno'], 'user' => $row['user']);
  }
}
else
{
  $busca = $_GET['busca'];
  //Para la búsqueda
  try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno, user FROM docente WHERE dc_nombres LIKE '%$busca%';";
    $result_search = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al hacer las búsqueda; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  while ($row = $result_search->fetch())
  {
    $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres'], 'paterno' => $row['dc_paterno'], 'materno' => $row['dc_materno'], 'user' => $row['user']);
  }
  if(!isset($docentes))
  {
    try
    {
      $sql = "SELECT dc_codigo, dc_nombres, dc_paterno, dc_materno FROM docente WHERE dc_paterno LIKE '%$busca%';";
      $result_search = $pdo->query($sql);
    }
    catch (PDOException $e)
    {
      $error = 'Error al hacer las búsqueda; ' . $e->getMessage();
      include '../error.html.php';
      exit();
    }
    while ($row = $result_search->fetch())
    {
      $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres'], 'paterno' => $row['dc_paterno'], 'materno' => $row['dc_materno']);
    }
  } 
}
//Si no se recuperaron docentes, se llena el arreglo con un texto
if(!isset($docentes))
{
  $docentes[] = array('id' => "Vacío", 'nombres' => "Vacío", 'paterno' => "Vacío", 'materno' => "Vacío", 'area' => "Vacío", 'programa' => "Vacío");
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
  $pdf->SetTitle('Docentes');
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
  <h1 align="center">Docentes</h1>
  <br>
    <table border="1" cellpadding="4">
      <thead>
        <tr>
          <th><b>Nombres</b></th>
          <th><b>Apellido paterno</b></th>
          <th><b>Apellido materno</b></th>
          <th><b>Área académica</b></th>
          <th><b>Unidad académico</b></th>
          <th><b>Cuerpos colegiados</b></th>
        </tr>
      </thead>  
    <tbody>
  ';
  //Se agregan los datos
  foreach ($docentes as $docente):
    $tbl .= '
      <tr>
        <td>' . $docente['nombres'] . '</td>
        <td>' . $docente['paterno'] . '</td>
        <td>' . $docente['materno'] . '</td>
        <td>';
   //Recupera las áreas acádemicas de cada docente
    $id_docente = $docente['id'];
    $sql = "SELECT ctaa_nombre FROM cat_area_aca, integrantes_area_aca WHERE cat_area_aca_ctaa_id = ctaa_id AND docente_dc_codigo = '$id_docente';";
    $resultA = $pdo->query($sql);
    while ($row = $resultA->fetch())
    {
       $tbl .= $row['ctaa_nombre'] . ", ";
    }
    $tbl .= '</td><td>';
    //Recupera las unidades academémicas de cada docente
    $sql = "SELECT ctua_nombre FROM cat_unid_acade, integrantes_unid_acade WHERE cat_unid_acade_ctua_id = ctua_id AND docente_dc_codigo = '$id_docente';";
    $resultU = $pdo->query($sql);
    while ($row = $resultU->fetch())
    {
      $tbl .= $row['ctua_nombre'] . ", ";
    }
    $tbl .= '</td><td>';
    //Recupera los cuerpos colegiados de cada docente
    $sql = "SELECT c_nombre FROM comision_cuerpos_colegiados, integrantes_comision WHERE docente_dc_codigo = '$id_docente' AND comision_id = comision_cuerpos_colegiados_comision_id;";
    $resultC = $pdo->query($sql);
    while ($row = $resultC->fetch())
    {
      $tbl .= $row['c_nombre'] . ", ";
    }
    //Se cierran las etiquetas de td y tr, se continúa con el ciclo
    $tbl .= '</td></tr>';
  endforeach;
  //Cuando se termina de recorrer todo, se cierran el tbody y el table
  $tbl .= '</tbody></table>';

  $pdf->writeHTML($tbl, true, false, false, false, '');
  ob_end_clean();
  //Close and output PDF document
  $pdf->Output('Docentes.pdf', 'D');
}
?>


<!DOCTYPE html>

<head>
  <title>Docentes</title>
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
  <nav>
    <div class="nav-wrapper #d32f2f red darken-1">
      <form>
        <div class="input-field">
          <input id="search" name="busca" type="search" required>
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>
        </div>
      </form>
    </div>
  </nav>
  <main>
    <center>
      <!-- Tabla con los docentes -->
      <table class="striped">
        <thead>
          <tr>
            <th>Nombres</th>
            <th>Apellido paterno</th>
            <th>Apellido materno</th>
            <th>Área académica</th>
            <th>Unidad académico</th>
            <th>Cuerpos colegiados</th>
            <th>Ver perfil de usuario</th>
          </tr>
        </thead>
        <tbody>
          <!-- Se crea la tabla con lo recuperado de la base de datos-->
          <?php foreach ($docentes as $docente): ?>
            <tr>
              <td><?php echo htmlspecialchars($docente['nombres']); ?></td>
              <td><?php echo htmlspecialchars($docente['paterno']); ?></td>
              <td><?php echo htmlspecialchars($docente['materno']); ?></td>
              <td>
              <?php
                //Recupera las áreas acádemicas de cada docente
                $id_docente = $docente['id'];
                $sql = "SELECT ctaa_nombre FROM cat_area_aca, integrantes_area_aca WHERE cat_area_aca_ctaa_id = ctaa_id AND docente_dc_codigo = '$id_docente';";
                $resultA = $pdo->query($sql);
                while ($row = $resultA->fetch())
                {
                  echo htmlspecialchars($row['ctaa_nombre'] . ", ");
                }
              ?>
              </td>
              <td>
              <?php
                //Recupera las unidades academémicas de cada docente
                $sql = "SELECT ctua_nombre FROM cat_unid_acade, integrantes_unid_acade WHERE cat_unid_acade_ctua_id = ctua_id AND docente_dc_codigo = '$id_docente';";
                $resultU = $pdo->query($sql);
                while ($row = $resultU->fetch())
                {
                  echo htmlspecialchars($row['ctua_nombre'] . ", ");
                }
              ?>
              </td>
              <td>
                <?php
                  //Recupera los cuerpos colegiados de cada docente
                  $sql = "SELECT c_nombre FROM comision_cuerpos_colegiados, integrantes_comision WHERE docente_dc_codigo = '$id_docente' AND comision_id = comision_cuerpos_colegiados_comision_id;";
                  $resultC = $pdo->query($sql);
                  while ($row = $resultC->fetch())
                  {
                    echo htmlspecialchars($row['c_nombre'] . ", ");
                  }
                ?>
              </td>
              <td>
                <?php
                  if (isset($docente['user']))
                  {
                    ?>
                      <form method="post" action="ver_docente.html.php">
                        <input type="hidden" name="id" value="<?php echo $docente['id']; ?>">
                        <button class="btn" type="submit" name="Action" value="Ver">
                          Ver
                          <i class="material-icons left">zoom_in</i>
                        </button>
                      </form>
                    <?php
                  }
                  else
                  {
                    ?>
                      <p>Sin perfil de usuario</p>
                    <?php
                  }
                ?>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </center>
    <div id="left-section">
      <a class="waves-effect waves-light #ef5350 red lighten-1 btn-large" href="?print"><i class="material-icons left">print</i>Descargar PDF</a>
    </div>
  </main>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>

</html>