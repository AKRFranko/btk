!(function($) {
    // Use basil.js to create an in-browser key-value store.
    var storeOptions = {
        namespace: 'edb-toast',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);
    var sayThankYou = function() {
        $('#toast').html('<p class="ty">Thanks! Good Luck!</p>');
        setTimeout(hideToast, 1000);
    }
    var showToast = function() {
        store.set('lastToastSeen', 'initial');
        $('#toast').addClass('show');
    }
    var hideToast = function() {
        $('#toast').removeClass('show');
    }
    var onClickClose = function() {
        store.set('lastToastClosed', true);
        hideToast();
    }
    var onClickSend = function() {
        store.set('lastToastSent', true);
        sayThankYou();
    }
    if ($("#toast .invalid")) {
        showToast();
    } else {
        var lastToastSeen = store.get('lastToastSeen');
        var lastToastClosed = store.get('lastToastClosed');
        if (!lastToastSeen) {
            if (lastToastClosed) {
                $(window).blur(showToast);
            } else {
                setTimeout(showToast, 2000);

            }
        }


    }
    $(document).on('click', '#toast .close', onClickClose);
    $(document).on('submit', '#toast form', onClickSend);

})(jQuery)