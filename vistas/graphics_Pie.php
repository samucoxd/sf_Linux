<?php 
include 'controlPedido/conexion.php';

$database = new Connection();
$db = $database->openConnection();


$sql = "SELECT cobrador,count(*) as total from despachoalmacen group by cobrador;";
  $stmt = $db->query($sql)->fetchAll();
  $db = $database->closeConnection();

//print_r($stmt);

  $cobrador = array('jvargas'=>0,'msuarez'=>0,'mlino'=>0,'esolar'=>0,'dsanchez'=>0,'parteaga'=>0);


  foreach ($stmt as $row) {
    switch ($row['cobrador']) {
        case 'David Sanchez':
        $cobrador['dsanchez'] = $row['total'];
        break;
        case 'Efrain Solar':
        $cobrador['esolar'] = $row['total'];
        break;
        case 'Javier Vargas':
        $cobrador['jvargas'] = $row['total'];
        break;
        case 'Marco Suarez':
        $cobrador['msuarez'] = $row['total'];
        break;
        case 'Marwin Lino':
        $cobrador['mlino'] = $row['total'];
        break;
        case 'Pablo Artega':
        $cobrador['parteaga'] = $row['total'];
        break;
      
      default:
        # code...
        break;
    }
  }

  //print_r($cobrador);
  echo json_encode($cobrador);

?>