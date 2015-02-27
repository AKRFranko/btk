( function( $ ) {

	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop:0
		}, 100);
		return false;
	});

	$('.nav-hamburger .navbar-toggle').click( function () {
		if ( $(this).hasClass('collapsed') ) {
			$('#header-box').addClass('open');
			$('.navbar-header .fa').removeClass('fa-bars').addClass('fa-times');
		} else {
			$('#header-box').removeClass('open');
			$('.navbar-header .fa').removeClass('fa-times').addClass('fa-bars');
		}
	});

} )( jQuery );

