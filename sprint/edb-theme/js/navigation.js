/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */
( function() {
  
  
  
  /*
 

  */
  
  
  var $ = jQuery;
  $(document).on('click','.toggle', function(){
    var $nav = $(this).parents('nav');
    var $tog = $(this);
    if($tog.hasClass('on')){
      $tog.removeClass('on');
    }else{
      $nav.find('.toggle.on').removeClass('on');  
      $tog.addClass('on');
    }

  });
  $(document).on('click', '#shop-nav a:first', function(e){
    e.preventDefault();
    var $cats = $('#cat-nav');
    $cats.toggleClass('on');
  });
  
  $(document).on('click','#cat-nav', function(e){
    var $target = $(e.target);
    if($target.is('#cat-nav') || $target.is('div')){
      $('#shop-nav a:first').click();
    }
    
  });
  
  
  $(document).on('click','.burger', function(e){
    e.preventDefault();
    $('#shop-nav,#overlay, #masthead').toggleClass('on');
    $('#cat-nav').removeClass('on');
    if(!$('#masthead').hasClass('on')){
     $('#sign-in-menu.on, #sign-in-menu .on, #shop-nav.on, #cat-nav.on').removeClass('on');
    }
  });
  
  $(document).on('click', '#site-nav .login', function( e ){
    e.preventDefault();
    if($('#sign-in-menu').hasClass('on')){
      console.log('already on');
    }else{
      $('#sign-in-menu, #sign-in-menu .sign-in,#overlay,#masthead').addClass('on');
      $('#shop-nav, #cat-nav').removeClass('on')
    }
  });
  $(document).on('click', '#sign-in-menu .choices', function(){
    $('#sign-in-menu .sign-in').removeClass('on')
    if($(this).hasClass('signin')){
      $('#sign-in-menu .login-form').addClass('on');
    }else{
      $('#sign-in-menu .register-form').addClass('on');
    }
  });
  
  
  $(document).ajaxComplete( function(){
    setTimeout( function(){
      // console.log('REMOVE ERROR');
      $('.woocommerce-error, .woocommerce-message').addClass('hide');
    }, 10000);
  })
  
  $(document).on('click', '.toggle-login-type', function( e ){
    e.preventDefault();
    $('form.login, form.register').toggleClass('on');
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
  
  $(function(){
    // setTimeout( function(){
    //   // console.log('REMOVE ERROR');
    //   $('.woocommerce-error, .woocommerce-message').addClass('hide');
    // }, 5000);
    if($('.home-slider').length){
      var $slider = $('.home-slider');
      var $current = $slider.find('.slide-current');
      var $prev = $slider.find('.slide-prev');
      var $next = $slider.find('.slide-next');
      $slider.find('.slide:first').addClass('active');
      var pageSelector = new EdbPageSelector( $slider, {
          pageSelector: '.home-slider .slide',
          activeClass: 'active'
      });
      $next.on('click', function( e ){
        e.preventDefault();
        pageSelector.cycle(1);
        
        $current.text( pageSelector.active + 1);
      });
      $prev.on('click', function(e){
        e.preventDefault();
        pageSelector.cycle(-1);
        $current.text( pageSelector.active + 1);
      });
      
    }
    
  })

} )();
