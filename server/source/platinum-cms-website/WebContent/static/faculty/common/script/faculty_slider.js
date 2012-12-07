$(document).ready(function()
{
	//	make the sidebar fixed when scrolling down the screen
	var top = $('#sidebar').offset().top - parseFloat($('#sidebar').css('marginTop').replace(/auto/, 0));
	  $(window).scroll(function (event) {
	    // what the y position of the scroll is
	    var y = $(this).scrollTop();

	    // whether that's below the form
	    if (y >= top) {
	      // if so, ad the fixed class
	      $('#sidebar').addClass('fixed');
	    } else {
	      // otherwise remove it
	      $('#sidebar').removeClass('fixed');
	    }
	  });	
});