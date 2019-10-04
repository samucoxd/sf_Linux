<?php
include '../includes/header.php'; 
include '../controladores/controlador_mysql.php'; 
$database = new mysql();
$conn = $database->openConnection();
$mensaje="";
if (isset($_GET['datos'])) {
	if(!empty($_GET['nombre']) && !empty($_GET['ciudad'])){

        $nombre=$_GET['nombre'];
        $ciudad=$_GET['ciudad'];

		try {
		// calling stored procedure command
		$sql = 'insert into destino(nombre,ciudad) values(:nombre,:ciudad)';

		// prepare for execution of the stored procedure
		$stmt = $db->prepare($sql);

		// pass value to the command

        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindParam(':ciudad', $ciudad, PDO::PARAM_STR);

		$stmt->execute();

		$mensaje = "REGISTRADO! Registro Sastifactorio";

	} catch (PDOException $e) {
		echo $e->getMessage();
	}

	}else{
		$mensaje = "DATOS INCOMPLETOS, favor vuelva a llenar los datos";
	}
}

?>

<div class="card" style="width: 40rem; margin: auto;">
	<!-- Default form subscription -->
	<form class="text-center border border-light p-5" action="registrocliente.php" method="GET">

		<p class="h4 mb-4">Registro de un Destino Nuevo</p>

		<p>LLenar todos los datos Obligatorios para el correcto registro de Dstino.</p>

		<?php if ($mensaje != "") {
		?>
			<div class="alert alert-danger">
			<strong><?php echo $mensaje; ?></strong>
			</div>
		<?php
		} ?>

		<!-- nombre -->
		<input type="text" id="" name="nombre" class="form-control mb-4" placeholder="Nombre" required>

        <!-- ciudad -->
        <input type="text" id="" name="ciudad" class="form-control mb-4" placeholder="Ciudad" required>

		<!-- hidden -->
		<input type="hidden" id="" name="datos" value="datos" required>

		<!-- Sign in button -->
		<button class="btn btn-info btn-block"  type="submit">Registro</button>

	</form>
</div>

<div class="card shadow mb-4" style="width: 60rem; margin: 20px auto;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">TABLA DE DESTINATARIOS</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
				<th scope="col">Cod</th>
				<th scope="col">Nombre</th>
				<th scope="col">Ciudad</th>
				</thead>
                  <tfoot>
                    <tr>
					<th scope="col">Cod</th>
					<th scope="col">Nombre</th>
					<th scope="col">Ciudad</th>
                    </tr>
                  </tfoot>
                  <tbody>
					<?php 
					$mysql = new mysql(); 
					$dato = $mysql->select('destino');

					foreach ($dato as $row) { ?>
					<tr>
						<td><?php echo $row['iddestino'] ?></td>
						<td><?php echo $row['nombre'] ?></td>
						<td><?php echo $row['ciudad'] ?></td>
					</tr>
					<?php
					}
					?>
				</tbody>
                </table>
              </div>
            </div>
</div>


<?php 
$database->closeConnection();
$database = null;
include '../includes/footer.php'; 
?>	