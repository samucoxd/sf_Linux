<?php 
include 'controlPedido/conexion.php';

$database = new Connection();
$db = $database->openConnection();


$sql = "SELECT MonthName(fecha) AS mes, count(*) AS numFilas FROM controlpedido  GROUP BY mes;";
  $stmt = $db->query($sql)->fetchAll();
  $db = $database->closeConnection();

//print_r($stmt);

  $meses = array('enero'=>0,'febrero'=>0,'marzo'=>0,'abril'=>0,'mayo'=>0,'junio'=>0,'julio'=>0,'agosto'=>0,'septiembre'=>0,'octubre'=>0,'noviembre'=>0,'diciembre'=>0);


  foreach ($stmt as $row) {
    switch ($row['mes']) {
      case 'January':
        $meses['enero'] = $row['numFilas'];
        break;
        case 'February':
        $meses['febrero'] = $row['numFilas'];
        break;
        case 'March':
        $meses['marzo'] = $row['numFilas'];
        break;
        case 'April':
        $meses['abril'] = $row['numFilas'];
        break;
        case 'May':
        $meses['mayo'] = $row['numFilas'];
        break;
        case 'June':
        $meses['junio'] = $row['numFilas'];
        break;
        case 'July':
        $meses['julio'] = $row['numFilas'];
        break;
        case 'August':
        $meses['agosto'] = $row['numFilas'];
        break;
        case 'September':
        $meses['septiembre'] = $row['numFilas'];
        break;
        case 'October':
        $meses['octubre'] = $row['numFilas'];
        break;
        case 'November':
        $meses['noviembre'] = $row['numFilas'];
        break;
        case 'December':
        $meses['diciembre']= $row['numFilas'];
        break;
      
      default:
        # code...
        break;
    }
  }

  //print_r($meses);
  echo json_encode($meses);

?>