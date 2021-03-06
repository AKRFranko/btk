!(function($) {
    // Use basil.js to create an in-browser key-value store.
    var storeOptions = {
        namespace: 'edb-splash',
        storages: ['local', 'cookie', 'session', 'memory'],
        expireDays: 365
    }


    var store = new window.Basil(storeOptions);

    // Custom Storage Class That handles synchronizations with $_SESSION data.
    var EDBBrowserStorage = function() {
        if (!(this instanceof EDBBrowserStorage)) return new EDBBrowserStorage();
        return this;
    }

    EDBBrowserStorage.prototype = {
        // Get all local values.
        all: function() {
            var keys = store.keys();
            var json = keys.reduce(function(obj, key) {
                obj[key] = store.get(key);
                return obj;
            }, {});
            return json;
        },
        // Get a specific value.
        get: function(key) {
            if (arguments.length === 0) {
                return this.all();
            }
            return store.get(key);
        },
        // Set a value.
        set: function(key, value) {
            return store.set(key, value);
        },
        // Synchronize with $_SESSION.
        sync: function(callback) {
            var it = this;
            var complete = callback || $.noop;
            var data = {
                "edb-browser-storage": this.all(),
                action: 'synchronize_browser_storage'
            };
            $.ajax({
                url: btk_ajax.ajax_url,
                type: "POST",
                dataType: 'json',
                data: data,
                success: function(results) {
                    if ('string' === typeof results) {
                        results = JSON.parse(results);
                    }
                    Object.keys(results).forEach(function(key) {
                        it.set(key, results[key]);
                    });
                    complete(null, it.all());
                },
                error: function(error) {
                    complete(error);
                }
            });
        }
    }

    var EDBSplashPage = function() {
        if (!(this instanceof EDBSplashPage)) return new EDBSplashPage();
        this.store = new EDBBrowserStorage();
        return this;
    }

    EDBSplashPage.prototype = {
        debugToggle: function($btn) {
            var val = this.store.get('debug');
            if (val) {
                this.store.set('debug', false);

            } else {
                this.store.set('debug', true);

            }
            window.location.reload(true);
        },
        show: function(callback) {
            var complete = callback || $.noop;
            var it = this;
            var now = (new Date()).getTime();
            var data = this.store.all();
            if (!this.store.get('debug') && this.store.get('devon')) return true;

            if (!this.store.get('debug') && (data.splash && data.splash.value === true)) {
                $('body').trigger('splash-closed', data);
                return complete(null, false);
            } else {
                it.fetch(function(error, images) {
                    var splash = it.build(images);
                    splash.find('button').on('click', function(e) {
                        e.preventDefault();
                        var btn = $(this);
                        var lang = btn.data('lang');
                        it.store.set('splash', {
                            value: true,
                            time: now
                        });
                        it.store.set('lang', {
                            value: lang,
                            time: now
                        });
                        it.store.sync(complete);
                        setTimeout(function() {
                            $('body').removeClass('splash-on');
                            $('body').trigger('splash-closed', data);
                            $('#splash-page').remove();
                        }, 200);
                    });
                    $('body').append(splash).addClass('splash-on')
                });
            }
        },
        build: function(data) {
            var header = $('<h1>élément de base</h1><h2>EDB</h2>');
            var container = $('<form>').attr('id', 'splash-page');
            var enBtn = $('<button>').data('lang', 'en');
            var frBtn = $('<button>').data('lang', 'fr');
            enBtn.append($('<span>').text('english').attr('title', 'english'));
            frBtn.append($('<span>').text('français').attr('title', 'français'));
            enBtn.append($('<span>').addClass('icon-chevron-lite-right-white'));
            frBtn.append($('<span>').addClass('icon-chevron-lite-right-white'));
            var images = $('<div>');
            data.forEach(function(src) {
                var image = $('<div>').addClass('splash-image');
                image.css('background-image', 'url("' + src + '")');
                images.append(image);
            });
            container.append(images);
            container.append(enBtn);
            container.append(frBtn);
            container.append(header);
            return container;
        },
        fetch: function(callback) {
            var callback = callback || $.noop;
            var it = this;
            $.ajax({
                url: btk_ajax.ajax_url,
                type: "GET",
                dataType: 'json',
                data: {
                    "edb-splash-images": true,
                    action: 'provide_splash_images'
                },
                success: function(results) {
                    if ('string' === typeof results) {
                        results = JSON.parse(results);
                    }
                    callback(null, results);

                },
                error: function(error) {
                    callback(error);
                }
            });
        }
    }

    $(function() {

        var splashPage = new EDBSplashPage();
        splashPage.show();
        var $tog = $('<button>').text('turn debug ' + (store.get('debug') ? 'off' : 'on'));
        $('#colophon').append($tog);
        $tog.on('click', function() {
            splashPage.debugToggle($(this));
        })
    });


})(jQuery)