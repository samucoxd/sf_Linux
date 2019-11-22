<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
?>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Resumen de Pedidos Pendientes</h1>
          <p class="mb-4">Resumen de pedidos pendientes de preparacion y/o Despacho, del mes en curso</a>.</p>

          <!-- DataTales Example -->
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Resumen Pedido</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Nota</th>
                      <th>Factura</th>
                      <th>Fecha</th>
                      <th>Cliente</th>
                      <th>Vendedor</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Nota</th>
                      <th>Factura</th>
                      <th>Fecha</th>
                      <th>Cliente</th>
                      <th>Vendedor</th>
                    </tr>
                  </tfoot>
                  <tbody>

                  <?php
                  if ($_GET['valor' == 'picking'] ) {
                    try {
                      // calling stored procedure command
                      $sql = "CALL pendientepreparacion()";
                      // prepare for execution of the stored procedure
                      $data = $db->query($sql)->fetchAll();
                  } catch (PDOException $e) {
                      die("Error occurred:" . $e->getMessage());
                  }
                    foreach ($data as $row) {
                        
                  ?>

                    <tr>
                      <td><?php echo $row['Nota']; ?></td>
                      <td><?php echo $row['Factura']; ?></td>
                      <td><?php echo $row['Fecha']; ?></td>
                      <td><?php echo $row['Cliente']; ?></td>
                      <td><?php echo $row['Vendedor']; ?></td>
                    </tr>
                    <?php
                    }
                  }else {
                    if ($_GET['valor' == 'despacho']) {
                      try {
                        // calling stored procedure command
                        $sql = "CALL resumen_pedido('$fechaBusqueda')";
                        // prepare for execution of the stored procedure
                        $data = $db->query($sql)->fetchAll();
                    } catch (PDOException $e) {
                        die("Error occurred:" . $e->getMessage());
                    }
                      foreach ($data as $row) {
                          
                    ?>
  
                      <tr>
                        <td><?php echo $row['Nota']; ?></td>
                        <td><?php echo $row['Factura']; ?></td>
                        <td><?php echo $row['Fecha']; ?></td>
                        <td><?php echo $row['Cliente']; ?></td>
                        <td><?php echo $row['Vendedor']; ?></td>
                      </tr>
                      <?php
                      }
                    }
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

<?php include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?>   