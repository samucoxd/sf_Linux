<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

$resumen = $db->query("CALL resumenrapido({$_POST['nronota']})")->fetchAll();

echo count($resumen);

?>



<?php 
include '../includes/footer.php'; 
?>