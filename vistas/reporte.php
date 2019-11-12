<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

$resumen = $db->query("CALL resumenrapido({$_POST['nronota']})")->fetchAll();

if (count($resumen)>0) {
    foreach ($pedido as $row) {
  ?>


<div class="card" style="width: 30rem; margin: 20px;">
<h5 class="card-header card-sucess">Reporte por Nota</h5>
        <form>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Nro Nota</label>
                    <input type="text" class="form-control" value="<?php echo $row['nota']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-4">
                    <label>Nro Factura</label>
                    <input type="text" class="form-control" value="<?php echo $row['factura']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-4">
                    <label>Fecha</label>
                    <input type="date" class="form-control" value="<?php echo $row['fecha']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-8">
                    <label>Cliente</label>
                    <input type="date" class="form-control" value="<?php echo $row['cliente']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-8">
                    <label>Vendedor</label>
                    <input type="date" class="form-control" value="<?php echo $row['vendedor']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-5">
                    <label>Cobrador</label>
                    <input type="date" class="form-control" value="<?php echo $row['despachador']; ?>" disabled="true">
                </div>
                <div class="form-group col-md-5">
                    <label>Fecha Despacho</label>
                    <input type="date" class="form-control" value="<?php echo $row['fechadespacho']; ?>" disabled="true">
                </div>
            </div>
            
        </form>
</div>
    <?php
} //FIN DEL IF DEL FOREACH DE PRINCIPAL
}
else {
    echo '<meta http-equiv="refresh" content="2; url=reporteDespacho.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}

include '../includes/footer.php'; 
?>