'use strict';
(function(){
  
  
  var fetchURL = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails&playlistId=PLK95wsbzOzzunJIITt6-GakNutXOLCy4l&key=AIzaSyDrzsYB4-0y_4QKYlLWtqRF2kEQQhZi2rE&lang='+(WPGlobus.language || 'en');
  var iframe = '<iframe width="560" height="315" src="https://www.youtube.com/embed/VIDEOID?list=PLK95wsbzOzzunJIITt6-GakNutXOLCy4l" frameborder="0" allowfullscreen></iframe>'
  function injectVideo( item ){
    // console.log( item )
    var i = iframe.replace('VIDEOID', item.id );
  }
  
  var onFetch = function( data ){
    data.items.forEach( injectVideo );
    // console.log('fetched', data.items );
  }
  var onFail = function( e ){
    console.log( e );
  }
  
  jQuery( function(){
    if(jQuery('#post-2830').length){
      jQuery.getJSON(fetchURL).then( onFetch, onFail );  
    }
    
  })  
  
  
})()