<?php
    require 'conexion.php';
    $database = new Connection();

    require 'PHPExcel/IOFactory.php';

	//$nombreArchivo = 'prn5A.xls';
    $nombreArchivo ="prnBD30.xls";
    
	$objPHPExcel = PHPEXCEL_IOFactory::load($nombreArchivo);
	
	$objPHPExcel->setActiveSheetIndex(0);
	
	$numRows = $objPHPExcel->setActiveSheetIndex(0)->getHighestRow();
    print_r($numRows);
    $db = $database->openConnection();
    
	for($i = 2; $i <= $numRows; $i++){
        $codCliente = $objPHPExcel->getActiveSheet()->getCell('A'.$i)->getCalculatedValue();
		$nombreCliente = $objPHPExcel->getActiveSheet()->getCell('B'.$i)->getCalculatedValue();

        $sql = 'CALL insertarCliente(:codCliente,:nombreCliente)';
 
        // prepare for execution of the stored procedure
        $stmt = $db->prepare($sql);

        // pass value to the command
        $stmt->bindParam(':codCliente', $codCliente, PDO::PARAM_INT);
        $stmt->bindParam(':nombreCliente', $nombreCliente, PDO::PARAM_STR);
        // execute the stored procedure
        $stmt->execute();

    }
    $database->closeConnection();
    
    //header( "refresh:0; url=../registroPiking.php" );
	
?>