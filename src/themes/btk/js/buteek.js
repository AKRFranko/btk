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



        // sliderz
        $('.edb-slider').each(function() {
            var el = $(this).get(0);
            var swatches = $('.product-color-choice:first');
            var opts = {
                spacing: $("#masthead").outerHeight() + (swatches.length ? swatches.outerHeight() * 1.2 : 0)
            }
            var slider = window.EDBSlider(el, opts);
            slider.toggle(0, 'on');
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
            $(this).hover(function(e) {
                beforeHover = $('.product-color-choice .colorname').first().text();
                $('.product-color-choice .colorname').text($(this).attr('title'));

            }, function(e) {
                $('.product-color-choice .colorname').text(beforeHover);
            });

            $(this).on('click', function(e) {
                e.preventDefault();
                beforeHover = '';
                $('input[name^="attribute_"]').val($(this).attr('title'));
                $('.product-color span').first().text($(this).attr('title'));
                $('.product-color-choice .colorname').text($(this).attr('title'));
                $('.product-color-choice .none-selected').hide()
                $('.product-color-choice .one-selected').show()
                $('.product-color span').last().css('background-image', "url(" + $(this).find('img').attr('src') + ")");
                $('.single_variation_wrap .variation_id').val($(this).attr('data-variation-id'));
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