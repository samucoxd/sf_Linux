<?php

include_once '../config/conexion.php';
$db = new Connection();
$conn = $db->openConnection();

$nombreArchivo ="../libs/uploads/CodCliente.csv";

$dato;
$aux=1;
if (($gestor = fopen($nombreArchivo, "r")) !== FALSE) {
    while (($datos = fgetcsv($gestor, 1000, ";")) !== FALSE) {
        $dato[$aux-1] = array(
            "cod"         => $datos[0],
            "nombre"          => $datos[1],
     );
     $aux = $aux + 1;

    }
    fclose($gestor);
}

foreach ($dato as $value) {
    try {
        // begin the transaction
        $conn->beginTransaction();
        // our SQL statements

    $conn->exec("INSERT INTO cliente (idcliente, nombre,zona)
    VALUES ({$value['cod']},'{$value['nombre']})',null)");
    // commit the transaction
    $conn->commit();
    echo "New records created successfully";
    }
    catch(PDOException $e)
    {
    // roll back the transaction if something failed
    $conn->rollback();
    echo "Error: " . $e->getMessage();
    }
}




?>