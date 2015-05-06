/* DO NOT EDIT, THIS FILE IS GENERATED */
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
;!( function($){
	// Use basil.js to create an in-browser key-value store.
	var storeOptions = {
		namespace:'edb-splash',
		storages: ['local', 'cookie', 'session', 'memory'],
		expireDays: 365
	}


	var store = new window.Basil(storeOptions);

	// Custom Storage Class That handles synchronizations with $_SESSION data.
	var EDBBrowserStorage = function(){
		if( !(this instanceof EDBBrowserStorage) ) return new EDBBrowserStorage();
		return this;
	}

	EDBBrowserStorage.prototype = {
		// Get all local values.
		all: function(){
			var keys = store.keys();
			var json = keys.reduce( function( obj, key ){
				obj[key] = store.get( key );
				return obj;
			}, {} );
			return json;
		},
		// Get a specific value.
		get: function( key ){
			if( arguments.length === 0 ){
				return this.all();
			}
			return store.get( key );
		},
		// Set a value.
		set: function( key, value ){
			return store.set( key, value );
		},
		// Synchronize with $_SESSION.
		sync: function( callback ){
			var it = this;
			var callback = callback || $.noop;
			var data = { "edb-browser-storage": this.all(), action: 'synchronize_browser_storage' };
			$.ajax({
				url: btk_ajax.ajax_url,
				type: "POST",
				dataType: 'json',
				data: data,
				success: function( results ){
					if( 'string' === typeof results ){
						results = JSON.parse( results );
					}
					Object.keys( results ).forEach( function( key ){
						it.set( key, results[key] );
					});
					callback( null, it.all() );
				},
				error: function( error ){
					callback( error );
				}
			});
		}
	}

	var EDBSplashPage = function(){
		if( !(this instanceof EDBSplashPage) ) return new EDBSplashPage();
		this.store = new EDBBrowserStorage();
		return this;
	}

	EDBSplashPage.prototype = {
		show: function( callback ){
			var callback = callback || $.noop;
			var it = this;
			var now = (new Date()).getTime();
			var data = this.store.all();
			if( data.splash && data.splash.value === true ){
				return callback( null, false );
			}else{
				it.fetch( function( error, images ){
					var splash = it.build( images );
					splash.find('button').on('click', function(){
						var btn = $( this );
						var lang = btn.data('lang');
						it.store.set( 'splash', { value: true, time: now } );
						it.store.set( 'lang', { value: lang, time: now } );
						it.store.sync( callback );
						$('body').removeClass('splash-on');
					})
					$('body').append( splash ).addClass('splash-on')
				});
			}
		},
		build: function( data ){
			var container = $('<form>').attr('id','splash-page');
			var enBtn = $('<button>').text('enter').data('lang','en');
			var frBtn = $('<button>').text('entrez').data('lang','fr');
			var images = $('<div>');
			data.forEach(function( src ){
				var image = $('<div>').addClass('splash-image');
				image.css('background-image', 'url("'+src+'")');
				images.append( image );
			});
			container.append( images );
			container.append( enBtn );
			container.append( frBtn );
			return container;
		},
		fetch: function( callback ){
			var callback = callback || $.noop;
			var it = this;
			$.ajax({
				url: btk_ajax.ajax_url,
				type: "GET",
				dataType: 'json',
				data: { "edb-splash-images": true, action: 'provide_splash_images' },
				success: function( results ){
					if( 'string' === typeof results ){
						results = JSON.parse( results );
					}
					callback( null, results );
					
				},
				error: function( error ){
					callback( error );
				}
			});
		}
	}

	$( function(){
	
		var splashPage = new EDBSplashPage();
		splashPage.show();
	});


})(jQuery)

