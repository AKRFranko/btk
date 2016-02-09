(function($) {
    var materials = {
        '001': {
            name: 'color1',
            image: '/wp-content/themes/btk/img/textures/aluminium.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '002': {
            name: 'color2',
            image: '/wp-content/themes/btk/img/textures/argon.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]

        },
        '003': {
            name: 'color3',
            image: '/wp-content/themes/btk/img/textures/concrete.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '004': {
            name: 'color4',
            image: '/wp-content/themes/btk/img/textures/emerald.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '005': {
            name: 'color5',
            image: '/wp-content/themes/btk/img/textures/noise.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '006': {
            name: 'color6',
            image: '/wp-content/themes/btk/img/textures/orange.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '007': {
            name: 'color7',
            image: '/wp-content/themes/btk/img/textures/purple.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '008': {
            name: 'color8',
            image: '/wp-content/themes/btk/img/textures/sky.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '009': {
            name: 'color9',
            image: '/wp-content/themes/btk/img/textures/steel.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '010': {
            name: 'color10',
            image: '/wp-content/themes/btk/img/textures/teal.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '011': {
            name: 'color11',
            image: '/wp-content/themes/btk/img/textures/wine.jpg',
            fabric: 'fabric',
            composition: [
                '20% linen',
                '25% cotton',
                '45% polyester',
                '10% viscose'
            ]
        },
        '012': {
            name: 'color12',
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
        var html = '<h1>' + [materials[name].fabric, materials[name].name, index].join(' ') + '</h1>';
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

    $overlay.on('click', function(e) {

        if ($(e.target).parents('.materials-card').length > 0) {
            return true;
        } else {
            window.btk.hideMaterialInfo();
        }

    });

    $overlay.on('click', '.materials-close', function(e) {
        e.preventDefault();
        window.btk.hideMaterialInfo();


    });

    $(document.body).on('click', '.material-info-trigger', function(e) {
        var material = $(this).data('material');

        window.btk.showMaterialInfo(material);
    });

    $(document.body).append($overlay);

    window.btk.materials = materials;

})(jQuery);