<?php
include '../includes/header.php'; 
?>

<div class="container">
  <div class="page-header text-left">
    <h1>Buscador en tiempo real <small>con Jquery(ajax), Php y Mysql</small></h1>
  </div>
  <div class="row">
    <div class="col-md-3">
      <div class="input-group">
        <span class="input-group-addon"><span class="glyphicon glyphicon glyphicon-search" aria-hidden="true"></span></span>
        <input type="text" class="form-control" id="search" placeholder="Search video">
      </div>
    </div>
    <div class="col-md-3 col-md-offset-3" id="result">
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript" src="../libs/js/buscador.js"></script>


<?php
include '../includes/footer.php'; 
?>  


