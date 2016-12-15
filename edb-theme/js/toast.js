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
  
  if(null !== sessionStorage.getItem('has_dismissed_newsletter')){
    localStorage.setItem('has_dismissed_newsletter',sessionStorage.getItem('has_dismissed_newsletter'));
  }
  var contestEntered = localStorage.getItem('has_signed_up_for_newsletter');
  var contestDismissed =localStorage.getItem('has_dismissed_newsletter')||0;
  contestDismissed = parseFloat( contestDismissed );
  if(isNaN(contestDismissed)) contestDismissed = 0;
  var showDismissedContest = contestDismissed >= 1 ? false : true;
  
  $(function(){
    // $('#contest').remove();
    if($(document.body).hasClass('splash') || $('#edb-faq').length ){
      $('#contest').remove();
    }else{
      if(contestEntered){
        $('#contest').remove();
      }else if(!showDismissedContest){
        $('#contest').remove();
      }else{
        if(!/checkout/.test(window.location.href)){
          setTimeout( function(){
            $('#contest').addClass('active');
          }, 10000)  
        }else{
          $('#contest').remove();
        }
        
        // $('#contest').addClass('active');
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
    // $toast.removeClass('active');
    $toast.hide();
    localStorage.setItem('has_dismissed_newsletter', contestDismissed+1 );
  });
  
  // $(document).ajaxComplete(function(event ,request ){
  //   if(request.responseJSON && request.responseJSON.mailSent){
  //     localStorage.setItem('has_entered_contest', true );
  //     if($('#contest').length){
  //       $('.wpcf7-response-output').remove();
  //       $('#contest .content').html($('.btk-form-success.inplace').html())  
  //     }
      
  //   }
  // });
 
  
  $(document).on('submit', 'form#newsletter', function( e ){
    e.preventDefault();
    console.log('subscribing to newsletter')
    $.ajax({
      url: ajax_object.ajax_url,
      data: {
        'action': 'subscribe_to_newsletter',
        'email': $('#newsletter input').val()
      },
      success: function( data ){
        var json = JSON.parse(data);
        if(!json.error){
          localStorage.setItem('has_signed_up_for_newsletter', true );  
        }
        if($('#contest .body').length){
          $('#contest .body').html('<p class="success-message">'+json.message+'</p>');  
        }else{
          var $form= $('.entry-content');
          $form.fadeOut(function(){
            var $p = '<p class="success-message">'+json.message+'</p>';
            $form.html($p).fadeIn();    
          });
          
          
        }
        
        
      },
      error: function( error ){
        if($('#contest .body').length){
          $('#contest .body').html( '<p>Oops. Sorry, something went wrong. Please try again latter.</p>' );  
        }else{
          $('.entry-content').hide().html('<p>Oops. Sorry, something went wrong. Please try again latter.</p>').show();  
        }
        
      }
    });
    
  });
  
  
} )(jQuery);
