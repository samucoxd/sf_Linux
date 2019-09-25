<?php 

if(isset($_POST['txtbusca'])){
    require 'controlPedido/conexion.php';
    $database = new Connection(); 
    $db = $database->openConnection();
    $u=$db->query("SELECT * FROM cliente WHERE codCliente LIKE '%$_POST[txtbusca]%'");
      $f="";
   foreach ($u as $v)
        $f.="<h1>".$v['nombreCliente']."</h1>";
   echo $f;
}
?>