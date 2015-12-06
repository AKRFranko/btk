 jQuery(function() {

     var getShippingCost = function(total) {
         return total > 499 ? 0 : 75;
     };

     var storeOptions = {
         namespace: 'edb-checkout',
         storages: ['local', 'cookie', 'session', 'memory'],
         expireDays: 365
     }


     var store = new window.Basil(storeOptions);

     var $ = jQuery;
     var $cart = $('.page-cart');
     var timeout;
     var lastTotal = 0;

     $(function() {
             if ($('.woocommerce-billing-fields').length) {
                 var billingFields = $('[name^=billing_]');
                 var shippingFields = $('[name^=shipping_]');
                 billingFields.each(function() {
                     var $bf = $(this);
                     var sfname = $bf.attr('name').replace('billing', 'shipping');
                     var $sf = $('[name=' + sfname + ']');
                     if ($sf.length) {
                         $bf.on('focusout change', function() {
                             if ($('#same-address-checkbox').is(':checked')) {

                                 $sf.attr('disabled', true);
                                 $sf.val($bf.val()).trigger('change');
                             } else {
                                 $sf.attr('disabled', false);
                                 $sf.val('').trigger('change');
                             }
                         });
                     }
                 });
                 $('#same-address-checkbox').on('click', function() {
                     if ($('#no-shipping-checkbox').is(':checked')) {
                         $('#no-shipping-checkbox').prop('checked', false);
                     }
                     billingFields.each(function() {
                         $(this).trigger('change');
                     })
                 })
                 $('#no-shipping-checkbox').on('click', function() {
                     if ($('#same-address-checkbox').is(':checked')) {
                         $('#same-address-checkbox').prop('checked', false);
                     }
                     shippingFields.each(function() {
                         $(this).val('').trigger('change').attr('disabled', true);
                     })
                 });
             }
         })
         // var copyBillingShippingFields = function() {
         //     var billingFields = $('[name^=billing_]');
         //     billingFields.each(function() {
         //         var bf = $(this);
         //         var sfname = bf.attr('name').replace('billing', 'shipping');
         //         var sf = $('[name=' + sfname + ']');
         //         sf.val(bf.val());
         //     })
         // }
         // var clearShippingFields = function() {
         //     var shippingFields = $('[name^=billing_]');
         //     shippingFields.each(function() {
         //         $(this).val('');
         //     })
         // }
         // $('#same-address-checkbox').on('change', function() {
         //     if ($(this).is(':checked')) {
         //         copyBillingShippingFields()
         //     } else {
         //         clearShippingFields();
         //     }
         // }).trigger('change');

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
                 store.set('cart_estimated_shipping_cost', getShippingCost(subtotal));
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