(function($) {
	$(window).load(function() {

		// product sub/menu toggles
		$('.woo-categories .toggle').on('click', function() {
			$(this).toggleClass('on');
		});

		// back to top - scrolling anim
		$('#back-to-top a').on('click', function(e) {
			e.preventDefault();
			$('body,html').animate({
				scrollTop: 0
			}, 100);
		});



		// sign in behaviour
		//	$('#menu-header a:first').on('click', function(e) {
		$('#menu-header .login').on('click', function(e) {
			e.preventDefault();
			if (!$('#header-box').hasClass('open')) {
				$('#header-box').addClass('open');
				$('.sign-in-menu').show();
				$('.sign-in').show();
				$('.login-form').hide();
				$('.register-form').hide();
				$('.back-home').show();
			} else if ($('.sign-in, .login-form, .register-form').is(':visible')) {
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
		$('.nav-hamburger .navbar-toggle').click(function() {
			if ($('.sign-in, .login-form, .register-form').is(':visible')) {
				$('.sign-in-menu').hide();
				$('#header-box').removeClass('open');
			}
			if ($(this).hasClass('collapsed')) {
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


		$('#menu-hamburger li a[href*="products"]').click(function(e) {
			e.preventDefault();
			$('.woo-categories').toggle();
		});



		// sliderz
		$('.edb-slider').each(function() {
			var el = $(this).get(0);
			var opts = {
				spacing: "#masthead"
			}
			var slider = window.EDBSlider(el, opts);
			slider.toggle(0, 'on');
		});

/*
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
*/


		// product reviews
		$('.product .pr-rev').click(function(e) {
			e.preventDefault();
			$('.product #reviews').toggle();
			if ($('.product #reviews').is(':visible')) {
				$(this).addClass('active');
			} else {
				$(this).removeClass('active');
			}
		});
		$('.product .submit').addClass('valign').addClass('icon-arrow-lite-right-white');
		$('.product .form-submit').prepend('<span class="valign">submit review</span>');



		// product quantities stuff
		$('.entry-content p:has(img)').css('margin', '0');
		//	$('.pdf p:has(a)').append('<span class="icon-chevron-lite-right-black"></span>');
		$('.woocommerce .quantity').prepend('<a href="" class="qty-sub">-</a>').append('<a href="" class="qty-add">+</a>');
		$('.woocommerce .quantity input').attr('readonly', 'readonly');

		$('.qty-sub').click(function(e) {
			e.preventDefault();
			var val = $(this).parent().children('.qty');
			if (val.val() > 1) {
				val.val(Number(val.val()) - 1);
			}
		});
		$('.qty-add').click(function(e) {
			e.preventDefault();
			var val = $(this).parent().children('.qty');
			val.val(Number(val.val()) + 1);
		});



		// product colors change
		$('.product-color-choice ul li a').each(function() {
			$(this).on('click', function() {
				$('input[name^="attribute_"]').val($(this).attr('title'));
				$('.product-color span').first().text($(this).attr('title'));
				$('.product-color span').last().css('background-color', $(this).parent().css('background-color'));
				$('.single_variation_wrap .variation_id').val($(this).attr('data-variation'));
			});
		});



		// testing terms checkbox... doesnt work yet
		$('#terms').on('change', function() {
			if ($(this).is(':checked')) {
				$(this).removeClass('fa-square').addClass('fa-check-square');
			} else {
				$(this).removeClass('fa-check-square').addClass('fa-square');
			}
		});

		if (!$('#terms').prop('checked')) {
			$(this).addClass('fa-square').removeClass('fa-check-square');
		} else {
			$(this).addClass('fa-check-square').removeClass('fa-square');
		}


		$('.billing-shipping-edit input').each(function() {
			if ($(this).attr('placeholder') === '') {
				$(this).attr('placeholder', $(this).parent().children('label').text().toLowerCase());
			}
		});

	})
})(jQuery);