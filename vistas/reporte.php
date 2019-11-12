<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();


$resumen     =       $db->query("CALL resumenrapido({$_POST['nronota']})")->fetchAll();

print_r($resumen );
?>



<?php 
include '../includes/footer.php'; 
?>