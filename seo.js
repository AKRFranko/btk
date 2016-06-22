var en = require('./seo-en.json');
var fr = require('./seo-fr.json');
var fs = require('fs');

var php = [];
var php_en = [];
var php_fr = [];
var json = en.reduce( function( j, e, i ){
  e.URL = e.URL.replace('https://elementdebase.com','');
  j.en[e.URL]={};
  j.en[e.URL]['keywords'] = e['Mot-clé principal'];
  j.en[e.URL]['title'] = e['Page Title'];
  j.en[e.URL]['description'] = e['MetaDescriptions'];
  j.en[e.URL]['heading'] = e['H1 title'];
  php_en.push( '\t"'+e.URL+'"=>array("keywords"=> "'+e['Mot-clé principal']+'" ,"title"=> "'+e['Page Title']+'" ,"description"=> "'+e['MetaDescriptions']+'" ,"heading"=> "'+e['H1 title']+'")' );
  return j;
}, {en:{},fr:{}} )



fr.forEach( function( f ){
  f.URL = f.URL.replace('https://elementdebase.com','');
  json.fr[f.URL] = {};
  json.fr[f.URL]['keywords'] = f['Mot-clé principal'];
  json.fr[f.URL]['title'] = f['Page Title'];
  json.fr[f.URL]['description'] = f['MetaDescriptions'];
  json.fr[f.URL]['heading'] = f['H1 title'];
  php_fr.push( '\t"'+f.URL+'"=>array("keywords"=> "'+f['Mot-clé principal']+'" ,"title"=> "'+f['Page Title']+'" ,"description"=> "'+f['MetaDescriptions']+'" ,"heading"=> "'+f['H1 title']+'" )' );
});

php_en = php_en.join(",\n")
php_fr = php_fr.join(",\n")
php = 'array("en"=> array('+php_en+'),"fr"=> array('+php_fr+'))';




fs.writeFileSync('seo.php', php );






