/* global wc_cart_params */
jQuery( function( $ ) {
  
  
  $(document).ajaxSend( function( event, request ,settings ){
    console.log(settings);
    if(settings.url == '/cart/?wc-ajax=update_shipping_method' || settings.url == '/checkout/?wc-ajax=update_order_review'){
        var qs = settings.data;
        
        $( 'select.shipping_method, input[name^=shipping_method][type=radio]:checked, input[name^=shipping_method][type=hidden]' ).each( function() {
          qs += '&shipping_method['+$( this ).data( 'index' )+']=' + $( this ).val();
        });
        settings.data = qs;
    }
  });
  var ajaxUpdateCart = function(){
    
    $('input[name=update_cart]').click();
    
  };
  
  var updateTo = 0;
  var updateCartFragments = function(){
    clearTimeout(updateTo);
    updateTo = setTimeout( ajaxUpdateCart, 500 );
  };
  $(document).on('change', '.cart-item-quantity-input input', function( e ){
    updateCartFragments();
  });
  
});