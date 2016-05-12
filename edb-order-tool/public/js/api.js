// ?filter[limit]=15
var catalog;
var materials;
var cart;
var $ = jQuery;
var getCount = function() {
  var defer = jQuery.Deferred();
  defer.resolve({
    count: 12
  })
  return defer;

  return $.getJSON(apiUrl('/products/count'));
};
var apiUrl = function(path) {
  return 'https://ck_71d08f56fed6aa34a284ea7afa65796477c0196a:cs_e65dccfbea5cc06c8673fffb494f6b4733fffac8@badb0x.akr.club/wc-api/v3' + path;
}

var getChunk = function(start, total, notify) {
  var url = apiUrl('/products?filter[offset]=' + start + '&filter[limit]=' + 5);
  var op = function(outputs) {
    var ajax = $.getJSON(url);
    return ajax.then(function(data) {
      outputs = outputs.concat(data.products);
      notify(Math.floor(100 * (outputs.length / total)));
      return outputs;
    });
  }
  return op;
}

var loadProducts = function() {
  var defer = jQuery.Deferred();
  // var outputs=[];
  var resolve = function(outputs) {
    return defer.resolve(outputs.reduce(function(obj, out) {
      obj[String(out.id)] = out;
      return obj;
    }, {}))
  }
  var reject = function(error) {
    return defer.reject(error);
  }
  getCount().then(function(data) {
    var count = data.count;
    var ops = [];
    // var last = getChunk( 1, 5 );
    for (var i = 0; i < count; i += 5) {
      ops.push(getChunk(i, count, defer.notify));


    }
    var op = ops.shift()([]);
    return ops.reduce(function(a, b) {
      return a.then(b);
    }, op).then(resolve, reject)

  }, reject);
  return defer;
}
var loadMaterials = function() {
  return $.getJSON('/wp-content/themes/edb/js/materials.json').done(function(data) {

    return data;
  });
}

  function Catalog(products, materials) {
    this.products = products;
    this.materials = materials;
    return this;
  }

Catalog.ProductProxy = function(data) {
  return new Proxy(data, {
    get: function(o, k) {
      // console.log('gets', k )
      if (Catalog.hasOwnProperty('get' + k)) {
        return Catalog['get' + k](data)
      }
      return o[k];
    },
    set: function(o, k, v) {
      // console.log('sets', k, v )
      return o[k] = v;
    }
  })
}
Catalog.getsubtitle = function(o) {
  if ( !! o.subtitle && o.subtitle.includes('{:}')) {
    return o.subtitle.slice(o.subtitle.indexOf('{:en}') + 5, o.subtitle.indexOf('{:}'))
  } else {
    return o.subtitle;
  }
}
Catalog.gettitle = function(o) {
  var subtitle = Catalog.getsubtitle(o);
  if (subtitle) {
    return [o.title, subtitle].join('_');
  }
  return o.title.replace(/-/g, '_');
}

Catalog.prototype = {
  constructor: Catalog,
  each: function(fn) {
    var it = this;
    // var products = this.products;
    // var get = this.get;
    return Object.keys(it.products).map(function(key) {
      return fn.call(it, it.get(key));
    });
  },
  put: function(id, product) {
    id = id.toString();
    this.products[id] = product;
  },
  get: function(id) {
    id = id.toString();
    var product = this.products[id]
    if (product) {
      return Catalog.ProductProxy(product);
    }

  },
  findById: function(ids) {
    if (!Array.isArray(ids)) {
      ids = [ids];
    }
    return ids.map(function(id) {
      return this.get(id);
    }, this).filter(function(v) {
      return !!v
    });
  },
  findByAttr: function(attr, value) {
    var products = this.products;
    return Object.keys(products).reduce(function(found, key) {
      var product = products[key];

      if (products[key] && product.hasOwnProperty(attr) && product[key] == value) {
        found.push(product);
      }
      return found;
    }, [])
  },
  findByScore: function(string, minScore) {
    var it = this;
    minScore || (minScore = 0.8);
    if (!it.scores) {
      it.scores = {};
    }
    if (!it.scores[string]) {
      it.scores[string] = {};
    }
    it.each(function(product) {
      var title = product.title;
      var score = LiquidMetal.score(title, string);
      it.scores[string][product.id] = score;
    })
    var ids = Object.keys(it.scores[string]);
    return ids.sort(function(a, b) {
      if (it.scores[string][a] > it.scores[string][b]) {
        return -1;
      }
      if (it.scores[string][a] < it.scores[string][b]) {
        return 1;
      }
      return 0;
    }).filter(function(id) {
      return it.scores[string][id] >= minScore
    }).map(function(id) {
      return it.get(id)
    });
  }

};

var getToken = function() {
  return Date.now().toString(36);
}


  function Order() {

    this.billing_address = {};
    this.shipping_address = {};
    this.payment_details = {
      method_id: 'wc_gateway_paypal_pro',
      method_title: 'Credit Card (paypal)',
      paid: false
    };
    // payment_details: {
    //   method_id: 'bacs',
    //   method_title: 'Direct Bank Transfer',
    //   paid: true
    // },
    // billing_address: {
    //   first_name: 'John',
    //   last_name: 'Doe',
    //   address_1: '969 Market',
    //   address_2: '',
    //   city: 'San Francisco',
    //   state: 'CA',
    //   postcode: '94103',
    //   country: 'US',
    //   email: 'john.doe@example.com',
    //   phone: '(555) 555-5555'
    // },
    // shipping_address: {
    //   first_name: 'John',
    //   last_name: 'Doe',
    //   address_1: '969 Market',
    //   address_2: '',
    //   city: 'San Francisco',
    //   state: 'CA',
    //   postcode: '94103',
    //   country: 'US'
    // },
  };

Order.prototype = {
  toJSON: function() {
    return {
      order: {
        payment_details: this.payment_details,
        billing_address: this.billing_address,
        shipping_address: this.shipping_address,
        line_items: cart.line_items
      }
    };
  },
  validate: function() {
    if (!this.billing_address.email) {
      return new Error('Missing billing email.');
    } else if (cart.line_items.length < 1) {
      return new Error('No products in cart.');
    } else {
      return true;
    }
  },
  populate: function( scope, data ){
    Object.assign( this[scope], data );
  },
  send: function() {
    this.billing_address.country = 'CA';
    this.shipping_address.country = 'CA';
    this.billing_address.state = 'QC';
    this.shipping_address.state = 'QC';
    var ajax = $.ajax({
      type: "POST",
      url: apiUrl('/orders'),
      data: JSON.stringify(this),
      dataType: 'json'
    });
    return ajax;
  }
};




function Cart() {
  this.items = {};
  Object.defineProperty(this, 'getProducts', {
    enumerable: false,
    value: function() {
      var items = this.items;
      return Object.keys(items).map(function(key) {
        var item = items[key];
        return catalog.get(item.product_id)
      });
    }
  })
  Object.defineProperty(this, 'line_items', {
    enumerable: false,
    get: function() {
      var items = this.items;
      return Object.keys(items).map(function(key) {
        var item = items[key];
        return item;
      });
    }
  })
  return this;
}
Cart.prototype = {
  add: function(product_id, variation_id, qty) {
    var token = getToken();
    this.items[token] = {
      product_id: product_id,
      variation_id: variation_id,
      quantity: qty
    };
    return token;
  },
  update: function(token, qty) {
    var item = this.items[token];
    item.quantity = qty;
    if (qty === 0) {
      this.remove(token);
    }
  },
  remove: function(token) {
    delete this.items[token];
  }
}

var init = function() {
  return $.when(loadMaterials(), loadProducts()).done(function(mats, prods) {
    materials = mats[0];
    catalog = new Catalog(prods, materials);
    // cart = new Cart();
    return catalog;
  })
};



if(!window.edb){
  window.edb = function( onReady ){
    init.then( function(){
      onReady( Catalog, Cart, Order );
    });
  };
}


// init().then(function() {

//   console.log('init', arguments);
//   var mm = catalog.findByScore('mix')[0];
//   cart.add(mm.id, 35995, 3);
//   var order = new Order();
//   order.send().then(function() {
//     console.log('order sent')
//   }, function(error) {
//     console.log('order failed', error.responseText);
//   })
// });



// load.progress(function(progress) {
//   console.log('progress', progress);
// });

// load.fail(function(error) {
//   console.log('failed!', error);
// });

// load.done(function(products) {
//   catalog = new Catalog(products);

//   console.log('success!', catalog);
//   catalog.each(function(product) {
//     console.log(product.title);
//   })
// });



// var get = loadProducts();
// get.progress( function( progress){
//   console.log('progress', progress );
// })
// get.done( function( products){
//   console.log('got', products );
// });
// get.fail(function( ){
//           console.log('failed', arguments )
//         })