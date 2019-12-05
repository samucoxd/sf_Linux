<?php
include '../includes/header.php';
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();


if (isset($_POST['grabar'])) {
    $Nota               =   $_POST['Nota'];
    $picking            =   $_POST['picking'];
    $revision           =   $_POST['revision'];
    $embalaje           =   $_POST['embalaje'];
    $fallo              =   $_POST['falla'];
    $fechaPicking       =   $_POST['fechaPicking'];
    $horaPicking        =   $_POST['horaPicking'];
    $cobrador           =   $_POST['cobrador'];
    $fechaDespacho      =   $_POST['fechaDespacho'];
    $horaDespacho       =   $_POST['horaDespacho'];

    $exito = false;
    try {
        // calling stored procedure command
        $sql = 'CALL registro_picking_despacho(
            :_fechaPicking,:_horaPicking,:_picking,:_revision,:_embalaje,:_fallo,:_id,
            :_fechaDespacho,:_horaDespacho,:_despachador)';

        // prepare for execution of the stored procedure
        $stmt = $db->prepare($sql);

        // pass value to the command
        $stmt->bindParam(':_fechaPicking', $fechaPicking, PDO::PARAM_STR);
        $stmt->bindParam(':_horaPicking', $horaPicking, PDO::PARAM_STR);
        $stmt->bindParam(':_picking', $picking, PDO::PARAM_INT);
        $stmt->bindParam(':_revision', $revision, PDO::PARAM_INT);
        $stmt->bindParam(':_embalaje', $embalaje, PDO::PARAM_INT);
        $stmt->bindParam(':_fallo', $fallo, PDO::PARAM_INT);
        $stmt->bindParam(':_id', $Nota, PDO::PARAM_INT);
        $stmt->bindParam(':_fechaDespacho', $fechaDespacho, PDO::PARAM_STR);
        $stmt->bindParam(':_horaDespacho', $horaDespacho, PDO::PARAM_STR);
        $stmt->bindParam(':_despachador', $cobrador, PDO::PARAM_INT);

        // execute the stored procedure
        $stmt->execute();
        $exito = true;
    } catch (PDOException $ex) {
        echo $ex->getMessage();
    }

    if ($exito == true) {
        echo '<meta http-equiv="refresh" content="2; url=registroEspecialBuscador.php">';
        echo 'REGISTRO CON EXITO!.';
        exit();
    } else {
        echo '<meta http-equiv="refresh" content="2; url=registroEspecialBuscador.php">';
        echo 'NO SE REALIZO EL INGRESO!.';
        exit();
    }
}
date_default_timezone_set("America/La_Paz");
$pedido     =       $db->query("CALL preparacionxid({$_POST['nronota']})")->fetchAll();

if (count($pedido) > 0) {
    foreach ($pedido as $row) {
        if ($row['estado'] == 'CERRADO') {
            echo '<meta http-equiv="refresh" content="2; url=registroEspecialBuscador.php">';
            echo 'NOTA YA REGISTRADA!.';
            exit;
        }
    }
    $personal   =       $db->query("CALL lista_personal_almacen()")->fetchAll();
    $fallos     =       $db->query("CALL lista_fallo()")->fetchAll();
    // and somewhere later:
    foreach ($pedido as $row) {
        ?>

            <div class="row">
            <div class="col-sm-3">
            </div>
                <div class="card col-sm-6">
                    <div class="card-header">
                        <h5>Datos del Pedido</h5>
                    </div>
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
                </div>
            </div>
            <form method="POST" action="">
            <div class="row">
            <div class="col-sm-3">
            </div>
                <div class="card col-sm-6">
                    <div class="card-header">
                        <h5>Registro de Preparacion</h5>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Armador</label>
                        <select name="picking" class="form-control">
                            <option selected>Selecione un Personal</option>
                            <?php
                                    foreach ($personal as $persona) { ?>
                                <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Revisador</label>
                        <select name="revision" class="form-control">
                            <option selected>Selecione un Personal</option>
                            <?php
                                    foreach ($personal as $persona) { ?> 
                                    <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Embalador</label>
                        <select name="embalaje" class="form-control">
                            <option selected>Selecione un Personal</option>
                            <?php
                                    foreach ($personal as $persona) { ?>
                                <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Tipo de Falla</label>
                        <select name="falla" class="form-control">
                            <option selected>Selecione un Personal</option>
                            <?php
                                    foreach ($fallos as $fallo) { ?>
                                <option value="<?php echo $fallo['idfallo']; ?>"><?php echo $fallo['nombre']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Fecha Actual</label>
                            <input name="fechaPicking" type="date" class="form-control" value="<?php echo date("Y-m-d"); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Hora</label>
                            <input name="horaPicking" type="time" class="form-control" value="<?php echo date('H:i'); ?>">
                        </div>
                    </div>

            <?php

                //INICIO EL FORMULARIO DE DESPACHO
                //INICIO DEL IF DEL FOREACH DE DESPACHO
                $personalDespacho   =       $db->query("CALL lista_personal_despacho()")->fetchAll();
                // and somewhere later:
                    ?>

                    <div class="card-header">
                        <h5>Registro de Despacho</h5>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Cobrador</label>
                        <select name="cobrador" class="form-control">
                            <option selected>Selecione un Cobrador</option>
                            <?php
                                    foreach ($personalDespacho as $cobranza) { ?>
                                <option value="<?php echo $cobranza['iddespachador']; ?>"> <?php echo $cobranza['nombre']; ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label>Fecha Actual</label>
                            <input name="fechaDespacho" type="date" class="form-control" value="<?php echo date("Y-m-d"); ?>">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Hora</label>
                            <input name="horaDespacho" type="time" class="form-control" value="<?php echo date('H:i'); ?>">
                        </div>
                    </div>
            </div>
            </div>
            <div class="row">
            <div class="col-sm-3">
            </div>
                <div class="card col-sm-6">
                    <input type="hidden" name="Nota" value="<?php echo $row['Nota']; ?>">
                    <input type="hidden" name="grabar" value="grabar">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </div>
            </form>

<?php
} //FIN DEL IF DEL FOREACH DE PICKING
} //fin del if validar si existe consulta mysql
else {
    echo '<meta http-equiv="refresh" content="2; url=registroEspecialBuscador.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}

?>

<!-- End of Main Content -->
<?php 
include '../includes/footer.php';
$database->closeConnection();
$db = null;
?>