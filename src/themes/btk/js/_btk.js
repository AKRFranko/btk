/* DO NOT EDIT, THIS FILE IS GENERATED */
(function($) {

    // ecb slider 10second auto home 

    window.btk = {
        handleFormSuccess: function(formName) {
            $('.wpcf7-mail-sent-ok').remove();
            if (formName !== 'toast') {

                $('.btk-form-success').addClass('show');

                setTimeout(function() {
                    window.scrollTo(0, 0);
                }, 200);
                $('.btk-form-success .close').on('click', function() {
                    $('.btk-form-success').removeClass('show');

                    $('form').get(3).reset();
                });


            } else {
                $('#toast .btk-form-success .close').remove()
                $('#toast .content > *').fadeOut(156, function() {
                    $('#toast .content').html($('.btk-form-success').hide().html());
                    $('.btk-form-success').fadeIn(333);
                });

            }
        }

    }

    // Listen for orientation changes
    window.addEventListener("orientationchange", function() {
        // Announce the new orientation number
        $(window).trigger('resize');
    }, false);

    $('.toggle-register').on('click', function(e) {
        e.preventDefault();
        $('.customer-register, .customer-login').toggleClass('off');
    });
    window.btk.showSigninMenu = function() {
        $('.sign-in-menu').show();
        $('.sign-in').show();
        $('.login-form').hide();
        $('.register-form').hide();
        $('.back-home').show();
    }
    window.btk.hideSigninMenu = function() {
        $('.sign-in-menu').hide();
    }

    $(document).on('click touchstart', '#header-box.open', function(e) {

        if ($(e.target).is('.wrapper')) {
            $('.sign-in-menu').hide();
            $('#header-box').removeClass('open');
            $('#page').removeAttr('style');
            e.preventDefault();
        }
        //     var target = $(e.target);
        //     if (target.is('a') || target.is('button')) return;

        //     // $('.back-home').click();

    });

    $(window).unload(function() {
        $('body').addClass('loading');
    })
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
                window.btk.showSigninMenu();
                $('#page').css('overflow', 'hidden');
            } else if ($('.sign-in, .login-form, .register-form').is(':visible')) {
                window.btk.hideSigninMenu();
                $('#header-box').removeClass('open');
                $('#page').removeAttr('style');

            }
            // } else {
            //     window.btk.showSigninMenu();

            // }

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
        var toggleBurgerIcon = function() {
            if ($('#header-box').is('.open')) {
                $('.navbar-header .fa').removeClass('fa-bars').addClass('fa-times');
            } else {
                $('.navbar-header .fa').addClass('fa-bars').removeClass('fa-times');
            }
        }

        $('.nav-hamburger .navbar-toggle').click(function() {
            if ($('.sign-in, .login-form, .register-form').is(':visible')) {
                $('.sign-in-menu').hide();
                $('#header-box').removeClass('open');
                $('#page').removeAttr('style');
            }
            if ($(this).hasClass('collapsed')) {
                $('#header-box').addClass('open');
                $('#header-box .confirmation').hide();

                // $('#page').css('position', 'fixed');
                $('#page').css('overflow', 'hidden');
            } else {
                $('#header-box').removeClass('open');
                $('#header-box .confirmation').show();
                $('.woo-categories').hide();

                $('#page').removeAttr('style');
            }
            toggleBurgerIcon()

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

            var spacing;
            var masthead = $('#header-box').outerHeight();
            var winHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
            if ($('body').hasClass('home')) {
                spacing = masthead;
            } else {
                spacing = (winHeight / 2) + (masthead / 2);
            }
            var slider = window.EDBSlider(el, {
                spacing: spacing,
                minHeight: $('.maxw_320,.home').length ? null : 460
            });
            slider.toggle(0, 'on');
            $(el).find('.slide').each(function(slide) {
                $(this).find('img').prependTo($(this).find('.slide-link'))
            })

        });


        if ($('body').is('.home')) {
            console.log('ishome')
            var autoSlides;
            var clicknext = function() {
                console.log('clicking')
                $('.edb-slider .next').click();
                autoSlides = setTimeout(clicknext, 10000);
            };
            $('.edb-slider').on('mouseenter touchstart', function() {
                console.log('clearing')
                clearTimeout(autoSlides);
            }).on('mouseleave', function() {
                autoSlides = setTimeout(clicknext, 10000);
            }).trigger('mouseleave')
        }
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
                $('.material-info-trigger').data('material', $(this).attr('title')).css('display', 'inline-block');
                $('.product-color span').first().text($(this).attr('title'));
                $('.product-color-choice .colorname').text($(this).attr('title'));
                $('.product-color span').last().css(bgfg);
                // $('.single_variation_wrap .quantity').css(bgfg);
                $('.single_variation_wrap .variation_id').val($(this).attr('data-variation-id'));
                var avail = $(this).attr('data-variation-availability-delay');
                if (avail) {
                    avail = "" + avail;
                } else {
                    avail = 'in stock';
                }
                $('.single_variation_wrap .product-variation-availability-delay').text(avail);
                var imageSrc = $(this).data('variation-image');
                var activeSlide = $('.edb-slider:first .slides .slide.active');
                var tempSlide = activeSlide.clone().removeClass('active').addClass('temporary')
                tempSlide.css('background-image', 'url(' + imageSrc + ')');
                $('.edb-slider:first .slides').append(tempSlide);
                $('.edb-slider:first .index').html('')
                $('.edb-slider:first .separator').hide()
                $('.edb-slider:first .total').text($(this).attr('title'))
                $('.edb-slider:first').one('cycled', function() {
                    tempSlide.remove();
                    $('.edb-slider:first .separator').show()
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


        $('.woocommerce-billing-fields label[for], .woocommerce-shipping-fields label[for]').each(function() {
            var text = $(this).text().trim();
            var input = $(this).parent().find('#' + $(this).attr('for'));
            if (input.is('input')) {
                input.attr('placeholder', text);
            }
            // if ($(this).attr('placeholder') === '') {
            //     $(this).attr('placeholder', $(this).parent().children('label').text().toLowerCase());
            // }
        });




    })

    setTimeout(function() {
        $('.woocommerce-message').fadeOut();
    }, 5000)
})(jQuery);; jQuery(function() {

     var getShippingCost = function(total) {
         return total > 499 ? 0 : 75;
     };

     var storeOptions = {
         namespace: 'edb-checkout',
         storages: ['local', 'cookie', 'session', 'memory'],
         expireDays: 365
     }


     var store = new window.Basil(storeOptions);

     var $ = jQuery;
     var $cart = $('.page-cart');
     var timeout;
     var lastTotal = 0;

     $(function() {
             if ($('.woocommerce-billing-fields').length) {
                 var billingFields = $('[name^=billing_]');
                 var shippingFields = $('[name^=shipping_]');
                 billingFields.each(function() {
                     var $bf = $(this);
                     var sfname = $bf.attr('name').replace('billing', 'shipping');
                     var $sf = $('[name=' + sfname + ']');
                     if ($sf.length) {
                         $bf.on('focusout change', function() {
                             if ($('#same-address-checkbox').is(':checked')) {

                                 $sf.attr('disabled', true);
                                 $sf.val($bf.val()).trigger('change');
                             } else {
                                 $sf.attr('disabled', false);
                                 $sf.val('').trigger('change');
                             }
                         });
                     }
                 });
                 $('#same-address-checkbox').on('click', function() {
                     if ($('#no-shipping-checkbox').is(':checked')) {
                         $('#no-shipping-checkbox').prop('checked', false);
                     }
                     billingFields.each(function() {
                         $(this).trigger('change');
                     })
                 })
                 $('#no-shipping-checkbox').on('click', function() {
                     if ($('#same-address-checkbox').is(':checked')) {
                         $('#same-address-checkbox').prop('checked', false);
                     }
                     shippingFields.each(function() {
                         $(this).val('').trigger('change').attr('disabled', true);
                     })
                 });
             }
         })
         // var copyBillingShippingFields = function() {
         //     var billingFields = $('[name^=billing_]');
         //     billingFields.each(function() {
         //         var bf = $(this);
         //         var sfname = bf.attr('name').replace('billing', 'shipping');
         //         var sf = $('[name=' + sfname + ']');
         //         sf.val(bf.val());
         //     })
         // }
         // var clearShippingFields = function() {
         //     var shippingFields = $('[name^=billing_]');
         //     shippingFields.each(function() {
         //         $(this).val('');
         //     })
         // }
         // $('#same-address-checkbox').on('change', function() {
         //     if ($(this).is(':checked')) {
         //         copyBillingShippingFields()
         //     } else {
         //         clearShippingFields();
         //     }
         // }).trigger('change');

     if ($cart.length) {
         var $totl = $cart.find('.cart-totals.subtotal .amount');
         var $estm = $cart.find('.cart-totals.estimation .estimated-amount');
         var $items = $('.cart_item');
         var calcTotals = function() {

             clearTimeout(timeout);
             var subtotal = 0;
             var $items = $('.cart_item');
             if ($items.length) {
                 $items.each(function() {
                     var $item = $(this);
                     var $amnt = $item.find('.product-price .amount');
                     var $qty = $(this).find('input.qty');
                     var qty = $qty.val();
                     var cost = 1 * $(this).data('json').price;
                     var amnt = cost * qty;
                     subtotal += amnt;
                     $amnt.text('$' + amnt.toFixed(2));
                 });
             }
             if (subtotal !== lastTotal) {
                 lastTotal = subtotal;
                 $totl.text('$' + subtotal.toFixed(2));
                 $estm.text('$' + getShippingCost(subtotal).toFixed(2));
                 store.set('cart_estimated_shipping_cost', getShippingCost(subtotal));
             }

             timeout = setTimeout(calcTotals, 200);
         }

         // $items.each(function() {
         //     console.log($(this).data('json'))
         //     $(this).data('cost', 1 * $(this).find('.product-price').text().trim().replace('$', ''));
         // });
         timeout = setTimeout(calcTotals, 200);


     }

 });;jQuery(function() {
    // $('input,select,textarea').trigger('change');
    if (!$('body').is('.page-checkout')) return false;

    var storeOptions = {
        namespace: 'edb-checkout',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);

    var sumBar = $('.summary-bar');
    var fieldNames = [];
    var sumFields = $('.summary-bar span');
    var estship = store.get('cart_estimated_shipping_cost');
    if (estship || estship === 0) {
        $('input[name=delivery_fees_subtotal]').val('$' + estship.toFixed(2));
    }
    sumFields.each(function() {
        var $fld = $(this);
        var kls = $fld.attr("class");
        var name = kls.replace(/_summary$/, '');
        var $inp = $('form[name="checkout"] input[name="' + name + '"]');
        $inp.on('change focusout', function() {
            var val = $(this).val();
            if (name == 'paypal_pro-card-number') {
                val = '...' + val.replace(/\s/g, '').slice(-4);
            }
            $fld.text(val);
            sumBar.trigger('updated', {
                name: name,
                value: val
            });
        });
        if ($inp.val()) {

            $fld.text($inp.val());
        }
    });
    $('.tabbar').on('tab-changed', function(event, from, to) {
            //console.log('tab changed from', from, 'to', to)
            $('.summary-box.not-shown').removeClass('not-shown');
            $('.summary-box').removeClass('closed');
            if (to == 'review-pane') {
                // var total = $('.order-total .amount').text();
                // $('.big-cart-total').text(total);
                $('.summary-box:last-of-type').siblings().addClass('closed');
            } else if (to == 'delivery-pane') {
                $('.summary-box:gt(' + 1 + ')').addClass('not-shown');
                $('.summary-box:lt(' + 1 + ')').addClass('closed');
            } else if (to == 'payment-pane') {
                $('.summary-box:gt(' + 2 + ')').addClass('not-shown');
                $('.summary-box:lt(' + 2 + ')').addClass('closed');
            } else {
                $('.summary-box:first').siblings().addClass('not-shown');

            }
            $('html,body').animate({
                scrollTop: 0
            }, 333);

        })
        // $('#ship-to-different-address-checkbox').on('change', function() {
        //     if ($(this).is(':checked')) {
        //         $('.shipping-address-summary').show()
        //         $('.billing-address-summary').hide()
        //     } else {
        //         $('.shipping-address-summary').hide()
        //         $('.billing-address-summary').show()
        //     }

    // }).trigger('change')

    // $('#same-address-checkbox').on('click', function(e) {
    //     if ($(this).is(':checked')) $(this).removeAttr('checked');
    // });

    $('#local_pickup_option').on('change', function() {
        var isRush = $('#rush_delivery_option').get(0).checked;
        var isPickup = $('#local_pickup_option').get(0).checked;
        var $input = $('input[name="shipping_method[0]"]');
        var $pick = $('#shipping_method_0_local_pickup');
        var $deliv = $('#shipping_method_0_local_delivery');
        if (isPickup) {
            if (isRush) $('#rush_delivery_option').click();
            $pick.click()
        } else {
            $deliv.click();
        }
        setTimeout(function() {
            if ($deliv.is(':checked')) {
                $('.delivery_fees_subtotal_summary').text('$75.00');
            } else {
                $('.delivery_fees_subtotal_summary').text('$0.00');
            }
        }, 500);
        // if ($(this).is('#rush_delivery_option')) {

        // }

    }).trigger('change')

    $('#rush_delivery_option').on('change', function() {
        var isRush = $('#rush_delivery_option').get(0).checked;
        var wasPickup = $('#local_pickup_option').get(0).checked;
        if (isRush && wasPickup) {
            $('#local_pickup_option').click();
        }
    }).trigger('change')

    $('form[name="checkout"]').on('change', function(event) {
            var target = $(event.target);
            //console.log('changed', target.attr('name'));
        })
        // window.serializeObject = function(form) {
        //     var serialized = $(form).serializeArray();
        //     var data = {};
        //     serialized.forEach(function(field) {
        //         if (data[field.name] !== 0) {
        //             if (jQuery.isArray(data[field.name])) {
        //                 data[field.name].push(field.value);
        //             } else {
        //                 data[field.name] = [field.value];
        //             }
        //         } else {
        //             data[field.name] = field.value;
        //         }
        //     });
        //     console.log(data)
        // }

    $(function() {
        $('.woocommerce-invalid').removeClass('woocommerce-invalid');
        $('.woocommerce-validated').removeClass('woocommerce-validated');
        $('#shipping_country,#billing_country').val('CA').attr('disabled', true);
        var stickies = document.querySelectorAll('.tabbar, .summary-bar');
        for (var i = stickies.length - 1; i >= 0; i--) {
            Stickyfill.add(stickies[i]);
        }
    })

});;/**
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
})(jQuery);(function($) {
    var materials = {
        '001': {
            image: '/wp-content/themes/btk/img/textures/aluminium.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '002': {
            image: '/wp-content/themes/btk/img/textures/argon.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]

        },
        '003': {
            image: '/wp-content/themes/btk/img/textures/concrete.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '004': {
            image: '/wp-content/themes/btk/img/textures/emerald.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '005': {
            image: '/wp-content/themes/btk/img/textures/noise.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '006': {
            image: '/wp-content/themes/btk/img/textures/orange.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '007': {
            image: '/wp-content/themes/btk/img/textures/purple.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '008': {
            image: '/wp-content/themes/btk/img/textures/sky.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '009': {
            image: '/wp-content/themes/btk/img/textures/steel.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '010': {
            image: '/wp-content/themes/btk/img/textures/teal.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '011': {
            image: '/wp-content/themes/btk/img/textures/wine.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '012': {
            image: '/wp-content/themes/btk/img/textures/yolk.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'


            ]
        }
    };
    var $overlay = $('<div>').addClass('materials-overlay');
    var $close = $('<a>').addClass('materials-close').html('<span class="fa fa-times"></span>');
    var cards = {};
    Object.keys(materials).forEach(function(name, index) {
        var $card = $('<div>').addClass('materials-card');
        $card.append($close.clone())
        var $image = $('<div>').addClass('materials-image');
        $image.css('background-image', 'url("' + materials[name].image + '")');
        // var $img = $('<img>').attr('src', materials[name].image).appendTo($image);
        var $content = $('<div>').addClass('materials-content');
        var html = '<h1>' + [materials[name].fabric, name, index].join(' ') + '</h1>';
        html += '<h3>Compositon</h3><ul>';
        materials[name].composition.forEach(function(line) {
            html += '<li>' + line + '</li>';
        });
        html += '<br><p><a href="/order-samples">order samples</a></p>';
        $content.html(html);
        $card.append($image);
        $card.append($content);
        $overlay.append($card);
        cards[name] = $card;
    });

    window.btk.showMaterialInfo = function(material) {
        if (!material || !materials[material]) {
            return false;
        }
        $overlay.find('.materials-card').removeClass('active');
        cards[material].addClass('active');
        $overlay.addClass('opened');
    }
    window.btk.hideMaterialInfo = function() {
        $overlay.removeClass('opened');
    }

    $overlay.on('click', function(e) {

        if ($(e.target).parents('.materials-card').length > 0) {
            return true;
        } else {
            window.btk.hideMaterialInfo();
        }

    });

    $overlay.on('click', '.materials-close', function(e) {
        e.preventDefault();
        window.btk.hideMaterialInfo();


    });

    $(document.body).on('click', '.material-info-trigger', function(e) {
        var material = $(this).data('material');

        window.btk.showMaterialInfo(material);
    });

    $(document.body).append($overlay);

})(jQuery);;/**
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
    var storeOptions = {
        namespace: 'edb-checkout',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);
    var tabbar = $('.tabbar');
    var currentTab = null;
    var activateTab = function(tab) {
        var $tab = $(tab);

        var $others = $(tab).siblings('.tab').not($tab);
        var paneSelector = $tab.data('pane');
        if (currentTab !== paneSelector) {
            var $pane = $('#' + paneSelector);
            var $otherPanes = $('.tabpane').not($pane);
            $others.add($otherPanes).removeClass('active');
            $tab.add($pane).addClass('active');
            var index = $tab.index();
            store.set('last_checkout_tab', index + 1);
            tabbar.trigger('tab-changed', [currentTab, paneSelector]);
            currentTab = paneSelector;

        }

    }
    $(document).on('click', '.summary-box .toggle-box', function() {
        var $tog = $(this);
        var $sum = $(this).parents('.summary-box');
        $sum.toggleClass('closed');
    })
    var findTabTarget = function(pane) {
        return $('.tabbar .tab').filter(function() {
            return $(this).data('pane') == pane;
        });
    }
    var highlightTabsWithErrors = function() {
        return false;
        $('.tabpane').each(function() {
            var errors = $(this).find('.woocommerce-invalid');
            var $tab = findTabTarget($(this).attr('id'));
            if (errors.length > 0) {
                $tab.attr('data-invalids', errors.length);
            }
            if (!$tab.attr('data-invalids')) {



                errors.on('change', function() {
                    errors -= 1
                    if (errors > 0) {
                        $tab.attr('data-invalids', invalids);
                    } else {
                        $tab.removeAttr('data-invalids');
                    }

                });
            }
        })
    }
    $('.tabbar .tab').on('click', function(event) {
        event.preventDefault();
        activateTab(this)
    });

    $('.tabnext').on('click', function(event) {
        event.preventDefault();
        $('.tab.active').next().click();
    });

    $('.tabto').on('click', function(event) {
        event.preventDefault();
        var $target = findTabTarget($(this).data('pane'));
        $target.click();
    });

    $(function() {
        var index = store.get('last_checkout_tab');
        if (!index) index = 1;

        $tab = $('.tabbar .tab:nth-of-type(' + index + ')');
        activateTab($tab);

    })

    setInterval(function() {

        highlightTabsWithErrors()
    }, 100)

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
    };

    $(function() {
        // if (store.get('lastToastSent') != $('#toast').data('toast')) {
        //     checkToast()
        // }


    });





})(jQuery)