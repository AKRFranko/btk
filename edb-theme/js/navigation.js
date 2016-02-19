/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */ (function() {



  /*
 

  */
  
  
  

  // window.viewportUnitsBuggyfill.init();
  var $ = jQuery;
  $(document).on('click', '.toggle', function() {
    var $nav = $(this).parents('nav');
    var $tog = $(this);
    if ($tog.hasClass('on')) {
      $tog.removeClass('on');
    } else {
      $nav.find('.toggle.on').removeClass('on');
      $tog.addClass('on');
    }

  });
  $(document).on('click', '#shop-nav a:first', function(e) {
    e.preventDefault();
    var $cats = $('#cat-nav');
    $cats.toggleClass('on');
  });

  $(document).on('click', '#cat-nav', function(e) {
    var $target = $(e.target);
    if ($target.is('#cat-nav') || $target.is('div')) {
      $('#shop-nav a:first').click();
    }

  });


  $(document).on('click', '.burger', function(e) {
    e.preventDefault();
    $('#shop-nav,#overlay, #masthead').toggleClass('on');
    $('#cat-nav').removeClass('on');
    if (!$('#masthead').hasClass('on')) {
      $('#sign-in-menu.on, #sign-in-menu .on, #shop-nav.on, #cat-nav.on').removeClass('on');
    }
  });

  $(document).on('click', '#site-nav .login', function(e) {
    e.preventDefault();
    if ($('#sign-in-menu').hasClass('on')) {
      console.log('already on');
    } else {
      $('#sign-in-menu, #sign-in-menu .sign-in,#overlay,#masthead').addClass('on');
      $('#shop-nav, #cat-nav').removeClass('on')
    }
  });
  $(document).on('click', '#sign-in-menu .choices', function() {
    $('#sign-in-menu .sign-in').removeClass('on')
    if ($(this).hasClass('signin')) {
      $('#sign-in-menu .login-form').addClass('on');
    } else {
      $('#sign-in-menu .register-form').addClass('on');
    }
  });


  $(document).ajaxComplete(function(event, res) {
    setTimeout(function() {
      
      $('.woocommerce-error, .woocommerce-message').addClass('hide');
    }, 10000);
  })

  $(document).on('click', '.toggle-login-type', function(e) {
    e.preventDefault();
    $('form.login, form.register').toggleClass('on');
  });


  $(document).on('click', '.edb-material-choice-square', function(e) {

    var $choice = $(this);
    var $input = $choice.find('input');
    var data = $input.data();

    var name = data.name;
    var preview = data.preview;
    var shippingDelays = data.shippingDelay;
    var selectedQty = $('input[name=quantity]').val();
    var availableQty = 1 * shippingDelays.stock;

    if (availableQty < selectedQty) {
      $('.product-selected-availability .value').text(shippingDelays.min + ' ~ ' + shippingDelays.max)
    } else {
      $('.product-selected-availability .value').text(shippingDelays.min)
    }
    // var availabilites = $input.data('preview');

    var $originSlide = $('.edb-slide.active');
    var originSrc = $originSlide.find('img').attr('src');
    var $slider = $('.edb-slider');

    $('.product-selected-material .label').html(name);
    $originSlide.find('.backdrop').css({
      'background-image': 'url(' + preview + ')'
    });
    var index = $slider.find('.controls .current').text();
    $slider.find('.controls .current').html(name).css('width', 'auto');
    $slider.find('.controls .last, .controls .separator').hide();
    $slider.one('cycled', function() {
      $originSlide.find('.backdrop').css({
        'background-image': 'url(' + originSrc + ')'
      });
      $slider.find('.controls .last, .controls .separator').show();
      $slider.find('.controls .current').css('width', '2em')
    })

    // console.log(name)

  })
  
  // $(document).on('change','.shipping-method-choice input', function(){
  //   var $input = $( this );
  //   var $label = $(this).closest('label');
  //   var isChecked = $input.is(':checked');
  //   if(isChecked){
  //     $label.addClass('checked')
  //   }else{
  //     $label.removeClass('checked')
  //   }
  // })

  $(document).on('change', '.product-quantity-input input[name="quantity"]', function() {
    if ($('.product-color-choices .active-choice').length) {
      var data = $('.product-color-choices .active-choice .edb-material-choice-square input').data();
      var shippingDelays = data.shippingDelay;
      var selectedQty = $('input[name=quantity]').val();
      var availableQty = 1 * shippingDelays.stock;

      if (availableQty < selectedQty) {
        $('.product-selected-availability .value').text(shippingDelays.min + ' ~ ' + shippingDelays.max)
      } else {
        $('.product-selected-availability .value').text(shippingDelays.min)
      }
    }

  });

  // $.event.special.swipe.settings.threshold = 0.02;
  // $.event.special.swipe.settings.sensitivity = 12;
  // $(document).on('movestart', '.home-slider, .edb-slideshow-images', function(e) {
  //     // If the movestart is heading off in an upwards or downwards
  //     // direction, prevent it so that the browser scrolls normally.
  //     if ((e.distX > e.distY && e.distX < -e.distY) || (e.distX < e.distY && e.distX > -e.distY)) {
  //         e.preventDefault();
  //     }
  // });

  // $(document).on('swipeleft', '.home-slider, .edb-slideshow-images', function(e, dir) {
  //     e.preventDefault();

  //     // it.cycle(1);
  //     console.log(event.type)
  // });
  // $(document).on('swiperight', '.home-slider, .edb-slideshow-images', function(e, dir) {
  //     e.preventDefault()
  //     // it.cycle(-1);
  //     console.log(event.type)
  // });

  $(function() {
    
    if($('.is-safari .home-slider').length){
      var $hc = $('.home-slider .controls');
      function resizeSlider(){
        var ww = jQuery(window).width();
        var wh = jQuery(window).height();
        
        if(width < height ){
            $hc.addClass( 'ios-offset' );
        }else{
          $hc.removeClass( 'ios-offset' );
        }
      }
      $(window).resize( resizeSlider );
      
    }
    // var bg = jQuery("#bg1, #bg2");
    // jQuery(window).resize("resizeBackground");
    // function resizeBackground() {
    //     bg.height(jQuery(window).height());
    // }
    // resizeBackground();
    
    $('.address-field input.input-text').removeClass('input-text');
    // setTimeout( function(){
    //   // console.log('REMOVE ERROR');
    //   $('.woocommerce-error, .woocommerce-message').addClass('hide');
    // }, 5000);
    var $sliders = $('.home-slider, .edb-slideshow');
    if ($sliders.length) {
      $sliders.each(function() {
        var $slider = $(this);
        var hammer = new Hammer($slider.get(0));
        $slider.data('hammer', hammer);
        hammer.on('swipeleft', function(e) {
          console.log('left');
          $slider.data('pageSelector').cycle(1);
          //$slider.trigger( e.additionalEvent );
        })
        hammer.on('swiperight', function(e) {
          console.log('right');
          $slider.data('pageSelector').cycle(-1);

          //$slider.trigger( e.additionalEvent );
        })
      });
    }
    if ($('.home-slider').length) {
      var $slider = $('.home-slider');
      var $current = $slider.find('.slide-current');
      var $prev = $slider.find('.slide-prev');
      var $next = $slider.find('.slide-next');
      $slider.find('.slide:first').addClass('active');
      var pageSelector = new EdbPageSelector($slider, {
        pageSelector: '.home-slider .slide',
        activeClass: 'active'
      });
      $next.on('click', function(e) {
        e.preventDefault();
        pageSelector.cycle(1);

        $current.text(pageSelector.active + 1);
      });
      $prev.on('click', function(e) {
        e.preventDefault();
        pageSelector.cycle(-1);
        $current.text(pageSelector.active + 1);
      });

    }
    // if($('.wpcf7-form').length){
    //   $('form.wpcf7-form').each( function(){
    //     var $form = $(this);
    //     $form.on('submit', function(e){
    //       e.preventDefault();
    //       console.log('default prevented')
    //     })
    //   })
    // }

  })

  $(document).ajaxComplete(function(event, res) {
    $('.address-field input.input-text').removeClass('input-text');
    // console.log('REMOVE ERROR');
    // $('.shipping-method-choice input').each( function(){
    //   if( $(this).is(':checked')){
    //   $(this).closest('label').addClass('checked')  
    //   }else{
    //     $(this).closest('label').removeClass('checked')  
    //   }
      
    // })
    if (res.responseJSON.mailSent) {
      $('.wpcf7-form').html('<h1>Thank you!</h1><p>We\'ll get back to you shortly.');
    }
  })


  $(document).on('click', '#check-postcode', getShippingZone);

  $(document).on('change', 'postal_code', function() {
    var postcode = $('input[name=postal_code]').val();
    if (!val) {
      $('.known-zone').text('-');
    }
  });

  function getShippingZone() {
    var postcode = $('input[name=postal_code]').val();
    if (postcode) {
      jQuery.post("/wp-admin/admin-ajax.php", {
        'action': 'edb_guess_shipping_zone',
        'data': postcode
      }, function(res) {
        $('.known-zone').text(res.zone);
      });
    }

  }



})();