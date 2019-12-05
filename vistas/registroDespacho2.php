<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

if(isset($_POST['grabar'])){
  $Nota     =   $_POST['Nota'];
  $cobrador =   $_POST['cobrador'];
  $fecha    =   $_POST['fecha'];
  $hora     =   $_POST['hora'];

  $exito = false;
try {
  $sql = 'CALL registro_despacho(:fecha,:hora,:despachador,:id)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);
  $stmt->bindParam(':hora', $hora, PDO::PARAM_STR);
  $stmt->bindParam(':despachador', $cobrador, PDO::PARAM_INT);
  $stmt->bindParam(':id', $Nota, PDO::PARAM_INT);

  // execute the stored procedure
  $stmt->execute();
  $exito = true;
  } catch (PDOException $ex) {
    echo $ex->getMessage();
  }
  if ($exito == true ) {
    echo '<meta http-equiv="refresh" content="2; url=registroDespachoBuscador.php">';
    echo 'REGISTRO CON EXITO!.';
    exit();
  }else {
    echo '<meta http-equiv="refresh" content="2; url=registroDespachoBuscador.php">';
    echo 'NO SE REALIZO EL INGRESO!.';
    exit();
  }
}
  date_default_timezone_set("America/La_Paz");

$pedido     =       $db->query("CALL despachoxid({$_POST['nronota']})")->fetchAll();
if (count($pedido)>0) {
  foreach ($pedido as $row) {
    if ($row['estado']=='CERRADO') {
      echo '<meta http-equiv="refresh" content="2; url=registroDespachoBuscador.php">';
    echo 'NOTA YA REGISTRADA!.';
    exit;
    }
  }
    $personal   =       $db->query("CALL lista_personal_despacho()")->fetchAll();
    // and somewhere later:
    foreach ($pedido as $row) {
  ?>


<div class="card" style="width: 30rem; margin: 20px;">
<h5 class="card-header card-sucess">Registro de Despacho</h5>
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
                <label>Cobrador</label>
                <select name="cobrador" class="form-control">
                    <option selected>Selecione un Cobrador</option>
                    <?php 
        foreach ($personal as $persona) {
      ?>
                    <option value="<?php echo $persona['iddespachador']; ?>"><?php echo $persona['nombre']; ?>
                    </option>
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
            <input type="hidden" name="grabar" value="<?php echo $row['grabar']; ?>">
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>
    <?php
} //FIN DEL IF DEL FOREACH DE PRINCIPAL
} //fin del if validar si existe consulta mysql
else{
  echo '<meta http-equiv="refresh" content="2; url=registroDespachoBuscador.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}
include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?> 