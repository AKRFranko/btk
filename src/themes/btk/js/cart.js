 jQuery(function() {

     var getShippingCost = function(total) {
         return total > 499 ? 0 : 75;
     };
     var $ = jQuery;
     var $cart = $('.page-cart');
     var timeout;
     var lastTotal = 0;
     if ($cart.length) {
         var $totl = $cart.find('.cart-totals.subtotal .amount');
         var $estm = $cart.find('.cart-totals.estimation .estimated-amount');
         var $items = $('.cart_item');
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
                     var cost = 1 * $(this).data('json').price;
                     var amnt = cost * qty;
                     subtotal += amnt;
                     $amnt.text('$' + amnt.toFixed(2));
                 });
             }
             if (subtotal !== lastTotal) {
                 lastTotal = subtotal;
                 $totl.text('$' + subtotal.toFixed(2));
                 $estm.text('$' + getShippingCost(subtotal).toFixed(2));
             }

             timeout = setTimeout(calcTotals, 200);
         }

         // $items.each(function() {
         //     console.log($(this).data('json'))
         //     $(this).data('cost', 1 * $(this).find('.product-price').text().trim().replace('$', ''));
         // });
         timeout = setTimeout(calcTotals, 200);


     }

 });