<?php 
include '../includes/header.php';
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

$premios = $db->query('SELECT pedido.fecha,despacho.fecha as fechadespacho, pedido.idnota, 
cliente.nombre as cliente, premio.nombre as premio, cantidad FROM detallepremio
inner join premio on detallepremio.idpremio = premio.idpremio
inner join pedido on detallepremio.idnota = pedido.idnota
inner join cliente on pedido.cliente = cliente.idcliente
inner join despacho on pedido.idnota = despacho.idpedido;')->fetchAll();

?>
      <div class="card shadow mb-4" style="width: 60rem; margin: 20px auto;">
	<div class="card-header py-3">
	<h6 class="m-0 font-weight-bold text-primary">TABLA DE PREMIOS</h6>
	</div>
	<div class="card-body">
	<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
    <th scope="col">Fecha</th>
      <th scope="col">Despacho</th>
      <th scope="col">Nota</th>
      <th scope="col">Cliente</th>
      <th scope="col">Premio</th>
      <th scope="col">Cantidad</th>
		</thead>
		<tfoot>
    <th scope="col">Fecha</th>
      <th scope="col">Despacho</th>
      <th scope="col">Nota</th>
      <th scope="col">Cliente</th>
      <th scope="col">Premio</th>
      <th scope="col">Cantidad</th>
			</tr>
		</tfoot>
		<tbody>
    <?php
    foreach ($premios as $premio) {
?>

    <tr>
      <td nowrap><?php echo $premio['fecha']; ?></td>
      <td nowrap><?php echo $premio['fechadespacho']; ?></td>
      <td nowrap><?php echo $premio['idnota']; ?></td>
      <td nowrap><?php echo $premio['cliente']; ?></td>
      <td nowrap><?php echo $premio['premio']; ?></td>
      <td nowrap><?php echo $premio['cantidad']; ?></td>
    </tr>
<?php
}// FIN DE FOREACH
?>
		</tbody>
	</table>
	</div>
	</div>
</div>








<?php
include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?>

