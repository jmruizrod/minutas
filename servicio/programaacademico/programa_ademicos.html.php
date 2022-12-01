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

//Para recuperar los programas académicos, su unidad académica y su área académica
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = 'SELECT ctpa_id, ctpa_nombre, ctua_nombre, ctaa_nombre FROM cat_prog_acad, cat_unid_acade, cat_area_aca WHERE cat_unid_acade_fk = ctua_id AND ctaa_id = cat_area_fk';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena el arreglo programas con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $programas[] = array('id' => $row['ctpa_id'], 'nombre' => $row['ctpa_nombre'], 'unidad' => $row['ctua_nombre'], 'area' => $row['ctaa_nombre']);
}
//Si no se recuperó algo, se llna el arreglo con texto
if(!isset($programas))
{
  $programas[] = array('id' => "Vacío", 'nombre' => "Vacío", 'unidad' => "Vacío", 'area' => "Vacío");
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
  $pdf->SetTitle('Programas académicos');
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
  <h1 align="center">Programas académicos</h1>
  <br>
    <table border="1" cellpadding="4">
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Unidad académica</th>
          <th>Área académica</th>
        </tr>
      </thead>  
    <tbody>
  ';
  //Se agregan los datos
  foreach ($programas as $programa):
    $tbl .= '
      <tr>
        <td>' . $programa["nombre"] . '</td>
        <td>' . $programa["unidad"] . '</td>
        <td>' . $programa["area"] . '</td>
      </tr>
    ';
  endforeach;
  //Cuando se termina de recorrer todo, se cierran el tbody y el table
  $tbl .= '</tbody></table>';

  $pdf->writeHTML($tbl, true, false, false, false, '');
  ob_end_clean();
  //Close and output PDF document
  $pdf->Output('Programas_académicos.pdf', 'D');
}
?>


<!DOCTYPE html>

<head>
  <title>Programas académicos</title>
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
        <li><a href="../docentes/docentes.html.php">Docentes</a></li>
        <li class="active"><a href="programa_ademicos.html.php">Programas académicos</a></li>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <center>
      <table class="striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Unidad académica</th>
            <th>Área académica</th>
          </tr>
        </thead>
          <tbody>
            <?php foreach ($programas as $programa): ?>
              <tr>
                <td><?php echo htmlspecialchars($programa['nombre']); ?></td>
                <td><?php echo htmlspecialchars($programa['unidad']); ?></td>
                <td><?php echo htmlspecialchars($programa['area']); ?></td>
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