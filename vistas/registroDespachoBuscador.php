<?php 
include '../includes/header.php'; 
?>

<form class="form-inline" method="POST" action="registroDespacho2.php">
  <div class="form-group mx-sm-3 mb-2">
    <label>Ingrese el Numero de Nota </label>
    <input type="text" class="form-control" name="nronota" placeholder="# Nota">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Buscar</button>
</form>

<?php 
include '../includes/footer.php'; 
?>