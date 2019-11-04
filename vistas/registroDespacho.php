<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

if(isset($_POST['grabar'])){
  $Nota     =   $_POST['Nota'];
  $cobrador =   $_POST['cobrador'];
  $fecha    =   $_POST['fecha'];
  $hora     =   $_POST['hora'];
try {
  $sql = 'CALL registro_despacho(:fecha,:hora,:despachador,:id)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);
  $stmt->bindParam(':hora', $hora, PDO::PARAM_STR);
  $stmt->bindParam(':despachador', $cobrador, PDO::PARAM_INT);
  $stmt->bindParam(':id', $Nota, PDO::PARAM_INT);

  // execute the stored procedure
  $stmt->execute();
  } catch (PDOException $ex) {
    die($ex->getMessage());
  }
}
  date_default_timezone_set("America/La_Paz");
?>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Pedidos Pendientes de Despacho</h1>
  <p class="mb-4">En esta pagina se registran todos los pedidos pendientes de Despacho</a>.</p>

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
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>Fecha</th>
                      <th>Cobrador</th>
                      <th>FechaSalida</th>
                      <th>HoraSalida</th>
                      <th>Grabar</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>Fecha</th>
                      <th>Cobrador</th>
                      <th>FechaSalida</th>
                      <th>HoraSalida</th>
                      <th>Grabar</th>
                    </tr>
                  </tfoot>
                  <tbody>

                  <?php
                    
                    $despachos = $db->query("CALL pedido_despacho_pendiente()")->fetchAll();
                    $personal = $db->query("CALL lista_personal_despacho()")->fetchAll();
                    // and somewhere later:
                    foreach ($despachos as $row) {
                        
                  ?>

                    <tr>
                      <td><?php echo $row['Nota']; ?></td>
                      <td><?php echo $row['Factura']; ?></td>
                      <td><?php echo $row['Fecha']; ?></td>
                      <form action="" method="post">
                        <td>
                          <select name="cobrador" required>
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                          <?php 
                            foreach ($personal as $persona) {
                          ?>
                            <option value="<?php echo $persona['iddespachador']; ?>"><?php echo $persona['nombre']; ?></option> 
                            <?php 
                            }
                            ?>
                          </select>
                        </td>
                        <td>
                          <input type="date" name="fecha" value="<?php echo date("Y-m-d");?>" required>
                        </td>
                        <td>
                          <input type="time" name="hora" value="<?php echo date('H:i'); ?>" required>
                        </td>
                        <input type="hidden" name="Nota" value="<?php echo $row['Nota']; ?>" >
                        <input type="hidden" name="grabar" value="<?php echo $row['grabar']; ?>" >
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
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      <?php 
      include '../includes/footer.php'; 
      $database->closeConnection();
      $db=null;
      ?>   

      
