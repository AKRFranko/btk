/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */ 
 (function($) {



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
    if($cats.is('.on')){
      $(document).trigger('cat-menu-on')
    }else{
      $(document).trigger('cat-menu-off')
    }
  });

  
  $(document).on('click', '#cat-nav', function(e) {
    var $target = $(e.target);
    if ($target.is('#cat-nav') || $target.is('div')) {
      $('#shop-nav a:first').click();
    }

  });

  var toggleBurger = function(){
    $('#shop-nav,#overlay, #masthead').toggleClass('on');
    $('#cat-nav').removeClass('on');
    if (!$('#masthead').hasClass('on')) {
      $('#sign-in-menu.on, #sign-in-menu .on, #shop-nav.on, #cat-nav.on').removeClass('on');
      
    }
  }
  var toggleLogin = function(){
    if ($('#sign-in-menu').hasClass('on')) {
      $('#sign-in-menu, #sign-in-menu .sign-in,#overlay,#masthead').removeClass('on');
      $('#sign-in-menu .login-form,#sign-in-menu .register-form').removeClass('on')
      // console.log('already on');
    } else {
      $('#sign-in-menu, #sign-in-menu .sign-in,#overlay,#masthead').addClass('on');
      $('#shop-nav, #cat-nav').removeClass('on')
    }
  }
  
  var toggleLoginChoice = function( e ){
    $('#sign-in-menu .sign-in').removeClass('on')
    if ($(e.target).hasClass('signin')) {
      $('#sign-in-menu .login-form').addClass('on');
    } else {
      $('#sign-in-menu .register-form').addClass('on');
    }
  }
  
  $(document).on('click', '#site-nav > .login', function(e){
    e.preventDefault();
  })

  $(document).on('click', '.burger', function(e) {
    e.preventDefault();
    toggleBurger();
  });

  $(document).on('click', '#site-nav .login', function(e) {
    e.preventDefault();
    toggleLogin()
  });
  
  $(document).on('click', '#sign-in-menu .choices', function( e ) {
    e.preventDefault();
    toggleLoginChoice( e );
  });
  
  $(document).on('click', '.back-to-choices', function(){
    $('#sign-in-menu .login-form,#sign-in-menu .register-form').removeClass('on');
    $('#sign-in-menu .sign-in').addClass('on')
  })


  // $(document).ajaxSend( function( event, request, settings ){
  //   console.log(settings.data)
  //   settings.data = settings.data.replace(/postal-code\=([^&]+)/g,function(a,m,i){ return 'postal-code=' + ( m[0] + m[1] + m[2] + '%20' + m.slice(3)).toUpperCase()});
  // });
  
  $(document).ajaxComplete(function(event, res) {
    setTimeout(function() {
      
      $('.woocommerce-error, .woocommerce-message').addClass('hide');
    }, 10000);
  })

  $(document).on('click', '.toggle-login-type', function(e) {
    e.preventDefault();
    $('form.login, form.register').toggleClass('on');
    window.scrollTo(0, 0);

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
      $('.product-selected-availability .value').text(shippingDelays.max)
    } else {
      $('.product-selected-availability .value').text(shippingDelays.min)
    }
    // var availabilites = $input.data('preview');

    var $originSlide = $('.edb-slide.active');
    var originSrc = $originSlide.find('img').attr('src');
    var $slider = $('.edb-slider');
    var index = $slider.find('.controls .current').text();
    $('.product-selected-material .label').html(name);
    
    if($choice.parent().siblings().length){
      if(!preview){
      $originSlide.find('.backdrop').css({
        'background-image': $choice.css('background-image'),
        'background-size': '50%'
      });    
      }else{
        $originSlide.find('.backdrop').css({
          'background-image': 'url('+preview+')',
          'background-size': 'cover'
        });  
      }

      
      $slider.find('.controls .current').html(name).css('width', 'auto');
      $slider.find('.controls .last, .controls .separator').hide();
      $slider.one('cycled', function() {
        
          $originSlide.find('.backdrop').css({
            'background-image': 'url(' + originSrc + ')'
            ,'background-size': 'cover'
          });
        
        $slider.find('.controls .last, .controls .separator').show();
        $slider.find('.controls .current').css('width', '2em')
      });
    }
    
    
    

    // console.log(name)

  });
  
  
  //,#site-nav,#shop-nav,#cat-nav
 
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
        $('.product-selected-availability .value').text(shippingDelays.max)
      } else {
        $('.product-selected-availability .value').text(shippingDelays.min)
      }
    }

  });

  
  $(function() {
    
    
    $( "#overlay" ).on('click', function( e ){
      //console.log(e.target)
      e.preventDefault();
      e.stopPropagation();
      toggleBurger()
      
      
    });
    
    
    
    $('#sign-in-menu').on('click', function( e ){
      if($(e.target).is('#sign-in-menu')){
        e.preventDefault();
        e.stopPropagation();
        toggleBurger()
        
      }
    });
    
    if($('.is-safari').length){
      $('.image-download-button').on('click', function( e ){
        e.preventDefault();
        var img = jQuery(this).parent('.image-download-item').find('img').get(0);
        var w = img.hasOwnProperty('naturalWidth') ? img.naturalWidth : img.width;
        var h = img.hasOwnProperty('naturalHeight') ? img.naturalHeight : img.height;
        window.open(img.src,'Image','width='+w+'px,height='+h+'px,resizable=1');
      })
    }
    if($('.is-safari .home-slider').length){
      var $hc = $('.home-slider .controls');
      function resizeSlider(){
        var ww = jQuery(window).width();
        var wh = jQuery(window).height();
        
        if(ww < wh ){
            $hc.addClass( 'ios-offset' );
        }else{
          $hc.removeClass( 'ios-offset' );
        }
      }
      $(window).resize( resizeSlider );
      
    }
    
    if($('.edb-material-choice-square').length === 1){
      $('.edb-material-choice-square').click();
      
      $('.product-menu').addClass('one-choice');
    }
    
    
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
          // console.log('left');
          $slider.data('pageSelector').cycle(1);
          //$slider.trigger( e.additionalEvent );
        })
        hammer.on('swiperight', function(e) {
          // console.log('right');
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

   
  });
  
  var highlightCF7Message = function( message ){
    // console.log( message );
    var open;
    var chars = message.split('');
    return chars.reduce( function( msg, char ){
      if(char == '|' ){
        if(!open){
          open = true;
          char  = '<span class="highlight">';  
        }else{
          open = false;
          char  = '</span>';  
        }
        
      }
      
      return msg+char;
    }, '' )
  };
  
  $(document).ajaxComplete(function(event, res) {
    $('.address-field input.input-text').removeClass('input-text');
    if (res.responseJSON) {
      
      if(res.responseJSON.mailSent){
        if(res.responseJSON.message){
          $('.wpcf7-form').html('<p>'+highlightCF7Message(res.responseJSON.message)+'</p>');
        }else{
          $('.wpcf7-form').html('<h1>Thank you!</h1><p>We\'ll get back to you shortly.</p>');  
        }  
      }else{
        // console.log(res.responseJSON)
        if(res.responseJSON.message){
          $('.wpcf7-form').prepend('<p>'+highlightCF7Message(res.responseJSON.message)+'</p>');  
        }else{
         // $('.wpcf7-form').html('<h1>Oops!</h1><p>That didn\'t work.</p>');
        }
      }
    }
  });


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
        $('.known-zone').text(res.zone.split('-').join(' '));
      });
    }

  }
  $(function(){
    // preload variation previews.
    $('[data-preview]').each(function(){ var src=$(this).data('preview'); (new Image()).src=src;});
  })
  
  $( function(){
    
    var inp = $('input[name=your-email-confirm]').get(0);
    if(inp && inp.onpaste){
      inp.onpaste = function( e ){
        e.preventDefault();
        e.stopPropagation()
        // $('input[name=your-email-confirm]').after('<span role="alert" class="wpcf7-not-valid-tip">no pasting.</span>');
      };
    }
  })



})(jQuery);