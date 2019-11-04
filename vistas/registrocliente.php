<?php
include '../includes/header.php';
include '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
$mensaje = false;
if (isset($_POST['datos'])) {
    if (isset($_POST['codigo']) || isset($_POST['nombre']) || isset($_POST['zona'])) {

        $codigo = $_POST['codigo'];
        $nombre = $_POST['nombre'];
        $zona = $_POST['zona'];

        try {
            // calling stored procedure command
            $sql = 'insert into cliente(idcliente,nombre,zona) values(:codigo,:nombre,:zona)';

            // prepare for execution of the stored procedure
            $stmt = $db->prepare($sql);

            // pass value to the command
            $stmt->bindParam(':codigo', $codigo, PDO::PARAM_INT);
            $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
            $stmt->bindParam(':zona', $zona, PDO::PARAM_STR);
            $stmt->execute();

            $mensaje = true;

        } catch (PDOException $e) {
            echo $e->getMessage();
        }

    } else {
        $mensaje = false;
    }
}

?>

<div class="card" style="width: 40rem; margin: auto;">
	<!-- Default form subscription -->
	<form class="text-center border border-light p-5" action="registrocliente.php" method="POST">

		<p class="h4 mb-4">Registro de un Cliente Nuevo</p>

		<p>LLenar todos los datos Obligatorios para el correcto registro de Clientes.</p>

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

		<!-- codigo -->
		<input type="text" id="" name="codigo" class="form-control mb-4" placeholder="Codigo" required>

		<!-- nombre -->
		<input type="text" id="" name="nombre" class="form-control mb-4" placeholder="Nombre" required>

		<!-- zona -->
		<input type="text" id="" name="zona" class="form-control mb-4" placeholder="Zona" required>

		<!-- hidden -->
		<input type="hidden" id="" name="datos" value="datos" required>

		<!-- Sign in button -->
		<button class="btn btn-info btn-block"  type="submit">Sign in</button>

	</form>
</div>

<div class="card shadow mb-4" style="width: 60rem; margin: 20px auto;">
	<div class="card-header py-3">
	<h6 class="m-0 font-weight-bold text-primary">TABLA DE CLIENTES</h6>
	</div>
	<div class="card-body">
	<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<th scope="col">Cod</th>
			<th scope="col">Nombre</th>
			<th scope="col">Zona</th>
		</thead>
		<tfoot>
			<tr>
			<th scope="col">Cod</th>
			<th scope="col">Nombre</th>
			<th scope="col">Zona</th>
			</tr>
		</tfoot>
		<tbody>
			<?php
try {
    $data = $db->query("SELECT * FROM cliente")->fetchAll();

} catch (PDOException $e) {
    echo "Error al realizar el Select" . $e->getMessage();
}

foreach ($data as $row) {?>
			<tr>
				<td><?php echo $row['idcliente'] ?></td>
				<td><?php echo $row['nombre'] ?></td>
				<td><?php echo $row['zona'] ?></td>
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
include '../includes/footer.php';
?>
