(function($) {
    var materials = {
        'aluminium': {
            image: '/wp-content/themes/btk/img/textures/aluminium.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'argon': {
            image: '/wp-content/themes/btk/img/textures/argon.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]

        },
        'concrete': {
            image: '/wp-content/themes/btk/img/textures/concrete.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'emerald': {
            image: '/wp-content/themes/btk/img/textures/emerald.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'noise': {
            image: '/wp-content/themes/btk/img/textures/noise.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'orange': {
            image: '/wp-content/themes/btk/img/textures/orange.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'purple': {
            image: '/wp-content/themes/btk/img/textures/purple.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'sky': {
            image: '/wp-content/themes/btk/img/textures/sky.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'steel': {
            image: '/wp-content/themes/btk/img/textures/steel.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'teal': {
            image: '/wp-content/themes/btk/img/textures/teal.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'wine': {
            image: '/wp-content/themes/btk/img/textures/wine.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        'yolk': {
            image: '/wp-content/themes/btk/img/textures/yolk.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'


            ]
        }
    };
    var $overlay = $('<div>').addClass('materials-overlay');
    var $close = $('<a>').addClass('materials-close').html('<span class="fa fa-times"></span>');
    var cards = {};
    Object.keys(materials).forEach(function(name, index) {
        var $card = $('<div>').addClass('materials-card');
        $card.append($close.clone())
        var $image = $('<div>').addClass('materials-image');
        $image.css('background-image', 'url("' + materials[name].image + '")');
        // var $img = $('<img>').attr('src', materials[name].image).appendTo($image);
        var $content = $('<div>').addClass('materials-content');
        var html = '<h1>' + [materials[name].fabric, name, index].join(' ') + '</h1>';
        html += '<h3>Compositon</h3><ul>';
        materials[name].composition.forEach(function(line) {
            html += '<li>' + line + '</li>';
        });
        html += '<br><p><a href="/order-samples">order samples</a></p>';
        $content.html(html);
        $card.append($image);
        $card.append($content);
        $overlay.append($card);
        cards[name] = $card;
    });

    window.btk.showMaterialInfo = function(material) {
        if (!material || !materials[material]) {
            return false;
        }
        $overlay.find('.materials-card').removeClass('active');
        cards[material].addClass('active');
        $overlay.addClass('opened');
    }
    window.btk.hideMaterialInfo = function() {
        $overlay.removeClass('opened');
    }

    $overlay.on('click', '.materials-close', function(e) {
        e.preventDefault();
        window.btk.hideMaterialInfo();
    });

    $(document.body).on('click', '.material-info-trigger', function(e) {
        var material = $(this).data('material');
        console.log($(this))
        window.btk.showMaterialInfo(material);
    });

    $(document.body).append($overlay);

})(jQuery);