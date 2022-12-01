<?php
//Si no está con una sesión, se manda a login
session_start();
if (!isset($_SESSION['username']))
{
  header('Location: ../login.html.php');
  exit();
}

//Consulta para recuperar los cuerpos colegiados
try
{
  include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
  $sql = 'SELECT comision_id, c_nombre, c_funciones FROM comision_cuerpos_colegiados;';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los cuerpos colegiados; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena el arreglo cuerpos con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $cuerpos[] = array('id' => $row['comision_id'], 'nombre' => $row['c_nombre'], 'funciones' => $row['c_funciones']);
}
if(!isset($cuerpos))
{
  $cuerpos[] = array('id' => "No hay", 'nombre' => "No hay", 'funciones' => "No hay");
}

//Consulta para recuperar los programas académicos
try
{
  $sql = 'SELECT ctpa_id, ctpa_nombre FROM cat_prog_acad;';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los programas académicos; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena el arreglo programas con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $programas[] = array('id' => $row['ctpa_id'], 'nombre' => $row['ctpa_nombre']);
}
if(!isset($programas))
{
  $programas[] = array('id' => "No hay", 'nombre' => "No hay");
}

//Consulta para recuperar los docentes para marcar los asistentes
try
{
  $sql = 'SELECT DISTINCT dc_codigo, dc_nombres FROM docente;';
  $result = $pdo->query($sql);
}
catch (PDOException $e)
{
  $error = 'Error al recuperar los docentes; ' . $e->getMessage();
  include '../error.html.php';
  exit();
}
//Se llena el arreglo docentes con lo recuperado de la consulta
while ($row = $result->fetch())
{
  $docentes[] = array('id' => $row['dc_codigo'], 'nombres' => $row['dc_nombres']);
}
    
//Toma la hora
date_default_timezone_set("America/Chihuahua");
$t = time();
$t = date("G:i", $t);
//Toma el día
$d = date("j F, Y");
?>

<!DOCTYPE html>

<head>
<title>Crear minuta</title>
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
      <a href="#" class="brand-logo">Usuario</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../user.html.php">Panel de control</a></li>
        <li><a href="perfil.html.php">Perfil</a></li>
        <li class="active"><a href="crear_minuta.html.php">Crear minutas</a></li>
        <li><a href="../logout.html.php">Cerrar sesión</a></li>
      </ul>
    </div>
  </nav>
  <main>
    <center>
      <?php
        //Se guarda la minuta si todos los datos son correctos, sino se muestra que no se puede
        if (isset($_POST['Action']) and $_POST['Action']=='Registrar')
        {
          $time = $_POST['time'];
          $time = $time . ":00"; //Se tranforma la hora para la base de base de datos
          $date = date("Y-m-d", strtotime($_POST['date']));//Se transforma la fecha para la base de datos
          $dateTime = $date . " " . $time;
          $cuerpo = $_POST['cuerpo_colegiado'];
          $programa = $_POST['programa_academico'];
          $lugar = $_POST['lugar'];
          $asunto = $_POST['asunto'];
          $orden = $_POST['orden_del_dia'];

          if($cuerpo != "No hay" && $programa != "No hay")
          {
            //Toma todas los acuerdos que puedan estar
            $na = 1;
            if(isset($_POST['acuerdo_' . $na]))
            {
              $acuerdos = "";
              while (isset($_POST['acuerdo_' . $na]))
              {
                $acuerdos = $acuerdos . $_POST['acuerdo_' . $na] . "
";
                  $na++;
              }
            }
            //Ver asistentes
            if(isset($_POST['asistentes']))
            {
              $asistentes = $_POST['asistentes'];
              //Ciclo para recuperar los asistentes del formulario
              $asist = "";
              foreach ($asistentes as $asistente)
              {
                $asist = $asist . $asistente . ", ";
              }
            }
            else
            {
              $asist = "No hay asistentes :(";
            }
            //Query para guardar minutas
            if(isset($acuerdos))
            {
              try
              {
                $sql = "INSERT INTO minutas (id_minutas, create_at, update_at, fecha, hora_inicio, hora_fin, lugar, orden_del_dia, acuerdos, asunto, minutas_comision_cuerpos_colegiados_comision_id, cat_prog_acad_ctpa_id, asistentes) VALUES (NULL, '$dateTime', CURRENT_TIMESTAMP, '$date', '$time', CURRENT_TIMESTAMP, '$lugar', '$orden', '$acuerdos', '$asunto', '$cuerpo', '$programa', '$asist');";
                $s = $pdo->prepare($sql);
                $s->execute();
              }
              catch (PDOException $e)
              {
                $error = 'Error al insetar la minuta; ' . $e->getMessage();
                include '../error.html.php';
                exit();
              }  
            }
            else
            {
              try
              {
                $sql = "INSERT INTO minutas (id_minutas, create_at, update_at, fecha, hora_inicio, hora_fin, lugar, orden_del_dia, acuerdos, asunto, minutas_comision_cuerpos_colegiados_comision_id, cat_prog_acad_ctpa_id, asistentes) VALUES (NULL, '$dateTime', CURRENT_TIMESTAMP, '$date', '$time', CURRENT_TIMESTAMP, '$lugar', '$orden', NULL, '$asunto', '$cuerpo', '$programa', '$asist');";
                $s = $pdo->prepare($sql);
                $s->execute();
              }
              catch (PDOException $e)
              {
                $error = 'Error al insetar minuta; ' . $e->getMessage();
                include '../error.html.php';
                exit();
              } 
            }
            //Toma todas las actividades que puedan estar
            $n = 1;
            if(isset($_POST['actividad_' . $n]))
            {
              //Consulta para tener el id de la última minuta
              try
              {
                $sql = "SELECT id_minutas FROM minutas ORDER BY id_minutas DESC LIMIT 1";
                $result = $pdo->query($sql);
              }
              catch (PDOException $e)
              {
                $error = 'Error al recuperar id de minuta; ' . $e->getMessage();
                include '../error.html.php';
                exit();
              }
              //Guarda el id de la minuta en una variable pra la insertarlo en las actividades
              while ($row = $result->fetch())
              {
                $id_minuta = $row['id_minutas'];
              }
              //Se consiguen las actividades con su reponasable en un ciclo
              while (isset($_POST['actividad_' . $n]))
              {
                $actividad = $_POST['actividad_' . $n];
                $responable = $_POST['responsable_' . $n];
                //Para guardar minutas
                try
                {
                  $sql = "INSERT INTO actividad (id_actividad, actividades, docente_dc_codigo, minutas_id_minutas) VALUES (NULL, '$actividad', '$responable', '$id_minuta');";
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
            header('Location: perfil.html.php');
          }
          else
          {
            ?>
              <h5 class="red-text">No se puede agregar la minuta si no hay un cuerpo colegiado o un programa académico.</h5>
            <?php
          }
        }
      ?>
      <!---->
      <div class="section"></div>
      <h5>Crear minuta</h5>
      <div class="section"></div>
      <div class="container">
        <div class="#eeeeee grey lighten-3 row" style="display: inline-block; padding: 1px 32px 32px 32px; border: 1px solid #EEE;">
          <div class="section"></div>
          <form class="col s12" action="" method="post">
            <!--Lectura de la hora de inicio-->
            <div class="row">
              <div class="input-field col s12">
                <input type="text" class="timepicker" name="time" value="<?php echo htmlspecialchars($t); ?>" required>
                <label for="input_text">Hora de inicio</label>
              </div>
            </div>
            <!--Lectura de la fecha-->
            <div class="row">
              <div class="input-field col s12">
                <input type="text" class="datepicker" name="date" value="<?php echo htmlspecialchars($d); ?>" required>
                <label for="input_text">Fecha</label>
              </div>
            </div>
            <!--Lectura de cuerpo colegiado-->
            <div class="input-field col s12">
              <select name="cuerpo_colegiado">
                <?php foreach ($cuerpos as $cuerpo): ?>
                  <option value="<?php echo htmlspecialchars($cuerpo['id']); ?>"><?php echo htmlspecialchars($cuerpo['nombre']); ?></option>
                <?php endforeach; ?>
              </select>
              <label>Cuerpo colegiado</label>
            </div>
            <!--Lectura de programa académico-->
            <div class="input-field col s12">
              <select name="programa_academico">
                <?php foreach ($programas as $programa): ?>
                  <option value="<?php echo htmlspecialchars($programa['id']); ?>"><?php echo htmlspecialchars($programa['nombre']); ?></option>
                <?php endforeach; ?>
              </select>
              <label>Programa académico</label>
            </div>  
            <!--Lectura del lugar-->
            <div class="row">
              <div class="input-field col s12">
                <input id="text-lugar" name="lugar" type="text" data-length="50" required>
                <label for="input_text">Lugar</label>
              </div>
            </div>
            <!--Lectura de los asistentes-->
            <div class="input-field col s12">
              <select name="asistentes[]" multiple required>
                <option value="" disabled selected>Selecciona asistentes</option>
                <?php foreach ($docentes as $docente): ?>
                  <option value="<?php echo htmlspecialchars($docente['nombres']); ?>"><?php echo htmlspecialchars($docente['nombres']); ?></option>
                <?php endforeach; ?>
              </select>
              <label>Asistentes</label>
            </div>
            <!--Lectura del asunto-->
            <div class="row">
              <div class="row">
                <div class="input-field col s12">
                  <textarea id="textarea-asunto" name="asunto" class="materialize-textarea" required></textarea>
                  <label for="textarea1">Asunto</label>
                </div>
              </div>
            </div>
            <!--Lectura del orden del día-->
            <div class="row">
              <div class="row">
                <div class="input-field col s12">
                  <textarea id="textarea-ordenDia" name="orden_del_dia" class="materialize-textarea" required></textarea>
                  <label for="textarea1">Orden del día</label>
                </div>
              </div>
            </div>
            <!--Lectura de las actividades-->
            <p>Actividades</p>
            <ul class="collapsible" id="ul"></ul>
            <!-- Aquí se agregan los integrantes-->
            <a class="waves-effect waves-light btn modal-trigger" href="#modalAddActividad"><i class="material-icons left">add</i>Agregar actividad</a>
            <div class="section"></div>
            <!--Lectura de acuerdos-->
            <p>Acuerdos</p>
            <div id="acuerdos"></div>
            <!-- Aquí se agregan los acuerdos -->
            <div class="input-field col s12">
              <a class="waves-effect waves-light btn modal-trigger" href="#modalAddAcuerdos"><i class="material-icons left">add</i>Agregar acuerdos</a>
              <div class="section"></div>
            </div>
            <button type='submit' name='Action' value="Registrar" class='col s12 #1a237e indigo darken-1 btn-large waves-effect'>
              Registrar minuta
              <i class="material-icons left">save</i>
            </button>
          </form>
        </div>
      </div>
      <div class="row">
        <a class="waves-effect waves-light btn-large" href="perfil.html.php"><i class="material-icons left">arrow_back</i>Cancelar</a>
      </div>
    </center>

      <!-- Modals -->
      <!-- Modal para agregar responsables de la actividad-->
      <div id="modalAddActividad" class="modal">
        <div class="modal-content" id="modal_actividad">
          <!--Lectura de Responsable-->
            <div class="input-field col s12" id="responsable1">
              <div id="div_options0">
                <select id="select_responsable0">
                  <?php foreach ($docentes as $docente): ?>
                    <option id="option_responsable<?php echo htmlspecialchars($docente['id']); ?>" value="<?php echo htmlspecialchars($docente['id']); ?>"><?php echo htmlspecialchars($docente['nombres']); ?></option>
                  <?php endforeach; ?>
                </select>
                <label>Responsable</label>
              </div>
            </div>
            <!--Lectura de actividades-->
            <div class="row">
              <div class="input-field col s12">
                <input id="text_actividad" type="text" data-length="500" required>
                <label for="input_text">Actividades</label>
              </div>
            </div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="section"></div>
            <div class="input-field col s12">
            <button id="add_actividad" class='col s12 #1a237e indigo darken-1 btn-large waves-effect'>
              Agregar a minuta
              <i class="material-icons left">add</i>
            </button>
          </div>
        </div>
      </div>

      <!-- Modal para agregar acuerdos a la minuta-->
      <div id="modalAddAcuerdos" class="modal">
        <div class="modal-content" id="modal_actividad">
            <div class="row">
              <div class="input-field col s12">
                <textarea id="textarea_acuerdo" class="materialize-textarea"></textarea>
                <label>Acuerdo</label>
              </div>
            </div>
            <button id="add_acuerdo" class='col s12 #1a237e indigo darken-1 btn-large waves-effect'>
              Agregar a minuta
              <i class="material-icons left">add</i>
            </button>
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
    var numResp = 0;
    var numAcue = 0;

    $('#closeSendMinutas').click(function(){
        $('#modalSendMinutas').modal('close');
    });

    //Agregar integrante
    $('#add_actividad').click(function()
      {
        num = num + 1;

        var resp = document.getElementById("select_responsable0").value;
        var resp_nombre = document.getElementById("option_responsable" + resp).innerText;
        var acti = document.getElementById("text_actividad").value;

        var ul = document.getElementById("ul");
        var li = document.createElement("li");
        li.setAttribute("id", "li_" + num);
        ul.appendChild(li);

        var div = document.createElement("div");
        div.appendChild(document.createTextNode(acti));
        div.setAttribute("class", "collapsible-header");
        li.appendChild(div);

        var div_input = document.createElement("input");
        div_input.setAttribute("name", "actividad_" + num);
        div_input.setAttribute("value", acti);
        div_input.setAttribute("type", "hidden");
        li.appendChild(div_input);

        var div2 = document.createElement("div");
        div2.setAttribute("class", "collapsible-body"); // added line
        li.appendChild(div2);

        var la = document.createElement("label");
        la.appendChild(document.createTextNode("Responsable"));
        div2.appendChild(la);

        var divSection = document.createElement("div");
        divSection.setAttribute("class", "section");
        div2.appendChild(divSection);

        var span = document.createElement("span");
        span.appendChild(document.createTextNode(resp_nombre));
        div2.appendChild(span);

        var span_input = document.createElement("input");
        span_input.setAttribute("name", "responsable_" + num);
        span_input.setAttribute("value", resp);
        span_input.setAttribute("type", "hidden");
        span.appendChild(span_input);

        var divSection2 = document.createElement("div");
        divSection2.setAttribute("class", "section");
        div2.appendChild(divSection2);
        var div_lefth = document.createElement("div");
        div2.appendChild(div_lefth);

        $('#modalAddActividad').modal('close');
      }
    );
    //Agrega integrante
    $('#add_integrante').click(function()
      {
        numResp = numResp + 1;

        var selectHtml = document.getElementById("select_responsable0").innerHTML;
        var div_responsable = document.getElementById("responsable1");
        var div_Optons = document.getElementById("div_options0");

        var select = document.createElement("select");
        select.setAttribute("id", "select_responsable" + numResp);
        select.setAttribute("class", "select-wrapper");
        select.innerHTML = selectHtml;
        div_Optons.appendChild(select);
      }
    );
    //Agrega acuerdo
    $('#add_acuerdo').click(function()
      {
        numAcue = numAcue + 1;

        var text_acuerdo = document.getElementById("textarea_acuerdo").value;
        var div_acuerdos = document.getElementById("acuerdos");
        
        var div_acuerdo = document.createElement("div");
        div_acuerdo.setAttribute("id", "acuerdo" + numAcue);
        div_acuerdo.setAttribute("class", "input-field col s12");
        div_acuerdos.appendChild(div_acuerdo);

        var acuerdo = document.createElement("textarea");
        acuerdo.setAttribute("class", "materialize-textarea");
        acuerdo.setAttribute("name", "acuerdo_" + numAcue);
        acuerdo.appendChild(document.createTextNode(text_acuerdo));
        div_acuerdo.appendChild(acuerdo);

        $('#modalAddAcuerdos').modal('close');
      }
    );
  </script>
</body>

</html>