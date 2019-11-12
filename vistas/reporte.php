<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

echo $_POST['nronota'];
$resumen = $db->query("CALL resumenrapido({$_POST['nronota']})")->fetchAll();

echo count($resumen);

include '../includes/footer.php'; 
?>