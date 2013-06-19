test = [];

$(document).ready(function(){
  $('#git_error').hide();
  $.each($( "#github_list_showing tr td"),function(index,value){
    test.push($(value).data());
  });

  $( ".all_repos tr" ).draggable({helper: 'clone'});
  $( "#github_list_showing" ).droppable({
    drop: function(event,ui) {
      if($(this).find('tr').length >= 6){
        $(this).draggable({ disabled: true });
        $('#git_error').show();
        $('#git_error').css({"color" : "red"});
        setTimeout(function(){$('#git_error').hide();},5000);
      }
      else { $(this).append(ui.draggable);
        test.push($(this).find('td:last').data());
      }
    }
  });
  $( "#github_list_showing tr" ).draggable({helper: 'clone'});
  $( ".all_repos" ).droppable({
    drop: function(event,ui) {
     $(this).append(ui.draggable);
        test.pop($(this).find('td:last').data());
      }
  });
  $("form.git_save").submit(function(e){
    e.preventDefault();
    test.shift();
    $.post("/users/"+this.id+"/edit/github", { selected: test });
  });
});