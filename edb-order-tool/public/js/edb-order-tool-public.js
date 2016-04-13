(function($) {
  'use strict';
  alert('qwerwer')
  console.log('loasd')
  jQuery(document).ready(function($) {


    var Product = function(raw) {
      Object.keys(raw).reduce(function(o, k) {
        o[k] = raw[k];
        return o;
      }, this);
      return this;
    }

    var loadCatalog = function( complete ) {
      var catalog = {};
      jQuery.getJSON('/wp-content/uploads/json/catalog.json', function(data) {
        var products = {};
        var variations = {};
        var ids = Object.keys(data);
        ids.forEach(function(id) {
          var product = data[id];
          if (product.variation_id === null) {
            products[id] = new Product(product);
          } else {
            if (!variations[product.product_id]) {
              variations[product.product_id] = [];
            }
            variations[product.product_id].push(new Product(product));
          }
        });
        complete( Object.keys(products).reduce(function(cats, pid) {
          cats[pid] = products[pid];
          cats[pid].variations = variations[pid];
          return cats;
        }, catalog) );
      });
    }
    
    



    // This does the ajax request
    // $.ajax({
    //   url: edb_order_tool_params.ajaxurl,
    //   data: {
    //     'action': 'edb_order_tool',
    //     'command': 'initial'
    //   },
    //   success: function(data) {
    //     // This outputs the result of the ajax request
    //     console.log('success');
    //     if(data && data.length){
    //       var data = JSON.parse(data);
    //       var products = {};
    //       Object.keys(data).forEach( function( id ){
    //         var item = data[id];
    //         products[id] =  new Product( item) ;
    //       });
    //       console.log(products)
    //     }

    //   },
    //   error: function(errorThrown) {
    //     console.log('failure', errorThrown);
    //   }
    // });

  });
  /**
   * All of the code for your public-facing JavaScript source
   * should reside in this file.
   *
   * Note: It has been assumed you will write jQuery code here, so the
   * $ function reference has been prepared for usage within the scope
   * of this function.
   *
   * This enables you to define handlers, for when the DOM is ready:
   *
   * $(function() {
   *
   * });
   *
   * When the window is loaded:
   *
   * $( window ).load(function() {
   *
   * });
   *
   * ...and/or other possibilities.
   *
   * Ideally, it is not considered best practise to attach more than a
   * single DOM-ready or window-load handler for a particular page.
   * Although scripts in the WordPress core, Plugins and Themes may be
   * practising this, we should strive to set a better example in our own work.
   */

})(jQuery);