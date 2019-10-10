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
    //echo "<p>$row[idpedido]</p>";
    echo '
<tr>
<form action="" method="post">
<td><input type="text" value="'.$row["idpedido"].'"></td>
<td><input type="date" name="" id=""></td>
<td><input type="time" name="" id=""></td>
<td><input type="text" value="transporte"></td>
<td><input type="text" value="destino"></td>
<td><input type="text" value="guia"></td>
<td><input type="submit" value="Grabar"></td>
</form>
</tr>
    ';
  }
}

search();



