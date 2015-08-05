!(function($) {
    // Use basil.js to create an in-browser key-value store.
    var storeOptions = {
        namespace: 'edb-toast',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);
    var debugMode = store.get('edb-splash:debug');
    var sayThankYou = function() {
        $('#toast').find('form input').remove();
        setTimeout(hideToast, 3000);
    }
    var showToast = function() {
        store.set('lastToastSeen', $('#toast').data('toast'));
        $('#toast').addClass('show');
    }
    var hideToast = function() {
        $('#toast').removeClass('show');
    }
    var onClickClose = function() {
        store.set('lastToastClosed', new Date().getTime());
        hideToast();
    }
    var onClickSend = function() {
        store.set('lastToastSent', $('#toast').data('toast'));
    }

    $(document).on('click', '#toast .close', onClickClose);
    $(document).on('submit', '#toast form', onClickSend);

    var toastInterval = setTimeout(checkToast, 1000);
    var checkToast = function() {
        clearInterval(toastInterval);
        var now = new Date().getTime();
        var day = 1000; // * 60 * 60 * 24;
        if ($('#toast .wpcf7-mail-sent-ok').length) {
            return sayThankYou();
        } else if ($("#toast .invalid").length) {
            showToast();
        } else if (now - (1 * store.get('lastToastClosed')) > day) {
            showToast();
        } else {
            if (store.get('lastToastClosed')) {
                hideToast();
            }

        }

        toastInterval = setTimeout(checkToast, 1000);
    }
    $(function() {
        // if (store.get('lastToastSent') != $('#toast').data('toast')) {
        //     checkToast()
        // }


    });





})(jQuery)