/* DO NOT EDIT, THIS FILE IS GENERATED */
(function($) {
    $(window).load(function() {
        $('.loading').removeClass('loading');
        // product sub/menu toggles
        $('.woo-categories .toggle').on('click', function() {
            var $it = $(this);
            var $others = $('.woo-categories .toggle.on').not($it);
            $it.toggleClass('on');
            $others.removeClass('on');

        });

        // back to top - scrolling anim
        $('#back-to-top a').on('click', function(e) {
            e.preventDefault();
            $('body,html').animate({
                scrollTop: 0
            }, 100);
        });



        // sign in behaviour
        $('#menu-header .login').on('click', function(e) {
            e.preventDefault();
            if (!$('#header-box').hasClass('open')) {
                $('#header-box').addClass('open');
                $('.sign-in-menu').show();
                $('.sign-in').show();
                $('.login-form').hide();
                $('.register-form').hide();
                $('.back-home').show();
                $('#page').css('position', 'fixed');
            } else if ($('.sign-in, .login-form, .register-form').is(':visible')) {
                $('.sign-in-menu').hide();
                $('#header-box').removeClass('open');
                $('#page').removeAttr('style');
            }
        });

        $('.back-home .buttons').on('click', function(e) {
            e.preventDefault();
            $('.sign-in-menu').hide();
            $('#header-box').removeClass('open');
            $('#page').removeAttr('style');
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
                $('#page').removeAttr('style');
            }
            if ($(this).hasClass('collapsed')) {
                $('#header-box').addClass('open');
                $('#header-box .confirmation').hide();
                $('.navbar-header .fa').removeClass('fa-bars').addClass('fa-times');
                $('#page').css('position', 'fixed');
            } else {
                $('#header-box').removeClass('open');
                $('#header-box .confirmation').show();
                $('.woo-categories').hide();
                $('.navbar-header .fa').removeClass('fa-times').addClass('fa-bars');
                $('#page').removeAttr('style');
            }
        });

        $('#menu-hamburger li a[href*="products"]').click(function(e) {
            e.preventDefault();
            $('.woo-categories').toggle();
        });

        // $('main').masonry({

        //     itemSelector: '.main-article'
        // });

        // sliderz
        $('.edb-slider').each(function() {
            var el = $(this).get(0);
            // var isChildOf = $('body').hasClass('single-product') ? 'product' : $('body').hasClass('single-post') ? 'post' : 'generic';
            // // switch (isChildOf) {
            // //     // case 'product':
            // //     //     var pads = $.makeArray($('#masthead,.product-color-choice:first,.product-add'));
            // //     //     var spacing = pads.reduce(function(s, el) {
            // //     //         return s + $(el).outerHeight();
            // //     //     }, 0);
            // //     //     break;
            // //     // case 'post':
            // //     default: var spacing = $('#masthead').outerHeight()
            // // };
            var spacing;
            var masthead = $('#masthead').outerHeight();
            var winHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
            if ($('body').hasClass('home')) {
                spacing = masthead;
            } else {
                spacing = (winHeight / 2) + (masthead / 2);
            }
            // if (!$(el).hasClass('lookbook-slider')) {
            //     spacing += winHeight / 2
            // }
            var slider = window.EDBSlider(el, {
                spacing: spacing,
                minHeight: $('.maxw_320,.home').length ? null : 460
            });
            slider.toggle(0, 'on');
            $(el).find('.slide').each(function(slide) {
                $(this).find('img').prependTo($(this).find('.slide-link'))
            })

        });



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
            var beforeHover = '';
            var $siblings = $('.product-color-choice ul li a').not(this);
            $(this).hover(function(e) {
                beforeHover = $('.product-color-choice .colorname').text();
                $('.product-color-choice .colorname').text($(this).attr('title'));
            }, function(e) {
                $('.product-color-choice .colorname').text(beforeHover);
            });

            $(this).on('click', function(e) {
                e.preventDefault();
                beforeHover = '';
                var bgfg = {
                    'background-image': "url(" + $(this).find('img').attr('src') + ")",
                    'color': '#fff'
                }
                $siblings.removeClass('clicked');

                $(this).addClass('clicked');
                $('input[name^="attribute_"]').val($(this).attr('title'));
                $('.product-color span').first().text($(this).attr('title'));
                $('.product-color-choice .colorname').text($(this).attr('title'));
                $('.product-color span').last().css(bgfg);
                // $('.single_variation_wrap .quantity').css(bgfg);
                $('.single_variation_wrap .variation_id').val($(this).attr('data-variation-id'));
                var avail = $(this).attr('data-variation-availability-delay');
                if (avail) {
                    avail = "backorder " + avail;
                } else {
                    avail = 'in stock';
                }
                $('.single_variation_wrap .product-variation-availability-delay').text(avail);
                var imageSrc = $(this).data('variation-image');
                var activeSlide = $('.edb-slider:first .slides .slide.active');
                var tempSlide = activeSlide.clone().removeClass('active').addClass('temporary')
                tempSlide.css('background-image', 'url(' + imageSrc + ')');
                $('.edb-slider:first .slides').append(tempSlide);
                $('.edb-slider:first .index').html('<i class="fa fa-eye"></i>')
                $('.edb-slider:first .total').text($(this).attr('title'))
                $('.edb-slider:first').one('cycled', function() {
                    tempSlide.remove();
                });

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
})(jQuery);;/**
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
;(function($) {

	var replaceImages = function() {
		$('img[data-hires-image]').each(function() {
			var hiressrc = $(this).data('hires-image');
			if (hiressrc !== $(this).attr('src')) {
				$(this).attr('src', hiressrc);
			}


		});
	}
	$(function() {
		window.requestAnimationFrame(replaceImages);

	})
})(jQuery);/**
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
;!(function($) {
    // Use basil.js to create an in-browser key-value store.
    var storeOptions = {
        namespace: 'edb-splash',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);

    // Custom Storage Class That handles synchronizations with $_SESSION data.
    var EDBBrowserStorage = function() {
        if (!(this instanceof EDBBrowserStorage)) return new EDBBrowserStorage();
        return this;
    }

    EDBBrowserStorage.prototype = {
        // Get all local values.
        all: function() {
            var keys = store.keys();
            var json = keys.reduce(function(obj, key) {
                obj[key] = store.get(key);
                return obj;
            }, {});
            return json;
        },
        // Get a specific value.
        get: function(key) {
            if (arguments.length === 0) {
                return this.all();
            }
            return store.get(key);
        },
        // Set a value.
        set: function(key, value) {
            return store.set(key, value);
        },
        // Synchronize with $_SESSION.
        sync: function(callback) {
            var it = this;
            var complete = callback || $.noop;
            var data = {
                "edb-browser-storage": this.all(),
                action: 'synchronize_browser_storage'
            };
            $.ajax({
                url: btk_ajax.ajax_url,
                type: "POST",
                dataType: 'json',
                data: data,
                success: function(results) {
                    if ('string' === typeof results) {
                        results = JSON.parse(results);
                    }
                    Object.keys(results).forEach(function(key) {
                        it.set(key, results[key]);
                    });
                    complete(null, it.all());
                },
                error: function(error) {
                    complete(error);
                }
            });
        }
    }

    var EDBSplashPage = function() {
        if (!(this instanceof EDBSplashPage)) return new EDBSplashPage();
        this.store = new EDBBrowserStorage();
        return this;
    }

    EDBSplashPage.prototype = {
        debugToggle: function($btn) {
            var val = this.store.get('debug');
            if (val) {
                this.store.set('debug', false);

            } else {
                this.store.set('debug', true);

            }
            window.location.reload(true);
        },
        show: function(callback) {
            var complete = callback || $.noop;
            var it = this;
            var now = (new Date()).getTime();
            var data = this.store.all();
            if (!this.store.get('debug') && this.store.get('devon')) return true;

            if (!this.store.get('debug') && (data.splash && data.splash.value === true)) {
                $('body').trigger('splash-closed', data);
                return complete(null, false);
            } else {
                it.fetch(function(error, images) {
                    var splash = it.build(images);
                    splash.find('button').on('click', function(e) {
                        e.preventDefault();
                        var btn = $(this);
                        var lang = btn.data('lang');
                        it.store.set('splash', {
                            value: true,
                            time: now
                        });
                        it.store.set('lang', {
                            value: lang,
                            time: now
                        });
                        it.store.sync(complete);
                        setTimeout(function() {
                            $('body').removeClass('splash-on');
                            $('body').trigger('splash-closed', data);
                            $('#splash-page').remove();
                        }, 200);
                    });
                    $('body').append(splash).addClass('splash-on')
                });
            }
        },
        build: function(data) {
            var header = $('<h1>élément de base</h1><h2>EDB</h2>');
            var container = $('<form>').attr('id', 'splash-page');
            var enBtn = $('<button>').data('lang', 'en');
            var frBtn = $('<button>').data('lang', 'fr');
            enBtn.append($('<span>').text('english').attr('title', 'english'));
            frBtn.append($('<span>').text('français').attr('title', 'français'));
            enBtn.append($('<span>').addClass('icon-chevron-lite-right-white'));
            frBtn.append($('<span>').addClass('icon-chevron-lite-right-white'));
            var images = $('<div>');
            data.forEach(function(src) {
                var image = $('<div>').addClass('splash-image');
                image.css('background-image', 'url("' + src + '")');
                images.append(image);
            });
            container.append(images);
            container.append(enBtn);
            container.append(frBtn);
            container.append(header);
            return container;
        },
        fetch: function(callback) {
            var callback = callback || $.noop;
            var it = this;
            $.ajax({
                url: btk_ajax.ajax_url,
                type: "GET",
                dataType: 'json',
                data: {
                    "edb-splash-images": true,
                    action: 'provide_splash_images'
                },
                success: function(results) {
                    if ('string' === typeof results) {
                        results = JSON.parse(results);
                    }
                    callback(null, results);

                },
                error: function(error) {
                    callback(error);
                }
            });
        }
    }

    $(function() {

        var splashPage = new EDBSplashPage();
        splashPage.show();
        var $tog = $('<button>').text('turn debug ' + (store.get('debug') ? 'off' : 'on'));
        $('#colophon').append($tog);
        $tog.on('click', function() {
            splashPage.debugToggle($(this));
        })
    });


})(jQuery);!(function($) {
    // Use basil.js to create an in-browser key-value store.
    var storeOptions = {
        namespace: 'edb-toast',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);
    var debugMode = store.get('edb-splash:debug');
    var sayThankYou = function() {
        $('#toast').find('form input').remove();
        setTimeout(hideToast, 3000);
    }
    var showToast = function() {
        store.set('lastToastSeen', $('#toast').data('toast'));
        $('#toast').addClass('show');
    }
    var hideToast = function() {
        $('#toast').removeClass('show');
    }
    var onClickClose = function() {
        store.set('lastToastClosed', new Date().getTime());
        hideToast();
    }
    var onClickSend = function() {
        store.set('lastToastSent', $('#toast').data('toast'));
    }

    $(document).on('click', '#toast .close', onClickClose);
    $(document).on('submit', '#toast form', onClickSend);

    var toastInterval;
    $('body').on('splash-closed', function() {
        setTimeout(checkToast, 3000);
    });
    var checkToast = function() {
        clearInterval(toastInterval);
        var now = new Date().getTime();
        var day = 1000; // * 60 * 60 * 24;
        if ($('#toast .wpcf7-mail-sent-ok').length) {
            return sayThankYou();
        } else if ($("#toast .invalid").length) {
            showToast();
        } else if (store.get('lastToastClosed')) {
            hideToast();
        } else {
            showToast();
        }
        toastInterval = setTimeout(checkToast, 1000);
    }
    $(function() {
        // if (store.get('lastToastSent') != $('#toast').data('toast')) {
        //     checkToast()
        // }


    });





})(jQuery)