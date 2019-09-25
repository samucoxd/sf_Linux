<?php
if (isset($_POST['cobrador'])) {
  echo $_POST['cobrador'];
}

?>



<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="">
  </head>
  <body>
    <!--[if lt IE 7]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <form method="post" action="">
    <select name="cobrador" required  id="padre">
      <option disabled="disabled" selected value="">Seleccione un Cobrador</option>
      <option value="Javier Vargas">Javier Vargas</option> 
      <option value="" id="otro">Otro</option>
    </select>
    <input onclick="alerta('padre');" type="submit" value="enviar">
    </form>
    
    <script>
      function alerta(padre) 
          {
            var element = document.getElementById(padre);
          var otro = element.options[element.selectedIndex].text;
          if (otro == "Otro") {
            var opcion = prompt("Introduzca un nombre:", "Introduzca un nombre");
            
            if (opcion == null || opcion == "") {
                  mensaje = "Has cancelado o introducido el nombre vacío";
                  } else {
                    element.options[element.selectedIndex].value = opcion;
                      }
          }
          }
    </script>
  </body>
</html>