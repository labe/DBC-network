$(document).ready(function(){
  $('form#intro_change_form').hide();
  $('#intro_edit').click(function(){
    $('form#intro_change_form').toggle();
  });
});
