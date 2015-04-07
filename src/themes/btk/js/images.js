( function( $ ) {
	$( function(){
		$('img[data-hires-image]').each( function(){
			$(this).attr('src', $(this).data( 'hires-image' ) )

		});
	})
})( jQuery )