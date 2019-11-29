<?php 
require '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();

$stmt = $db->query("call cantidadError()")->fetchAll();

//create an array
$array = array();

foreach ($stmt as $row) {
    $nombre = $row['nombre'];
    $cantidad = $row['cantidad'];
    $array['cols'][] = array('type' => 'string'); 
    $array['rows'][] = array('c' => array( array('v'=> $nombre), array('v'=>(int)$cantidad)) );
}

$database->closeConnection();
$db=null;

$data = json_encode($array);
echo $data;


?>