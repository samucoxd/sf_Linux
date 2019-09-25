<?php include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
if(!empty($_POST['grabar'])){
  $idNota=$_POST['idNota'];
  $piking=$_POST['piking'];
  $revision=$_POST['revision'];
  $embalaje=$_POST['embalaje'];
  $falla=$_POST['falla'];
  //$db->query("CALL insertarPicking($idNota,$piking,$revision,$embalaje,$falla)");

  // calling stored procedure command
  $sql = 'CALL insertarPicking(:idNot,:piking,:revicion,:embalaje,:falla)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':idNot', $idNota, PDO::PARAM_INT);
  $stmt->bindParam(':piking', $piking, PDO::PARAM_STR);
  $stmt->bindParam(':revicion', $revision, PDO::PARAM_STR);
  $stmt->bindParam(':embalaje', $embalaje, PDO::PARAM_STR);
  $stmt->bindParam(':falla', $falla, PDO::PARAM_STR);

  // execute the stored procedure
  $stmt->execute();
 echo '<meta http-equiv="Refresh" content="0;URL=registroDespacho.php">';
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
                    
                    $data = $db->query("CALL listaPedidoPicking()")->fetchAll();
                    // and somewhere later:
                    foreach ($data as $row) {
                        
                  ?>

                    <tr>
                      <td><?php echo $row['idNota']; ?></td>
                      <td><?php echo $row['noFac']; ?></td>
                      <td><?php echo $row['fecha']; ?></td>
                      <form action="" method="post">
                        <td>
                          <select name="piking" required>
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                            <option value="sva">Samuel Vizcarra</option> 
                            <option value="ame" >Anibal Monasterio</option>
                            <option value="csb">Christian Serrano</option>
                            <option value="jma">Jesus Muñoz</option>
                            <option value="arc">Archivo</option>
                          </select>
                        </td>
                        <td>
                          <select name="revision" required>
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                            <option value="sva">Samuel Vizcarra</option> 
                            <option value="ame" >Anibal Monasterio</option>
                            <option value="csb">Christian Serrano</option>
                            <option value="jma">Jesus Muñoz</option>
                          </select>
                        </td>
                        <td>
                          <select name="embalaje">
                          <option disabled="disabled" selected value="">Seleccione una Persona</option>
                            <option value="sva">Samuel Vizcarra</option> 
                            <option value="ame" >Anibal Monasterio</option>
                            <option value="csb">Christian Serrano</option>
                            <option value="jma">Jesus Muñoz</option>
                          </select>
                        </td>
                        <td>
                          <select name="falla">
                          <option disabled="disabled" selected value="">Seleccione una Falla</option>
                            <option value="A">P.Faltante</option> 
                            <option value="B" >P.Sobrante</option>
                            <option value="C" >Cruce Lote</option>
                            <option value="D" >Cruce Prod.</option>
                          </select>
                        </td>
                        <input type="hidden" name="idNota" value="<?php echo $row['idNota']; ?>" >
                        <input type="hidden" name="grabar" value="<?php echo $row['grabar']; ?>" >
                        <td><button type="submit" class="btn btn-success">Grabar</button></td>
                      </form>
                    </tr>
                    <?php
                    }
                    $database->closeConnection();
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
      ?>   