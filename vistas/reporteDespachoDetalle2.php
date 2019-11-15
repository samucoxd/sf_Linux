<?php 
include '../includes/header.php'; 
?>
<form action="reporteDespacho2.php" method="POST">
<div>
  <input type="radio" name="opcion" value="nota"
         checked>
  <label for="nota">nota</label>
</div>
<div>
  <input type="radio" name="opcion" value="factura"
         >
  <label for="factura">factura</label>
</div>
<div>
  <input type="radio" name="opcion" value="cliente"
         >
  <label for="cliente">cliente</label>
</div>
<div>
  <input type="radio" name="opcion" value="vendedor"
         >
  <label for="vendedor">vendedor</label>
</div>
    <button type="submit">Buscar</button>
</form>
<?php 
include '../includes/footer.php'; 
?>