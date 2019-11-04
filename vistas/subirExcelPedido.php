<?php
include_once '../config/conexion.php';
$database = new Connection();
$db = $database->openConnection();
$target_path = "../libs/uploads/";
$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
    echo "El archivo ".  basename( $_FILES['uploadedfile']['name']). 
    " ha sido subido";
} else{
    echo "Ha ocurrido un error, trate de nuevo!";
}


$nombreArchivo ="../libs/uploads/".basename( $_FILES['uploadedfile']['name']);
//$nombreArchivo = "../libs/uploads/pedido.csv";
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
            "codVendedor"   => $datos[8],
            "ventaBruta"    => $datos[10]
     );
     }
     $aux = $aux + 1;

    }
    fclose($gestor);
}


foreach ($dato as $value) {
    try {
        if ($value['ventaBruta'] > 0) {
		

        $date = DateTime::createFromFormat('d/m/Y', $value['fecha']);
        $fecha = $date->format('Y-m-d'); // => 2013-12-24
        $sql = 'CALL registrar_pedido(:idnota,:idfac,:fecha,:cliente,:vendedor)';
 
        // prepare for execution of the stored procedure
        $stmt = $db->prepare($sql);
      
        // pass value to the command
        $stmt->bindParam(':idnota', $value['nota'], PDO::PARAM_INT);
        $stmt->bindParam(':idfac', $value['factura'], PDO::PARAM_INT);
        $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);
        $stmt->bindParam(':cliente', $value['codCliente'], PDO::PARAM_INT);
        $stmt->bindParam(':vendedor', $value['codVendedor'], PDO::PARAM_INT);
      
        // execute the stored 
        $stmt->execute();
        echo "{$value['nota']}  REGISTRADO <br>";
        }
        
    }
    catch(PDOException $ex)
    {
        echo "{$value['nota']}  NO REGISTRADO <br>";
        die($ex->getMessage());
    }

}
$database->closeConnection();
$db=null;
?>
