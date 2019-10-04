<?php
include '../config/conexion.php';
include '../includes/header.php'; 
$database = new Connection();
$db = $database->openConnection();
$mensaje = false;
if (isset($_POST['datos'])) {
	if(!empty($_POST['nombre'])){

		$nombre=$_POST['nombre'];

		try {
		// calling stored procedure command
		$sql = 'insert into personalalmacen(nombre) values(:nombre)';

		// prepare for execution of the stored procedure
		$stmt = $db->prepare($sql);

		// pass value to the command

		$stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);

		$stmt->execute();

		$mensaje = true;

	} catch (PDOException $e) {
		echo $e->getMessage();
	}

	}else{
		$mensaje = false;
	}
}

?>

<div class="card" style="width: 40rem; margin: auto;">
	<!-- Default form subscription -->
	<form class="text-center border border-light p-5" action="registropersonal.php" method="POST">

		<p class="h4 mb-4">Registro de un Personal de Almacen Nuevo</p>

		<p>LLenar todos los datos Obligatorios para el correcto registro de un Personal de Almacen.</p>

		<?php if ($mensaje) {
    ?>
			<div class="alert alert-success">
			<strong><?php echo "REGISTRADO! Cliente Registrado Correctamente"; ?></strong>
			</div>
		<?php
}else{
	?>
	<div class="alert alert-danger">
			<strong><?php echo "DATOS INCOMPLETOS, favor vuelva a llenar los datos"; ?></strong>
			</div>
<?php } ?>

		<!-- nombre -->
		<input type="text" id="" name="nombre" class="form-control mb-4" placeholder="Nombre" required>


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
				</thead>
                  <tfoot>
                    <tr>
					<th scope="col">Cod</th>
					<th scope="col">Nombre</th>
                    </tr>
                  </tfoot>
                  <tbody>
					<?php 
					try {
						$data = $db->query("SELECT * FROM personalalmacen")->fetchAll();
					
					} catch (PDOException $e) {
						echo "Error al realizar el Select" . $e->getMessage();
					}

					foreach ($data as $row) { ?>
					<tr>
						<td><?php echo $row['idpersonalalmacen'] ?></td>
						<td><?php echo $row['nombre'] ?></td>
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