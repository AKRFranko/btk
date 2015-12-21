jQuery(function() {
    // $('input,select,textarea').trigger('change');
    if (!jQuery('body').is('.page-checkout')){ return false; }


    var onUpdateShippingSuccess = function( response ){
      console.log('shipping-method-update-success', response );
      jQuery(document).trigger('shipping-method-update-success', [ response ]);
    };
    
    var onUpdateShippingError = function( error ){
      console.log('shipping-method-update-error', error );
      jQuery(document).trigger('shipping-method-update-error', [ error ]);
    };
    
    var updateShipping = function( method ) {
      var data = {
        action: 'woocommerce_update_order_review',
        security: wc_checkout_params.update_order_review_nonce,
        shipping_method: [ method ]
      }
      jQuery.ajax({
        type: 'POST',
        url: wc_checkout_params.ajax_url,
        data: data,
        success: onUpdateShippingSuccess,
        error: onUpdateShippingError
      });
    };
 
 



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
            if (name == 'paypal_pro-card-number') {
                val = '...' + val.replace(/\s/g, '').slice(-4);
            }
            $fld.text(val);
            sumBar.trigger('updated', {
                name: name,
                value: val
            });
        });
        if ($inp.val()) {

            $fld.text($inp.val());
        }
    });
    $('.tabbar').on('tab-changed', function(event, from, to) {
            //console.log('tab changed from', from, 'to', to)
            $('.summary-box.not-shown').removeClass('not-shown');
            $('.summary-box').removeClass('closed');
            if (to == 'review-pane') {
                // var total = $('.order-total .amount').text();
                // $('.big-cart-total').text(total);
                $('.summary-box:last-of-type').siblings().addClass('closed');
            } else if (to == 'delivery-pane') {
                $('.summary-box:gt(' + 1 + ')').addClass('not-shown');
                $('.summary-box:lt(' + 1 + ')').addClass('closed');
            } else if (to == 'payment-pane') {
                $('.summary-box:gt(' + 2 + ')').addClass('not-shown');
                $('.summary-box:lt(' + 2 + ')').addClass('closed');
            } else {
                $('.summary-box:first').siblings().addClass('not-shown');

            }
            $('html,body').animate({
                scrollTop: 0
            }, 333);

        })
        // $('#ship-to-different-address-checkbox').on('change', function() {
        //     if ($(this).is(':checked')) {
        //         $('.shipping-address-summary').show()
        //         $('.billing-address-summary').hide()
        //     } else {
        //         $('.shipping-address-summary').hide()
        //         $('.billing-address-summary').show()
        //     }

    // }).trigger('change')

    // $('#same-address-checkbox').on('click', function(e) {
    //     if ($(this).is(':checked')) $(this).removeAttr('checked');
    // });

    // $('#no-shipping-checkbox').on('change', function() {
    //     if ($(this).is(':checked')) {
    //         $('#shipping_method_0_local_pickup').get(0).checked = true;
    //         $('#shipping_method_0_local_delivery').get(0).checked = false;

    //     } else {
    //         $('#shipping_method_0_local_pickup').get(0).checked = false;
    //         $('#shipping_method_0_local_delivery').get(0).checked = true;
    //         // $('#shipping_method_0_local_delivery').click();//
    //     }
    // }).trigger('change');

    // $('#local_pickup_option').on('change', function() {
    //     var isRush = $('#rush_delivery_option').get(0).checked;
    //     var isPickup = $('#local_pickup_option').get(0).checked;
    //     var $input = $('input[name="shipping_method[0]"]');
    //     var $pick = $('#shipping_method_0_local_pickup');
    //     var $deliv = $('#shipping_method_0_local_delivery');
    //     if (isPickup) {
    //         if (isRush) $('#rush_delivery_option').click();
    //         $pick.click()
    //     } else {
    //         $deliv.click();
    //     }
    //     setTimeout(function() {
    //         if ($deliv.is(':checked')) {
    //             $('.delivery_fees_subtotal_summary').text('$65.00');
    //         } else {
    //             $('.delivery_fees_subtotal_summary').text('$0.00');
    //         }
    //     }, 500);
    //     // if ($(this).is('#rush_delivery_option')) {

    //     // }

    // }).trigger('change')

    // $('#rush_delivery_option').on('change', function() {
    //     var isRush = $('#rush_delivery_option').get(0).checked;
    //     var wasPickup = $('#local_pickup_option').get(0).checked;
    //     if (isRush && wasPickup) {
    //         $('#local_pickup_option').click();
    //     }
    // }).trigger('change')

    $('form[name="checkout"]').on('change', function(event) {
            var target = $(event.target);
            //console.log('changed', target.attr('name'));
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
    $('input[name=coupon_code]').on('change', function() {
        var val = $(this).val();
        var data = {
            action: 'woocommerce_apply_coupon',
            security: wc_checkout_params.apply_coupon_nonce,
            coupon_code: val
        }
        jQuery.ajax({
            type: 'POST',
            url: wc_checkout_params.ajax_url,
            data: data,
            success: function(e) {
                window.btk.updateOrder(function() {
                    console.log(arguments)
                });
            }
        })
    })
    $(function() {
        $('.woocommerce-invalid').removeClass('woocommerce-invalid');
        $('.woocommerce-validated').removeClass('woocommerce-validated');
        $('#shipping_country,#billing_country').val('CA').attr('readonly', true);
        var stickies = document.querySelectorAll('.tabbar, .summary-bar');
        for (var i = stickies.length - 1; i >= 0; i--) {
            Stickyfill.add(stickies[i]);
        }

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

                            $sf.val($bf.val()).trigger('change');
                            $sf.attr('readonly', true);
                        } else {

                            $sf.attr('readonly', false);
                            $sf.val('').trigger('change');
                        }

                    });
                }
            });

        }

        $(document).on('btk-shipping-method-change', function(event, data) {
            $('input[name="shipping_method[0]"]').val(data);
            // updateShipping( data );
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

            if ($(this).is(':checked')) {
                shippingFields.each(function() {
                    $(this).val('').attr('readonly', true).trigger('change');

                });
            } else {
                shippingFields.each(function() {
                    $(this).val('').attr('readonly', false).trigger('change');

                });
            }

        });

        $('#same-address-checkbox, #no-shipping-checkbox').on('click', function() {
            var method = $('#no-shipping-checkbox').is(':checked') ? 'local_pickup' : 'local_delivery';
            $(document).trigger('btk-shipping-method-change', [method]);
        })
    })

});