<?php include '../includes/header.php'; ?>

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
                      <th>Fecha</th>
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>NoClie</th>
                      <th>Cliente</th>
                      <th>Preparacion</th>
                      <th>despacho</th>
                      <th>Cobrador</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Fecha</th>
                      <th>NoTran</th>
                      <th>NoFac</th>
                      <th>NoClie</th>
                      <th>Cliente</th>
                      <th>Preparacion</th>
                      <th>despacho</th>
                      <th>Cobrador</th>
                    </tr>
                  </tfoot>
                  <tbody>

                  <?php
                    require '../config/conexion.php';
                    $database = new Connection();
                    $db = $database->openConnection();
                    $mes=date("m");
                    $ano=date("Y");
                    $fechaBusqueda=$ano."-".$mes."-01";
                    //echo $fechaBusqueda;
                    $data = $db->query("CALL controlPendientes('$fechaBusqueda')")->fetchAll();
                    // and somewhere later:
                    foreach ($data as $row) {
                        
                  ?>

                    <tr>
                      <td><?php echo $row['fecha']; ?></td>
                      <td><?php echo $row['idNota']; ?></td>
                      <td><?php echo $row['noFac']; ?></td>
                      <td><?php echo $row['noClie']; ?></td>
                      <td><?php echo $row['cliente']; ?></td>
                      <?php if(empty($row['preparacion'])){ ?>
                        <td>N</td><?php }else {?>
                        <td><?php echo $row['preparacion']; ?></td>
                      <?php }?>
                      <?php if(empty($row['despacho'])){ ?>
                        <td>N</td>
                        <?php }else {?>
                          <td><?php echo $row['despacho']; ?></td>
                      <?php }?>
                      <?php if(empty($row['cobrador'])){ ?>
                        <td>N</td>
                        <?php }else {?>
                          <td><?php echo $row['cobrador']; ?></td>
                      <?php }?>
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

      <?php include '../includes/footer.php'; ?>   