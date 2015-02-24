( function( $ ) {
	$(window).scroll(function(e) {
		if ($(window).scrollTop() > 0) {
			$('#header-box').css('position', 'fixed');
			$('.title-top').hide();
			$('.title-scroll').show();
		} else {
			$('#header-box').css('position', 'static');
			$('.title-top').show();
			$('.title-scroll').hide();
		}
	});

	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		scrollTop: $('body').offset().top
		}, 300
	);
} )( jQuery );

