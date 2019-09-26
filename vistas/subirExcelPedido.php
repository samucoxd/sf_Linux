<?php
include_once '../config/conexion.php';
$db = new Connection();
$conn = $db->openConnection();
$target_path = "../libs/uploads/";
$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
    echo "El archivo ".  basename( $_FILES['uploadedfile']['name']). 
    " ha sido subido";
} else{
    echo "Ha ocurrido un error, trate de nuevo!";
}


$nombreArchivo ="../libs/uploads/".basename( $_FILES['uploadedfile']['name']);
$nombreArchivo = "../libs/uploads/pedido.csv";
$dato;
$aux=1;
if (($gestor = fopen($nombreArchivo, "r")) !== FALSE) {
    while (($datos = fgetcsv($gestor, 1000, ";")) !== FALSE) {
     if ($aux >= 5) {
        $dato[$aux-1] = array(
            "fecha"         => $datos[3],
            "nota"          => $datos[4],
            "factura"       => $datos[5],
            "codCliente"    => $datos[6],
            "codVendedor"   => $datos[8]
     );
     }
     $aux = $aux + 1;

    }
    fclose($gestor);
}

foreach ($dato as $value) {
    try {
        // begin the transaction
        $conn->beginTransaction();
        // our SQL statements
        $date = DateTime::createFromFormat('d/m/Y', $value['fecha']);
        $fecha = $date->format('Y-m-d'); // => 2013-12-24
        $conn->exec("INSERT INTO pedido (idnota, idfac, fecha, cliente, vendedor)
        VALUES ({$value['nota']},{$value['factura']},'{$fecha}',{$value['codCliente']},{$value['codVendedor']})");
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


$conn = $db->closeConnection();
$conn = null;
?>