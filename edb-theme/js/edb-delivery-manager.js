(function($) {
  var base = 'badb0x.akr.club';
  // var username='ck_dbc3f91b5f982189037625df93c50393ad99592b';
  // var password='cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1';
  var username = 'ck_94fac53c2e52855c8967c6a34991bb462f0e553a';
  var password = 'cs_e252818ee207a1a6baa461401c64dcf772f2c0d1';
  var apiPath = function(path) {
    var str = 'https://' + base + '/wc-api/v3' + path;
    return str;
  }

  $.ajaxPrefilter(function(options) {
    options.beforeSend = function(xhr) {
      xhr.setRequestHeader("Authorization", "Basic " + btoa(username + ":" + password));
    };
  })


  function getEn(str) {
    if (str.indexOf('{:}') == -1) return str;
    var eng = str.split('{:}').reduce(function(en, s) {
      return en ? en : /\:en/.test(s) ? s : null;
    }, null);
    return eng.replace('{:en}', '');
  }


  var API = {
    request: function( type, path, data, callback ){
      var options = {};
      options.url = apiPath(path);
      options.type = type;
      options.dataType='json';
      if(arguments.length == 4){
        options.data = JSON.stringify(data)
      }else{
        callback = data;
      };
      var request = $.ajax(options);
      request.fail(callback);
      request.done(function(data) {
        callback(null, data);
      });
      return request;
    },
    get: function(path, callback) {
      return API.request( 'GET', path, callback );
    },
    post: function(path, data, callback) {
      return API.request( 'POST', path, data, callback );
    }
  };
  
  
  console.log(API)

  window.onload = function() {
    API.get('/orders',function( error, ordersData) {
      if(error){
        console.log(error);
      }else{
        console.log(ordersData);
      }
    })
  }
})(jQuery)