<?php include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();


if(isset($_POST['grabar'])){
  $Nota       =   $_POST['Nota'];
  $picking    =   $_POST['picking'];
  $revision   =   $_POST['revision'];
  $embalaje   =   $_POST['embalaje']; 
  $fallo      =   $_POST['falla'];
  $fecha      =   $_POST['fecha'];
  $hora       =   $_POST['hora'];

$exito = false;
try {
  // calling stored procedure command
  $sql = 'CALL registro_preparacion(:_fecha,:_hora,:_picking,:_revision,:_embalaje,:_fallo,:_id)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':_fecha', $fecha, PDO::PARAM_STR);
  $stmt->bindParam(':_hora', $hora, PDO::PARAM_INT);
  $stmt->bindParam(':_picking', $picking, PDO::PARAM_INT);
  $stmt->bindParam(':_revision', $revision, PDO::PARAM_INT);
  $stmt->bindParam(':_embalaje', $embalaje, PDO::PARAM_INT);
  $stmt->bindParam(':_fallo', $fallo, PDO::PARAM_INT);
  $stmt->bindParam(':_id', $Nota, PDO::PARAM_INT);

  // execute the stored procedure
  $stmt->execute();
  $exito = true;
  } catch (PDOException $ex) {
    echo $ex->getMessage();
  }

  if ($exito == true ) {
    echo '<meta http-equiv="refresh" content="2; url=registroPikingBuscador.php">';
    echo 'REGISTRO CON EXITO!.';
  }else {
    echo '<meta http-equiv="refresh" content="2; url=registroPikingBuscador.php">';
    echo 'NO SE REALIZO EL INGRESO!.';
  }
  
}
date_default_timezone_set("America/La_Paz");
$pedido     =       $db->query("CALL preparacionxid({$_POST['nronota']})")->fetchAll();

if (count($pedido)>0) {
  foreach ($pedido as $row) {
    if ($row['estado']=='CERRADO') {
      echo '<meta http-equiv="refresh" content="2; url=registroPikingBuscador.php">';
    echo 'NOTA YA REGISTRADA!.';
    exit;
    }
  }


  
    $personal   =       $db->query("CALL lista_personal_almacen()")->fetchAll();
    $fallos     =       $db->query("CALL lista_fallo()")->fetchAll();
    // and somewhere later:
    foreach ($pedido as $row) {
  ?>


<div class="card" style="width: 30rem; margin: 20px;">
<h5 class="card-header card-sucess">Registro de Preparacion</h5>
        <form method="POST" action="">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Nro Nota</label>
                    <input type="text" class="form-control" value="<?php echo $row['Nota']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-4">
                    <label>Nro Factura</label>
                    <input type="text" class="form-control" value="<?php echo $row['Factura']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-4">
                    <label>Fecha</label>
                    <input type="date" class="form-control" value="<?php echo $row['Fecha']; ?>" disabled="true">
                </div>
            </div>
            <div class="form-group col-md-8">
                <label>Armador</label>
                <select name="picking" class="form-control">
                    <option selected>Selecione un Personal</option>
                    <?php 
        foreach ($personal as $persona) {
      ?>
                    <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?>
                    </option>
                    <?php 
        }
        ?>
                </select>
            </div>
            <div class="form-group col-md-8">
                <label>Revisador</label>
                <select name="revision" class="form-control">
                    <option selected>Selecione un Personal</option>
                    <?php 
        foreach ($personal as $persona) {
      ?> <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option>
                        <?php 
        }
        ?>
                </select>
            </div>
            <div class="form-group col-md-8">
                <label>Embalador</label>
                <select name="embalaje" class="form-control">
                    <option selected>Selecione un Personal</option>
                    <?php 
        foreach ($personal as $persona) {
      ?>
                    <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?>
                    </option>
                    <?php 
        }
        ?>
                </select>
            </div>
            <div class="form-group col-md-8">
                <label>Tipo de Falla</label>
                <select name="falla" class="form-control">
                    <option selected>Selecione un Personal</option>
                    <?php 
        foreach ($fallos as $fallo) {
      ?>
                    <option value="<?php echo $fallo['idfallo']; ?>"><?php echo $fallo['nombre']; ?></option>
                    <?php 
        }
        ?>
                </select>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Fecha Actual</label>
                    <input name="fecha" type="date" class="form-control" value="<?php echo date("Y-m-d");?>">
                </div>
                <div class="form-group col-md-6">
                    <label>Hora</label>
                    <input name="hora" type="time" class="form-control" value="<?php echo date('H:i'); ?>">
                </div>
            </div>
            <input type="hidden" name="Nota" value="<?php echo $row['Nota']; ?>">
            <input type="hidden" name="grabar" value="grabar">
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>
    <?php
} //FIN DEL IF DEL FOREACH DE PRINCIPAL
} //fin del if validar si existe consulta mysql
else{
  echo '<meta http-equiv="refresh" content="2; url=registroPikingBuscador.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}

?>

      <!-- End of Main Content -->
  <?php  include '../includes/footer.php';
  $database->closeConnection();
  $db=null;
  ?>   
