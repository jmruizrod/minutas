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

//Consulta para tener los cuerpos colegiados
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = 'SELECT comision_id, c_nombre, c_funciones, cat_unid_acade_ctua_id, cat_area_aca_ctaa_id FROM comision_cuerpos_colegiados;';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los cuerpos colegiados; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Llena el arreglo cuerpos con lo recuperado de la base de datos
while ($row = $result->fetch())
{
  $cuerpos[] = array('id' => $row['comision_id'], 'nombre' => $row['c_nombre'], 'funciones' => $row['c_funciones'], 'unidad' => $row['cat_unid_acade_ctua_id'], 'area' => $row['cat_area_aca_ctaa_id']);
}
//Si no tiene cuerpos colegiados se llena indicando que no hay
if(!isset($cuerpos))
{
  $cuerpos[] = array('id' => "Vacío", 'nombre' => "Vacío", 'funciones' => "Vacío", 'unidad' => "Vacío", 'area' => "Vacío");
}

//Consulta para recuperar los docentes para marcar los responsables de actividades
try
{
  $sql = 'SELECT DISTINCT dc_codigo, dc_nombres FROM docente;';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los docentes para marcar los asistentes; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena con lo recuperado de la consulta de losdocente
while ($row = $result->fetch())
{
  $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres']);
}

//Consulta para recuperar las unidades acádemicas para desplegarlas en el select de agregar cuerpo colegiado
try
{
  $sql = "SELECT ctua_id, ctua_nombre FROM cat_unid_acade;";
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar las unidades académicas; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena con lo recuperado de la consulta de las unidades académicas
while ($row = $result->fetch())
{
  $unidades[] = array('id' => $row['ctua_id'], 'nombre' => $row['ctua_nombre']);
}
if(!isset($unidades))
{
  $unidades[] = array('id' => "Vacío", 'nombre' => "Vacío");
}

//Consulta para recuperar los áreas acádemicas para desplegarlas en el select de agregar cuerpo colegiado
try
{
  $sql = "SELECT ctaa_id, ctaa_nombre FROM cat_area_aca;";
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los usuarios; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena con lo recuperado de la consulta de las áreas académicas
while ($row = $result->fetch())
{
  $areas[] = array('id' => $row['ctaa_id'], 'nombre' => $row['ctaa_nombre']);
}
if(!isset($areas))
{
  $areas[] = array('id' => "Vacío", 'nombre' => "Vacío");
}

//Para agregar un nuevo cuerpo colegiado
if (isset($_POST['Registrar']))
{
  $nombre = $_POST['nombre_cuerpo'];
  $funciones = $_POST['funciones'];
  $unidad = $_POST['select_unidad'];
  $area = $_POST['select_area'];
  //Registra un nuevo cuerpo colegiado
  try
  {
    $sql = "INSERT INTO comision_cuerpos_colegiados (comision_id, c_nombre, c_funciones, c_inicio, c_fin, cat_comision_fk, created_at, updated_at, cat_unid_acade_ctua_id, cat_area_aca_ctaa_id) VALUES ('', '$nombre', '$funciones', '2018-11-22', '2018-11-22', NULL, TIMESTAMP, TIMESTAMP, '$unidad', '$area')";
    $s = $pdo->prepare($sql);
    $s->execute();
  }
  catch (PDOException $e)
  {
    $error = 'Error al insertar un nuevo cuerpo colegiado; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  //Toma todos los integrantes que puedan estar para agregarlos a integrantes_comision
  $n = 1;
  if(isset($_POST['integrante_' . $n]))
  {
    //Consulta para tener el id del cuerpo colegiado agregado
    try
    {
      $sql = "SELECT comision_id FROM comision_cuerpos_colegiados ORDER BY comision_id DESC LIMIT 1;";
      $result = $pdo->query($sql);
    }
    catch (PDOException $e)
    {
      $error = 'Error al recuperar el id del cuerpo colegiado; ' . $e->getMessage();
      include '../error.html.php';
      exit();
    }
    //Guarda el id de la minuta en una variable pra la insertarlo en las actividades
    while ($row = $result->fetch())
    {
      $last_cuerpo = $row['comision_id'];
    }
    //Se consiguen los integrantes del cuerpo colegiado en un ciclo
    while (isset($_POST['integrante_' . $n]))
    {
      $integrante = $_POST['integrante_' . $n];
      $cargo = $_POST['cargo_' . $n];
      //Para insertar los integrantes y su cargo en la tabla activides
      try
      {
        $sql = "INSERT INTO integrantes_comision (idintegrantes_comision, cargo, comision_cuerpos_colegiados_comision_id, docente_dc_codigo) VALUES (NULL, '$cargo', '$last_cuerpo', '$integrante');";
        $s = $pdo->prepare($sql);
        $s->execute();
      }
      catch (PDOException $e)
      {
        $error = 'Error al insertar actividades; ' . $e->getMessage();
        include '../error.html.php';
        exit();
      }
      $n++;
    } 
  }
  header('Location: cuerpos_colegiados.html.php');
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
  $pdf->SetTitle('Cuerpos_colegiados');
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
  <h1 align="center">Cuerpos colegiados</h1>
  <br>
  <table border="1" cellpadding="4">
    <thead>
      <tr>
        <th><b>Nombre</b></th>
        <th><b>Funciones</b></th>
      </tr>
    </thead>    
    <tbody>
  ';
  //Se agregan los datos
  foreach ($cuerpos as $cuerpo):
    $tbl .= '
      <tr>
        <td>' . ($cuerpo["nombre"]) . '</td>
        <td>' . nl2br($cuerpo["funciones"]) . '</td>
      </tr>';
  endforeach;
  //Cuando se termina de recorrer todo, se cierran el tbody y el table
  $tbl .= '</tbody></table>';
  $pdf->writeHTML($tbl, true, false, false, false, '');
  ob_end_clean();
  //Close and output PDF document
  $pdf->Output('Cuerpos_colegiados.pdf', 'D');
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
    <div id="left-section">
      <!-- Botón para abrir el modal de agregar cuerpo colegiado-->
      <a class="waves-effect waves-light btn #ef5350 red lighten-1 modal-trigger" href="#modalAddCuerpo"><i class="material-icons left">add</i>Agregar</a>
    </div>
    <center>
      <!-- Tabla con los cuerpo colegiados -->
      <table class="striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Funciones</th>
            <th>Ver</th>
            <th>Editar</th>
          </tr>
        </thead>    
          <tbody>
            <!-- Ciclo for para crear la tabla con los cuerpos colegiados -->
            <?php foreach ($cuerpos as $cuerpo): ?>
              <tr>
                <td><?php echo htmlspecialchars($cuerpo['nombre']); ?></td>
                <td><?php echo nl2br($cuerpo['funciones']); ?></td>
                <td>
                  <form action="ver_cuerpos_colegiados.html.php" method="post">
                    <input type="hidden" name="id" value="<?php echo $cuerpo['id']; ?>">
                    <button class="btn" type="submit" value="Ver">
                      Ver
                      <i class="material-icons left">zoom_in</i>
                    </button>
                  </form>
                </td>
                <td>
                  <form method="post" action="cuerpos_colegiados_edit.html.php">
                    <input type="hidden" name="id" value="<?php echo htmlspecialchars($cuerpo['id']); ?>">
                    <input type="hidden" name="nombre" value="<?php echo htmlspecialchars($cuerpo['nombre']); ?>">
                    <input type="hidden" name="funciones" value="<?php echo htmlspecialchars($cuerpo['funciones']); ?>">
                    <input type="hidden" name="select_unidad" value="<?php echo htmlspecialchars($cuerpo['unidad']); ?>">
                    <input type="hidden" name="select_area" value="<?php echo htmlspecialchars($cuerpo['area']); ?>">
                    <?php
                    //Recupera los integrantes del cuerpo colegiado seleccionado
                    $cuerpo_id = $cuerpo['id'];
                    $n = 0;
                    try
                    {
                      $sql = "SELECT dc_codigo, dc_nombres, cargo FROM integrantes_comision, docente WHERE comision_cuerpos_colegiados_comision_id = '$cuerpo_id' AND docente_dc_codigo = dc_codigo";
                      $result = $pdo->query($sql);
                    }
                    catch (PDOException $e)
                    {
                      $error = 'Error al recuperar id de minuta; ' . $e->getMessage();
                      include '../error.html.php';
                      exit();
                    }
                    //Crea un input oculto con los integrantes
                    while ($row = $result->fetch())
                    {
                      $n++;
                      ?>
                      <input type="hidden" name="<?php echo htmlspecialchars('docente_' . $n); ?>" value="<?php echo htmlspecialchars($row['dc_codigo']); ?>">
                      <input type="hidden" name="<?php echo htmlspecialchars('integrante_' . $n); ?>" value="<?php echo htmlspecialchars($row['dc_nombres']); ?>">
                      <input type="hidden" name="<?php echo htmlspecialchars('cargo_' . $n); ?>" value="<?php echo htmlspecialchars($row['cargo']); ?>">
                      <?php
                    }
                    ?>
                      <input type="hidden" name="number_integrantes" value="<?php echo htmlspecialchars($n); ?>">
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
   
    <!-- Modals -->
     <!-- Modal para agregar cuerpo colegiado -->
      <div id="modalAddCuerpo" class="modal">
        <div class="modal-content">
          <div id="left-section">
            <button class="waves-effect waves-light btn" name='close' id="closeAddCuerpo">
              <i class="material-icons">close</i>
            </button>
          </div>
          <h5>Agregar cuerpo colegiado</h5>
          <form class="col s12" action="?" method="post">
            <!--Lectura del nombre del cuerpo colegiado-->
            <div class="row">
              <div class="input-field col s12">
                <input id="input_text" type="text" data-length="200" name='nombre_cuerpo' required>
                <label for="input_text">Nombre del cuerpo colegiado</label>
              </div>
            </div>
            <!--Lectura de las funciones-->
            <div class='row'>
              <div class="input-field col s12">
                <textarea id="textarea1" name="funciones" class="materialize-textarea" required></textarea>
                <label for="textarea1">Funciones</label>
              </div>
            </div>
            <!--Agregar integrantes-->
            <div class="row">
              <p>Integrantes</p>
              <ul class="collapsible" id="collapsible_father">
                <li id="li_0"></li>
                <!--Aquí se agregan los integrantes-->
              </ul>
            </div>
            <div class="row">
              <div id="left-section">
                <button class="waves-effect waves-light btn modal-trigger" href="#modalAddInte">
                  Agregar integrante
                  <i class="material-icons left">person_add</i>
                </button>
              </div>
            </div>
            <!--Selecciona unidad académica-->
            <label>Unidad académica</label>
            <div class="input-field col s12">
              <select name="select_unidad" required>
                <option value="" disabled selected>Selecciona una unidad académica</option>
                <?php foreach ($unidades as $unidad): ?>
                  <option value="<?php echo htmlspecialchars($unidad['id']); ?>"><?php echo htmlspecialchars($unidad['nombre']); ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <!--Selecciona área académica-->
            <label>Área académica</label>
            <div class="input-field col s12">
              <select name="select_area" required>
                <option value="" disabled selected>Selecciona una área académica</option>
                <?php foreach ($areas as $area): ?>
                  <option value="<?php echo htmlspecialchars($area['id']); ?>"><?php echo htmlspecialchars($area['nombre']); ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <button type='submit' name='Registrar' class='indigo btn'>
              Agregar el cuerpo colegiado
              <i class="material-icons left">save</i>
            </button>
          </form>
        </div>
      </div>
      <!-- Modal para agregar integrante al cuerpo colegiado usuario-->
      <div id="modalAddInte" class="modal bottom-sheet">
        <div class="modal-content">
          <div class="input-field col s12">
            <select id="select_integrante">
              <option value="" disabled selected>Selecciona un docente</option>
              <?php foreach ($docentes as $docente): ?>
                  <option id="option_docente<?php echo htmlspecialchars($docente['id']); ?>" value="<?php echo htmlspecialchars($docente['id']); ?>"><?php echo htmlspecialchars($docente['nombres']); ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <label>Cargo</label>
            <p>
              <input name="group1" type="radio" id="integrante" value="Integrante" checked />
              <label for="integrante">Integrante</label>
            </p>
            <p>
              <input name="group1" type="radio" id="responsable" value="Responsable" />
              <label for="responsable">Responsable</label>
            </p>
            <p>
              <input name="group1" type="radio" id="secretario" value="Secretario"  />
              <label for="secretario">Secretario</label>
            </p>
            <button id="add_integrante" value="Inicia" class='col s12 btn btn-large waves-effect indigo'>Agregar
              <i class="material-icons left">add</i>
            </button>
            <div id="left-section">
              <button class="waves-effect waves-light btn" name='close' id="closeAddInte">
                <i class="material-icons">close</i>
              </button>
            </div>
          <?php foreach ($docentes as $docente): ?>
            <div class="section"></div>
          <?php endforeach; ?>
        </div>
      </div>
      
  </main>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
  <script type="text/javascript" src="../js/script_time.js"></script>
  <script type="text/javascript" src="../js/script_date.js"></script>
  <script type="text/javascript" src="../js/script_select_multiple.js"></script>
  <script type="text/javascript" src="../js/script_modal.js"></script>
  <script>
    var num = 0;

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
    //Agrega integrante
    $('#add_integrante').click(function()
    {
        num = num + 1;
        //Se tomae el valor del select integrante   
        var inte = document.getElementById("select_integrante").value;
        var inte_nombre = document.getElementById("option_docente" + inte).innerText;
        var cargo = document.querySelector('input[name = "group1"]:checked').value;
        //Toma el li a para crear otro delante de él
        var ul = document.getElementById("collapsible_father");
        var li = document.createElement("li");
        li.setAttribute("id", "li_" + num);
        ul.appendChild(li);

        var div = document.createElement("div");
        div.appendChild(document.createTextNode(inte_nombre));
        div.setAttribute("class", "collapsible-header");
        li.appendChild(div);
        //Crea un input para el formulario
        var nombre = document.createElement("input");
        nombre.setAttribute("name", "integrante_" + num);
        nombre.setAttribute("value", inte);
        nombre.setAttribute("type", "hidden");
        div.appendChild(nombre);

        var div2 = document.createElement("div");
        div2.setAttribute("class", "collapsible-body");
        li.appendChild(div2);

        var span = document.createElement("span");
        span.appendChild(document.createTextNode(cargo));
        div2.appendChild(span);

        var divSection2 = document.createElement("div");
        divSection2.setAttribute("class", "section");
        div2.appendChild(divSection2);

        var span_input = document.createElement("input");
        span_input.setAttribute("name", "cargo_" + num);
        span_input.setAttribute("value", cargo);
        span_input.setAttribute("type", "hidden");
        span.appendChild(span_input);

        var div_lefth = document.createElement("div");
        div2.appendChild(div_lefth);
        //Busca la opción que se seleccionó y la borra
        disable = document.getElementsByClassName("active selected");
        disable[0].parentNode.removeChild(disable[0]);
        var x = document.getElementById("select_integrante");
        var xr = document.getElementById("select_integrante").selectedIndex;
        x.options.remove(xr);
        //Reinicializael select
        $("#select_integrante").material_select();
        //Cierra el modal
        $('#modalAddInte').modal('close');
      }
    );
  </script>
</body>

</html>