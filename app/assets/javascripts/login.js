$(document).ready(function(){
  $('form.login').css('visibility','hidden');
  $('.login_button').click(function(){
    $('.login').css({opacity: 0, visibility: "visible"}).animate({opacity: 1}, 200);
    $('.login_button').hide();
    $('#target').focus();
  });
});
