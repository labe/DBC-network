var location_filters = [];
var group_filters = [];

$(document).ready(function(){

  //Clears any of the filters that have been selected
  $('.clear').click(function(event){
    $('.location_filters').prop('disabled', false);
    $('.group_filters').prop('disabled', false);
    $('.user_list li').show();
    $('.location_filters').show();
    $('.group_filters').show();
    group_filters = [];
    location_filters = [];
  });

  //Adds each clicked location filter to location_filters array and then passes that array into apply location filters
  $('.location_filters').click(function(event){
    event.preventDefault();
    location_filters.push($(this).attr('id'));
    apply_location_filters($(this).attr('id'));
    $(this).prop('disabled', true);
  });

  //Adds each clicked location filter to location_filters array and then passes that array into apply group filters
  $('.group_filters').click(function(event){
    event.preventDefault();
    group_filters.push($(this).attr('id'));
    apply_group_filters($(this).attr('id'));
    $(this).prop('disabled', true);
  });

  //Applies the location filters to the user list then calls for the group buttons to be hidden
  function apply_location_filters(selected_filters){
    console.log("location_filters" + location_filters.length)
    for(i in selected_filters){
      
      if (group_filters.length == 0 && location_filters.length == 1){
        $('.user_list li:visible').filter(':not(*[data-location="' + selected_filters +'"])').hide();
      }
      else if (group_filters.length >= 1 && location_filters.length == 1){
        $('.user_list li:visible').filter(':not(*[data-location="' + selected_filters +'"])').hide();
        apply_group_filters(group_filters);
      }
      else{
        $('.user_list li:hidden').filter('*[data-location="' + selected_filters +'"]').show();
        apply_group_filters(group_filters);
      }
      hide_group_buttons();
    };
  };

  function apply_group_filters(selected_filters){
    console.log("group_filters" + group_filters.length)
    for(i in selected_filters){
      if (group_filters.length == 1 && location_filters.length == 0){
        $('.user_list li').hide();
        $('*[data-group="' + selected_filters +'"]').show();
      }
      else {
        $('.user_list li:visible').filter(':not(*[data-group="' + selected_filters +'"])').hide();
      };
      hide_location_buttons();
      hide_group_buttons();
    };
  };

  function hide_location_buttons(){
    var visible_city = $('.user_list li:visible').filter('*[data-location]');
    $('.location_filters').hide();
    for (var i=0; i < visible_city.length ; i++){
      $('.location_filters:hidden').filter('*[id=' + visible_city[i].getAttribute('data-location') +']').show();
    };
  };

  function hide_group_buttons(){
    var visible_group = $('.user_list li:visible').filter('*[data-group]');
    $('.group_filters').hide();
    for (var i=0; i < visible_group.length ; i++){
      $('.group_filters:hidden').filter('*[id=' + visible_group[i].getAttribute('data-group') +']').show();
    };
  };
});

