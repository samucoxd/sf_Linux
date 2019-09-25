<?php
include '../config/conexion.php';
include '../includes/header.php'; 
$database = new Connection();
$db = $database->openConnection();
$mensaje="";
if (isset($_GET['datos'])) {
	if(!empty($_GET['nombre']) && !empty($_GET['ciudad'])){

        $nombre=$_GET['nombre'];
        $ciudad=$_GET['ciudad'];

		try {
		// calling stored procedure command
		$sql = 'insert into destino(nombre) values(:nombre,:ciudad)';

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


<?php 
$database->closeConnection();
$database = null;
include '../includes/footer.php'; 
?>	