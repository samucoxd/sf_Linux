<?php
include '../includes/header.php'; 
?>


        <input type="text" class="form-control" id="search" placeholder="Search video">


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
<tbody id="result">

</tbody>
</table>
</div>
</div>
</div>
</div>
</div>







<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript" src="../libs/js/buscador.js"></script>


<?php
include '../includes/footer.php'; 
?>  


