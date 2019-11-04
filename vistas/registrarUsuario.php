<?php
session_start();
include '../config/controlPedido/conexion.php';
include '../libs/includes/header.php'; 
$database = new Connection();
$db = $database->openConnection();
if(isset($_POST['registrar'])){
  $nombre=$_POST['nombre'];
  $apellidos=$_POST['apellidos'];
  $cargo=$_POST['cargo'];
  $usuario=$_POST['usuario'];
  $password1=$_POST['password1'];
  $password2=$_POST['password2'];

  if ($password1 != $password2) {
    echo "<meta http-equiv='Refresh' content='0;URL=registrarUsuario.php'>";
    $_SESSION['mensaje']  = 'Las Contraseñas no son iguales';
  }else{
    session_destroy();
  }

  // calling stored procedure command
  $sql = 'insert into usuario(idUsuario,nombre,apellidos,cargo,nombreUsuario,pass) values(:idUsuario,:nombre,:apellidos,:cargo,:nombreUsuario,:pass)';
 
  // prepare for execution of the stored procedure
  $stmt = $db->prepare($sql);

  // pass value to the command
  $stmt->bindParam(':codigo', $codigo, PDO::PARAM_INT);
  $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);

  try {
	$stmt->execute();
	echo "<meta http-equiv='Refresh' content='0;URL=registroCliente.php'>";
  } catch (PDOException $e) {
	  echo $e->getMessage();
  }

}
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Crear Cuenta Usuario</h1>
                <h3><?php if (isset($_SESSION['mensaje'])) {
                  if (!empty($_SESSION['mensaje'])) {
                    echo $_SESSION['mensaje'];
                    unset($_SESSION['mensaje']);
                    session_destroy();
                  }
                } ?></h3>
              </div>
              <form class="user" method="POST" action="">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="nombre" placeholder="Nombre">
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="apellidos" placeholder="Apellidos">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="cargo" placeholder="Cargo">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="usuario" placeholder="Usuario">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password1" placeholder="Password">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="password2" placeholder="Repeat Password">
                  </div>
                </div>
                <a type="submit" name="registrar" value="registrar" class="btn btn-primary btn-user btn-block">
                  Registrar Cuenta
                </a>
                <hr>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="#">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <?php include '../includes/footer.php'; ?>   
