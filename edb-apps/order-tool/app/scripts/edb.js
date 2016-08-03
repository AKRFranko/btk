(function($) {

  var keys;
  var base;
  if (false) { // /badb0x/.test(window.location)) {
    keys = {
      "consumerKey": "ck_001610a4c56cf948758f10d8c10fe4d62b609d7b",
      "consumerSecret": "cs_0416bd0d857d420c30b64dbce68211c214dde76d"
    };
    base = 'badb0x.akr.club';
  } else {
    keys = {
      "consumerKey": "ck_dbc3f91b5f982189037625df93c50393ad99592b",
      "consumerSecret": "cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1"
    };
    base = 'elementdebase.com';
  }



  var shipping_method_names = {
    'edb_self_pickup': 'pickup',
    'edb_ship_bundle_1': 'ship',
  }

  var CART = {};
  var FEES = [];
  var PRODUCTS;
  var MATERIALS = {};


  var preloadImage = function( src ){
    if(preloadImage[src]) return;
    var image = new Image();
    preloadImage[src] = image;
    image.style.opacity = '0';
    image.src = src;
    image.onload = function(){
      var p = image.parentNode;
      p.removeChild( image );
    }
    document.body.appendChild(image);
  }
  var fail = function(e) {
    console.log('fail', e);
  }

  var apiPath = function(path) {
    var str = 'https://' + base + '/wc-api/v3' + path;
    return str;
  }

  var setHeaders = function(xhr) {
    console.log('setHeaders')
    xhr.setRequestHeader("Authorization", "Basic " + btoa(keys.consumerKey + ":" + keys.consumerSecret));
    return xhr
  }


  // $.ajaxSetup( { beforeSend: setHeaders });
  var getJSON = function(path) {
    return $.ajax({
      url: path,
      type: 'GET',
      dataType: 'json'
      // username: keys.consumerKey,
      // password: keys.consumerSecret,
    });
  }

  var postOrder = function() {
    return $.ajax({
      type: 'POST',
      url: apiPath('/orders'),
      dataType: 'json',
      data: JSON.stringify(generateOrder())
      // username: keys.consumerKey,
      // password: keys.consumerSecret,

    });
  }



    function getEn(str) {
      if (str.indexOf('{:}') == -1) return str;
      var eng = str.split('{:}').reduce(function(en, s) {
        return en ? en : /\:en/.test(s) ? s : null;
      }, null);
      return eng.replace('{:en}', '');
    }

  var fetchProductCount = function(callback) {
    var countUrl = apiPath('/products/count');
    getJSON(countUrl).then(function(data) {
      if (data.hasOwnProperty('count')) {
        callback(null, data.count);
      } else {
        callback(new Error('Product count 0?'));
      }

    }, fail)
  }
  var findProductById = function(id) {
    for (var i = 0; i < PRODUCTS.length; i++) {
      var item = PRODUCTS[i];
      if (item.id == id) return item;
    }

  }



  var fetchProducts = function(callback, progress) {
    fetchProductCount(function(error, count) {
      if (error) return callback(error);
      var products = [];
      var start = 0;
      var onChunk = function(error, data) {
        if (error) return callback(error);
        products = products.concat(data);
        if (typeof progress == 'function') {
          progress(products.length, count);
        }

        if (products.length >= count) {
          requestAnimationFrame( function(){
            callback(null, products);
          });
        } else {
          start += 10;
          requestAnimationFrame( function(){
            fetchProductChunk(start, 10, onChunk);
          });
        }
      }
      fetchProductChunk(start, 10, onChunk);
    });
  }
  var fetchProductChunk = function(start, end, callback) {
    var url = apiPath('/products?filter[offset]=' + start + '&filter[limit]=' + end);
    getJSON(url).then(function(data) {
      callback(null, data.products);
    }, callback);
  }


  var createVariation = function(data, product) {
    // console.log(data)
    var materialId = data.attributes[0].option;

    // var imageSrc = MATERIALS[materialID].image;//'/wp-content/edb-materials/' + materialId + '.jpg';
    var materialObject = MATERIALS[materialId];
    if (!materialObject.image) {
      materialObject.image = product.image;
    }

    var isOnSale = product.isOnSale ? true : data.on_sale;

    // if(MATERIALS)
    product.stocks[materialId] = data.stock_quantity;

    return {
      type: 'variation',
      id: data.id,
      name: [product.name, materialId].join(', '),
      sku: data.sku,
      image: product.image,

      categories: product.categories,
      product: product,
      material: materialObject,
      price: parseFloat(data.price),
      isOnSale: isOnSale,
      shipping: product.shipping,
      stock: data.stock_quantity,
      isBackorder: data.stock_quantity <= 0
    };

  }


  var createProduct = function(data) {
    var materialIds = data.attributes[0].options;
    var imageSrc = data.featured_src;
    var title = getEn(data.title);
    var subtitle = getEn(data.subtitle);
    var categories = data.categories;
    var isOnSale = data.on_sale;
    preloadImage(imageSrc);
    console.log(data.attributes)
    var shipping = {
      id: data.shipping_class_id,
      class: data.shipping_class
    }

    var product = {
      type: 'product',
      hidden: true,
      id: data.id,
      name: [title, subtitle].filter(function(n) {
        return !!n
      }).join('-').toLowerCase(),
      sku: data.sku,
      image: imageSrc,
      categories: categories.join(', '),
      materials: materialIds.reduce(function(o, id) {

        o[id] = MATERIALS[id];
        return o;
      }, {}),
      price: parseFloat(data.price),
      isOnSale: isOnSale,
      shipping: shipping,
      stocks: {}
    };
    var variations = data.variations.map(function(v) {
      return createVariation(v, product);
    });
    product.variations = variations;
    return product;

  }

  var fetchMaterials = function(callback) {
    $.getJSON('/wp-content/edb-json/materials.json').then(function(json) {
      json.forEach(function(mat) {
        if (mat.title) {
          mat.title = getEn(mat.title);
        } else {
          mat.title = 'Material no.'
        }
        if (mat.subtitle) {
          mat.subtitle = getEn(mat.subtitle);
        }
        if (mat.subtitle) {
          mat.name = mat.title + ' ' + mat.subtitle;
        } else {
          mat.name = mat.title;
        }
        mat.fullName = mat.name + ' ' + mat.material;
        if(mat.image){
          mat.image = 'https://elementdebase-prod-elementdebase.netdna-ssl.com' + mat.image;
          preloadImage(mat.image);
        }
        MATERIALS[mat.material] = mat;
      });
      callback(null, MATERIALS);
    }, callback);
  }




  var getToken = function(){
    return (Date.now() * 10000).toString(36);
  }

  var addToCart = function(pid, vid, quantity, shipping) {
    console.log('addToCart', pid, vid, quantity, shipping);
    var token = getToken();
    var line_item = {
      product_id: pid,
      variation_id: vid,
      quantity: quantity
    };
    var product = findProductById(pid);
    var variation = null;
    product.variations.forEach(function(v, i) {

      if (v.id == vid) {
        variation = product.variations[i];
      }
    });
    
    CART[token] = {
      cart_token: token,
      line_item: line_item,
      product: product,
      variation: variation,
      shipping: shipping || 'edb_self_pickup'
    };
    return token;
  };

  var removeFromCart = function(token) {
    delete CART[token];
  };

  var updateCartItemQty = function(token, qty) {
    CART[token].line_item.quantity = qty;
  }
  var updateCartItemShipping = function(token, shipping) {
    CART[token].shipping = shipping;
  }
  var updateCartItemAvailability = function(token, avail) {
    CART[token].availability = avail;
  }


  var clearCart = function() {
    CART = {};
  }


  var getOrderItemsFromCart = function() {
    return Object.keys(CART).map(function(key) {
      return CART[key].line_item
    });
  };

  var getOrderBillingAddress = function() {
    return {
      first_name: 'Bill',
      last_name: 'Mench',
      address_1: '969 Billings road.',
      address_2: '',
      city: 'Montreal',
      state: 'QC',
      postcode: 'C1C 1G1',
      country: 'CA',
      email: 'john.doe@example.com',
      phone: '(555) 555-5555'
    }
  }

  var getOrderShippingAddress = function() {
    return {
      first_name: 'Chip',
      last_name: 'Asap',
      address_1: '969 Shippings ave.',
      address_2: '',
      city: 'Montreal',
      state: 'QC',
      postcode: 'H2A 2A2',
      country: 'CA'
    };
  }

  var splitCartItemsByAvailability = function(  ){
    var items =  Object.keys(CART).map(function(k) {
                   return CART[k]
                 });
    items.forEach( function(item){
    var stock_qty = item.variation.stock;
    var wants_qty = item.line_item.quantity;
    if (stock_qty <= 0) {
      
      // console.log('wants:', wants_qty, 'have: ', stock_qty, 'status: ', "backorder")
      item.availability="backorder";
    } else {
      var itemA, itemB;
      var diff = stock_qty - wants_qty;
      if (diff >= 0) {
        item.availability="available";
        // console.log('wants:', wants_qty, 'have: ', stock_qty, 'status: ', "available")
      } else {
        var available = stock_qty;
        var backorder = Math.abs(diff);
        removeFromCart( item.cart_token );
        var tokA = addToCart( item.product.id, item.variation.id, available, item.shipping );
        var tokB = addToCart( item.product.id, item.variation.id, backorder, item.shipping );
        updateCartItemAvailability( tokA, 'available')
        updateCartItemAvailability( tokB, 'backorder')
        // console.log('wants:', wants_qty, 'have: ', stock_qty, 'status: ', "split")
      }
    }
      
    });
    
  }
  var bundleCartItems = function() {
    //edb_ship_bundle_1
    var items = Object.keys(CART).map(function(k) {
      return CART[k]
    });

    var bundles = {
      edb_ship_bundle_1: {
        'available': [],
        'backorder': []
      },
      edb_self_pickup: {
        'available': [],
        'backorder': []
      }
    };
    
    
    items.forEach(function(item) {

      var stock_qty = item.variation.stock;
      var wants_qty = item.line_item.quantity;

      if (stock_qty <= 0) {
        bundles[item.shipping].backorder.push(item);
        item.availability="backorder";
      } else {
        var diff = stock_qty - wants_qty;
        if (diff >= 0) {
          bundles[item.shipping].available.push(item);
          item.availability="available";
        } else {
          var available = stock_qty;
          var backorder = Math.abs(diff);

          var itemA = Object.assign({}, item);
          itemA.line_item = Object.assign({}, item.line_item, {
            quantity: available
          });
          itemA.availability="available";
          var itemB = Object.assign({}, item);
          itemA.availability="backorder";
          itemB.line_item = Object.assign({}, item.line_item, {
            quantity: backorder
          });
          bundles[item.shipping].available.push(itemA);
          bundles[item.shipping].backorder.push(itemB);
        }
      }
    });
    
    return bundles;
  }

  var getOrderShippingDiscount = function() {
    var bundles = bundleCartItems();
    var shipping_discounts = [];
    Object.keys(bundles).forEach(function(shipping_method) {
      if (shipping_method == 'edb_self_pickup') {
        var items = bundles[shipping_method].available.concat(bundles[shipping_method].backorder);
        var total = items.reduce(function(t, item) {
          var price = item.variation.price;
          var quantity = item.line_item.quantity;
          return t + (price * quantity);
        }, 0);
        var fee = total * 0.05;
        shipping_discounts.push({
          'title': 'self pickup discount',
          'taxable': false,
          'total': -1 * fee
        });
      }

    });
    return shipping_discounts;
  }


  var addCustomFee = function(data) {
    var token = getToken();
    var fee_line = {
      fee_token: token,
      title: data.title || 'fee',
      taxable: data.taxable || false,
      tax_class: data.tax_class || '',
      total: data.total || 0
    };
    FEES[token] = fee_line;
    return token;
  }

  var removeCustomFee = function(token) {
    delete FEES[token];
  }

  var updateCustomFee = function(token, data) {
    FEES[token] = Object.assign({}, FEES[token], data);
  }

  var getOrderCustomFees = function() {
    return Object.keys(FEES).map(function(k) {
      return FEES[k];
    })
  }
  var clearFees = function(){
    FEES = {};
  }

  var getOrderFeeLines = function() {
    var shippingDiscounts = getOrderShippingDiscount();
    var FEES = getOrderCustomFees();
    var fee_lines = shippingDiscounts.concat(FEES)
    return fee_lines;
  }


  var getOrderShippingLines = function() {
    var bundles = bundleCartItems();
    var shipping_lines = [];
    Object.keys(bundles).forEach(function(shipping_method) {
      if (shipping_method != 'edb_self_pickup') {
        var items = bundles[shipping_method].available.concat(bundles[shipping_method].backorder);
        var total = items.reduce(function(t, item) {
          var price = item.variation.price;
          var quantity = item.line_item.quantity;
          return t + (price * quantity);
        }, 0);
        var fee = total * 0.05;
        if (fee > 0) {
          
          shipping_lines.push({
            'method_id': shipping_method,
            'method_title': shipping_method_names[shipping_method],
            'total': fee
          });
        }

      }

    });
    return shipping_lines;
    // return [
    //   {
    //     method_id: 'flat_rate',
    //     method_title: 'Flat Rate',
    //     total: 10
    //   }
    // ]
  }

  var generateOrder = function() {
    return {
      order: {
        status: 'processing',
        payment_details: {
          method_id: 'wc_gateway_paypal_pro',
          method_title: 'Credit Card (paypal)',
          paid: false
        },
        billing_address: EDB.billingAddress,//getOrderBillingAddress(),
        shipping_address: EDB.shippingAddress,//getOrderShippingAddress(),
        line_items: getOrderItemsFromCart().map( function( item ){
          item.product_id = item.variation_id;
          return item;
        }),
        shipping_lines: getOrderShippingLines(),
        fee_lines: getOrderFeeLines()
      }
    }
  }





  var EDB = window.EDB = {};

  EDB.load = function(callback, progress) {
    EDB.notify = progress;
    progress('loading EDB stuff.');
    progress('...weaving textiles...');
    fetchMaterials(function(error) {
      if (error) {
        callback(error)
      } else {
        progress('...moving furniture...');
        fetchProducts(function(error, data) {
          if (error) {
            callback(error);
          } else {

            progress('...yelling at the variables...');

            PRODUCTS = data.map(createProduct);
            progress('LETS GET READY TO RUMBLLLLLLLLLLE!')
            callback(null, EDB);
          }
        }, function(a, total) {
          var p = Math.floor((a / total) * 100);
          progress('...' + p + '% of ' + total + ' thingamabobs loaded...');

        });
      }
    });
  };

  EDB.catalogCache = {};
  EDB.filterCatalogItems = function( filter ){
    if (!filter) {
       PRODUCTS.map( function( p, i ){
        p.hidden = true;
        
        return p;
      });
    } else {
      
    PRODUCTS.map(function(p) {
      if(!p.scores) p.scores = {};
      if(!p.scores[filter]) p.scores[filter] = LiquidMetal.score(p.name, filter);
      if( p.scores[filter] >= 0.7){
        p.hidden = false;
      }else{
        p.hidden = true;
      }
      
      return p;
    })
    }
  }
  EDB.getCatalogItems = function(filter) {
    return PRODUCTS;
    
  };

  EDB.getCartItems = function() {
    splitCartItemsByAvailability();
    return Object.keys(CART).map(function(k) {
      CART[k].line_item.meta = {key:'cart_token',label:'cart token', value: k };
      return CART[k];
    })
  };
  
  EDB.getCustomFees = function(){
    return getOrderCustomFees();
  }
  
  EDB.getShippingFees = function(){
    return getOrderShippingLines();
  }

  EDB.cart = {
    addItem: function(pid, vid, qty, shipping) {
      if (arguments.length < 3) throw "Missing arguments";
      if (!shipping) {
        shipping = 'edb_ship_bundle_1';
      }
      return addToCart(pid, vid, qty, shipping);
    },
    removeItem: function(token) {
      return removeFromCart(token);
    },
    updateItemQty: function(token, qty) {
      return updateCartItemQty(token, qty);
    },
    updateItemShipping: function(token, shipping) {
      return updateCartItemShipping(token, shipping);
    },
    clearItems: function() {
      return clearCart();
    }
  };

  EDB.order = {
    
    addFee: function( fee ){
      return addCustomFee( fee );
    },
    removeFee: function( token ){
      return removeCustomFee( token );
    },
    clearFees: function(){
      return clearFees();
    },
    prepare: function() {
      return generateOrder();
    },
    setShipping: function( shipping ){
      EDB.shippingAddress = shipping;
    },
    setBilling: function( billing ){
      EDB.billingAddress = billing;
    },
    send: function( callback ){
      postOrder().then( function( order ){
        callback( null, order )
      }, callback );
    }
  }
  
  EDB.orderRequiresShipping = function(){
    return Object.keys(CART).some( function( k ){ return CART[k].shipping !== 'edb_self_pickup' });
  }





  // ["106","105","104","103","102","101","063","062","059","058","057","056","055","054","053","052","051","001","002","003","004","005","006","007","008","009","010","011","012","064","999","153","151","154","152","107","108","109","110"]

  /*#################*/
  // EDB.load(function(error) {
  //   if (error) {
  //     console.log(error)
  //   } else {
  //     PRODUCTS.forEach(function(p) {
  //       var varidx = Math.floor(Math.random() * p.variations.length);
  //       var variation = p.variations[varidx];
  //       var qty = 10;


  //       addToCart(p.id, variation.id, qty, 'edb_ship_bundle_1');

  //     });

  //     addCustomFee({
  //       title: 'test fee line 1',
  //       taxable: true,
  //       'tax_class': '',
  //       total: 500
  //     });




  //     // postOrder().then(function(o) {
  //     //   console.log(o);
  //     // }, fail);


  //   }

  // }, function(msg) {
  //   console.log(msg)
  // })


})(jQuery);