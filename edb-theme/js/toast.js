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
        }, 100)
      }  
    }
    $('input[name=attribute_edb_material]').trigger('change')
  });
  
  $(document).on('change', function(){
    var material = $('input[name=attribute_edb_material]').val();
    if(!material){
      $('#show-material-toast').hide()  
      
    }else{
      $('#show-material-toast').show()  
      
    }
    
  });
  
  $(document).on('click', '#show-material-toast', function( e ){
    var materialNo = $('input[name=attribute_edb_material]').val();
    var classes = 'toast vertical top active material-'+materialNo;
    $('#material-toast').attr('class', classes );
    $('body').addClass('toast-cover');
  });
  $(document).on('click', '#material-toast .close', function( e ){
    e.preventDefault()
    var $close = $(this);
    var $toast = $close.closest('.toast');
    $toast.removeClass('active');
    $('body').removeClass('toast-cover');
  });
  $(document).on('click','#contest .close', function( e ){
    e.preventDefault()
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
