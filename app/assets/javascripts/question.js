$(document).ready(function(){
  $('.question-answer').css('opacity','0.3');
  $('.question-answer').first().css('opacity','1');
  $(".question-answer :input").first().focus();
  // $('#intro_edit').click(function(){
  //   $('form#intro_change_form').toggle();
  // });
  // $('.question-answer').hover(
  //   function() {
  //     $(this).animate({"opacity":"1"}, 'fast');
  //   }, 
  //   function() {
  //     $(this).animate({"opacity":"0.3"}, 'fast');
  //   }
  // );
  $('.question-answer').click(
    function() {
      $(this).animate({"opacity":"1"}, 'fast');
      $(':input', this).focus();
  });
});
