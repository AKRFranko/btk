( function( $ ) {

	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		scrollTop: $('body').offset().top
		}, 300
	);

} )( jQuery );

