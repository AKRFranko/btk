(function($) {

  var EDB = {
    shippingAddress: {
      state: 'QC',
      country: 'CA'
    },
    billingAddress: {
      country: 'CA'
    },
    cartRef: {},
    cartItems: [],
    feeRef: {},
    feeItems: []
  };

  var globalCats = {};
  var fail = function(e) {
    console.log('fail', e);
  }
  var base = 'elementdebase.com'
  var apiPath = function(path) {
    var str = 'https://' + base + '/wc-api/v3' + path;
    return str;
  }

    function getEn(str) {
      if (str.indexOf('{:}') == -1) return str;
      var eng = str.split('{:}').reduce(function(en, s) {
        return en ? en : /\:en/.test(s) ? s : null;
      }, null);
      return eng.replace('{:en}', '');
    }

  var RATES = {
    'furniture': {
      'min': 500,
      'below': {
        'zone-1': 65,
        'zone-2': 150,
        'zone-3': 250
      },
      'above': {
        'zone-1': 0,
        'zone-2': 85,
        'zone-3': 150
      }
    },
    'small-furniture': {
      'min': 500,
      'below': {
        'zone-1': 18,
        'zone-2': 25,
        'zone-3': 28
      },
      'above': {
        'zone-1': 0,
        'zone-2': 10,
        'zone-3': 15
      }
    },
    'accessories': {
      'min': 50,
      'below': {
        'zone-1': 15,
        'zone-2': 15,
        'zone-3': 15
      },
      'above': {
        'zone-1': 0,
        'zone-2': 0,
        'zone-3': 0
      }
    }
  };


  var getZone = function(postcode) {
    postcode = (postcode || '').toUpperCase().trim();
    var zone;
    var zone1 = /^(H..|G1.|M..|K1.|T2.|T3.|T5.|T6.|V5.|V6.|C1A|R2.|R3.|E2.|E1.|E3.|B3.|S7.|S4.|A1.|J4.).+$/;
    var zone3 = /^(J|G|K|L|N|P|T|V|C|R|E|B|S|A|Y|X)0.+$/;

    // invalid;
    if (!/^([a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d)$/.test(postcode)) {
      return 'zone-3';
    }
    zone = 'zone-2';
    if (zone1.test(postcode)) {
      zone = 'zone-1';
    }
    if (zone3.test(postcode)) {
      zone = 'zone-3';
    }
    console.log('zone for: ', postcode, ' is ', zone);
    return zone;
  };

  var getZoneCost = function(type, total, postalcode) {
    var zone = getZone(postalcode);
    var rates = RATES[type];
    if (total >= rates.min) {
      return rates.above[zone];
    } else {
      return rates.below[zone];
    }
  };


  var getStateTaxes = function(state, amount) {
    var taxes = EDB.taxes[state];
    return taxes.map(function(tax) {
      
      var rate = parseFloat((parseFloat(tax.rate) / 100).toFixed(5));
      return {
        name: tax.name,
        amount: parseFloat( (rate * amount).toFixed(2))
      };
    })
  }





  // console.log( getZoneCost('furniture', 600, 'H2A 2A2') )
  // console.log( getZoneCost('furniture', 600, 'c1c 1c1') )
  // console.log( getZoneCost('furniture', 600, 'J0X 1Z1') )


  var fetchProducts = function(callback, notifyProgress) {
    if (typeof notifyProgress == 'undefined') {
      notifyProgress = function(message) {
        console.log(message);
      }
    }
    var products = [];
    var start = 0;
    var fetched = 0;
    var getCount = $.ajax({
      url: apiPath('/products/count'),
      type: 'GET',
      dataType: 'json'
    });
    getCount.fail(callback);
    getCount.done(function(data) {
      notifyProgress('fetching ' + data.count + ' products and their variations');
      var stop = data.count;
      var onChunk = function(data) {
        fetched += data.products.length;
        products = products.concat(data.products);
        notifyProgress('...got ' + fetched + ' of ' + stop);
        if (fetched < stop) {
          start += 10;
          fetchChunk();
        } else {
          fetched = 0;
          start = 0;
          callback(null, products);
        }
      }
      var fetchChunk = function() {
        var chunk = $.ajax({
          url: apiPath('/products?filter[offset]=' + start + '&filter[limit]=10'),
          type: 'GET',
          dataType: 'json'
        });
        chunk.fail(callback);
        chunk.done(onChunk)
      }
      fetchChunk();

    });
  };

  var fetchMaterials = function(callback) {
    //var MATERIALS = {};
    $.getJSON('/wp-content/edb-json/materials.json').then(function(json) {
      callback(null, json);
    }, callback);
  }

  var fetchTaxes = function(callback) {
    var fetch = $.ajax({
      url: apiPath('/taxes'),
      type: 'GET',
      dataType: 'json'
    });
    fetch.fail(callback);
    fetch.done(function(data) {
      callback(null, data.taxes);
    })
  }


  var fetchRemoteData = function(callback) {
    var fetched = {};
    var expect = ['products', 'materials', 'taxes'];
    var complete = function() {
      if (expect.every(function(name) {
        return fetched.hasOwnProperty(name)
      })) {
        callback(null, fetched);
      }
    }
    fetchProducts(function(error, chunk) {
      if (error) return callback(error);
      fetched.products = chunk;
      complete();
    });

    fetchMaterials(function(error, chunk) {
      if (error) return callback(error);
      fetched.materials = chunk;
      complete();
    });

    fetchTaxes(function(error, chunk) {
      if (error) return callback(error);
      fetched.taxes = chunk;
      complete();
    });
  }
  var createMaterials = function(data) {
    return data.map(function(mat) {
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
      if (mat.description) {
        mat.description = getEn(mat.description).split('|').join("\n");
      }
      mat.fullName = mat.name + ' ' + mat.material;
      if (mat.image) {
        mat.image = 'https://elementdebase-prod-elementdebase.netdna-ssl.com' + mat.image;
      }
      return mat;
    });
  }

  var createVariation = function(data, product) {
    // console.log(data)
    var materialId = data.attributes[0].option;

    // var imageSrc = MATERIALS[materialID].image;//'/wp-content/edb-materials/' + materialId + '.jpg';
    var materialObject = EDB.materials.filter(function(m) {
      return m.material == materialId
    })[0];

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

  var createProducts = function(data) {
    return data.map(function(raw) {
      var materialIds = raw.attributes[0].options;
      var imageSrc = raw.featured_src;
      var title = getEn(raw.title);
      var subtitle = getEn(raw.subtitle);
      var categories = raw.categories;
      var isOnSale = raw.on_sale;

      var shipping = {
        id: raw.shipping_class_id,
        class: raw.shipping_class
      }
      categories.forEach(function(c) {
        globalCats[c] = c;
      });
      var product = {
        type: 'product',
        hidden: true,
        id: raw.id,
        name: [title, subtitle].filter(function(n) {
          return !!n
        }).join('-').toLowerCase(),
        sku: raw.sku,
        image: imageSrc,
        categories: categories.join(', '),
        price: parseFloat(raw.price),
        isOnSale: isOnSale,
        shipping: shipping,
        stocks: {},
        selectedVariation: raw.variations[0].id
      };
      Object.defineProperty(product, 'raw', {
        value: raw
      });
      var variations = raw.variations.map(function(v) {
        return createVariation(v, product);
      });
      product.variations = variations;
      return product;
    })
  }
  var createTaxes = function(data) {
    return data.reduce(function(tx, item) {
      if (!tx[item.state]) {
        tx[item.state] = [];
      }
      tx[item.state].push(item);
      return tx;
    }, {});
  }

  var createDataLibrary = function(data) {
    EDB.materials = createMaterials(data.materials);
    EDB.products = createProducts(data.products);
    EDB.taxes = createTaxes(data.taxes);
    EDB.categories = Object.keys(globalCats);
  }

  var getToken = function() {
    return (Date.now() * 10000).toString(36) + Math.floor(Math.random() * 1000000).toString(36);
  }
  var getProductById = function(pid) {
    var found = EDB.products.filter(function(p) {
      return p.id == pid;
    });
    return found.length ? found[0] : null;
  }
  var getVariationById = function(pid, vid) {
    var product = getProductById(pid);
    if (!product) return null;
    var found = product.variations.filter(function(v) {
      return v.id == vid;
    });
    return found.length ? found[0] : null;
  }


  // var EDB =  {
  //   load: function() {

  //   }
  // }
  EDB.load = function(callback) {
    fetchRemoteData(function(error, data) {
      if (error) return callback(error);
      createDataLibrary(data);
      callback(null, EDB);
      // EDB.addToCart(EDB.products[0], EDB.products[0].variations[0], 5);
      // EDB.removeCartItem(EDB.cartItems[1].token);
      // EDB.addFee({
      //   title: 'taxable fee',
      //   taxable: true,
      //   total: 100
      // });
      // EDB.addFee({
      //   title: 'not taxable fee',
      //   taxable: false,
      //   total: 100
      // });
    })
  };
  
  EDB.sendOrderEmail = function( id, key ){
    var url = edb_order_tool_params.ajaxurl;
    return $.post( url ,{send_order_email:id,action:'send_order_tool_email'});
    // console.log('should send email');
  }

  EDB.addToCart = function(product, variation, quantity) {
    // var product = getProductById( product_id );
    // var variation = getVariationById( product_id, variation_id );
    var in_stock = variation.stock;
    var avail = 'available';
    if (in_stock <= 0) {
      avail = 'backorder';
    } else if (quantity > in_stock) {
      EDB.addToCart(product, variation, in_stock);
      EDB.addToCart(product, variation, quantity - in_stock);
      return;
    }
    var token = getToken();
    var item = {
      token: token,
      product: product,
      variation: variation,
      quantity: quantity,
      availability: avail,
      shippingPackage: 'edb_ship_bundle_1',
      total: quantity * variation.price
    };
    EDB.cartRef[token] = item;
    EDB.cartItems.push(EDB.cartRef[token]);
    variation.stock -= quantity;
    // if( quantity > in_stock){

    // }
    // console.log('addToCart', item)
  }
  EDB.setCartItemShippingPackage = function(token, shippingPackage) {
    EDB.cartRef[token].shippingPackage = shippingPackage;
  }

  EDB.removeCartItem = function(token) {
    delete EDB.cartRef[token];
    var deletedIndex;
    EDB.cartItems = EDB.cartItems.filter(function(item, index) {
      if (item.token == token) {
        item.variation.stock += item.quantity;
        deletedIndex = index;
        return false;
      }
      return true;
    });
    console.log('removed index', deletedIndex);
    return deletedIndex;
  }


  EDB.clearCart = function() {
    Object.keys(EDB.cartRef).forEach(EDB.removeCartItem);
  }

  EDB.addFee = function(data) {
    var token = getToken();
    var fee = {
      token: token,
      title: data.title || 'custom fee',
      taxable: data.taxable || false,
      tax_class: data.tax_class || '',
      total: data.total || 0
    }
    EDB.feeRef[token] = fee;
    EDB.feeItems.push(fee);
  }
  EDB.orderRequiresShipping = function() {
    if(!EDB.cartItems.length) return false;
    return EDB.cartItems.some(function(item) {
      return item.shippingPackage != 'edb_self_pickup';
    })
  }
  EDB.removeFee = function(token) {
    delete EDB.feeRef[token];
    var deletedIndex;
    EDB.feeItems = EDB.feeItems.filter(function(item, index) {
      if (item.token == token) {
        deletedIndex = index;
      }
      return item.token != token;
    });
    return deletedIndex;
  }
  EDB.clearFees = function() {
    Object.keys(EDB.feeRef).forEach(EDB.removeFee);
  }


  EDB.postOrder = function( callback ) {
    var order = {
      status: 'pending',
      payment_details: {
        method_id: 'wc_gateway_paypal_pro',
        method_title: 'Credit Card (paypal)',
        paid: false
      },
      billing_address: EDB.billingAddress,
      shipping_address: EDB.shippingAddress,
      line_items: EDB.cartItems.map(function(item) {
        return {
          product_id: item.variation.id,
          variation_id: item.variation.id,
          quantity: item.quantity,
          meta: {
            key: 'shipping_choice',
            label: 'shipping choice',
            value: item.shippingPackage
          }
        }
      }),
      // shipping_lines: getOrderShippingLines(),
      // fee_lines: getOrderFeeLines()
    }

    if (EDB.orderRequiresShipping()) {
      order.shipping_lines = [{
        'method_id': 'edb_ship_buncle_1',
        'method_title': 'edb shipping',
        'total': EDB.calcShippingCost()
      }]
    }
    var discount = EDB.calcSelfPickupDiscount();
    if (discount < 0) {
      if (!order.fee_lines) {
        order.fee_lines = [];
      }
      order.fee_lines.push({
        'title': 'self pickup discount',
        'taxable': false,
        
        'total': discount
      })
    }
    EDB.feeItems.forEach(function(item) {
      if (!order.fee_lines) {
        order.fee_lines = [];
      }
      order.fee_lines.push({
        title: item.title,
        taxable: item.taxable,
        tax_class:'',
        total:item.total
      });
    });
    
    return $.ajax({
      type: 'POST',
      url: apiPath('/orders'),
      dataType: 'json',
      data: JSON.stringify({order:order})
      // username: keys.consumerKey,
      // password: keys.consumerSecret,
    });
    
  
    
  }


  EDB.getProductById = getProductById;
  EDB.getZone = getZone;
  // var addCustomFee = function(data) {
  //   var token = getToken();
  //   var fee_line = {
  //     fee_token: token,
  //     title: data.title || 'fee',
  //     taxable: data.taxable || false,
  //     tax_class: data.tax_class || '',
  //     total: data.total || 0
  //   };
  //   FEES[token] = fee_line;
  //   return token;
  // }

  // var removeCustomFee = function(token) {
  //   delete FEES[token];
  // }

  // var updateCustomFee = function(token, data) {
  //   FEES[token] = Object.assign({}, FEES[token], data);
  // }

  // var getOrderCustomFees = function() {
  //   return Object.keys(FEES).map(function(k) {
  //     return FEES[k];
  //   })
  // }
  // var clearFees = function(){
  //   FEES = {};
  // }



  EDB.calcSelfPickupDiscount = function() {
    var pickups = EDB.cartItems.filter(function(item) {
      return item.shippingPackage == 'edb_self_pickup';
    });
    return -0.05 * pickups.reduce(function(total, item) {
      var price = item.variation.price;
      var qty = item.quantity;
      return total + (price * qty)
    }, 0);
  };

  EDB.calcShippingCost = function() {
    var postcode = EDB.shippingAddress.postcode;
    var shippings = EDB.cartItems.filter(function(item) {
      return item.shippingPackage != 'edb_self_pickup';
    });
    var type_totals = {
      'furniture': 0,
      'small-furniture': 0,
      'accessories': 0
    };
    shippings.forEach(function(item) {
      var price = item.variation.price;
      var qty = item.quantity;
      var total = 1 * (price * qty);
      type_totals[item.product.shipping.class] += total;
    });

    return Object.keys(type_totals).reduce(function(total, key) {
      if (type_totals[key]) {
        return total + getZoneCost(key, type_totals[key], postcode);
      }
      return total;
    }, 0);

  };

  EDB.calculateTotals = function() {
    var totals = {};
    var taxable = 0;
    totals.cart = EDB.cartItems.reduce(function(t, item) {
      return t + (1 * item.total);
    }, 0);
    totals.fees = EDB.feeItems.reduce(function(t, fee) {
      if (fee.taxable) {
        taxable += (1 * fee.total);
      }
      return t + (1 * fee.total);
    }, 0);
    totals.shipping = EDB.calcShippingCost();
    totals.pickupDiscount = EDB.calcSelfPickupDiscount();
    taxable += totals.cart;
    taxable += totals.shipping;
    // taxable += totals.pickupDiscount;
    totals.subtotal = Object.keys(totals).reduce(function(t, k) {
      return t + (1 * totals[k]);
    }, 0);
    totals.tax = getStateTaxes(EDB.shippingAddress.state || 'QC', taxable);
    totals.total = totals.subtotal + totals.tax.reduce(function(t, tx) {
      
      return t + (1 * tx.amount);
    }, 0);

    return Object.keys(totals).reduce(function(all, k) {
      if (k != 'tax') {
        var l = k;
        if (k == 'shipping') {
          l = 'Shipping (' + getZone(EDB.shippingAddress.postcode) + ')';
        };
        all.push({
          label: l,
          value: totals[k]
        });

      } else {
        totals[k].forEach(function(tx) {
          all.push({
            label: 'tax ' + tx.name,
            value: tx.amount
          });
        })
      }
      return all;
    }, [])
  }




  // EDB.load( function(){
  //   console.log(arguments)
  // })

  window.EDB = EDB;



})(jQuery.noConflict())