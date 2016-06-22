/*
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/

(function(document) {
  'use strict';

  // Grab a reference to our auto-binding template
  // and give it some initial binding values
  // Learn more about auto-binding templates at http://goo.gl/Dx1u2g
  var app = document.querySelector('#app');

  // Sets app default base URL
  app.baseUrl = '/order-tool/';
  app.searchFilter = '';
  app.catalogOpened=false;
  app.lastOrderResponse;
  // app.resetFees = function() {
  //   app.customFee = {
  //     title: null,
  //     taxable: false,
  //     total: 0
  //   };
  // }
  // app.resetBilling = function() {
  //   app.billing = {
  //     email: null
  //   };
  // }
  // app.resetShipping = function() {
  //   app.shipping = {
  //     first_name: null,
  //     last_name: null,
  //     address_1: null,
  //     address_2: null,
  //     city: null,
  //     state: null,
  //     postcode: null,
  //     country: 'CA'
  //   };
  // }
  // app.resetShipping();
  // app.resetBilling();
  // app.resetFees();

  // if (window.location.port === '') { // if production
  //   // Uncomment app.baseURL below and
  //   // set app.baseURL to '/your-pathname/' if running from folder in production
  //   // app.baseUrl = '/polymer-starter-kit/';
  // }

  // app.displayInstalledToast = function() {
  //   // Check to make sure caching is actually enabled—it won't be in the dev environment.
  //   if (!Polymer.dom(document).querySelector('platinum-sw-cache').disabled) {
  //     Polymer.dom(document).querySelector('#caching-complete').show();
  //   }
  // };

  // Listen for template bound event to know when bindings
  // have resolved and content has been stamped to the page
  app.addEventListener('dom-change', function() {
    console.log('Our app is ready to rock!');


  });

  // See https://github.com/Polymer/polymer/issues/1381
  window.addEventListener('WebComponentsReady', function() {
    // imports are loaded and elements have been registered
    EDB.load(app.onEDBLoaded, app.notifyProgress);

    // app.createSearchFilterListener();
  });

  app.echo = function(a, fluf) {
    
    // console.log('echo', a)
    return a;

  }
  
  app.handlePrepareForNewOrder = function(){
    // app.cartItems = [];
    // app.searchInput = '';
    // EDB.clearFees();
    // EDB.clearCart();
    // EDB.shippingAddress = {
    //   state: 'QC',
    //   country: 'CA'
    // };
    // EDB.billingAddress = { country: 'CA' };
    // app.route = 'home'
    window.location.reload( true );
  }
  
  var refreshProducts = function(){
    
    var itms = app.$.listCatalog.items;
    app.$.listCatalog.items = [];
    app.async( function(){ 
      app.$.listCatalog.items = itms;
    });
    app.$.listCatalog.render();
  }
  app.hideErrors = function(){
    var eToast = document.querySelector('#errorToast');
    eToast.close();
  }
  app.displayErrors = function( errors ){
    var eToast = document.querySelector('#errorToast');
    if(errors.errors){
      errors = errors.errors;
    }
    eToast.text = errors.join("\n");
    
    eToast.open();
  }
  app.onEDBLoaded = function() {
    // console.log(EDB);
    app.customFee = {
      title: null,
      taxable: true,
      total: null
    };
    app.shippingChanged=null;
    // app.searchFilter = '';
    app.searchInput = '';
    app.set('products',EDB.products);
    
    app.cartItems = [];
    app.feeItems = [];
    app.shippingAddress = EDB.shippingAddress;
    app.billingAddress = EDB.billingAddress;
    app.edbLoaded=true;
    var debounceSync;
    
    document.querySelector('#searchFilter').addEventListener('input',function(){
      clearTimeout(debounceSync);
      debounceSync = setTimeout(function(){
      if(!app.searchInput || app.searchInput.trim() == ''){
        app.set('searchFilter', '');
      }else{
        app.set('searchFilter', app.searchInput.trim());
      }  
      },10)
      
    })
    // app.catalogItems = EDB.products;
    // // EDB.cart.addItem(8012, 8013, 5);
    // app.cartItems = [];
  };

  // app.refreshProducts = function(){
    
  //   return EDB.products;
  // }
  app.filterProducts = function(filter) {
    // console.log('filterProducts')
    if(filter){
      filter = filter.trim();
    }
    return function(product) {
      if (!filter) return true;
      if (!product) return false;
      return ~product.raw.categories.indexOf(filter);
    };

  };

  app.sortProducts = function(filter) {
    // console.log('sortProducts')
    if(!filter) return function(){ return -1;}
    return function(a, b) {
      if (!filter) return 1;
      var aScore = LiquidMetal.score(a.name, filter);
      var bScore = LiquidMetal.score(b.name, filter);
      return aScore < bScore ? 1 : -1;
    };

  };

  app.computeTotals = function() {
    // console.log('computeTotals')
    return EDB.calculateTotals().filter(function(t) {return t.label === 'total' ? true : t.value !== 0;})
  };

  app.computeZone = function( postcode ){
    return EDB.getZone( postcode );
  }
  app.handleOpenCatalog = function() {
    document.querySelector('#catalog').open();
  };

  app.handleOpenFees = function() {
    document.querySelector('#addFee').open();
  };

  app.handleAddToCart = function(event) {
    var root =  Polymer.dom(event).rootTarget;
    var choice = root.parentElement;
    var selector = choice.querySelector('iron-selector');
    var qtyInput = choice.querySelector('.variation-quantity');
    var subTemplate = selector.querySelector('template');
    var product = event.model.product;
    var variation = product.variations.reduce(function(f, v) {
      if (v.id == product.selectedVariation) {
        return v;
      };
      return f;
    }, null);
    
    var quantity = product.wantedQuantity;
    qtyInput.value = null;
    selector.selected = null;
    EDB.addToCart(product, variation, quantity);
    EDB.cartItems.forEach( function( cartItem, index ){
      var appItem = app.get('cartItems.'+index);
      if(!appItem || appItem && appItem.token !== cartItem.token){
        app.push('cartItems', cartItem );
      }else{
        app.set('cartItems.'+index, cartItem );
      }
    });
    event.model.set('product.selectedVariation',product.variations[0].id);
    event.model.set('product.wantedQuantity',null);
    refreshProducts();
    // product.wantedQuantity = null;
    
    // subTemplate.items = [];
    // app.async(function(){
    //   subTemplate.items = product.variations;  
    // })
    
    // event.model.set('product.variations',product)
    // document.querySelector('#listOfProducts').render();
  }
  app.handleRemoveFromCart = function( event ) {
    // console.log('handleRemoveFromCart', window.REL = Polymer.dom(event) )
    var removedIndex = EDB.removeCartItem( event.model.cartItem.token );
    app.splice( 'cartItems', removedIndex, 1 );
    // // app.notifyPath('products',EDB.products);
    // var catalogIndex;
    // var catalog = document.querySelector('#listCatalog');
    // var items = catalog.parentElement.querySelector('template').items[0];
    // // document.querySelector('#listOfProducts').render();
    refreshProducts();
    
  }
  app.handleAddFee = function() {
    EDB.addFee(app.customFee);
    app.customFee = {
      title: null,
      taxable: true,
      total: null
    };
    
    EDB.feeItems.forEach(function(feeItem, index) {
      var appItem = app.get('feeItems.'+index);
      if(!appItem || appItem && appItem.token !== feeItem.token){
        app.push('feeItems', feeItem );
      }else{
        app.set('feeItems.'+index, feeItem );
      }
    })
    document.querySelector('#listOfFees').render();
    
  };
  app.handleShippingChanged = function(){
    app.set('shippingChanged', Date.now().toString(36) );
  }
  app.handleRemoveFee = function( event ) {
    var removedIndex = EDB.removeFee( event.model.feeItem.token );
    app.splice('feeItems', removedIndex, 1 );
    document.querySelector('#listOfFees').render();
  };
  app.toMoney = function(n) {
    return '$ ' + (1 * n).toFixed(2);
  }
  
  app.handlePostOrder = function(){
    app.hideErrors();
    var errors = [];
    if(EDB.orderRequiresShipping()){
      if(!EDB.shippingAddress.postcode){
        errors.push('Missing postal code.');
      }
      if(!EDB.shippingAddress.address_1){
        errors.push('Missing street address.');
      }
      if(!EDB.shippingAddress.city){
        errors.push('Missing city.');
      }
      if(!EDB.shippingAddress.state){
        errors.push('Missing province.');
      }
    }
    if(!EDB.billingAddress.email){
      errors.push('Missing customer email.');
    }
    if(EDB.cartItems.length == 0 && EDB.feeItems.length == 0){
      errors.push('Nothing to bill.');
    }
    if(errors.length > 0){
      return app.displayErrors(errors)
    }
    var post = EDB.postOrder();
    post.fail( function( error ){
      return app.displayErrors( [ error ] );
    });
    post.done( function( data ){
      app.lastOrderResponse = data;
      app.route = 'complete';
    });
  }
 app.computePayOrderUrl = function( res ){
   if( !res ){
     return '#';
   }else{

     return 'https://elementdebase.com/checkout/order-pay/'+res.order.id+'/?pay_for_order=true&key='+res.order.order_key;
   }
 }
 app.handleSendOrderEmail = function(  ){
   var id = app.lastOrderResponse.order.id;
   var key = app.lastOrderResponse.order.order_key;
   EDB.sendOrderEmail( id, key ).done( function(){
    document.querySelector('.final-message paper-button').disabled = true;
    document.querySelector('.final-message paper-button').label = 'sent!';  
   }).fail( function(){
     app.displayErrors(['Sending email failed.']);
   });
 }
  // Scroll page to top and expand header
  app.scrollPageToTop = function() {
    //app.$.headerPanelMain.scrollToTop(true);
    
  };

  app.closeDrawer = function() {
    //app.$.paperDrawerPanel.closeDrawer();
  };

})(document);