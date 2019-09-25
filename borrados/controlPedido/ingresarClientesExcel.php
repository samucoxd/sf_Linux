<?php

    require 'PHPExcel/IOFactory.php';
    require 'conexion.php';

	$nombreArchivo = 'ClenteXzona.xls';
	
	$objPHPExcel = PHPEXCEL_IOFactory::load($nombreArchivo);
	
	$objPHPExcel->setActiveSheetIndex(0);
	
	$numRows = $objPHPExcel->setActiveSheetIndex(0)->getHighestRow();
	
	for($i = 5; $i <= $numRows; $i++){
        $cod = $objPHPExcel->getActiveSheet()->getCell('A'.$i)->getCalculatedValue();
        $nombre = $objPHPExcel->getActiveSheet()->getCell('B'.$i)->getCalculatedValue();
		$zona = $objPHPExcel->getActiveSheet()->getCell('C'.$i)->getCalculatedValue();
        try
        {
            $database = new Connection();
            $db = $database->openConnection();
            // inserting data into create table using prepare statement to prevent from sql injections
            $stm = $db->prepare("INSERT INTO cliente (codCliente,nombreCliente,zona) 
            VALUES (:codCliente,:nombreCliente,:zona)") ;
            // inserting a record
            $stm->execute(array(
            ':codCliente' => $cod ,
            ':nombreCliente' => $nombre , 
            ':zona' => $zona ));
            //echo "New record created successfully";
            $database->closeConnection();
        }
        catch (PDOException $e)
        {
            echo "There is some problem in connection: " . $e->getMessage();
        }
        
	}
	
?>