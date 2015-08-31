 jQuery(function() {

     var $ = jQuery;
     var $cart = $('.page-cart');
     var timeout;
     if ($cart.length) {
         var calcTotals = function() {

             clearTimeout(timeout);
             var subtotal = 0;
             var $items = $('.cart_item');
             if ($items.length) {
                 $items.each(function() {
                     var $item = $(this);
                     var $amnt = $item.find('.product-price .amount');
                     var $qty = $(this).find('input.qty');
                     var qty = $qty.val();
                     var cost = $(this).data('cost');
                     var amnt = cost * qty;
                     subtotal += amnt;
                     $amnt.text('$' + amnt.toFixed(2));
                 });
             }

             $totl.text('$' + subtotal.toFixed(2));
             timeout = setTimeout(calcTotals, 200);
         }
         var $totl = $cart.find('.cart-collaterals .amount:first');
         var $items = $('.cart_item');
         $items.each(function() {
             $(this).data('cost', 1 * $(this).find('.product-price').text().trim().replace('$', ''));
         });
         timeout = setTimeout(calcTotals, 200);


     }

 });