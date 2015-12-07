!(function($) {
    var storeOptions = {
        namespace: 'edb-checkout',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);
    var tabbar = $('.tabbar');
    var currentTab = null;
    var activateTab = function(tab) {
        var $tab = $(tab);

        var $others = $(tab).siblings('.tab').not($tab);
        var paneSelector = $tab.data('pane');
        if (currentTab !== paneSelector) {
            var $pane = $('#' + paneSelector);
            var $otherPanes = $('.tabpane').not($pane);
            $others.add($otherPanes).removeClass('active');
            $tab.add($pane).addClass('active');
            var index = $tab.index();
            store.set('last_checkout_tab', index + 1);
            tabbar.trigger('tab-changed', [currentTab, paneSelector]);
            currentTab = paneSelector;

        }

    }
    $(document).on('click', '.summary-box .toggle-box', function() {
        var $tog = $(this);
        var $sum = $(this).parents('.summary-box');
        $sum.toggleClass('closed');
    })
    var findTabTarget = function(pane) {
        return $('.tabbar .tab').filter(function() {
            return $(this).data('pane') == pane;
        });
    }
    var highlightTabsWithErrors = function() {
        return false;
        $('.tabpane').each(function() {
            var errors = $(this).find('.woocommerce-invalid');
            var $tab = findTabTarget($(this).attr('id'));
            if (errors.length > 0) {
                $tab.attr('data-invalids', errors.length);
            }
            if (!$tab.attr('data-invalids')) {



                errors.on('change', function() {
                    errors -= 1
                    if (errors > 0) {
                        $tab.attr('data-invalids', invalids);
                    } else {
                        $tab.removeAttr('data-invalids');
                    }

                });
            }
        })
    }
    $('.tabbar .tab').on('click', function(event) {
        event.preventDefault();
        activateTab(this)
    });

    window.btk.updateOrder = function(callback) {
        var data = {
            action: 'woocommerce_update_order_review',
            security: wc_checkout_params.update_order_review_nonce,
            post_data: $('form.checkout').serialize()
        }
        jQuery.ajax({
            type: 'POST',
            url: wc_checkout_params.ajax_url,
            data: data,
            success: function(e) {
                if (e.fragments) {
                    Object.keys(e.fragments).forEach(function(sel) {
                        $(sel).replaceWith(e.fragments[sel]);
                        console.log($(sel))
                    });
                }
                callback(null, e);
                console.log('success');
            },
            error: function(e) {
                callback(e);
                console.log('error', e);
            }
        })

    }
    var tabbing = false;
    $('.tabnext').on('click', function(event) {
        event.preventDefault();
        if (tabbing) return;
        tabbing = true;
        window.btk.updateOrder(function(error, data) {
            if (!error) {
                $('.tab.active').next().click();
            }
            tabbing = false;
        });
        // var data = {
        //     action: 'woocommerce_update_order_review',
        //     security: wc_checkout_params.update_order_review_nonce,
        //     post_data: $('form.checkout').serialize()
        // }
        // jQuery.ajax({
        //     type: 'POST',
        //     url: wc_checkout_params.ajax_url,
        //     data: data,
        //     success: function() {
        //         console.log('success')
        //         $('.tab.active').next().click();
        //     },
        //     complete: function() {
        //         tabbing = false;
        //     },
        //     error: function() {
        //         console.log('error', arguments);
        //     }
        // })

    });

    $('.tabto').on('click', function(event) {
        event.preventDefault();
        var $target = findTabTarget($(this).data('pane'));
        $target.click();
    });

    $(function() {
        var index = store.get('last_checkout_tab');
        if (!index) index = 1;

        $tab = $('.tabbar .tab:nth-of-type(' + index + ')');
        activateTab($tab);

    })

    setInterval(function() {

        highlightTabsWithErrors()
    }, 100)

})(jQuery)