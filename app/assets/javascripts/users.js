var selected_filters = [];

$(document).ready(function(){
  
  //Clears any of the filters that have been selected
  $('.clear').click(function(event){
    $('.filters').prop('disabled', false);
    $('.user_list li').show();
  });

  //Adds each clicked filter to selected_filters array and then passes that array into apply filters 
  $('.filters').click(function(event){
    event.preventDefault;
    selected_filters.push($(this).attr('id'));
    apply_filters(selected_filters);
    $(this).prop('disabled', true);
  });

  //Applies the filters to the List
  function apply_filters(selected_filters){
    $('.user_list li').hide();

    for(i in selected_filters){
      if ($('.user_list li:visible').length == 0){
          $('*[data-location="'+ selected_filters[i] +'"]').show();
          $('*[data-cohort="'+ selected_filters[i] +'"]').show();
          $('*[data-status="'+ selected_filters[i] +'"]').show();
      }
      else {
        $('.user_list li:hidden').filter('*[data-location="'+ selected_filters[i] +'"]').show();
        $('.user_list li:hidden').filter('*[data-cohort="'+ selected_filters[i] +'"]').show();
        $('.user_list li:hidden').filter('*[data-status="'+ selected_filters[i] +'"]').show();
      };
    };
  };
});
