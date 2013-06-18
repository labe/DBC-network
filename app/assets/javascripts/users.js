var location_filters = [];
var group_filters = [];
var status_filters = [];

// var unique = $.unique('.user_list li:visible').attr('data');


$(document).ready(function(){

  //Clears any of the filters that have been selected
  $('.clear').click(function(event){
    $('.location_filters').prop('disabled', false);
    $('.group_filters').prop('disabled', false);
    $('.user_list li').show();
    $('.location_filters').show();
    group_filters = [];
    location_filters = [];
    status_filters = [];
  });

  //Adds each clicked filter to selected_filters array and then passes that array into apply filters
  $('.location_filters').click(function(event){
    event.preventDefault();
    location_filters.push($(this).attr('id'));
    apply_location_filters(location_filters);
    $(this).prop('disabled', true);
  });

  $('.group_filters').click(function(event){
    event.preventDefault();
    group_filters.push($(this).attr('id'));
    apply_group_filters(group_filters);
    $(this).prop('disabled', true);
  });

  //Applies the filters to the List
  function apply_location_filters(selected_filters){
    $('.user_list li').hide();

    for(i in selected_filters){
      if ($('.user_list li:visible').length == 0){
         // $('*[data-' + selected_filters[i] +']').show();
         $('*[data-location="' + selected_filters[i] +'"]').show();
      }
      else {
        $('.user_list li:hidden').filter('*[data-location="' + selected_filters[i] +'"]').show();
      };
    };
  };

  function apply_group_filters(selected_filters){
    
    for(i in selected_filters){
      if ($('.user_list li:visible').length == 0){
         $('*[data-group="' + selected_filters[i] +'"]').show();
      }
      else {
        $('.user_list li:visible').filter('*[data-group="' + selected_filters[i] +'"]').hide();
        hide_location_buttons();
      };
    };
  };

  function hide_location_buttons(){
    var visible_city = $('.user_list li:visible').filter('*[data-location]');
    $('.location_filters').hide();
    for (var i=0; i < visible_city.length ; i++){
      $('.location_filters:hidden').filter('*[id=' + visible_city[i].getAttribute('data-location') +']').show();
    };
  };
});


// if group button is clicked
//   get button id
//   hide all students without data attribute = button id
//   hide all location buttons that don't have at least one data location id from visible user_list

// var unique = $('.user_list li:visible').filter(function(itm,i,a){
//     return i==a.indexOf(itm);
// });

// if location-button is clicked
//   get button id
//   hide any users on user_list without id


