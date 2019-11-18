<?php 
include '../includes/header.php'; 
?>
<div class="jumbotron">
  <h1>Reporte Detallado de Pedido</h1>      
  <p>Busqueda por Criterio, elegir alguna opcion de busqueda, escribir el valor de la busqueda ej.:"farmacia beniana", determinar la cantidad de registros a mostrar de forma descendente por fecha. </p>
</div>


<div class="container-fluid">
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
<form action="reporteDespacho2.php" method="POST">
<div class="form-check">
  <input class="form-check-input" type="radio" name="opcion" value="nota"checked>
  <label for="nota">nota</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="opcion" value="factura">
  <label for="factura">Factura</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="opcion" value="cliente">
  <label for="cliente">Cliente</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="opcion" value="vendedor">
  <label for="vendedor">Vendedor</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="opcion" value="cobrador">
  <label for="vendedor">Cobrador</label>
</div>
<div>
  <input type="text" name="valor" placeholder="Valor">
  <label for="Valor">Valor</label>
</div>
<div>
  <input type="number" name="limite" value="10">
  <label for="Valor">Cantidad de Registros</label>
</div>
    <button class="btn btn-success" type="submit">Buscar</button>
</form>
      </div>
      </div>
      </div>
      </div>
<?php 
include '../includes/footer.php'; 
?>