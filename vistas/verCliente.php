<?php include '../includes/header.php'; 



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
<?php 

?>
                <!-- Buscador Tiempo Real -->
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="txtbusca" placeholder="Buscar" aria-label="Buscar" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">BUSCAR</span>
                    </div>
                </div>
                <div id="salida"></div>

              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      <script
            src="js/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
            $("#txtbusca").keyup(function(){
                var parametros="txtbusca="+$(this).val()
                $.ajax({
                    data:  parametros,
                    url:   'busquedaCliente.php',
                    type:  'post',
                    beforeSend: function () {},
                    success:  function (response) {                 
                    $("#salida").html(response);
                    },
                    error:function(){
                        alert("error")
                        }
                });
            })
        })
    </script>

      <?php  include '../includes/footer.php'; 
      ?>   