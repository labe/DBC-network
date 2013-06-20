$(document).ready(function(e){
  e.preventDefault();
  $('.slider-button').toggle(function(){
      $(this).addClass('on').html('Activate');
  },function(){
      $(this).removeClass('on').html('Deactivate');
  });
});
