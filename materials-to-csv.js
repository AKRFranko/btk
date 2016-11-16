var json = require('./mdraw.json');
json = Object.keys(json).map( function( k ){ var s = json[k]; Object.keys(s.description||{}).forEach(function(kk){ s[kk] = s.description[kk]});delete s.description;return s;}).reduce(function(o,i){
  o[i.material_no] = i;
  return o;
},{})



var numbers = [];
var n=999;
while(n>0){
  var s = n.toString();
  while(s.length < 3){
    s = '0'+s;
  }
  numbers.push(s);
  n--;
}
var headings = ['material_no','title','subtitle','body','image','products'];
var rows = [headings.join(';')];
numbers.reverse().forEach( function( n ){
  var row = [];
  var data = json[n];
  if(!data){
    row = [n,'n/a','n/a','n/a','n/a','n/a']
  }else{
    row = [n,data.title,data.subtitle,data.body,data.image,data.products];
  }
  rows.push( row.join(';').replace(/[\n\t\r]+/g,' ') )
})
var fs = require('fs');

var csv = rows.join("\n");
var d = new Date();
var filename = [d.getFullYear(), d.getMonth(), d.getDate(), 'materials'].join('-')+'.csv';
fs.writeFileSync(filename, csv);