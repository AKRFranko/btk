var letter_order = 'DEFABC'.split('');
var html = '';
letter_order.forEach( function( letter ){
 var i = 0;
 while( i++ < 5 ){
  var name = 'edb_paprika_'+ letter + '' + i;
  html += '<div class="pdf-download-item">';  
  html += '<div class="pdf-download-item-image" style="background-image:url(\'/wp-content/monstas/'+name+'.svg\');"></div>';
  html += '<div class="pdf-download-item-text">'+name+'.pdf</div>';
  html += '<div class="pdf-dowload-item-button">';
  html += '<a href="https://elementdebase.com/wp-content/monstas/'+name+'.pdf" target="_blank" download="'+name+'.pdf">download</a>';
  html += '</div>';
  html += '</div>';
  html += "\n\n";

 }
})


console.log(html)
