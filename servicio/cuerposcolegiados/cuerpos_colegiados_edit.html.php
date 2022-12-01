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

//Consulta para recuperar los docentes para marcar los asistentes
try
  {
    include $_SERVER['DOCUMENT_ROOT'] . '\includes\db.inc.php';
    $sql = "SELECT dc_codigo, dc_nombres FROM docente";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar los docentes para marcar los asistentes; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }

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
    $error = 'Error al recuperar las unidades acádemicas; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  while ($row = $result->fetch())
  {
    $unidades[] = array('id' => $row['ctua_id'], 'nombre' => $row['ctua_nombre']);
  }
  //Consulta para recuperar las áreas acádemicas para desplegarlas en el select de agregar cuerpo colegiado
  try
  {
    $sql = "SELECT ctaa_id, ctaa_nombre FROM cat_area_aca;";
    $result = $pdo->query($sql);
  }
  catch (PDOException $e)
  {
    $error = 'Error al recuperar las áreas acádemicas; ' . $e->getMessage();
    include '../error.html.php';
    exit();
  }
  while ($row = $result->fetch())
  {
    $areas[] = array('id' => $row['ctaa_id'], 'nombre' => $row['ctaa_nombre']);
  }

  //Edita el cuerpo colegiado
  if (isset($_POST['Action']) and $_POST['Action']=='Guardar')
  {
      $id = $_POST['id'];
      $nombre = $_POST['nombre'];
      $funciones = $_POST['funciones'];
      $unidad = $_POST['select_unidad'];
      $area = $_POST['select_area'];

      //Toma día y hora para el update
      //Zona horaria
      date_default_timezone_set("America/Chihuahua");
      //Hora
      $t = time();
      $t = date("G:i:s", $t);
      //Toma el día
      $d = date("Y-m-d");
      $fecha_hora = $d . " " . $t;

      //Actualiza el cuerpo colegiado
      try
      {
        $sql = "UPDATE comision_cuerpos_colegiados SET c_nombre = '$nombre', `c_funciones` = '$funciones', `updated_at` = '$fecha_hora', `cat_unid_acade_ctua_id` = '$unidad', `cat_area_aca_ctaa_id` = '$area' WHERE `comision_cuerpos_colegiados`.`comision_id` = $id;";
        $s = $pdo->prepare($sql);
        $s->execute();
      }
      catch (PDOException $e)
      {
        $error = 'Error al insertar cuerpo colegiado; ' . $e->getMessage();
        include '../error.html.php';
        exit();
      }

      //Ve si se borra un integrante
      $i = $_POST['number_integrantes'];
      while ($i > 0)
      {
        if (isset($_POST['erase_' . $i]))
        {
          $docente_id = $_POST['docente_' . $i];
          //Borra el integrantes seleccionado
          try
          {
            $sql = "DELETE FROM integrantes_comision WHERE docente_dc_codigo = '$docente_id' AND comision_cuerpos_colegiados_comision_id = $id LIMIT 1;";
            $s = $pdo->prepare($sql);
            $s->execute();
          }
          catch (PDOException $e)
          {
            $error = 'Error al borrar integrante del cuerpo colegiado; ' . $e->getMessage();
            include '../error.html.php';
            exit();
          }
        }
        $i--;
      }

      //Toma todos los integrantes que puedan estar para agregarlos a integrantes_comision
      $n = 1;
      if(isset($_POST['integrante_nuevo_' . $n]))
      {
        //Se consiguen los integrantes del cuerpo colegiado en un ciclo
        while (isset($_POST['integrante_nuevo_' . $n]))
        {
          $integrante = $_POST['integrante_nuevo_' . $n];
          $cargo = $_POST['cargo_' . $n];
          //Para guardar minutas
          try
          {
            $sql = "INSERT INTO integrantes_comision (idintegrantes_comision, cargo, comision_cuerpos_colegiados_comision_id, docente_dc_codigo) VALUES (NULL, '$cargo', '$id', '$integrante');";
            $s = $pdo->prepare($sql);
            $s->execute();
          }
          catch (PDOException $e)
          {
            $error = 'Error al insertar integrantes; ' . $e->getMessage();
            include '../error.html.php';
            exit();
          }
          $n++;
        } 
      }
    header('Location: cuerpos_colegiados.html.php'); 
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
    <center>
      <!---->
      <div class="section"></div>
      <h5>Editar cuerpo colegiado</h5>
      <div class="section"></div>
      <div class="container">
        <div class="#eeeeee grey lighten-3 row" style="display: inline-block; padding: 1px 32px 32px 32px; border: 1px solid #EEE;">
          <div class="section"></div>
          <form class="col s12" action="" method="post">
            <!--Lectura del nombre del cuerpo colegiado-->
            <div class="row">
              <div class="input-field col s12">
                <input type="hidden" name="id" value="<?php echo htmlspecialchars($_POST['id']); ?>">
                <input id="input_text1" name="nombre" type="text" data-length="50" value="<?php echo htmlspecialchars($_POST['nombre']); ?>" required>
                <label for="input_text1">Nombre del cuerpo colegiado</label>
              </div>
            </div>
            <!--Lectura de las funciones del cuerpo colegiado-->
            <div class="row">
              <div class="input-field col s12">
                <textarea id="textarea1" name="funciones" class="materialize-textarea" required><?php echo htmlspecialchars($_POST['funciones']); ?></textarea>
                <label for="textarea1">Funciones</label>
              </div>
            </div>
            <!--Toma los integrantes y sus cargos-->
            <label>Integrantes</label>
            <div class="row">
              <ul class="collapsible" id="collapsible_father">
              <li id="li_0"></li>
              <!-- Aquí aparecen los usuarios que estén el cuerpo colegiados y aquí también agregan-->
                <?php
                  $n = 1;
                  while (isset($_POST['integrante_' . $n]))
                  {
                    ?>
                    <!--Lectura de las funciones del cuerpo colegiado-->
                    <li id="<?php echo htmlspecialchars('li_' . $n); ?>">
                      <div class="collapsible-header">
                        <input type="hidden" id="input_text2" name="<?php echo htmlspecialchars('integrante_' . $n); ?>" type="text" data-length="50" value="<?php echo htmlspecialchars($_POST['integrante_' . $n]); ?>" required>
                        <?php echo htmlspecialchars($_POST['integrante_' . $n]); ?>
                      </div>
                      <div class="collapsible-body">
                        <p><?php echo htmlspecialchars($_POST['cargo_' . $n]); ?></p>
                        <p>
                          <input type="checkbox" id="<?php echo htmlspecialchars("check_" . $n); ?>" name="<?php echo htmlspecialchars("erase_" . $n); ?>" />
                          <label for="<?php echo htmlspecialchars("check_" . $n); ?>">Quitar a este docente</label>
                          <input type="hidden" name="<?php echo htmlspecialchars('docente_' . $n); ?>" value="<?php echo htmlspecialchars($_POST['docente_' . $n]); ?>">
                        </p>
                      </div>
                    </li>
                    <?php
                      $n++;
                  }
                  ?>
                </ul>
                <input type="hidden" name="number_integrantes" value="<?php echo htmlspecialchars($_POST['number_integrantes']); ?>">
              </div>
              <!--Agregar integrantes-->
              <div class="row">
                <div id="left-section">
                  <button class="waves-effect waves-light btn modal-trigger" href="#modalAddInte">
                    Agregar integrante
                    <i class="material-icons left">person_add</i>
                  </button>
                </div>
              </div>
              <!--Selecciona unidad académica-->
              <div class="row">
                <label>Unidad académica</label>
                <div class="input-field col s12">
                  <select name="select_unidad" required>
                    <?php foreach ($unidades as $unidad): ?>
                      <option value="<?php echo htmlspecialchars($unidad['id']); ?>"
                      <?php
                        if ($unidad['id'] == $_POST['select_unidad'])
                        {
                          ?>selected <?php
                        }
                      ?>
                      ><?php echo htmlspecialchars($unidad['nombre']); ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <!--Selecciona área académica-->
              <div class="row">
                <label>Área académica</label>
                <div class="input-field col s12">
                  <select name="select_area" required>
                    <?php foreach ($areas as $area): ?>
                      <option value="<?php echo htmlspecialchars($area['id']); ?>"
                        <?php
                          if ($area['id'] == $_POST['select_area'])
                          {
                            ?>selected <?php
                          }
                        ?>
                        ><?php echo htmlspecialchars($area['nombre']); ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
            <button type='submit' name='Action' value="Guardar" class='col s12 #ef5350 red lighten-1 btn-large waves-effect'>
              Guardar cambios
              <i class="material-icons left">save</i>
            </button>
          </form>
        </div>
      </div>
      <div class="row">
        <a class="waves-effect waves-light btn-large" href="cuerpos_colegiados.html.php"><i class="material-icons left">arrow_back</i>Cancelar</a>
      </div>
    </center>

    <!-- Modals -->
      <!-- Modal para agregar integrante al cuerpo colegiado usuario-->
      <div id="modalAddInte" class="modal bottom-sheet">
        <div class="modal-content">
          <div class="input-field col s12">
            <select id="select_integrante">
              <option value="" disabled selected>Selecciona un docente</option>
              <?php foreach ($docentes as $docente):
                $i = 1;
                $no_write = false;
                while (isset($_POST['docente_' . $i]))
                {
                  if($docente['id'] == $_POST['docente_' . $i])
                  {
                    $no_write = true;
                  }
                  $i++;
                }
                if(!$no_write)
                {
                  ?>
                    <option id="option_docente<?php echo htmlspecialchars($docente['id']); ?>" value="<?php echo htmlspecialchars($docente['id']); ?>"> <?php echo htmlspecialchars($docente['nombres']); ?></option>
                  <?php  
                }
                ?>
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
    $('#closeAddInte').click(function(){
        $('#modalAddInte').modal('close');
    });

    //Agrega integrante
    $('#add_integrante').click(function()
      {
        num = num + 1;
       
        var inte = document.getElementById("select_integrante").value;
        var inte_nombre = document.getElementById("option_docente" + inte).innerText;
        var cargo = document.querySelector('input[name = "group1"]:checked').value;

        var ul = document.getElementById("collapsible_father");
        var li = document.createElement("li");
        li.setAttribute("id", "li_" + num);
        ul.appendChild(li);

        var div = document.createElement("div");
        div.appendChild(document.createTextNode(inte_nombre));
        div.setAttribute("class", "collapsible-header");
        li.appendChild(div);

        var nombre = document.createElement("input");
        nombre.setAttribute("name", "integrante_nuevo_" + num);
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

        disable = document.getElementsByClassName("active selected");
        disable[0].parentNode.removeChild(disable[0]);
        var x = document.getElementById("select_integrante");
        var xr = document.getElementById("select_integrante").selectedIndex;
        x.options.remove(xr);

        $("#select_integrante").material_select();

        $('#modalAddInte').modal('close');
      }
    );
  </script>
</body>

</html>