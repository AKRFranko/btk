!(function($) {
    var storeOptions = {
        namespace: 'edb-checkout',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);

    var activateTab = function(tab) {
        var $tab = $(tab);
        var $others = $(tab).siblings('.tab').not($tab);
        var paneSelector = $tab.data('pane');
        var $pane = $('#' + paneSelector);
        var $otherPanes = $('.tabpane').not($pane);
        $others.add($otherPanes).removeClass('active');
        $tab.add($pane).addClass('active');
        var index = $tab.index();
        store.set('last_checkout_tab', index + 1);
    }
    var findTabTarget = function(pane) {
        return $('.tabbar .tab').filter(function() {
            return $(this).data('pane') == pane;
        });
    }
    var highlightTabsWithErrors = function() {

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

    $('.tabnext').on('click', function(event) {
        event.preventDefault();
        $('.tab.active').next().click();
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