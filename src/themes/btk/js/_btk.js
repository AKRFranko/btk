/* DO NOT EDIT, THIS FILE IS GENERATED */
(function($) {



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

    $(document).on('keyup', '.delivery-list input[name=postal_code]', function(event) {
        var val = $('.delivery-list input[name=postal_code]').val();
        if (/^h/.test(val)) {
            $('.known-zone').text('zone 1');
        } else if (/^m/.test(val)) {
            $('.known-zone').text('zone 2');
        } else if (val) {
            $('.known-zone').text('zone 3');
        } else {
            $('.known-zone').text('');
        }

    });
    setTimeout(function() {
        $('.woocommerce-message').fadeOut();
    }, 5000)
})(jQuery);; jQuery(function() {
   
   var onUpdateCartBeforeNavSuccess = function(html) {
     jQuery('#cartForm').trigger('cart-udpated');
   };
   var onUpdateCartBeforeNavError = function(error) {
     console.log(error);
   };

   var updateTotals = function() {
     var totalQties = 0;
     var totalCost = 0;
     $('.btk-cart-item-qty-select').each(function() {
       totalQties += parseFloat($(this).find('.btk-cart-item-qty-select-input').val());
       totalCost += parseFloat($('.btk-cart-item-qty-select-price-total').text().replace('$', ''));
     });

     // var qties = $('.btk-cart-item-qty-select-input').map(function( ){ return $(this).val(); });
     // var totals = $('.btk-cart-item-qty-select-price-total').map( function(){ return parseFloat($(this).text().replace('$',''))});
     // var totalItemsInCart = qties.reduce( function( a, b ){
     //   return a + b;
     // }, 0 );
     // var totalCostOfCart = totals.reduce( function( a, b ){
     //                         return a + b;
     // }, 0 ); 
     $('#cart-item-counter').text(totalQties);
     $('.cart-totals.subtotal .amount').text('$' + totalCost.toFixed(2));
   };

   var ajax = {
     type: 'POST',
     url: jQuery('#cartForm').attr('action'),
     success: onUpdateCartBeforeNavSuccess,
     error: onUpdateCartBeforeNavError
   }
   window.updateCartBeforeNav = function() {

     ajax.data = jQuery('#cartForm').serialize();
     jQuery.ajax(ajax);
     console.log('ajax called')
   };


   jQuery(document).on('click', '.btk-cart-checkout-button', function(e) {
     console.log(e.isDefaultPrevented());
     e.preventDefault();

     var destination = $(this).attr('href');
     jQuery('#cartForm').one('cart-udpated', function() {

       window.location.href = destination;
     });
     updateCartBeforeNav();
     return false;
   });

   jQuery(document).on('click', '.btk-cart-back-button', function(e) {
     console.log(e);
     e.preventDefault();
     var destination = $(this).attr('href');
     jQuery('#cartForm').one('cart-udpated', function() {
       window.location.href = destination;
     });
     updateCartBeforeNav();
     return false;
   });


   jQuery(document).on('change', '.btk-cart-item-qty-select-input', function(e) {
     var $item = $(this).parents('.btk-cart-item');
     var data = $item.data('json');
     data.qty_wanted = $(this).val();
     var noticeText = '';
     var totalText = '$' + (parseFloat(data.item_price) * data.qty_wanted).toFixed(2);
     if (data.qty_wanted > data.qty_in_stock) {
       noticeText = (data.qty_wanted - data.qty_in_stock) + ' on backorder.';
     }
     $item.find('.btk-cart-item-qty-select-input').text(noticeText);
     $item.find('.btk-cart-item-qty-select-price-total').text(totalText);
     updateTotals();
   });
   // var val = $(this).val();
   // var data = {
   //     action: 'woocommerce_apply_coupon',
   //     security: wc_checkout_params.apply_coupon_nonce,
   //     coupon_code: val
   // }
   // jQuery.ajax({
   //     type: 'POST',
   //     url: wc_checkout_params.ajax_url,
   //     data: data,
   //     success: function(e) {
   //         window.btk.updateOrder(function() {
   //             console.log(arguments)
   //         });
   //     }
   // })
   // var requestAnimFrame = (function() {
   //     return window.requestAnimationFrame ||
   //         window.webkitRequestAnimationFrame ||
   //         window.mozRequestAnimationFrame ||
   //         function(callback) {
   //             window.setTimeout(callback, 1000 / 60);
   //         };
   // })();

   // var getShippingCost = function(total) {
   //     return total > 500 ? 0 : 65;
   // };

   // var storeOptions = {
   //     namespace: 'edb-checkout',
   //     storages: ['local', 'cookie', 'session', 'memory'],
   //     expireDays: 365
   // }



   // var store = new window.Basil(storeOptions);

   // var $ = jQuery;
   // var $cart = $('.page-cart');
   // var timeout;
   // var lastTotal = 0;

   // // var debounceUpdate;
   // // $(function() {
   // //     var upd_cart_btn = $("input[name=update_cart]");
   // //     upd_cart_btn.hide();
   // //     $(".qty").on("change", function() {
   // //         clearTimeout(debounceUpdate);
   // //         debounceUpdate = setTimeout(function() {
   // //             upd_cart_btn.trigger("click");
   // //         }, 100)

   // //     });
   // // });



   // if ($cart.length) {
   //     var $totl = $cart.find('.cart-totals.subtotal .amount');
   //     var $estm = $cart.find('.cart-totals.estimation .estimated-amount');
   //     var $items = $('.cart_item');
   //     var calcTotals = function() {

   //         // clearTimeout(timeout);
   //         var subtotal = 0;
   //         var $items = $('.cart_item');
   //         var qties = 0;
   //         if ($items.length) {
   //             $items.each(function() {
   //                 var $item = $(this);
   //                 var $amnt = $item.find('.product-price .amount');
   //                 var $qty = $(this).find('input.qty');
   //                 var inStock = $(this).data('json').in_stock;

   //                 var qty = $qty.val();
   //                 var $over;

   //                 if(qty > inStock){
   //                   $over = $item.find('.overstock');
   //                   if(!$over.length){
   //                     $over = $('<small class="overstock"><b>'+( qty - inStock )+'</b> are backorder.</small>')
   //                   }else{
   //                     $over.html( '<b>' (qty - inStock) + '</b> are backorder.' );
   //                   }
   //                   $item.find('.product-quantity').append($over);
   //                 }else{
   //                   $item.find('.overstock').remove();
   //                 }
   //                 qties += (1 * qty);
   //                 var cost = 1 * $(this).data('json').price;
   //                 var amnt = cost * qty;
   //                 subtotal += amnt;
   //                 $amnt.text('$' + amnt.toFixed(2));

   //             });
   //         }
   //         if (subtotal !== lastTotal) {
   //             lastTotal = subtotal;
   //             $totl.text('$' + subtotal.toFixed(2));
   //             $estm.text('$' + getShippingCost(subtotal).toFixed(2));
   //             store.set('cart_estimated_shipping_cost', getShippingCost(subtotal));
   //         }
   //         // $('#cart-item-counter').text(qties);
   //         timeout = requestAnimFrame(calcTotals);
   //     }

   //     // $items.each(function() {
   //     //     console.log($(this).data('json'))
   //     //     $(this).data('cost', 1 * $(this).find('.product-price').text().trim().replace('$', ''));
   //     // });
   //     timeout = requestAnimFrame(calcTotals);


   // }

 });;jQuery(function() {
    // $('input,select,textarea').trigger('change');
    if (!jQuery('body').is('.page-checkout')){ return false; }


    var onUpdateShippingSuccess = function( response ){
      console.log('shipping-method-update-success', response );
      jQuery(document).trigger('shipping-method-update-success', [ response ]);
    };
    
    var onUpdateShippingError = function( error ){
      console.log('shipping-method-update-error', error );
      jQuery(document).trigger('shipping-method-update-error', [ error ]);
    };
    
    var updateShipping = function( method ) {
      var data = {
        action: 'woocommerce_update_order_review',
        security: wc_checkout_params.update_order_review_nonce,
        shipping_method: [ method ]
      }
      jQuery.ajax({
        type: 'POST',
        url: wc_checkout_params.ajax_url,
        data: data,
        success: onUpdateShippingSuccess,
        error: onUpdateShippingError
      });
    };
 
 



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

    // $('#no-shipping-checkbox').on('change', function() {
    //     if ($(this).is(':checked')) {
    //         $('#shipping_method_0_local_pickup').get(0).checked = true;
    //         $('#shipping_method_0_local_delivery').get(0).checked = false;

    //     } else {
    //         $('#shipping_method_0_local_pickup').get(0).checked = false;
    //         $('#shipping_method_0_local_delivery').get(0).checked = true;
    //         // $('#shipping_method_0_local_delivery').click();//
    //     }
    // }).trigger('change');

    // $('#local_pickup_option').on('change', function() {
    //     var isRush = $('#rush_delivery_option').get(0).checked;
    //     var isPickup = $('#local_pickup_option').get(0).checked;
    //     var $input = $('input[name="shipping_method[0]"]');
    //     var $pick = $('#shipping_method_0_local_pickup');
    //     var $deliv = $('#shipping_method_0_local_delivery');
    //     if (isPickup) {
    //         if (isRush) $('#rush_delivery_option').click();
    //         $pick.click()
    //     } else {
    //         $deliv.click();
    //     }
    //     setTimeout(function() {
    //         if ($deliv.is(':checked')) {
    //             $('.delivery_fees_subtotal_summary').text('$65.00');
    //         } else {
    //             $('.delivery_fees_subtotal_summary').text('$0.00');
    //         }
    //     }, 500);
    //     // if ($(this).is('#rush_delivery_option')) {

    //     // }

    // }).trigger('change')

    // $('#rush_delivery_option').on('change', function() {
    //     var isRush = $('#rush_delivery_option').get(0).checked;
    //     var wasPickup = $('#local_pickup_option').get(0).checked;
    //     if (isRush && wasPickup) {
    //         $('#local_pickup_option').click();
    //     }
    // }).trigger('change')

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
    $('input[name=coupon_code]').on('change', function() {
        var val = $(this).val();
        var data = {
            action: 'woocommerce_apply_coupon',
            security: wc_checkout_params.apply_coupon_nonce,
            coupon_code: val
        }
        jQuery.ajax({
            type: 'POST',
            url: wc_checkout_params.ajax_url,
            data: data,
            success: function(e) {
                window.btk.updateOrder(function() {
                    console.log(arguments)
                });
            }
        })
    })
    $(function() {
        $('.woocommerce-invalid').removeClass('woocommerce-invalid');
        $('.woocommerce-validated').removeClass('woocommerce-validated');
        $('#shipping_country,#billing_country').val('CA').attr('readonly', true);
        var stickies = document.querySelectorAll('.tabbar, .summary-bar');
        for (var i = stickies.length - 1; i >= 0; i--) {
            Stickyfill.add(stickies[i]);
        }

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

                            $sf.val($bf.val()).trigger('change');
                            $sf.attr('readonly', true);
                        } else {

                            $sf.attr('readonly', false);
                            $sf.val('').trigger('change');
                        }

                    });
                }
            });

        }

        $(document).on('btk-shipping-method-change', function(event, data) {
            $('input[name="shipping_method[0]"]').val(data);
            // updateShipping( data );
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

            if ($(this).is(':checked')) {
                shippingFields.each(function() {
                    $(this).val('').attr('readonly', true).trigger('change');

                });
            } else {
                shippingFields.each(function() {
                    $(this).val('').attr('readonly', false).trigger('change');

                });
            }

        });

        $('#same-address-checkbox, #no-shipping-checkbox').on('click', function() {
            var method = $('#no-shipping-checkbox').is(':checked') ? 'local_pickup' : 'local_delivery';
            $(document).trigger('btk-shipping-method-change', [method]);
        })
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
            name: 'color1',
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
            name: 'color2',
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
            name: 'color3',
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
            name: 'color4',
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
            name: 'color5',
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
            name: 'color6',
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
            name: 'color7',
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
            name: 'color8',
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
            name: 'color9',
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
            name: 'color10',
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
            name: 'color11',
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
            name: 'color12',
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
        var html = '<h1>' + [materials[name].fabric, materials[name].name, index].join(' ') + '</h1>';
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

    window.btk.materials = materials;

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

    window.btk.updateOrder = function(callback) {
        var data = {
            action: 'woocommerce_update_order_review',
            security: wc_checkout_params.update_order_review_nonce,
            post_data: $('form.checkout').serialize(),
            shipping_method: [ $('input[name^=shipping_method]').val() ]
            
        };
        jQuery.ajax({
            type: 'POST',
            url: wc_checkout_params.ajax_url,
            data: data,
            success: function(e) {
              
                if (e.fragments) {
                  console.log(Object.keys(e.fragments));
                    Object.keys(e.fragments).forEach(function(sel) {
                        $(sel).replaceWith(e.fragments[sel]);
                        console.log($(sel))
                    });
                }
                callback(null, e);
                console.log('success');
            },
            error: function(e) {
                callback(e);
                console.log('error', e);
            }
        })

    }
    var tabbing = false;
    $('.tabnext').on('click', function(event) {
        event.preventDefault();
        if (tabbing) return;
        tabbing = true;
        window.btk.updateOrder(function(error, data) {
            if (!error) {
                $('.tab.active').next().click();
            }
            tabbing = false;
        });
        // var data = {
        //     action: 'woocommerce_update_order_review',
        //     security: wc_checkout_params.update_order_review_nonce,
        //     post_data: $('form.checkout').serialize()
        // }
        // jQuery.ajax({
        //     type: 'POST',
        //     url: wc_checkout_params.ajax_url,
        //     data: data,
        //     success: function() {
        //         console.log('success')
        //         $('.tab.active').next().click();
        //     },
        //     complete: function() {
        //         tabbing = false;
        //     },
        //     error: function() {
        //         console.log('error', arguments);
        //     }
        // })

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





})(jQuery);