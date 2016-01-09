/* global wc_cart_params */
jQuery( function( $ ) {
  
  
  
  $(document).ajaxSend( function( event, request ,settings ){
    
    if(settings.url == '/cart/?wc-ajax=update_shipping_method' || settings.url == '/checkout/?wc-ajax=update_order_review'){
        var qs = settings.data;
        
        settings.data = qs+'&'+$( 'select.shipping_method, input[name^=shipping_method][type=radio]:checked, input[name^=shipping_method][type=hidden]' ).serialize();
    }
  });
  $(document).ajaxSuccess( function( event, request, settings, data){
    if(/update_order_review/.test(settings.url)){
      $('.cart-costs-repeat').html( $('.cart-costs').html() );
      $('.cart-review-items-repeat').html( $('.cart-review-items').html() );
      
      var $review = data.fragments['.woocommerce-checkout-review-order-table'];
      console.log(  $($review).find('.cart_item') );
      
    }
    // console.log(request);
  });
  
 
  var ajaxUpdateCart = function(){
    
    $('input[name=update_cart]').click();
    
  };
  
  var ajaxApplyCoupon = function(){
    var security = wc_checkout_params.apply_coupon_nonce;
    var url = wc_checkout_params.wc_ajax_url.replace('%%endpoint%%','apply_coupon');
    var coupon_code = $('#coupon_code').val();
    var data = { coupon_code: coupon_code, security: security }
    if(coupon_code){
      var $form = $('#coupon_code').parents('form');
      if( $form.is('.processing')){
        return false;
      }else{
        $form.addClass('processing').block({
          message: null,
          overlayCSS: {
            background: '#fff',
            opacity: 0.6
          }
        });

        $.post( url, data, function( html ){
          $form.removeClass( 'processing' ).unblock();
          
          var $html = $( html );
          $('#coupon_code').val('');
          $( '.woocommerce-error, .woocommerce-message' ).remove();
          $form.before( $html );
          $( document.body ).trigger( 'update_checkout', { update_shipping_method: false } );
          
        });    
      }
      
    }
    
  }
  
  
  
  var debounce = function( fn, time ){
    clearTimeout(fn.debounceTimeout);
    fn.debounceTimeout = setTimeout( fn, time );
  }
  // var couponTo = 0;
  // var updateTo = 0;
  // var updateCartFragments = function(){
  //   clearTimeout(updateTo);
  //   updateTo = setTimeout( ajaxUpdateCart, 500 );
  // };
  
  $(document).on('change', '.cart-item-quantity-input input', function( e ){
    debounce( ajaxUpdateCart, 500 );
  });
  $(document).on('change', '#coupon_code', function( e ){
    debounce( ajaxApplyCoupon, 500 );
  });
  $(document).on('keyup', '#coupon_code', function( e ){
    debounce( ajaxApplyCoupon, 2000 );
  });
  
  

  // var activeTab = null;
  
  $(document).ajaxComplete( function(){
    console.log('ajaxComplete');
    $('#checkout-panel-tabs a.active').click()
  
  });
  
  
  $( document ).ready( function(){
    if($('form.checkout').length){
      var hash = window.location.hash;
      var activeHash = $('#checkout-panel-tabs a.active').attr('href');
      if(activeHash != hash){
        $('#checkout-panel-tabs a[href='+hash+']').click();  
      }  
      var panelInput = $('#currentPanel');
      if(panelInput.length === 0){
        panelInput = $('<input>').attr({ id: 'currentPanel',type: 'hidden', name: 'current_panel' }).appendTo('form.checkout');
      }
      panelInput.val( window.location.hash );
    }
    
  });
  
  $(document).on('click', '#checkout-panel-tabs a', function( e ){
    e.preventDefault()
    $('.checkout-panel.active, #checkout-panel-tabs a.active, .summary.active').removeClass('active');
    var hash = $(this).attr('href');
    var $target = $( hash );
    var $summary = $( '.summary[data-panel="'+hash+'"]');
    
    $(this).add($target).add($summary).addClass('active');
    $('#currentPanel').val(hash);
    if(!history.replaceState){
      window.location.hash = hash;
    }else{
      history.replaceState({}, '', hash);  
    }
    
    
  });
  
  $(document).on('keydown', 'form.checkout', function( e ){
    var currentPanel = $('#currentPanel').val();
    if(e.keyCode === 13 && currentPanel !== '#place-order-panel'){
      e.preventDefault();
    }
  })
  
  var getCreditCardType = function(accountNumber){
    var result = "unknown";
    if (/^5[1-5]/.test(accountNumber)){
      result = "mastercard";
    }else if (/^4/.test(accountNumber)){
      result = "visa";
    }else if (/^3[47]/.test(accountNumber)){
      result = "amex";
    }
    return result;
  }
  var getCreditCardNumberString = function( number ){
    var parts = number.split(' ');
    var string = [];
    if(parts.length >= 4){
      return 'xxxx xxxx xxxx ' + parts[parts.length-1];
    }else{
      return '-';
    }
  }
  
  $(document).on('keyup','#paypal_pro-card-number', function( event ){
    $('.credit-card-type').text( getCreditCardType( $(this).val() ) );
    $('.credit-card-number').text( getCreditCardNumberString( $(this).val() ) );
  });
  // $(document).on('change','.edb_shipping', function(){
    // console.log( $('.edb_shipping').serialize() );
    // $(document.body).trigger('update_checkout');
  // });
  
  $(function(){
    $('.woocommerce form .form-row label').each(function(){
      var $label = $( this );
      var $input = $label.next('input,select');
      if($input.length){
        $input.attr('placeholder', $label.text() );
      }
    })
  })
  
});