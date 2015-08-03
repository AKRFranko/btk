var EDBSlider = function(el, opts) {
    if (!(this instanceof EDBSlider)) return new EDBSlider(el, opts);
    if ($(el).data('slider')) return $(el).data('slider');
    var it = this;
    it.el = el;
    it.slides = [];
    it.options = opts || {};
    it.index = -1;
    it.slideEl = $('<div>').addClass('slides').get(0)
    $(it.el).append(it.slideEl)
    json = $(it.el).find('script').html()
    $(it.el).find('script').replaceWith(it.slideEl)

    try {
        it.slides = JSON.parse(json)
    } catch (E) {
        it.slides = []
    }
    if (!it.slides.length) {
        console.log("Broken! No slides found", el)
        return it;
    }
    it.isLoaded = EDBSlider.no;
    it.total = it.slides.length;
    var loaded = 0;
    it.slides = it.slides.map(function(data, index) {
        var slide = EDBSlider.Slide(data, index);
        $(it.slideEl).append(slide.el);
        $(slide).on('loaded', function() {
            loaded++;
            if (loaded >= it.total) {
                it.isLoaded = EDBSlider.yes;
                $(it).trigger('loaded', [it])
            }
        });
        return slide;
    });

    $(it.el).find('.controls .next').on('click', function(e) {
        e.preventDefault()
        it.cycle(1);
    });
    $(it.el).find('.controls .prev').on('click', function(e) {
        e.preventDefault()
        it.cycle(-1);
    });

    $.event.special.swipe.settings.threshold = 0.02;
    $.event.special.swipe.settings.sensitivity = 12;
    $(it.el).on('movestart', function(e) {
        // If the movestart is heading off in an upwards or downwards
        // direction, prevent it so that the browser scrolls normally.
        if ((e.distX > e.distY && e.distX < -e.distY) || (e.distX < e.distY && e.distX > -e.distY)) {
            e.preventDefault();
        }
    }).on('swipeleft', function(e, dir) {
        e.preventDefault()
        it.cycle(1);
        console.log(event.type)
    }).on('swiperight', function(e, dir) {
        e.preventDefault()
        it.cycle(-1);
        console.log(event.type)
    });


    var lastResize = null;
    var handleResize = function() {
        clearTimeout(lastResize);
        lastResize = setTimeout(function() {
            it.adjustHeight(it.options.spacing || 0)
        }, 200);
    }
    $(window).on('orientationchange', handleResize)
    $(window).on('resize', handleResize).resize();


    $(it.el).data('slider', it);
    return this;
}
EDBSlider.yes = function() {
    return true;
}
EDBSlider.no = function() {
    return false;
}
EDBSlider.Slide = function(data, index) {
    if (!(this instanceof EDBSlider.Slide)) return new EDBSlider.Slide(data, index);
    it = this
    it.index = index;
    it.el = document.createElement('div')
    it.img = new Image();
    it.isLoaded = EDBSlider.no;
    $(it.img).on('load', function(event) {
        it.isLoaded = EDBSlider.yes;
        $(it).trigger('loaded', [it]);
    });
    it.img.src = data.src;
    var link = $('<a>').attr('href', data.url).prop('draggable', false).addClass('slide-link').html('<span class="slide-text">' + data.text + '</span>')
    if (data._blank) {
        link.attr('target', '_blank');
    }
    $(it.el).css('background-image', 'url("' + data.src + '")');
    $(it.el).addClass('slide').data('slide', it).append(it.img).append(link)
    if (data.html) {
        var content = $('<div>').addClass('slide-html').html(data.html);
        $(it.el).append(content);
    };
    if (data.shopnow) {
        var $shopnow = $('<span>').addClass('shopnow').attr('data-text', data.shopnow);
        $(link).find('.slide-text').append($shopnow);
    }
    return it;
}

EDBSlider.Slide.prototype = {

    adjustHeight: function(h) {
        $(this.el).css({
            "min-height": h,
            "max-height": h,
            "height": h
        })
    },
    isActive: function() {
        return $(this.el).hasClass('active');
    },
    activate: function() {
        if (this.isActive()) return true;
        $(this.el).addClass('active');
    },
    deactivate: function() {
        if (!this.isActive()) return true;
        $(this.el).removeClass('active');
    }
}

EDBSlider.prototype = {

    adjustHeight: function(minus) {
        console.log('adjust')
        var winHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
        if (isNaN(minus)) minus = $(minus).outerHeight();
        $(this.el).css({
            "min-height": this.options.minHeight || winHeight - minus,
            "max-height": this.options.minHeight || winHeight - minus,
            "height": winHeight - minus
        })
    },
    update: function() {
        $(this.el).find('.controls .index').text(this.index + 1);
        $(this.el).find('.controls .total').text(this.total);
    },
    cycle: function(dir) { // 1 || -1
        var index = this.index + dir;
        if ($('body').hasClass('mobile')) {
            if (index == this.total) index = index - 1;
            if (index < 0) index = 0;
        } else {
            if (index == this.total) index = 0;
            if (index < 0) index = this.total - 1;
        }
        $(this.el).trigger('cycled');
        this.toggle(index, 'on');
    },
    toggle: function(index, state) {
        var it = this;
        var target = it.slides[index];
        var current = it.slides[it.index];
        var sameSlide = index === it.index;
        var sameState = target.isActive() && current.isActive();
        var operation = state === 'on' ? 'activate' : 'deactivate'
        if (sameSlide && sameState) return it;
        var hasActiveSlide = false;
        it.slides.forEach(function(other, idx) {
            if (!hasActiveSlide && other.isActive()) hasActiveSlide = true;
            other.deactivate()
                // if( other.index == target.index ) return;
                // if( state === 'on' && other.isActive() ){
                // 	other.deactivate()
                // }else if( state === 'off' && other.isActive() ){
                // 	hasActiveSlide = true;
                // };
        });
        if (state === 'off' && !hasActiveSlide) {
            it.slides[0].activate();
            it.index = 0;
        } else {
            target[operation].call(target);
            console.log('setting index to', index)
            it.index = index;
        }
        it.update();
        return it
    }
}

window.EDBSlider = EDBSlider;