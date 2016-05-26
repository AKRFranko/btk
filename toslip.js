var WooCommerceAPI = require('woocommerce-api');
var pid = process.argv[process.argv.length-1];
if(!pid){
  process.exit('Missing PID.');
}

var cats = [{
             "id": 30,
             "name": "sofas",
             "slug": "sofas",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 3
           }, {
             "id": 31,
             "name": "2-seater",
             "slug": "sofas-2-seater",
             "parent": 30,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 32,
             "name": "3-seater",
             "slug": "sofas-3-seater",
             "parent": 30,
             "description": "",
             "display": "default",
             "image": "",
             "count": 7
           }, {
             "id": 33,
             "name": "sofa-beds",
             "slug": "sofa-beds",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 3
           }, {
             "id": 34,
             "name": "sectionals",
             "slug": "sectionals",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 35,
             "name": "left-facing",
             "slug": "sectionals-left-facing",
             "parent": 34,
             "description": "",
             "display": "default",
             "image": "",
             "count": 4
           }, {
             "id": 36,
             "name": "right-facing",
             "slug": "sectionals-right-facing",
             "parent": 34,
             "description": "",
             "display": "default",
             "image": "",
             "count": 4
           }, {
             "id": 51,
             "name": "modular",
             "slug": "sofas-modular",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 3
           }, {
             "id": 37,
             "name": "side-tables",
             "slug": "side-tables",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 11
           }, {
             "id": 38,
             "name": "armchairs",
             "slug": "armchairs",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 6
           }, {
             "id": 39,
             "name": "benches-ottomans",
             "slug": "benches-ottomans",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 40,
             "name": "headboards",
             "slug": "headboards",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 41,
             "name": "storage",
             "slug": "storage",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 42,
             "name": "accessories",
             "slug": "accessories",
             "parent": 0,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 43,
             "name": "pillows",
             "slug": "accessories-pillows",
             "parent": 42,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 44,
             "name": "rugs",
             "slug": "accessories-rugs",
             "parent": 42,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }, {
             "id": 45,
             "name": "other",
             "slug": "accessories-other",
             "parent": 42,
             "description": "",
             "display": "default",
             "image": "",
             "count": 0
           }];

var getCatId = function( cat ){
  return cats.reduce( function( found, cur ){
    if( found ) return found;
    if( cur.name == cat || cur.slug == cat ){
      return cur.id;
    }
    return found;
  }, null )
}
var wc = new WooCommerceAPI({
  url: 'https://badb0x.akr.club',
  // wpAPI: true,
  version: 'v3',
  verifySsl: false,
  // consumerKey:'ck_88b9a1cd25695b4a4514a395c6a5c94e72715199',
  // consumerSecret:'cs_c048c3fe2b104a0164e4b8c6e6e3e1782a5d067f'
  consumerKey: 'ck_dbc3f91b5f982189037625df93c50393ad99592b',
  consumerSecret: 'cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1'
});

var onFailure = function( error ){
  console.error( error );
  process.exit(1);
}

var getEn = function( str ){
  if(!str) return '';
  if(!~str.indexOf('{:en}')) return str;
  var r = new RegExp( /.*\{\:en\}([^\{]+)\{\:\}.*/);
  return str.match( r )[1];
}


var onProductCreated = function( data ){
  console.log('SUCCESS!!', data );
}
var onProductData = function( data ){
  var title = getEn(data.product.title);
  var subtitle = getEn(data.product.subtitle);
  var name = [title, subtitle].join('_');
  var materials = data.product.attributes[0].options;
  var images = data.product.images.map( function( i ){ return i.src });
  var featured = data.product.featured_src;
  var price = Math.ceil( 0.25 * data.product.price);
  var categories = data.product.categories;
  var desc =data.product.description;
  var variations = [];
  materials.forEach( function( mid ){
    variations.push( {
      regular_price: price,
      managing_stock: true,
      backorders: 'allow',
      attributes: [
        {
          name: 'edb_material',
          slug: 'edb_material',
          option: mid
        }
      ]
    });
  })
  var slipcover = {
    title: name,
    type: 'variable',
    status: 'draft',
    description: desc,
    categories: [29], //[52]
    backorders: 'allow',
    featured_src: featured,
    shipping_class: 'accessories',
    images: images.map( function( src,i ){ return { src: src.replace('https','http'), title: name + '_' + i, position: i } }),
    attributes: [
      data.product.attributes[0]
    ],
    variations: variations
  }
  // console.log(slipcover)
  wc.post('products', {  product: slipcover }, handle( onFailure, onProductCreated ))
  
}
var onCategoryData = function( data ){
  cats = data.categories;
  wc.get('products/' + pid, handle( onProductData, onFailure ) );  
}



var handle = function( succ, fail ){
  return function( error, response ){
    if( error ) return fail( error );
    else return succ( JSON.parse(response.body) );
  }
}
wc.get('categories', handle( onCategoryData, onFailure ))
