$(document).ready(function(){


  $('#search').on('keyup', function(){
    var search = $('#search').val()
    $.ajax({
      type: 'POST',
      url: 'search.php',
      data: {'search': search},
      beforeSend: function(){
        $('#result').html('<img src="../libs/img/pacman.gif">')
      }
    })
    .done(function(resultado){
      $('#result').html(resultado)
    })
    .fail(function(){
      alert('Hubo un error :(')
    })
  })
})