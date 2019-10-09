<?php 
include '../config/conexion.php';

if(!isset($_POST['search'])) exit('No se recibió el valor a buscar');

function search()
{
  $database = new Connection();
  $db = $database->openConnection();
  $search = $_POST['search'];
  $query = "SELECT idpedido FROM despacho WHERE idpedido LIKE '%$search%' ";
  $res = $db->query($query)->fetchAll();
  foreach ($res as $row) {
    echo "<p>$row[idpedido]</p>";
  }
}

search();