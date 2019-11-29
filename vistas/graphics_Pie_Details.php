<?php 
include '../includes/header.php'; 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
?>




<?php
include '../includes/footer.php'; 
$database->closeConnection();
$db=null;
?> 