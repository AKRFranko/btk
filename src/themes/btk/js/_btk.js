/* DO NOT EDIT, THIS FILE IS GENERATED */
( function( $ ) { $( window ).load( function(){
	

	
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


} ) } )( jQuery );

;/**
 * Theme Customizer enhancements for a better user experience.
 *
 * Contains handlers to make Theme Customizer preview reload changes asynchronously.
 */

( function( $ ) {
        var wp = wp || {};
        if( !wp.customize ) return;
	// Site title and description.
	wp.customize( 'blogname', function( value ) {
		value.bind( function( to ) {
			$( '.site-title a' ).text( to );
		} );
	} );
	wp.customize( 'blogdescription', function( value ) {
		value.bind( function( to ) {
			$( '.site-description' ).text( to );
		} );
	} );
	// Header text color.
	wp.customize( 'header_textcolor', function( value ) {
		value.bind( function( to ) {
			if ( 'blank' === to ) {
				$( '.site-title, .site-description' ).css( {
					'clip': 'rect(1px, 1px, 1px, 1px)',
					'position': 'absolute'
				} );
			} else {
				$( '.site-title, .site-description' ).css( {
					'clip': 'auto',
					'color': to,
					'position': 'relative'
				} );
			}
		} );
	} );
} )( jQuery );
;( function( $ ) {

	var replaceImages = function(){
		$('img[data-hires-image]').each( function(){
			$(this).attr('src', $(this).data( 'hires-image' ) )

		});
	}
	$( function(){
		window.requestAnimationFrame(  replaceImages );
		
	})
})( jQuery );/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens.
 */
 
( function() {
	var container, button, menu;

	container = document.getElementById( 'site-navigation' );
	if ( ! container ) {
		return;
	}

	button = container.getElementsByTagName( 'button' )[0];
	if ( 'undefined' === typeof button ) {
		return;
	}

	menu = container.getElementsByTagName( 'ul' )[0];

	// Hide menu toggle button if menu is empty and return early.
	if ( 'undefined' === typeof menu ) {
		button.style.display = 'none';
		return;
	}

	menu.setAttribute( 'aria-expanded', 'false' );

	if ( -1 === menu.className.indexOf( 'nav-menu' ) ) {
		menu.className += ' nav-menu';
	}

	button.onclick = function() {
		if ( -1 !== container.className.indexOf( 'toggled' ) ) {
			container.className = container.className.replace( ' toggled', '' );
			button.setAttribute( 'aria-expanded', 'false' );
			menu.setAttribute( 'aria-expanded', 'false' );
		} else {
			container.className += ' toggled';
			button.setAttribute( 'aria-expanded', 'true' );
			menu.setAttribute( 'aria-expanded', 'true' );
		}
	};
} )();
;( function() {
	var is_webkit = navigator.userAgent.toLowerCase().indexOf( 'webkit' ) > -1,
	    is_opera  = navigator.userAgent.toLowerCase().indexOf( 'opera' )  > -1,
	    is_ie     = navigator.userAgent.toLowerCase().indexOf( 'msie' )   > -1;

	if ( ( is_webkit || is_opera || is_ie ) && document.getElementById && window.addEventListener ) {
		window.addEventListener( 'hashchange', function() {
			var element = document.getElementById( location.hash.substring( 1 ) );

			if ( element ) {
				if ( ! /^(?:a|select|input|button|textarea)$/i.test( element.tagName ) ) {
					element.tabIndex = -1;
				}

				element.focus();
			}
		}, false );
	}
})();
