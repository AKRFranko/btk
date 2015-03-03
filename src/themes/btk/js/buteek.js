( function( $ ) {

	// back to top
	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop:0
		}, 100);
		return false;
	});


	// sign in behaviour
	$('#menu-header a:first').on('click', function(e) {
		e.preventDefault();
/*
		if ( $('.nav-collapse').is(':visible') ) {
			$('.collapse').collapse('hide');
			$('.navbar-header .fa').removeClass('fa-times').addClass('fa-bars');
		}
		if ( $('#header-box').hasClass('open') ) {
			$('#header-box').removeClass('open');
			$('.sign-in').hide();
		} else {
			$('#header-box').addClass('open');
			$('.sign-in').show();
		}
*/
		if ( ! $('#header-box').hasClass('open') ) {
			$('#header-box').addClass('open');
			$('.sign-in').show();
			$('.back-home').show();
		}
		return false;
	});

	$('.back-home .button').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.back-home').hide();
		$('#header-box').removeClass('open');
		return false;
	});


	// hamburger menu on/off
	$('.nav-hamburger .navbar-toggle').click( function () {
		if (  $('.sign-in').is(':visible') ) {
			$('.sign-in').hide();
			$('.back-home').hide();
			$('#header-box').removeClass('open');
		}
		if ( $(this).hasClass('collapsed') ) {
			$('#header-box').addClass('open');
			$('.navbar-header .fa').removeClass('fa-bars').addClass('fa-times');
		} else {
			$('#header-box').removeClass('open');
			$('.navbar-header .fa').removeClass('fa-times').addClass('fa-bars');
		}
	});

} )( jQuery );

