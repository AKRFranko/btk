/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */
( function() {
  
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
    $('#shop-nav,#overlay, #cat-nav, #masthead').toggleClass('on');
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
  
  
  
  $(function(){
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
