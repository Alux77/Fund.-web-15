$(document).ready(function() {
  
  $('form').submit(function(event)
  {
    event.preventDefault();
      $.post('/rolls', function(data)
    {
      $('#die').html(data);
    });
  });

});
