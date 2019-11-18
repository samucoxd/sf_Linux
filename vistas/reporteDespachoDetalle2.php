<?php 
include '../includes/header.php'; 
?>
<form action="reporteDespacho2.php" method="POST">
<div>
  <input type="radio" name="opcion" value="nota"checked>
  <label for="nota">nota</label>
</div>
<div>
  <input type="radio" name="opcion" value="factura">
  <label for="factura">factura</label>
</div>
<div>
  <input type="radio" name="opcion" value="cliente">
  <label for="cliente">cliente</label>
</div>
<div>
  <input type="radio" name="opcion" value="vendedor">
  <label for="vendedor">vendedor</label>
</div>
<div>
  <input type="radio" name="opcion" value="cobrador">
  <label for="vendedor">Cobrador</label>
</div>
<div>
  <input type="text" name="valor" placeholder="Valor">
  <label for="Valor">Valor</label>
</div>
<div>
  <input type="number" name="limite" value="10">
  <label for="Valor">Valor</label>
</div>
    <button type="submit">Buscar</button>
</form>
<?php 
include '../includes/footer.php'; 
?>