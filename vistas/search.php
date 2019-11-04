<?php 
include '../config/conexion.php';

if(!isset($_POST['search'])) exit('No se recibió el valor a buscar');

function search()
{
  try {
    $database = new Connection();
    $db = $database->openConnection();
    $search = $_POST['search'];
    $query = "call buscar_despacho_x_nota('{$search}')";
    $res = $db->query($query)->fetchAll();
    $transporte = $db->query("call lista_transporte")->fetchAll();
    $destino = $db->query("call lista_destino")->fetchAll();
    foreach ($res as $row) {
      echo '
      <tr>
      <form action="registroDestinos.php" method="post">
      <td>'.$row["idpedido"].'</td>
      <td><input type="date" name="fecha" id=""></td>
      <td><input type="time" name="hora" id=""></td>
      <td>
        <select name="transporte" required>
        <option disabled="disabled" selected value="">Seleccione un transporte</option>';
        foreach ($transporte as $trans) {
          echo '<option value="'.$trans['idtransporte'].'">'.$trans['nombre'].'</option> ';
        }
      echo '</select>
      </td>
      <td>
      <select name="destino" required>
        <option disabled="disabled" selected value="">Seleccione un destino</option>';
        foreach ($destino as $dest) {
          echo '<option value="'.$dest['iddestino'].'">'.$dest['nombre'].'</option> ';
        }
      echo'</select>
      </td>
      <td><input type="text" value="guia"></td>
      <input type="hidden" value="dato" name="dato">
      <input type="hidden" value="'.$row["idpedido"].'" name="Nota">
      <td><button type="submit" class="btn btn-success">Grabar</button></td>
      </form>
      </tr>
    ';
    }
  } catch (PDOException $ex) {
    die($ex->getMessage());
  }
}

search();



