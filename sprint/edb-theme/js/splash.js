/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */
( function() {
  
  var lastSplashSeen = localStorage.getItem('last_splash_seen');
  
  $(function(){
    $('#splash').each(function(){
      var $splash = $( this );
      var splashID = $splash.data('id');
      if(lastSplashSeen === splashID){
        $splash.remove();
      }else{
        $('body').addClass('.splash');
      }
    });
  });

} )();
