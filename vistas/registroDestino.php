<?php
session_start();

include '../includes/header.php'; 
include '../config/conexion.php';
date_default_timezone_set("America/La_Paz");
$database = new Connection();
$db = $database->openConnection();
$nota=0;

if(!empty($_GET['envio'])){
  $fecha=$_GET['fecha'];
  $destino=$_GET['destino'];
  $transporte=$_GET['transporte'];
  $guia=$_GET['guia'];
  $idNota=$_GET['idNota'];
  $hora=$_GET['hora'];


  // calling stored procedure command
  $sql = 'insert into enviosAlmacen(idNota,fecha,hora,idDestino,idFlota,guia) values(:idNota,:fecha,:hora,:idDestino,:idFlota,:guia)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':idNota', $idNota, PDO::PARAM_INT);
  $stmt->bindParam(':fecha', $fecha);
  $stmt->bindParam(':hora', $hora);
  $stmt->bindParam(':idDestino', $destino, PDO::PARAM_INT);
  $stmt->bindParam(':idFlota', $transporte, PDO::PARAM_INT);
  $stmt->bindParam(':guia', $guia, PDO::PARAM_STR);

  // execute the stored procedure
  $stmt->execute();
}
if (!empty($_GET['busqueda'])){
$idNota=$_GET['idNota'];
$idFac=$_GET['idFac'];


// calling stored procedure command
$sql = 'select idNota from controlpedido where idNota='.$idNota.' and noFac='.$idFac.'';

// prepare for execution of the stored procedure
$stmt = $db->query($sql)->fetchAll();
    foreach ($stmt as $row){
        echo $row["idNota"];
        $_SESSION["idNota"] = $row["idNota"];
    }
    if (empty($_SESSION["idNota"])) {
        echo "<h1 style='color:red'>DATOS NO ENCONTRADOS</h1>";
        echo "<meta http-equiv='Refresh' content='3;URL=registroDestino.php'>";
    }else{
        echo $_SESSION["idNota"];
    }

}

?>
    <h1>Registro de Envios de Almacen</h1>
    <?php 
        if(empty($_GET['busqueda']) && empty($_POST['envio'])){ 
    ?>
            
    <form action="#" method="GET">
        <label for="Nro Nota">NOTA:</label>
        <input type="text" name="idNota" required>
        <label for="Nro Factura">FACTURA:</label>
        <input type="text" name="idFac" required>
        <button type="submit" name="busqueda" value="busqueda">Buscar</button>
    </form>
    <?php }
    
    if(!empty($_GET['busqueda'])) {
    ?>
    <form action="" method="GET">
        <label for="Codigo">Ingrese la Fecha</label>
        <input type="date" name="fecha" placeholder="fecha" value="<?php echo date("Y-m-d"); ?>"><br>
        <label for="Codigo">Ingrese la Hora</label>
        <input type="time" name="hora" value="<?php echo date('H:i'); ?>"><br>
        <label for="Codigo">Ingrese el Destino</label>
        <select name="destino">
            <?php
            $destino = $db->query("select * from destinoEnvios")->fetchAll();
            // and somewhere later:
            foreach ($destino as $row) {
            ?>
            <option value="<?php echo $row['idDestino'] ?>"><?php echo $row['nombre'] ?></option> 
            <?php } ?>
        </select><br>
        <label for="Codigo">Ingrese el Medio Transporte</label>
        <select name="transporte">
            <?php
            $flota = $db->query("select * from flota")->fetchAll();
            // and somewhere later:
            foreach ($flota as $row) {
            ?>
            <option value="<?php echo $row['idFlota'] ?>"><?php echo $row['nombre'] ?></option> 
            <?php } ?>
        </select><br>
        <label for="Codigo">Ingrese la Guia</label>
        <input type="text" name="guia" ><br>
        <input type="hidden" name="idNota" value="<?php echo $_SESSION["idNota"]; ?>" >
        <button type="submit" name="envio" value="envio" class="btn btn-success">Grabar</button>
    </form>
    <?php
    unset($_SESSION['idNota']);
    session_destroy();
    }    
include '../includes/footer.php'; 
?>  


