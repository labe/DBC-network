function overlay(e) {
	e.preventDefault();
	var docHeight = $(document).height();
	$("body").append("<div id='overlay'><div id='box'></div></div>");
	$('#box').append(
	"<form>First name: <input type='text' name='firstname'> \
	<br>Last name: <input type='text' name='lastname'></form> \
	<input type='submit' value='Submit'>")
		.css({
			'background-color' : 'white',
			'position' :'absolute',
			'text-align' : 'center',
			'top' : '25%',
			'left' : '25%',
			'width' : '50%',
			'height' : '50%'
		});
	$("#overlay")
		.height(docHeight)
		.css({
			'opacity' : 0.4,
			'position' : 'absolute',
			'top' : 0,
			'left' : 0,
			'background-color' : 'black',
			'width' : '100%',
			'z-index' : 5000
		});
}

$(document).ready(function(){
		$('button').on('click',overlay);
});

