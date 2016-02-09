//
/**
 * navigation.js
 *
 * Handles toggling the navigation menu for small screens and enables tab
 * support for dropdown menus.
 */
( function($) {
  
  var Toast = function( el ){
    
  }
  var contestEntered = localStorage.getItem('has_entered_contest');
  var contestDismissed =sessionStorage.getItem('has_dismissed_contest');
  
  $(function(){
    if($(document.body).hasClass('splash')){
      $('#contest').remove();
    }else{
      if(contestEntered){
        $('#contest').remove();
      }else if(contestDismissed){
        $('#contest').remove();
      }else{
        setTimeout( function(){
          $('#contest').addClass('active');
        }, 10000)
      }  
    }
    
  });
  
  $(document).on('click','#contest .close', function( e ){
    var $close = $(this);
    var $toast = $close.closest('.toast');
    $toast.removeClass('active');
    sessionStorage.setItem('has_dismissed_contest', true );
  });
  
  $(document).ajaxComplete(function(event ,request ){
    if(request.responseJSON && request.responseJSON.mailSent){
      localStorage.setItem('has_entered_contest', true );
      if($('#contest').length){
        $('.wpcf7-response-output').remove();
        $('#contest .content').html($('.btk-form-success.inplace').html())  
      }
      
    }
  });
  
  
} )(jQuery);
