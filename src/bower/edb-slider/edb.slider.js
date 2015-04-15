
var yes = function(){ return true }
var no = function(){ return false }

var EDBSlider = function( el ){
	if( !( this instanceof EDBSlider ) ) return new EDBSlider( el );
	if( $(el).data('slider')) return $(el).data('slider');
	var it = this;
	it.el     = el;
	it.slides = [];
	it.index  = -1;
	json = $( it.el ).find( 'script' ).html()
	try{
		it.slides = JSON.parse( json )
	}catch( E ){
		it.slides = []
	}
	if( !it.slides.length ){
		console.log( "Broken! No slides found", el )
		return it;
	}
	it.isLoaded = no;
	it.total = it.slides.length;
	var loaded = 0;
	it.slides = it.slides.map(  function( data, index ){
		var slide =  EDBSlider.Slide( data, index );
		$(it.el).append( slide.el );
		$( slide ).on('loaded', function(){
			loaded++;
			if( loaded >= it.total ){
				it.isLoaded = yes;
				$( it ).trigger( 'loaded' , [ it ] )
			}
		});
		return slide;
	} );
	it.slides.reduce( function( a, b ){ 
		if( !a ){
			$( b.el ).inserBefore( $( it.el ).find('.controls') )
		}else{
			$(a.el).insertAfter( b.el )
		}
		return b;
	});
	$(it.el).find('.controls .next').on('click', function( e ){
		e.preventDefault()
		it.cycle( 1 );
	});
	$(it.el).find('.controls .prev').on('click', function( e ){
		e.preventDefault()
		it.cycle( -1 );
	});
	$(it.el).addClass('slides').data( 'slider', it );
	return this;
}

EDBSlider.Slide = function( data, index ){
	if( !( this instanceof EDBSlider.Slide ) ) return new EDBSlider.Slide( data, index );
	it = this
	it.index       = index;
	it.el       = document.createElement( 'div' )
	it.img      = new Image();
	it.isLoaded = no;
	$( it.img ).on( 'load', function( event ){
		it.isLoaded = yes;
		$(it).trigger( 'loaded', [ it ] );
	});
	it.img.src = data.src;
	var link = $('<a>').attr('href', data.url ).addClass('slide-link').html('<span class="slide-text">'+data.text+'</span>')
	$(it.el).css('background-image', 'url("'+data.src+'")');
	$(it.el).addClass('slide').data( 'slide', it ).append( it.img ).append( link )
	return it;
}

EDBSlider.Slide.prototype = {
	isActive: function () {
		return $( this.el ).hasClass( 'active' );
	},
	activate: function( ){
		if( this.isActive() ) return true;
		$( this.el ).addClass( 'active' );
	},
	deactivate: function(){
		if( !this.isActive() ) return true;
		$( this.el ).removeClass( 'active' );
	}
}

EDBSlider.prototype={
	update: function(){
		$( this.el ).find('.controls .index').text( this.index+1 );
		$( this.el ).find('.controls .total').text( this.total );
	},
	cycle: function( dir ){ // 1 || -1
		var index = this.index + dir;
		if( index >= this.total ) index = 0;
		if( index < 0 ) index = this.total - 1;
		this.toggle( index, 'on' );
	},
	toggle: function( index, state ){
		var it = this;
		var target = it.slides[index];
		var current = it.slides[it.index];
		var sameSlide = index === it.index;
		var sameState = target.isActive() && current.isActive();
		var operation = state === 'on' ? 'activate' : 'deactivate' 
		if( sameSlide && sameState ) return it;
		var hasActiveSlide = false;
		it.slides.forEach( function( other, idx ){ 
			if( state === 'on' && other.isActive() ){
				other.deactivate()
			}else if( state === 'off' && other.isActive() ){
				hasActiveSlide = true;
			};
		});
		if( state === 'off' && !hasActiveSlide ){
			it.slides[0].activate();
			it.index = 0;
		}else{
			target[operation].call( target );
			it.index = index;
		}
		it.update();
		return it
	}
}

window.EDBSlider = EDBSlider;

