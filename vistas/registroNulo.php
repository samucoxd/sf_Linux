<?php include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
if(!empty($_POST['grabar'])){
  $idNota=$_POST['idNota'];
  $motivo=$_POST['motivo'];
  $obs=$_POST['obs'];
  //$db->query("CALL insertarPicking($idNota,$piking,$revision,$embalaje,$falla)");

  // calling stored procedure command
  $sql = 'CALL registrar_nulo(:_nota,:_motivo,:_obs)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':idNot', $idNota, PDO::PARAM_INT);
  $stmt->bindParam(':motivo', $motivo, PDO::PARAM_STR);
  $stmt->bindParam(':obs', $obs, PDO::PARAM_STR);

  // execute the stored procedure
  $stmt->execute();
  
}
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
            <div class="card-body col-md-3">
                <form action="" method="post">
                    <div class="form-group">
                        <label for="">Nro Nota</label>
                        <input type="text" class="form-control" placeholder="Nro Nota" name="idNota">
                        <label for="">Motivo de Anulacion:</label>
                        <select name="motivo" class="form-control">
                            <option value="" selected></option>
                            <option value="eCantidaad">Cantidad</option> 
                            <option value="ePrecio" >Precio</option>
                            <option value="eFacturacion">Error_Facturacion</option>
                        </select>
                        <label for="">Observaciones</label>
                        <textarea name="obs" class="form-control" cols="30" rows="10"></textarea><br>
                    </div>
                    <input type="hidden" name="grabar" value="grabar">
                    <button type="submit" class="btn btn-success">Grabar</button>
                </form> 

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