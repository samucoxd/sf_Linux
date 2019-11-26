<?php
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
?>

<form action="" method="post">
  <input type="text" name="encontrado">
  <button type="submit" class="btn btn-success">Buscar</button>
</form>

<?php
if (isset($_POST['encontrado'])) {
  $query = "call buscar_despacho_x_nota({$_POST['encontrado']})";
  $res = $db->query($query)->fetchAll();
  $transporte = $db->query("call lista_transporte")->fetchAll();
  $destino = $db->query("call lista_destino")->fetchAll();
?>

<!-- Begin Page Content -->
<div class="container-fluid">
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Resumen Pedidos Pendientes de Preparacion</h1>
<p class="mb-4">En esta pagina se registran todos los pedidos que esten pendientes de preparacion(Picking).</p>

<!-- DataTales Example -->

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Cuadro Pendientes</h6>
  </div>
<div class="card-body">
<div class="table-responsive">
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<thead>
  <tr>
  <th>Nota</th>
  <th>Fecha</th>
  <th>Hora</th>
  <th>Transporte</th>
  <th>Destino</th>
  <th>Guia</th>
  <th>Grabar</th>
  </tr>
</thead>
<tfoot>
  <tr>
  <th>Nota</th>
  <th>Fecha</th>
  <th>Hora</th>
  <th>Transporte</th>
  <th>Destino</th>
  <th>Guia</th>
  <th>Grabar</th>
  </tr>
</tfoot>
<?php
foreach ($res as $row) {
?>
  <tr>
    <form action="" method="post">
      <td><?php echo $row['idnota'] ?></td>
      <td><input type="date" name="fecha"></td>
      <td><input type="time" name="hora"></td>
      <td>
        <select name="transporte" required>
          <option disabled="disabled" selected value="">Seleccione un transporte</option>
          <?php foreach ($transporte as $trans) { ?>
          <option value="<?php echo $trans['idtransporte']; ?>"><?php echo $trans['nombre']; ?></option>
          <?php 
          }
          ?>
        </select>
      </td>
      <td>
      <select name="destino" required>
          <option disabled="disabled" selected value="">Seleccione un destino</option>
          <?php foreach ($destino as $dest) { ?>
          <option value="<?php echo $dest['iddestino']; ?>"><?php echo $dest['nombre']; ?></option>
          <?php 
          }
          ?>
        </select>
      </td>
      <td><input type="text" name="guia"></td>
      <input type="hidden" name="grabar" value="grabar">
      <input type="hidden" name="nota" value="<?php echo $row['idnota']; ?>">
      <td><button type="submit" class="btn btn-success">Grabar</button></td>
    </form>
  </tr>
<?php
}
?>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>

<?php
}else {
  if (isset($_POST['grabar'])) {
  $Nota       = $_POST['nota'];
  $Fecha      = $_POST['fecha'];
  $Hora       = $_POST['hora'];
  $Transporte = $_POST['transporte'];
  $Destino    = $_POST['destino'];
  $Guia       = $_POST['guia'];
    try {
       // calling stored procedure command
      $sql = 'CALL registrar_envio(:fecha,:hora,:transporte,:destino,:guia,:idpedido)';
    
      // prepare for execution of the stored procedure
      $stmt = $db->prepare($sql);

      // pass value to the command
      $stmt->bindParam(':fecha', $Fecha, PDO::PARAM_STR);
      $stmt->bindParam(':hora', $Hora, PDO::PARAM_STR);
      $stmt->bindParam(':transporte', $Transporte, PDO::PARAM_INT);
      $stmt->bindParam(':destino', $Destino, PDO::PARAM_INT);
      $stmt->bindParam(':guia', $Guia, PDO::PARAM_STR);
      $stmt->bindParam(':idpedido', $Nota, PDO::PARAM_INT);

      // execute the stored procedure
      $stmt->execute();
    } catch (PDOException $ex) {
      die($ex->getMessage());
    }
  }
}
include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?>  