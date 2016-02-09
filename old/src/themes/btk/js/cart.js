 jQuery(function() {
   
   var onUpdateCartBeforeNavSuccess = function(html) {
     jQuery('#cartForm').trigger('cart-udpated');
   };
   var onUpdateCartBeforeNavError = function(error) {
     console.log(error);
   };

   var updateTotals = function() {
     var totalQties = 0;
     var totalCost = 0;
     $('.btk-cart-item-qty-select').each(function() {
       totalQties += parseFloat($(this).find('.btk-cart-item-qty-select-input').val());
       totalCost += parseFloat($('.btk-cart-item-qty-select-price-total').text().replace('$', ''));
     });

     // var qties = $('.btk-cart-item-qty-select-input').map(function( ){ return $(this).val(); });
     // var totals = $('.btk-cart-item-qty-select-price-total').map( function(){ return parseFloat($(this).text().replace('$',''))});
     // var totalItemsInCart = qties.reduce( function( a, b ){
     //   return a + b;
     // }, 0 );
     // var totalCostOfCart = totals.reduce( function( a, b ){
     //                         return a + b;
     // }, 0 ); 
     $('#cart-item-counter').text(totalQties);
     $('.cart-totals.subtotal .amount').text('$' + totalCost.toFixed(2));
   };

   var ajax = {
     type: 'POST',
     url: jQuery('#cartForm').attr('action'),
     success: onUpdateCartBeforeNavSuccess,
     error: onUpdateCartBeforeNavError
   }
   window.updateCartBeforeNav = function() {

     ajax.data = jQuery('#cartForm').serialize();
     jQuery.ajax(ajax);
     console.log('ajax called')
   };


   jQuery(document).on('click', '.btk-cart-checkout-button', function(e) {
     console.log(e.isDefaultPrevented());
     e.preventDefault();

     var destination = $(this).attr('href');
     jQuery('#cartForm').one('cart-udpated', function() {

       window.location.href = destination;
     });
     updateCartBeforeNav();
     return false;
   });

   jQuery(document).on('click', '.btk-cart-back-button', function(e) {
     console.log(e);
     e.preventDefault();
     var destination = $(this).attr('href');
     jQuery('#cartForm').one('cart-udpated', function() {
       window.location.href = destination;
     });
     updateCartBeforeNav();
     return false;
   });


   jQuery(document).on('change', '.btk-cart-item-qty-select-input', function(e) {
     var $item = $(this).parents('.btk-cart-item');
     var data = $item.data('json');
     data.qty_wanted = $(this).val();
     var noticeText = '';
     var totalText = '$' + (parseFloat(data.item_price) * data.qty_wanted).toFixed(2);
     if (data.qty_wanted > data.qty_in_stock) {
       noticeText = (data.qty_wanted - data.qty_in_stock) + ' on backorder.';
     }
     $item.find('.btk-cart-item-qty-select-input').text(noticeText);
     $item.find('.btk-cart-item-qty-select-price-total').text(totalText);
     updateTotals();
   });
   // var val = $(this).val();
   // var data = {
   //     action: 'woocommerce_apply_coupon',
   //     security: wc_checkout_params.apply_coupon_nonce,
   //     coupon_code: val
   // }
   // jQuery.ajax({
   //     type: 'POST',
   //     url: wc_checkout_params.ajax_url,
   //     data: data,
   //     success: function(e) {
   //         window.btk.updateOrder(function() {
   //             console.log(arguments)
   //         });
   //     }
   // })
   // var requestAnimFrame = (function() {
   //     return window.requestAnimationFrame ||
   //         window.webkitRequestAnimationFrame ||
   //         window.mozRequestAnimationFrame ||
   //         function(callback) {
   //             window.setTimeout(callback, 1000 / 60);
   //         };
   // })();

   // var getShippingCost = function(total) {
   //     return total > 500 ? 0 : 65;
   // };

   // var storeOptions = {
   //     namespace: 'edb-checkout',
   //     storages: ['local', 'cookie', 'session', 'memory'],
   //     expireDays: 365
   // }



   // var store = new window.Basil(storeOptions);

   // var $ = jQuery;
   // var $cart = $('.page-cart');
   // var timeout;
   // var lastTotal = 0;

   // // var debounceUpdate;
   // // $(function() {
   // //     var upd_cart_btn = $("input[name=update_cart]");
   // //     upd_cart_btn.hide();
   // //     $(".qty").on("change", function() {
   // //         clearTimeout(debounceUpdate);
   // //         debounceUpdate = setTimeout(function() {
   // //             upd_cart_btn.trigger("click");
   // //         }, 100)

   // //     });
   // // });



   // if ($cart.length) {
   //     var $totl = $cart.find('.cart-totals.subtotal .amount');
   //     var $estm = $cart.find('.cart-totals.estimation .estimated-amount');
   //     var $items = $('.cart_item');
   //     var calcTotals = function() {

   //         // clearTimeout(timeout);
   //         var subtotal = 0;
   //         var $items = $('.cart_item');
   //         var qties = 0;
   //         if ($items.length) {
   //             $items.each(function() {
   //                 var $item = $(this);
   //                 var $amnt = $item.find('.product-price .amount');
   //                 var $qty = $(this).find('input.qty');
   //                 var inStock = $(this).data('json').in_stock;

   //                 var qty = $qty.val();
   //                 var $over;

   //                 if(qty > inStock){
   //                   $over = $item.find('.overstock');
   //                   if(!$over.length){
   //                     $over = $('<small class="overstock"><b>'+( qty - inStock )+'</b> are backorder.</small>')
   //                   }else{
   //                     $over.html( '<b>' (qty - inStock) + '</b> are backorder.' );
   //                   }
   //                   $item.find('.product-quantity').append($over);
   //                 }else{
   //                   $item.find('.overstock').remove();
   //                 }
   //                 qties += (1 * qty);
   //                 var cost = 1 * $(this).data('json').price;
   //                 var amnt = cost * qty;
   //                 subtotal += amnt;
   //                 $amnt.text('$' + amnt.toFixed(2));

   //             });
   //         }
   //         if (subtotal !== lastTotal) {
   //             lastTotal = subtotal;
   //             $totl.text('$' + subtotal.toFixed(2));
   //             $estm.text('$' + getShippingCost(subtotal).toFixed(2));
   //             store.set('cart_estimated_shipping_cost', getShippingCost(subtotal));
   //         }
   //         // $('#cart-item-counter').text(qties);
   //         timeout = requestAnimFrame(calcTotals);
   //     }

   //     // $items.each(function() {
   //     //     console.log($(this).data('json'))
   //     //     $(this).data('cost', 1 * $(this).find('.product-price').text().trim().replace('$', ''));
   //     // });
   //     timeout = requestAnimFrame(calcTotals);


   // }

 });