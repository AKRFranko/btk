( function( $ ) {

	// back to top
	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop:0
		}, 100);
	});



	// sign in behaviour
	$('#menu-header a:first').on('click', function(e) {
		e.preventDefault();
		if ( ! $('#header-box').hasClass('open') ) {
			$('#header-box').addClass('open');
			$('.sign-in-menu').show();
			$('.sign-in').show();
			$('.login').hide();
			$('.register').hide();
			$('.back-home').show();
		} else if (  $('.sign-in, .login, .register').is(':visible') ) {
			$('.sign-in-menu').hide();
			$('#header-box').removeClass('open');
		}
	});

	$('.back-home .buttons').on('click', function(e) {
		e.preventDefault();
		$('.sign-in-menu').hide();
		$('#header-box').removeClass('open');
	});

	$('.signin').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.login').show();
	});

	$('.signup').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.register').show();
	});



	// hamburger menu on/off
	$('.nav-hamburger .navbar-toggle').click( function () {
		if (  $('.sign-in, .login, .register').is(':visible') ) {
			$('.sign-in-menu').hide();
			$('#header-box').removeClass('open');
		}
		if ( $(this).hasClass('collapsed') ) {
			$('#header-box').addClass('open');
			$('#header-box .confirmation').hide();
			$('.navbar-header .fa').removeClass('fa-bars').addClass('fa-times');
		} else {
			$('#header-box').removeClass('open');
			$('#header-box .confirmation').show();
			$('.woo-categories').hide();
			$('.navbar-header .fa').removeClass('fa-times').addClass('fa-bars');
		}
	});


	$('#menu-hamburger li a[href*="products"]').click( function (e) {
		e.preventDefault();
		$('.woo-categories').toggle();
	});


	// carousel principal
	$('.slider').bxSlider({
		nextSelector: '#main-next',
		prevSelector: '#main-prev',
		nextText: '',
		prevText: '',
		pager: true,
		pagerType: 'short',
		pagerShortSeparator: ' | '
	});

/*
	// carousel collections
	$('.slider-collections').bxSlider({
		nextSelector: '#coll-next',
		prevSelector: '#coll-prev',
		nextText: '',
		prevText: '',
		pager: false
	});

	// carousel news
	$('.slider-news').bxSlider({
		nextSelector: '#news-next',
		prevSelector: '#news-prev',
		nextText: '',
		prevText: '',
		pager: false
	});

	// carousel article
	$('.slider-article').bxSlider({
		nextSelector: '#article-next',
		prevSelector: '#article-prev',
		nextText: '',
		prevText: '',
		pager: false
	});
*/

	// slider product images
	$('.product-slider').bxSlider({
		nextSelector: '#controls-next',
		prevSelector: '#controls-prev',
		nextText: '',
		prevText: '',
		pager: true,
		pagerType: 'short',
		pagerShortSeparator: ' | '
	});




	$('.entry-content p:has(img)').css('margin', '0');
	$('.pdf p:has(a)').append('<span class="icon-chevron-lite-right-black"></span>');
	$('.woocommerce .quantity').prepend('<a href="" class="qty-sub">-</a>').append('<a href="" class="qty-add">+</a>');
	$('.woocommerce .quantity input').attr('readonly', 'readonly');

	$('.qty-sub').click(function(e) {
		e.preventDefault();
		var val = $(this).parent().children('.qty');
		if ( val.val() > 1 ) {
			val.val( Number( val.val() ) - 1 );
		}
	});
	$('.qty-add').click(function(e) {
		e.preventDefault();
		var val = $(this).parent().children('.qty');
		val.val( Number( val.val() ) + 1 );
	});


	$('#terms').on('change', function() {
		alert('test');
		console.log('test');
		if ( $(this).is(':checked') ) {
			$(this).removeClass('fa-square').addClass('fa-check-square');
		} else {
			$(this).removeClass('fa-check-square').addClass('fa-square');
		}
	});


	if ( ! $('#terms').prop('checked') ) {
		$(this).addClass('fa-square').removeClass('fa-check-square');
	} else {
		$(this).addClass('fa-check-square').removeClass('fa-square');
	}


} )( jQuery );

