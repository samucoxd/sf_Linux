<?php include '../includes/header.php'; ?>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Reporte Por Fecha</h6>
            </div>
            <div class="card-body col-md-3" >
              <div class="form-group">
                  <form action="reporte.php" method="post" target="_blank">
                      <label for="">Fecha Inicio</label>
                      <input type="date" class="form-control" name="fechaInicio">                    
                      <label for="">Fecha Fin</label>
                      <input type="date" class="form-control" name="fechaFin">
                      <input type="hidden" value="Reporte por Fecha" name="reporte">
                      <button class="btn btn-success" type="submit">Buscar</button>                    
                  </form>
              </div>
            </div>
          </div>
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Reporte Por Codigo Nota</h6>
            </div>
            <div class="card-body col-md-3" >
              <div class="form-group">
                <form action="reporte.php" method="post" target="_blank">
                    <label for="">Cod Nota</label>
                    <input type="text" class="form-control" name="cod">    
                    <input type="hidden" value="Reporte por Nota" name="reporte"> 
                    <button class="btn btn-success" type="submit">Buscar</button>                    
                </form>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <?php include '../includes/footer.php'; ?>   