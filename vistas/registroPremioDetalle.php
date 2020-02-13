<?php
include '../includes/header.php';
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();


if (isset($_POST['grabar'])) {
    $pedido     =       $db->query("CALL preparacionxid({$_POST['Nota']})")->fetchAll();

    if (count($pedido) > 0) {
    $nota               =   $_POST['Nota'];
    $premio            =   $_POST['premio'];
    $cantidad           =   $_POST['cantidad'];
    echo $premio." - ".$nota." - ".$cantidad;

    $exito = false;
    try {
        // calling stored procedure command
        $sql = 'INSERT INTO detallepremio (idpremio, idnota, cantidad) VALUES (?, ?, ?);';

        // prepare for execution of the stored procedure
        $stmt = $db->prepare($sql);

        // pass value to the command
        $stmt->bindParam(1, $premio);
        $stmt->bindParam(2, $nota);
        $stmt->bindParam(3, $cantidad);
        // execute the stored procedure
        $stmt->execute();
        $exito = true;
    } catch (PDOException $ex) {
        echo $ex->getMessage();
    }

    if ($exito == true) {
        echo '<meta http-equiv="refresh" content="1; url=registroPremioDetalle.php">';
        echo 'REGISTRO CON EXITO!.';
        exit();
    } else {
        echo '<meta http-equiv="refresh" content="1; url=registroPremioDetalle.php">';
        echo 'NO SE REALIZO EL INGRESO!.';
        exit();
    }
}else {
    echo '<meta http-equiv="refresh" content="1; url=registroPremioDetalle.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}


}
date_default_timezone_set("America/La_Paz");

    $premios   =       $db->query("SELECT * FROM premio")->fetchAll();
        ?>

            <div class="row">
            <div class="col-sm-3">
            </div>
                <div class="card col-sm-6">
                    <div class="card-header">
                        <h5>Datos del Premio</h5>
                    </div>
                    <form method="POST" action="">

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Nro Nota</label>
                            <input type="text" class="form-control" name="Nota">
                        </div>
                        <div class="form-group col-md-4">
                            <label>Premio</label>
                            <select name="premio" class="form-control">
                            <option selected>Selecione un Premio</option>
                            <?php
                                    foreach ($premios as $premio) { ?> 
                                    <option value="<?php echo $premio['idpremio']; ?>"><?php echo $premio['nombre']; ?></option>
                            <?php } ?>
                        </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Cantidad</label>
                            <input type="text" class="form-control" name="cantidad">
                        </div>
                    </div>
                    <input type="hidden" name="grabar" value="grabar">
                     <button type="submit" class="btn btn-primary">Guardar</button>
                    </form>
                </div>
            </div>
            
<!-- End of Main Content -->
<?php 
include '../includes/footer.php';
$database->closeConnection();
$db = null;
?>