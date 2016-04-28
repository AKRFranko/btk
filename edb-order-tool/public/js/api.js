// ?filter[limit]=15

var $ = jQuery;
var getCount = function() {
  return $.getJSON('https://ck_71d08f56fed6aa34a284ea7afa65796477c0196a:cs_e65dccfbea5cc06c8673fffb494f6b4733fffac8@badb0x.akr.club/wc-api/v3/products/count');
};
var getAPIUrl = function() {

}

var getChunk = function(start, total, notify ) {
  var url = 'https://ck_71d08f56fed6aa34a284ea7afa65796477c0196a:cs_e65dccfbea5cc06c8673fffb494f6b4733fffac8@badb0x.akr.club/wc-api/v3/products?filter[offset]=' + start + '&filter[limit]=' + 5;
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
      ops.push(getChunk(i, count, defer.notify ));


    }
    var op = ops.shift()([]);
    return ops.reduce(function(a, b) {
      return a.then(b);
    }, op).then(resolve, reject)

  }, reject);
  return defer;
}


function Catalog( products ){
  this.products = products;
}

Catalog.ProductProxy = function( data ){
  return new Proxy( data, {
    get: function( o, k){
      console.log('gets', k )
      
      return o[k];
    },
    set: function( o, k, v){
      console.log('sets', k, v )
      return o[k] = v;
    }
  })
}

Catalog.prototype = {
  constructor: Catalog,
  put: function( id, product ){
    id = id.toString();
    this.products[id] = product;
  },
  get: function( id ){
    id = id.toString();
    return Catalog.ProductProxy( this.products[ id ] );
  }
  
};



var catalog;

var load = loadProducts();

load.progress( function( progress ){
  console.log( 'progress', progress );
});

load.fail( function( error ){
  console.log( 'failed!', error );
});

load.done( function( products ){
  catalog = new Catalog( products );
  
  console.log( 'success!', catalog );
  catalog.each(function( product ){
    console.log( product ).subtitle;
  })
});



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