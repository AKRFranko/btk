( function( $ ) { $( window ).load( function(){


	// back to top - scrolling anim
	$('#back-to-top a').on('click', function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop:0
		}, 100);
	});



	// sign in behaviour
//	$('#menu-header a:first').on('click', function(e) {
	$('#menu-header .login').on('click', function(e) {
		e.preventDefault();
		if ( ! $('#header-box').hasClass('open') ) {
			$('#header-box').addClass('open');
			$('.sign-in-menu').show();
			$('.sign-in').show();
			$('.login-form').hide();
			$('.register-form').hide();
			$('.back-home').show();
		} else if (  $('.sign-in, .login-form, .register-form').is(':visible') ) {
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
		$('.login-form').show();
	});

	$('.signup').on('click', function(e) {
		e.preventDefault();
		$('.sign-in').hide();
		$('.register-form').show();
	});



	// hamburglar menu on/off
	$('.nav-hamburger .navbar-toggle').click( function () {
		if (  $('.sign-in, .login-form, .register-form').is(':visible') ) {
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


	$('.edb-slider').each( function(){
		var el = $(this).get(0);
		var opts = { spacing: "#masthead" }
		var slider = window.EDBSlider( el, opts );
		slider.toggle( 0, 'on');
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



	// product reviews
	$('.product .pr-rev').click(function(e){
		e.preventDefault();
		$('.product #reviews').toggle();
		if ( $('.product #reviews').is(':visible') ) {
			$(this).addClass('active');
		} else {
			$(this).removeClass('active');
		}
	});
	$('.product .submit').addClass('valign').addClass('icon-arrow-lite-right-white');
	$('.product .form-submit').prepend('<span class="valign">submit review</span>');



	// product quantities stuff
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



	// product colors change
	$('.product-color a').click(function(){
		$('.color-choice').show();
	});
	$('.back-to-product a').click(function(){
		$('.color-choice').hide();
	});
	$('.color-choice ul li a').each(function(){
		$(this).on('click', function(){
			$('.color-selection').show().css('background-color', $(this).css('background-color'));
			$('.color-selection .selected').text($(this).text());
			$('.choose-this-color a').attr('data-variation', $(this).attr('data-variation'));
		});
	});
	$('.choose-this-color a').click(function(){
		$('.color-selection').hide();
		$('.color-choice').hide();
		$('.pa_color').val($('.color-selection .selected').text());
		$('.product-color span').text($('.color-selection .selected').text());
		$('.product-color a').css('background-color', $('.color-selection').css('background-color'));
		$('.single_variation_wrap .variation_id').val( $(this).attr('data-variation') );
	});
	$('.color-selection .cancel').click(function(){
		$('.color-selection').hide();
	});



	// testing terms checkbox... doesnt work yet
	$('#terms').on('change', function() {
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


	$('.billing-shipping-edit input').each(function(){
		if ($(this).attr('placeholder') === '') {
			$(this).attr('placeholder', $(this).parent().children('label').text().toLowerCase());
		}
	});

} ) } )( jQuery );

