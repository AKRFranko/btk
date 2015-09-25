 jQuery(function() {
     if (!$('body').is('.page-checkout')) return false;

     var storeOptions = {
         namespace: 'edb-checkout',
         storages: ['local', 'cookie', 'session', 'memory'],
         expireDays: 365
     }


     var store = new window.Basil(storeOptions);

     var sumBar = $('.summary-bar');
     var fieldNames = [];
     var sumFields = $('.summary-bar span');
     var estship = store.get('cart_estimated_shipping_cost');
     if (estship || estship === 0) {
         $('input[name=delivery_fees_subtotal]').val('$' + estship.toFixed(2));
     }
     sumFields.each(function() {
         var $fld = $(this);
         var kls = $fld.attr("class");
         var name = kls.replace(/_summary$/, '');
         var $inp = $('form[name="checkout"] input[name="' + name + '"]');
         $inp.on('change focusout', function() {
             var val = $(this).val();
             if (val) $fld.text(val);
             sumBar.trigger('updated', {
                 name: name,
                 value: val
             });
         });
         if ($inp.val()) {
             $fld.text($inp.val());
         };
     });
     $('.tabbar').on('tab-changed', function(event, from, to) {
         console.log('tab changed from', from, 'to', to)
         $('html,body').animate({
             scrollTop: 0
         }, 333);
     })
     $('#ship-to-different-address-checkbox').on('change', function() {
         if ($(this).is(':checked')) {
             $('.shipping-address-summary').show()
                 //$('.billing-address-summary').hide()
         } else {
             $('.shipping-address-summary').hide()
                 //$('.billing-address-summary').show()
         }

     }).trigger('change')

     $('#local_pickup_option').on('change', function() {
         var isRush = $('#rush_delivery_option').get(0).checked;
         var isPickup = $('#local_pickup_option').get(0).checked;
         var $input = $('input[name="shipping_method[0]"]');
         var $pick = $('#shipping_method_0_local_pickup');
         var $deliv = $('#shipping_method_0_local_delivery');
         if (isPickup) {
             if (isRush) $('#rush_delivery_option').click();
             $pick.click()
         } else {
             $deliv.click();
         }

         // if ($(this).is('#rush_delivery_option')) {

         // }

     }).trigger('change')

     $('#rush_delivery_option').on('change', function() {
         var isRush = $('#rush_delivery_option').get(0).checked;
         var wasPickup = $('#local_pickup_option').get(0).checked;
         if (isRush && wasPickup) {
             $('#local_pickup_option').click();
         }
     }).trigger('change')

     $('form[name="checkout"]').on('change', function(event) {
             var target = $(event.target);
             console.log('changed', target.attr('name'));
         })
         // window.serializeObject = function(form) {
         //     var serialized = $(form).serializeArray();
         //     var data = {};
         //     serialized.forEach(function(field) {
         //         if (data[field.name] !== 0) {
         //             if (jQuery.isArray(data[field.name])) {
         //                 data[field.name].push(field.value);
         //             } else {
         //                 data[field.name] = [field.value];
         //             }
         //         } else {
         //             data[field.name] = field.value;
         //         }
         //     });
         //     console.log(data)
         // }

     $(function() {
         var stickies = document.querySelectorAll('.tabbar, .summary-bar');
         for (var i = stickies.length - 1; i >= 0; i--) {
             Stickyfill.add(stickies[i]);
         }
     })

 });