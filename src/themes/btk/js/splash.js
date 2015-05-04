!( function($){
	// Use basil.js to create an in-browser key-value store.
	var storeOptions = {
		namespace:'edb-splash',
		storages: ['local', 'cookie', 'session', 'memory'],
		expireDays: 365
	}


	var store = new window.Basil(storeOptions);

	// Custom Storage Class That handles synchronizations with $_SESSION data.
	var EDBBrowserStorage = function(){
		if( !(this instanceof EDBBrowserStorage) ) return new EDBBrowserStorage();
		return this;
	}

	EDBBrowserStorage.prototype = {
		// Get all local values.
		all: function(){
			var keys = store.keys();
			var json = keys.reduce( function( obj, key ){
				obj[key] = store.get( key );
				return obj;
			}, {} );
			return json;
		},
		// Get a specific value.
		get: function( key ){
			if( arguments.length === 0 ){
				return this.all();
			}
			return store.get( key );
		},
		// Set a value.
		set: function( key, value ){
			return store.set( key, value );
		},
		// Synchronize with $_SESSION.
		sync: function( callback ){
			var it = this;
			var callback = callback || $.noop;
			var data = { "edb-browser-storage": this.all(), action: 'synchronize_browser_storage' };
			$.ajax({
				url: btk_ajax.ajax_url,
				type: "POST",
				dataType: 'json',
				data: data,
				success: function( results ){
					if( 'string' === typeof results ){
						results = JSON.parse( results );
					}
					Object.keys( results ).forEach( function( key ){
						it.set( key, results[key] );
					});
					callback( null, it.all() );
				},
				error: function( error ){
					callback( error );
				}
			});
		}
	}

	var EDBSplashPage = function(){
		if( !(this instanceof EDBSplashPage) ) return new EDBSplashPage();
		this.store = new EDBBrowserStorage();
		return this;
	}

	EDBSplashPage.prototype = {
		show: function( callback ){
			var callback = callback || $.noop;
			var it = this;
			var now = (new Date()).getTime();
			var data = this.store.all();
			if( data.splash && data.splash.value === true ){
				return callback( null, false );
			}else{
				it.fetch( function( error, images ){
					var splash = it.build( images );
					splash.find('button').on('click', function(){
						var btn = $( this );
						var lang = btn.data('lang');
						it.store.set( 'splash', { value: true, time: now } );
						it.store.set( 'lang', { value: lang, time: now } );
						it.store.sync( callback );
						$('body').removeClass('splash-on');
					})
					$('body').append( splash ).addClass('splash-on')
				});
			}
		},
		build: function( data ){
			var container = $('<form>').attr('id','splash-page');
			var enBtn = $('<button>').text('enter').data('lang','en');
			var frBtn = $('<button>').text('entrez').data('lang','fr');
			var images = $('<div>');
			data.forEach(function( src ){
				var image = $('<div>').addClass('splash-image');
				image.css('background-image', 'url("'+src+'")');
				images.append( image );
			});
			container.append( images );
			container.append( enBtn );
			container.append( frBtn );
			return container;
		},
		fetch: function( callback ){
			var callback = callback || $.noop;
			var it = this;
			$.ajax({
				url: btk_ajax.ajax_url,
				type: "GET",
				dataType: 'json',
				data: { "edb-splash-images": true, action: 'provide_splash_images' },
				success: function( results ){
					if( 'string' === typeof results ){
						results = JSON.parse( results );
					}
					callback( null, results );
					
				},
				error: function( error ){
					callback( error );
				}
			});
		}
	}

	$( function(){
	
		var splashPage = new EDBSplashPage();
		splashPage.show();
	});


})(jQuery)

