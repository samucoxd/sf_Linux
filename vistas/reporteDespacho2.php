<?php 
include '../includes/header.php';
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

$opcion   = $_POST['opcion'];
$valor    = $_POST['valor'];
$limite   = $_POST['limite'];
$table    = null;
$indice   = 1;

switch ($opcion) {
    case 'cliente':
      $stm = $db->prepare("CALL buscarporcliente(?,?)");
      $stm->bindParam(1, $valor , PDO::PARAM_STR);
      $stm->bindParam(2, $limite , PDO::PARAM_INT);
      $stm->execute();
      $table = $stm->fetchAll();
        break;
      case 'vendedor':
          $stm = $db->prepare("CALL buscarporvendedor(?,?)");
          $stm->bindParam(1, $valor , PDO::PARAM_STR);
          $stm->bindParam(2, $limite , PDO::PARAM_INT);
          $stm->execute();
          $table = $stm->fetchAll();
          break;
      case 'nota':
        $stm = $db->prepare("CALL buscarpornota(?,?)");
        $stm->bindParam(1, $valor , PDO::PARAM_STR);
        $stm->bindParam(2, $limite , PDO::PARAM_INT);
        $stm->execute();
        $table = $stm->fetchAll();
          break;
      case 'factura':
        $stm = $db->prepare("CALL buscarporfactura(?,?)");
        $stm->bindParam(1, $valor , PDO::PARAM_STR);
        $stm->bindParam(2, $limite , PDO::PARAM_INT);
        $stm->execute();
        $table = $stm->fetchAll();
          break;
      case 'cobrador':
        $stm = $db->prepare("CALL buscarporcobrador(?,?)");
        $stm->bindParam(1, $valor , PDO::PARAM_STR);
        $stm->bindParam(2, $limite , PDO::PARAM_INT);
        $stm->execute();
        $table = $stm->fetchAll();
          break;
    default:
        # code...
        break;
}
?>
<div class="container-fluid">
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
<table class="table table-bordered" width="100%" cellspacing="0">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha</th>
      <th scope="col">Nota</th>
      <th scope="col">Factura</th>
      <th scope="col">Cliente</th>
      <th scope="col">Vendedor</th>
      <th scope="col">FechaPreparacion</th>
      <th scope="col">HoraPreparacion</th>
      <th scope="col">Preparador</th>
      <th scope="col">Revisor</th>
      <th scope="col">Embalador</th>
      <th scope="col">Fallo</th>
      <th scope="col">Estado</th>
      <th scope="col">FechaDespacho</th>
      <th scope="col">HoraDespacho</th>
      <th scope="col">EstadoDespacho</th>
      <th scope="col">Cobrador</th>
      <th scope="col">FechaEnvio</th>
      <th scope="col">HoraEnvio</th>
      <th scope="col">Guia</th>
      <th scope="col">Transporte</th>
      <th scope="col">Destino</th>
      <th scope="col">Ciudad</th>
    </tr>
  </thead>
  <tbody>
<?php
if (count($table)>0) {
    foreach ($table as $row) {
?>

    <tr>
      <th scope="row"><?php echo $indice; ?></th>
      <td nowrap><?php echo $row['fecha']; ?></td>
      <td nowrap><?php echo $row['nota']; ?></td>
      <td nowrap><?php echo $row['factura']; ?></td>
      <td nowrap><?php echo $row['cliente']; ?></td>
      <td nowrap><?php echo $row['vendedor']; ?></td>
      <td nowrap><?php echo $row['fechapreparacion']; ?></td>
      <td nowrap><?php echo $row['horapreparacion']; ?></td>
      <td nowrap><?php echo $row['preparador']; ?></td>
      <td nowrap><?php echo $row['revisor']; ?></td>
      <td nowrap><?php echo $row['embalador']; ?></td>
      <td nowrap><?php echo $row['fallo']; ?></td>
      <td nowrap><?php echo $row['estadopreparacion']; ?></td>
      <td nowrap><?php echo $row['fechadespacho']; ?></td>
      <td nowrap><?php echo $row['horadespacho']; ?></td>
      <td nowrap><?php echo $row['estadodespacho']; ?></td>
      <td nowrap><?php echo $row['despachador']; ?></td>
      <td nowrap><?php echo $row['fechaenvio']; ?></td>
      <td nowrap><?php echo $row['horaenvio']; ?></td>
      <td nowrap><?php echo $row['guia']; ?></td>
      <td nowrap><?php echo $row['transporte']; ?></td>
      <td nowrap><?php echo $row['destino']; ?></td>
      <td nowrap><?php echo $row['ciudad']; ?></td>
    </tr>
<?php
$indice = $indice + 1;
}// FIN DE FOREACH
?>
  </tbody>
</table>
</div>
  </div>
    </div>
      </div>
<?php
}
else {
    echo '<meta http-equiv="refresh" content="2; url=reporteDespacho2.php">';
    echo 'NO EXISTE NOTA EN LA BASE DE DATOS!.';
}

include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?>

