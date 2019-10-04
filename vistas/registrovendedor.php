<?php
include '../includes/header.php'; 
include '../controladores/controlador_mysql.php'; 
$database = new Connection();
$db = $database->openConnection();
$mensaje="";
if (isset($_GET['datos'])) {
	if(!empty($_GET['codigo']) && !empty($_GET['nombre'])){

		$codigo=$_GET['codigo'];
		$nombre=$_GET['nombre'];

		try {
		// calling stored procedure command
		$sql = 'insert into vendedor(idcliente,nombre,zona) values(:codigo,:nombre)';

		// prepare for execution of the stored procedure
		$stmt = $db->prepare($sql);

		// pass value to the command
		$stmt->bindParam(':codigo', $codigo, PDO::PARAM_INT);
		$stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
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
	<form class="text-center border border-light p-5" action="registrovendedor.php" method="GET">

		<p class="h4 mb-4">Registro de un Vendedor Nuevo</p>

		<p>LLenar todos los datos Obligatorios para el correcto registro de un Vendedor.</p>

		<?php if ($mensaje != "") {
		?>
			<div class="alert alert-danger">
			<strong><?php echo $mensaje; ?></strong>
			</div>
		<?php
		} ?>

		<!-- codigo -->
		<input type="text" id="" name="codigo" class="form-control mb-4" placeholder="Codigo" required>

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
              <h6 class="m-0 font-weight-bold text-primary">TABLA DE CLIENTES</h6>
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
					$mysql = new mysql(); 
					$dato = $mysql->select('vendedor');

					foreach ($dato as $row) { ?>
					<tr>
						<td><?php echo $row['idvendedor'] ?></td>
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