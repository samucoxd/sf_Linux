<?php 
include '../includes/header.php'; 
?>
<form action="reporteDespacho2.php" method="POST">
    <input type="radio" name="opcion" value="nota">
    <input type="radio" name="opcion" value="factura">
    <input type="radio" name="opcion" value="cliente">
    <input type="radio" name="opcion" value="vendedor">
    <input type="text" name="valor" placeholder="Valor">
    <button type="submit">Buscar</button>
</form>
<?php 
include '../includes/footer.php'; 
?>