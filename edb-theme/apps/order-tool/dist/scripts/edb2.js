!function(e){function t(e){if(-1==e.indexOf("{:}"))return e;var t=e.split("{:}").reduce(function(e,t){return e?e:/\:en/.test(t)?t:null},null);return t.replace("{:en}","")}var n={shippingAddress:{state:"QC",country:"CA"},billingAddress:{country:"CA"},cartRef:{},cartItems:[],feeRef:{},feeItems:[]},i={},a="elementdebase.com",r=function(e){var t="https://"+a+"/wc-api/v3"+e;return t},o={furniture:{min:500,below:{"zone-1":65,"zone-2":150,"zone-3":250},above:{"zone-1":0,"zone-2":85,"zone-3":150}},"small-furniture":{min:500,below:{"zone-1":18,"zone-2":25,"zone-3":28},above:{"zone-1":0,"zone-2":10,"zone-3":15}},accessories:{min:50,below:{"zone-1":15,"zone-2":15,"zone-3":15},above:{"zone-1":0,"zone-2":0,"zone-3":0}}},s=function(e){e=(e||"").toUpperCase().trim();var t,n=/^(H..|G1.|M..|K1.|T2.|T3.|T5.|T6.|V5.|V6.|C1A|R2.|R3.|E2.|E1.|E3.|B3.|S7.|S4.|A1.|J4.).+$/,i=/^(J|G|K|L|N|P|T|V|C|R|E|B|S|A|Y|X)0.+$/;return/^([a-zA-Z]\d[a-zA-Z]\s?\d[a-zA-Z]\d)$/.test(e)?(t="zone-2",n.test(e)&&(t="zone-1"),i.test(e)&&(t="zone-3"),console.log("zone for: ",e," is ",t),t):"zone-3"},u=function(e,t,n){var i=s(n),a=o[e];return t>=a.min?a.above[i]:a.below[i]},c=function(e,t){var i=n.taxes[e];return i.map(function(e){var n=parseFloat((parseFloat(e.rate)/100).toFixed(5));return{name:e.name,amount:parseFloat((n*t).toFixed(2))}})},l=function(t,n){"undefined"==typeof n&&(n=function(e){console.log(e)});var i=[],a=0,o=0,s=e.ajax({url:r("/products/count"),type:"GET",dataType:"json"});s.fail(t),s.done(function(s){n("fetching "+s.count+" products and their variations");var u=s.count,c=function(e){o+=e.products.length,i=i.concat(e.products),n("...got "+o+" of "+u),u>o?(a+=10,l()):(o=0,a=0,t(null,i))},l=function(){var n=e.ajax({url:r("/products?filter[offset]="+a+"&filter[limit]=10"),type:"GET",dataType:"json"});n.fail(t),n.done(c)};l()})},p=function(t){e.getJSON("/wp-content/edb-json/materials.json").then(function(e){t(null,e)},t)},f=function(t){var n=e.ajax({url:r("/taxes"),type:"GET",dataType:"json"});n.fail(t),n.done(function(e){t(null,e.taxes)})},d=function(e){var t={},n=["products","materials","taxes"],i=function(){n.every(function(e){return t.hasOwnProperty(e)})&&e(null,t)};l(function(n,a){return n?e(n):(t.products=a,void i())}),p(function(n,a){return n?e(n):(t.materials=a,void i())}),f(function(n,a){return n?e(n):(t.taxes=a,void i())})},m=function(e){return e.map(function(e){return e.title?e.title=t(e.title):e.title="Material no.",e.subtitle&&(e.subtitle=t(e.subtitle)),e.subtitle?e.name=e.title+" "+e.subtitle:e.name=e.title,e.description&&(e.description=t(e.description).split("|").join("\n")),e.fullName=e.name+" "+e.material,e.image&&(e.image="https://elementdebase-prod-elementdebase.netdna-ssl.com"+e.image),e})},g=function(e,t){var i=e.attributes[0].option,a=n.materials.filter(function(e){return e.material==i})[0];a.image||(a.image=t.image);var r=t.isOnSale?!0:e.on_sale;return t.stocks[i]=e.stock_quantity,{type:"variation",id:e.id,name:[t.name,i].join(", "),sku:e.sku,image:t.image,categories:t.categories,product:t,material:a,price:parseFloat(e.price),isOnSale:r,shipping:t.shipping,stock:e.stock_quantity,isBackorder:e.stock_quantity<=0}},h=function(e){return e.map(function(e){var n=(e.attributes[0].options,e.featured_src),a=t(e.title),r=t(e.subtitle),o=e.categories,s=e.on_sale,u={id:e.shipping_class_id,"class":e.shipping_class};o.forEach(function(e){i[e]=e});var c={type:"product",hidden:!0,id:e.id,name:[a,r].filter(function(e){return!!e}).join("-").toLowerCase(),sku:e.sku,image:n,categories:o.join(", "),price:parseFloat(e.price),isOnSale:s,shipping:u,stocks:{},selectedVariation:e.variations[0].id};Object.defineProperty(c,"raw",{value:e});var l=e.variations.map(function(e){return g(e,c)});return c.variations=l,c})},v=function(e){return e.reduce(function(e,t){return e[t.state]||(e[t.state]=[]),e[t.state].push(t),e},{})},b=function(e){n.materials=m(e.materials),n.products=h(e.products),n.taxes=v(e.taxes),n.categories=Object.keys(i)},_=function(){return(1e4*Date.now()).toString(36)+Math.floor(1e6*Math.random()).toString(36)},k=function(e){var t=n.products.filter(function(t){return t.id==e});return t.length?t[0]:null};n.load=function(e){d(function(t,i){return t?e(t):(b(i),void e(null,n))})},n.sendOrderEmail=function(){console.log("should send email")},n.addToCart=function(e,t,i){var a=t.stock,r="available";if(0>=a)r="backorder";else if(i>a)return n.addToCart(e,t,a),void n.addToCart(e,t,i-a);var o=_(),s={token:o,product:e,variation:t,quantity:i,availability:r,shippingPackage:"edb_ship_bundle_1",total:i*t.price};n.cartRef[o]=s,n.cartItems.push(n.cartRef[o]),t.stock-=i},n.setCartItemShippingPackage=function(e,t){n.cartRef[e].shippingPackage=t},n.removeCartItem=function(e){delete n.cartRef[e];var t;return n.cartItems=n.cartItems.filter(function(n,i){return n.token==e?(n.variation.stock+=n.quantity,t=i,!1):!0}),console.log("removed index",t),t},n.clearCart=function(){Object.keys(n.cartRef).forEach(n.removeCartItem)},n.addFee=function(e){var t=_(),i={token:t,title:e.title||"custom fee",taxable:e.taxable||!1,tax_class:e.tax_class||"",total:e.total||0};n.feeRef[t]=i,n.feeItems.push(i)},n.orderRequiresShipping=function(){return n.cartItems.length?n.cartItems.some(function(e){return"edb_self_pickup"!=e.shippingPackage}):!1},n.removeFee=function(e){delete n.feeRef[e];var t;return n.feeItems=n.feeItems.filter(function(n,i){return n.token==e&&(t=i),n.token!=e}),t},n.clearFees=function(){Object.keys(n.feeRef).forEach(n.removeFee)},n.postOrder=function(t){var i={status:"pending",payment_details:{method_id:"wc_gateway_paypal_pro",method_title:"Credit Card (paypal)",paid:!1},billing_address:n.billingAddress,shipping_address:n.shippingAddress,line_items:n.cartItems.map(function(e){return{product_id:e.variation.id,variation_id:e.variation.id,quantity:e.quantity,meta:{key:"shipping_choice",label:"shipping choice",value:e.shippingPackage}}})};n.orderRequiresShipping()&&(i.shipping_lines=[{method_id:"edb_ship_buncle_1",method_title:"edb shipping",total:n.calcShippingCost()}]);var a=n.calcSelfPickupDiscount();return 0>a&&(i.fee_lines||(i.fee_lines=[]),i.fee_lines.push({title:"self pickup discount",taxable:!1,total:a})),n.feeItems.forEach(function(e){i.fee_lines||(i.fee_lines=[]),i.fee_lines.push({title:e.title,taxable:e.taxable,tax_class:"",total:e.total})}),e.ajax({type:"POST",url:r("/orders"),dataType:"json",data:JSON.stringify({order:i})})},n.getProductById=k,n.getZone=s,n.calcSelfPickupDiscount=function(){var e=n.cartItems.filter(function(e){return"edb_self_pickup"==e.shippingPackage});return-.05*e.reduce(function(e,t){var n=t.variation.price,i=t.quantity;return e+n*i},0)},n.calcShippingCost=function(){var e=n.shippingAddress.postcode,t=n.cartItems.filter(function(e){return"edb_self_pickup"!=e.shippingPackage}),i={furniture:0,"small-furniture":0,accessories:0};return t.forEach(function(e){var t=e.variation.price,n=e.quantity,a=1*(t*n);i[e.product.shipping["class"]]+=a}),Object.keys(i).reduce(function(t,n){return i[n]?t+u(n,i[n],e):t},0)},n.calculateTotals=function(){var e={},t=0;return e.cart=n.cartItems.reduce(function(e,t){return e+1*t.total},0),e.fees=n.feeItems.reduce(function(e,n){return n.taxable&&(t+=1*n.total),e+1*n.total},0),e.shipping=n.calcShippingCost(),e.pickupDiscount=n.calcSelfPickupDiscount(),t+=e.cart,t+=e.shipping,e.subtotal=Object.keys(e).reduce(function(t,n){return t+1*e[n]},0),e.tax=c(n.shippingAddress.state||"QC",t),e.total=e.subtotal+e.tax.reduce(function(e,t){return e+1*t.amount},0),Object.keys(e).reduce(function(t,i){if("tax"!=i){var a=i;"shipping"==i&&(a="Shipping ("+s(n.shippingAddress.postcode)+")"),t.push({label:a,value:e[i]})}else e[i].forEach(function(e){t.push({label:"tax "+e.name,value:e.amount})});return t},[])},window.EDB=n}(jQuery.noConflict());