//
/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */
( function($) {
  
  var lastSplashSeen = localStorage.getItem('last_splash_seen');
  
  $(function(){
    $('#splash').each(function(){
      var $splash = $( this );
      $splash.remove();
      // var splashID = $splash.data('id');
      // if(lastSplashSeen === splashID){
      //   $splash.remove();
      // }else{
      //   $('body').addClass('splash');
      //   $splash.addClass('active');
      // }
      // $('#splash').on('click', '.language-selection', function(){
      //   localStorage.setItem('last_splash_seen', splashID );
      // })
    });
    // $('#contest').each()
    
  });

} )(jQuery);
