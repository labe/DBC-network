function overlay(e) {
	var docHeight = $(document).height();
	$("body").append("<div id='overlay'><div id='box'></div></div>");
	$('#box').append(
	"<span>Student Signup</span><br> \
<form accept-charset='UTF-8'F action='/log_in' class='login' method='post'><br> \
<input id='email' name='email' placeholder='Email' type='text'/><br> \
<input id='password' name='password' placeholder='Password' type='password'/><br> \
<input name='commit' type='submit' value='Login'/></form>")
		.css({
			'background-color' : 'rgba(255, 255, 255, 100)',
			'position' :'absolute',
			'text-align' : 'center',
			'top' : '25%',
			'left' : '25%',
			'width' : '50%',
			'height' : '50%',
			'border-radius' : '25px',
			'z-index' : 4999
		}).hide().show(('slow','scale'));
	$("#overlay")
		.height(docHeight)
		.css({
			'position' : 'absolute',
			'top' : 0,
			'left' : 0,
			'background-color' : 'rgba(0,0,0,0.5)',
			'width' : '100%',
			'z-index' : 5000
		});
		$('body div #box form').on('submit',function(e){
			e.preventDefault();
			console.log(this);
			$(this).replaceWith('<div>Thanks we will be in touch soon!</div>');
		});
}

$(document).ready(function(){
		$('.login_button').click(function(e){
			e.preventDefault();
			overlay();
		});

});