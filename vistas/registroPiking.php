<?php include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
if(!empty($_POST['grabar'])){
  $idNota   = $_POST['Nota'];
  $picking   = $_POST['picking'];
  $revision = $_POST['revision'];
  $embalaje = $_POST['embalaje']; 
  $falla    = $_POST['falla'];
  $fecha    = $_POST['fecha'];
  $hora    = $_POST['hora'];

  // calling stored procedure command
  $sql = 'CALL registro_preparacion(:fecha,:hora,:picking,:revision,:embalaje,:fallo,:Nota)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);
  $stmt->bindParam(':hora', $hora, PDO::PARAM_STR);
  $stmt->bindParam(':picking', $picking, PDO::PARAM_INT);
  $stmt->bindParam(':revision', $revision, PDO::PARAM_INT);
  $stmt->bindParam(':embalaje', $embalaje, PDO::PARAM_INT);
  $stmt->bindParam(':fallo', $fallo, PDO::PARAM_INT);
  $stmt->bindParam(':Nota', $Nota, PDO::PARAM_INT);

  // execute the stored procedure
  $stmt->execute();
 //echo '<meta http-equiv="Refresh" content="0;URL=registroDespacho.php">';
}else{

?>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>Fecha</th>
                      <th>Picking</th>
                      <th>Revision</th>
                      <th>Embalaje</th>
                      <th>Falla</th>
                      <th>Grabar</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>Fecha</th>
                      <th>Picking</th>
                      <th>Revision</th>
                      <th>Embalaje</th>
                      <th>Falla</th>
                      <th>Grabar</th>
                    </tr>
                  </tfoot>
                  <tbody>

                  <?php
                    $pedido = $db->query("CALL pedido_preparacion_pendiente()")->fetchAll();
                    $personal = $db->query("CALL lista_personal_almacen()")->fetchAll();
                    $fallos = $db->query("CALL lista_fallo()")->fetchAll();
                    // and somewhere later:
                    foreach ($pedido as $row) {
                  ?>

                    <tr>
                      <td><?php echo $row['Nota']; ?></td>
                      <td><?php echo $row['Factura']; ?></td>
                      <td><?php echo $row['Fecha']; ?></td>
                      <form action="" method="post">
                        <td>
                          <select name="picking" required>
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                          <?php 
                            foreach ($personal as $persona) {
                          ?>
                            <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option> 
                            <?php 
                            }
                            ?>
                          </select>
                        </td>
                        <td>
                          <select name="revision" required>
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                            < <?php 
                            foreach ($personal as $persona) {
                          ?>
                            <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option> 
                            <?php 
                            }
                            ?>
                          </select>
                        </td>
                        <td>
                          <select name="embalaje">
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                          <?php 
                            foreach ($personal as $persona) {
                          ?>
                            <option value="<?php echo $persona['idpersonalalmacen']; ?>"><?php echo $persona['nombre']; ?></option> 
                            <?php 
                            }
                            ?>
                          </select>
                        </td>
                        <td>
                          <select name="falla">
                          <option disabled="disabled" selected value="">Seleccione una Falla</option>
                          <?php 
                            foreach ($fallos as $fallo) {
                          ?>
                            <option value="<?php echo $fallo['idfallo']; ?>"><?php echo $fallo['nombre']; ?></option> 
                            <?php 
                            }
                            ?>
                          </select>
                        </td>
                        <td><input type="date" name="fecha"></td>
                        <td><input type="time" name="hora"></td>
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


      <?php  include '../includes/footer.php'; 
              }

              $database->closeConnection();
          $db=null;
      ?>   