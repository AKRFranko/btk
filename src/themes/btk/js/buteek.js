( function( $ ) {

	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop:0
		}, 800);
		return false;
	});

} )( jQuery );

