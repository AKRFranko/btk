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
                $('#page').css('position', 'fixed');
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

                $('#page').css('position', 'fixed');
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
            var masthead = $('#masthead').outerHeight();
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
})(jQuery);