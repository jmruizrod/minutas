<?php
//Si no está con una sesión, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
    header('Location: ../login.html.php');
    exit();
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
  // set margins
  $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
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
    <table border="1" cellpadding="2">
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
        <td>
    ';
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
  $pdf->Output('Usuariso.pdf', 'I');
}

?>


  
<!DOCTYPE html>

<head>
<title>Imprimir usuarios</title>
  <meta charset="UTF-8">
  <!-- Fuentes e íconos de google -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
  <!-- Estilos propios -->
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body>
  <main>
      <center>
        <h5>Usuarios</h5>
          <table class="striped">
            <thead>
              <tr>
                  <th>Nombre</th>
                  <th>Contraseña</th>
                  <th>Cuerpo colegiado</th>
              </tr>
            </thead>

            <tbody>
              
            <?php foreach ($usuarios as $usuario): ?>
                <tr>
                  <td><?php echo htmlspecialchars($usuario['usuario']); ?></td>
                  <td><?php echo htmlspecialchars($usuario['contraseña']); ?></td>
                  <td><?php 
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
                        //Se muestrael contenido de la consulta
                        foreach ($cuerpos as $cuerpo):
                          echo htmlspecialchars($cuerpo['cuerpo'] . ", ");
                        endforeach;
                        unset($cuerpos);
                      ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
          </table>
      </center>
      <a class="waves-effect waves-light btn-large" href="?print"><i class="material-icons left">print</i>Imprimir los usuarios</a>
  </main>
  <script type="text/javascript" src="//code.jquery.com/jquery-compat-git.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
</body>

</html>

<?php

?>