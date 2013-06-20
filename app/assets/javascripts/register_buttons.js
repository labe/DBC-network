$(document).ready(function(){
  $('#company').css('opacity','0.001');
  $('#employer').hover(
    function() {
      $('#company').animate({"opacity":"1"}, "fast");
    }, 
    function() {
      $('#company').css("opacity","0.001");
    }
  );
  $('#company').hover(
    function() {
      $('#company').animate({'opacity': '1'}, 500);
    },
    function() {
      $('#company').animate({'opacity': '.001'}, "fast");
    }
  );
});
