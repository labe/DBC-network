test = [];
$(document).ready(function(){
$( ".all_repos tr" ).draggable({helper: 'clone'});
$( "#github_list_showing" ).droppable({
  drop: function(event,ui) {
  if($(this).find('tr').length >= 6){
          $(this).draggable({ disabled: true });
          $(this).parent().prepend("Sorry Brah Only 5 Top Repos Allowed");
        }
    else { $(this).append(ui.draggable);
    test.push($(this).find('td:last').text());
  }
  }
});
$("form.git_save").submit(function(e){
  e.preventDefault();
  $.post("/users/"+this.id+"/edit/github", { selected: test });
});
});