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
		if ( ! $('#header-box').hasClass('open') ) {
			$('#header-box').addClass('open');
			$('.sign-in-menu').show();
			$('.sign-in').show();
			$('.login').hide();
			$('.register').hide();
			$('.back-home').show();
		}
		return false;
	});
	$('.back-home .button').on('click', function(e) {
		e.preventDefault();
		$('.sign-in-menu').hide();
		$('#header-box').removeClass('open');
		return false;
	});

	$('.signin').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.login').show();
		return false;
	});
	$('.signup').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.register').show();
		return false;
	});



	// hamburger menu on/off
	$('.nav-hamburger .navbar-toggle').click( function () {
		if (  $('.sign-in').is(':visible') ) {
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
		return false;
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

	// carousel news
	$('.slider-article').bxSlider({
		nextSelector: '#article-next',
		prevSelector: '#article-prev',
		nextText: '',
		prevText: '',
		pager: false
	});



	$('.entry-content p:has(img)').css('margin', '0');
//	$('.pdf p:has(a)').addClass('icon-chevron-lite-right-black');
	$('.pdf p:has(a)').append('<span class="icon-chevron-lite-right-black"></span>');

} )( jQuery );

