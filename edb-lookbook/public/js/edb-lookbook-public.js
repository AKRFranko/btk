(function( $ ) {
	'use strict';

	var idleTime = 0;
	var autoCycletime = 3;
	var autoCycleBetween = 5000;
	var autoCycleOn = false;
	var nextAutoCycle;
	
  $(document).ready(function () {
      //Increment the idle time counter every minute.
      var idleInterval = setInterval(timerIncrement, 30000); // 30 seconds
  
      //Zero the idle timer on mouse movement.
      $(this).mousemove(function (e) {
          idleTime = 0;
      });
      $(this).keypress(function (e) {
          idleTime = 0;
      });
      
   });
  
   function timerIncrement() {
      idleTime = idleTime + 0.5;
   }
   
	 function autoCycle(){
	   clearTimeout(nextAutoCycle);
	   
       $('.edb-slider').each(function(){
         var $slider = $(this);
         if($slider.data('autocycle') || idleTime > 3){
          cycle( this, 1 );     
         }
         
       });
     
	   nextAutoCycle = setTimeout( autoCycle, autoCycleBetween  );
	 }
	 nextAutoCycle = setTimeout(autoCycle, autoCycleBetween );
	 
	 function cycleTo( slider, nth ){
	   var $slider = $( slider );
     var $active = $slider.find('.edb-slide.active');
     var targetIndex= nth - 1;
     var activeIndex = $active.index();
     var direction,times;
     if( targetIndex > activeIndex ){
       direction = 1;
       times = targetIndex - activeIndex;
     }else if(targetIndex < activeIndex){
       direction = -1;
       times = activeIndex - targetIndex;
     }
     var loop = -1;
     while(loop++ < times){
       cycle($slider, direction);
     }
	 }
	 
	 function cycle( slider, direction ){
	   var $slider = $( slider );
	   var $active = $slider.find('.edb-slide.active');
	   var cycleFn = direction == 1 ? 'next' : 'prev';
	   var $target = $active[cycleFn]();
	   var $first = $slider.find('.edb-slide:first');
	   var $last = $slider.find('.edb-slide:last');
	   if(!$target.length){
	     if(direction == 1){
	       $target = $first;
	     }else{
	       $target = $last;
	     }
	   }
	   if(!$target.is($active)){
	     $slider.trigger('cycle');
	   }
	   if($target.is($last)){
         $slider.addClass('at-end');    
     }else{
         $slider.removeClass('at-end');  
     }
	   $slider.one('cycled', function(){
	     if($target.is($first)){
           $slider.addClass('at-start');    
       }else{
           $slider.removeClass('at-start');  
       }
	   });
	   $active.add($target).toggleClass('active');
	   setTimeout(function(){
	     
	     $slider.trigger('cycled')
	   },10);
	 }
	 
	 function setupProxyControls( slider ){
	   
	  var $slider = $( slider );
	  var $slides = $slider.find('.edb-slides');
	  var $prev = $('<a href="#">').addClass('proxy-control proxy-control-prev');
	  var $next = $('<a href="#">').addClass('proxy-control proxy-control-next');
	  $slides.after($prev)
	  $slides.after($next)
	  $prev.on('click', function(){
	    $slider.find('.controls .prev').click()
	  })
	  $next.on('click', function(){
      $slider.find('.controls .next').click()
    })
	  
	 }
	 
	 function updateCount( slider ){
	   var $slider = $( slider );
	   var total = $slider.find('.edb-slide');
	   var index = $slider.find('.edb-slide.active').index();
	   $slider.find('.indicator.current').text(index + 1 );
	   $slider.find('.indicator.last').text( total.length );
	   if(index === 0 && !$slider.hasClass('at-start')){
	     $slider.addClass('at-start');
	   }
	 }
	 
	 function hammerDown( slider ){
	   var $slider = $( slider );
	   if(!$slider.data('hammered')){
	     var hammer = new Hammer( $slider.get(0) );
	     hammer.get('pan').set({ threshold: 0.1 })
	     $slider.data('hammered', hammer );
	     hammer.on('swipeleft', function(){
	       cycle( $slider, 1 )
	     });
	     hammer.on('swiperight', function(){
         cycle( $slider, -1 )
       })
	     
	   }
	 }
	 
	 $(document).on('click', '.controls .next, .controls .prev', function(e){
	   e.preventDefault();
	   var $slider = $(this).closest('.edb-slider');
	   //var kenburns  = $slider.data('kenburns');
	   //if(kenburns){
	   //  $slider.removeClass('kenburns')
	   //}
	   var dir = $(this).hasClass('next') ? 1 : 0;
	   cycle( $slider, dir );
	   //if(kenburns){
	   //$slider.one('cycled', function(){
	   //  setTimeout(function(){
	   //   $slider.addClass('kenburns')  
	   //  },1000)
	     
	   //});
	   //}
	 })
	 
	 $( document).on('cycled', '.edb-slider', function(){
	   updateCount( this );
	 });
	 
   $(function( ) {
      $('.edb-slider').each(function(){
        updateCount( this );
        hammerDown( this );
        setupProxyControls( this );
      });
      
      
   });
   
   $(document).ajaxSuccess(function(){
     $('.edb-slider').each(function(){
       updateCount( this );
       hammerDown( this );
     });
   });
   
   
    
   
   
	  /*

	 *
	 * When the window is loaded:
	 *
	 * $( window ).load(function() {
	 *
	 * });
	 *
	 * ...and/or other possibilities.
	 *
	 * Ideally, it is not considered best practise to attach more than a
	 * single DOM-ready or window-load handler for a particular page.
	 * Although scripts in the WordPress core, Plugins and Themes may be
	 * practising this, we should strive to set a better example in our own work.
	 */
   // shim layer with setTimeout fallback
  // window.requestAnimFrame = (function(){
  //   return  window.requestAnimationFrame       ||
  //           window.webkitRequestAnimationFrame ||
  //           window.mozRequestAnimationFrame    ||
  //           function( callback ){
  //             window.setTimeout(callback, 1000 / 60);
  //           };
  // })();
  // function initialize( slider ){
  //   var $slider = $(this).addClass('initialized');
  // }
  // function render(){
  //   $('.edb-slider:not(.initialized)').each( function( ){
  //     initialize( this );
  //   });
  // }
   // usage:
   // instead of setInterval(render, 16) ....
   
  // (function animloop(){
  //   requestAnimFrame(animloop);
  //   render();
  // })();
})( jQuery );
