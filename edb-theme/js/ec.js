(function(main, $ ){
  
  
  
  

  // var listingMap = {
  //   '.tax-product_cat': {}
  // }
  
  var edbStats = {};
  
  var getCurrentList = function(){
    if(/\/shop\/$/.test(window.location.href)){
      return 'All Products';
    };
    if(/\/shop\/\?on_sale/.test(window.location.href)){
      return 'Sale Products';
    };
    if(/\/shop\/\?on_sale/.test(window.location.href)){
      return 'Search Result';
    };
    if($('body.tax-product_cat')){
      var cats = window.location.pathname.replace(/\/product-category\/|\/$/g,'').split('/');
      var cat = cats[cats.length-1];
      return 'Category: '+cat;
    };
    return null;
  }
  
  edbStats.recordProductClick = function( clicked ){
    var product = $(clicked).data('product');
    ga('ec:addProduct', product );
    ga('ec:setAction', 'click', { list: getCurrentList() } );
    ga('send','event','UX','click', 'Results', {
      hitCallback: function(){
        
        document.location = $(clicked).attr('href');
      }
    })
  }
  

  
  edbStats.getCurrentCheckoutStep = function(){
    var panel = $('.checkout-panel.active');
    var steps = ["address-info-panel", "shipping-packages-panel", "payment-info-panel", "place-order-panel"];
    if(panel && panel.length){
      var name = panel.attr('id');
      var index = steps.indexOf(name) + 3;
      return { index: index, name: name };
    }
    return null;
  }
  
  
  $(function(){
    if($('.woocommerce-account').length){
      ga('ec:setAction', 'checkout', { 'step': 1 });
      ga('send', 'pageview');  
    }
    if($('#ga-order').length){
     $('.cart_item').each( function(){
       ga('ec:addProduct', $(this).data('product'));
     });
     ga('ec:setAction','purchase', $('#ga-order').data('order'));  
     ga('send','pageview'); 
    }
    $('.woocommerce-account').find('form.guest button[type="submit"]').on('click', function(){
      ga('ec:setAction','checkout', {
          'step': 1,
          'option':'guest'
      });
    });
    $('.woocommerce-account').find('form.login button[type="submit"]').on('click', function(){
      ga('ec:setAction','checkout', {
          'step': 1,
          'option':$('#username').val()
      });
    });
    $('#do-not-ship-option').on('change', function(){
      if($(this).is(':checked')){
      ga('ec:setAction','checkout', {
          'step': 2,
          'option': 'self pickup'
      });  
      }
      
    });
    
    $('#ship-to-same-address-option').on('change', function(){
      if($(this).is(':checked')){
      ga('ec:setAction','checkout', {
          'step': 2,
          'option': 'use same address'
      });  
      }
    });
    
    $('input.shipping_method').on('change', function(){
      ga('ec:setAction','checkout', {
          'step': 3,
          'option': $(this).val()
      });  
    })
    
    $(document).on('updated_checkout', function(){
      var step = edbStats.getCurrentCheckoutStep();
      
      if(step !== null){
        $('.cart_item').each( function(){
          ga('ec:addProduct', $(this).data('product'));
        });
        ga('ec:setAction','checkout', {'step': step.index });  
        ga('send','pageview');
      };
      
    })
    
  })
  
  // $(document).on('click','.checkout-button', function(){
  
  // });
  
  // $(document).on('click','.edb-save-and-continue', function(){
  //   var panel = $('.checkout-panel.active');
  //   var steps = ["address-info-panel", "shipping-packages-panel", "payment-info-panel", "place-order-panel"];
  //   if(panel && panel.length){
  //     var step = panel.attr('id');
  //     var index = steps.indexOf(step) + 2;
  //     ga('ec:setAction','checkout', {
  //         'step': index,
  //         'option': 
  //     });
  //   }
  //   // var step = window.location.hash;
  //   // if(step){
      
  //   // }
  // });
  $(document).on('click', '#add-to-cart', function(){
    var product = $('div[data-product]').data('product');
    product.variant = $('.edb-material-choices .active-choice input').val();
    var price = $('.product-price .saleprice').text();
    var qty = $('.qty-val').text();
    if(!price){
      price = $('.product-price').text().trim();
    }
    product.price = parseFloat(price);
    product.quantity=qty;
    ga('ec:addProduct', product );
    ga('ec:setAction', 'add');
    ga('send', 'event', 'UX', 'click', 'add to cart'); 
  });
  
  $(document).on('click', '.cart-item-remove a', function(){
    var product = $(this).parent('.cart_item').data('product');
    var qty = $(this).parent('.cart_item').find('.qty-val').text();
    ga('ec:addProduct', product );
    ga('ec:setAction', 'remove');
    ga('send', 'event', 'UX', 'click', 'remove from cart'); 
    
  });

  $(function(){
    ga('require', 'ec');  
    var currentList = getCurrentList();
    if(currentList !== null){
      $('.article-link').map( function( ){
        var link = $(this);
        var product = link.data('product');
        if(product){
          product.list = getCurrentList();
          ga('ec:addImpression', product );  
        }
      });
      ga('send','pageview');
    }
    
    if($('body').hasClass('single-product')){
      var product = $('div[data-product]').data('product');
      ga('ec:addProduct', product);
      ga('ec:setAction', 'detail');
      ga('send', 'pageview'); 
    }
  });
  
  
  
  
  if(!main.edbStats){
    main.edbStats = edbStats;
  }
  
  
})( window, jQuery )