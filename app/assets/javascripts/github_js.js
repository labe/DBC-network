test = []

$(document).ready(function(){
$( ".all_repos tr" ).draggable({helper: 'clone'});
$( "#github_list_showing" ).droppable({
  drop: function(event,ui) {
    $(this).append(ui.draggable);
    test.push($(this).find('td:last').text());
  }
});
$(".git_save").submit(function(e){
  e.preventDefault();
  debugger;
  $.post("/users/"+this.id+"/edit/github", { selected: test });
});
});