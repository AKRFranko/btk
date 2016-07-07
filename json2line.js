
process.stdin.on('data', function( d ){
  var json = JSON.parse(d.toString())
  if(Array.isArray(json)){
    var lines = [];
    json.forEach( function( o ){
        var keys = Object.keys( o );
        var line = [];
        keys.forEach( function( k ){
          line.push( o[k] );
        });
        lines.push( '"' + line.join('",  "') + '"' );
    });
    console.log(lines.join("\n"))
  }
})
