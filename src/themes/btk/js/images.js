( function( $ ) {

	var replaceImages = function(){
		$('img[data-hires-image]').each( function(){
			$(this).attr('src', $(this).data( 'hires-image' ) )

		});
	}
	$( function(){
		window.requestAnimationFrame(  replaceImages );
		
	})
})( jQuery )