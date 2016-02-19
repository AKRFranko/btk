#!/bin/env node

var fs = require('fs')
var glob = require('glob-fs');
var path = require('path');
var root = process.argv[2];
var forms = require('forms');
var fields = forms.fields;
var validators = forms.validators;
var widgets = forms.widgets;
var datauri = require('datauri').sync;
var categories = {
  'sofas': ['2-seater', '3-seater'],
  'sofa-beds': [],
  'sectionals': ['left-facing', 'right-facing'],
  'coffee-tables': [],
  'armchairs': [],
  'benches-ottomans': [],
  'headboards': [],
  'storage': [],
  'accessories': ['pillows', 'rugs', 'other']
}
// var css = fs.readFileSync( 'imports.css');
var html_head  = '<!doctype html><html lang="en"><head><link rel="stylesheet" href="imports.css"><meta charset="utf-8"><title>EDB Imports</title></head><body>';
var html_foot   = '<button id="save">save</button></body></html>';
var categories = Object.keys(categories).reduce(function(paths, category) {
  var subs = categories[category];
  var catpath = path.join(root, 'data', 'products', category);
  if (subs.length > 0) {
    return subs.reduce(function(p, s) {
      paths.push({
        category: category,
        subcategory: s,
        path: path.join(catpath, s)
      });
      return paths;
    }, paths);
  } else {
    paths.push({
      category: category,
      subcategory: null,
      path: catpath
    });
  }
  return paths;
}, []);

var materials = [];//['001', '002', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '014', '015', '016', '017'];


var mat_dirs = glob().readdirSync('./data/materials/**');
var prod_dirs = glob().readdirSync('./data/products/**');


var html = [ html_head ];


var materialLabel = function( material ){
  var id= material.material_id;
  var small = material.small_image;
  return '<img width="50" height="50" src="'+small+'"> '+id;
}

var productFormTitle = function( data ){
  var parts = [];
  if(data.category){
    parts.push(data.category)
  }
  if(data.subcategory){
    parts.push(data.subcategory)
  }
  if(data.folder){
    parts.push(data.folder)
  }
  return parts.join('/');
}
var createMaterialForm = function(data) {
  console.log('CREATE MATERIAL FORM', data);
  // TODO fill comps from data
  var comps = {
    line_1: { en: fields.string({cssClasses:['comp'],label: 'composition 1 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 1 (fr)'}) },
    line_2: { en: fields.string({cssClasses:['comp'],label: 'composition 2 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 2 (fr)'}) },
    line_3: { en: fields.string({cssClasses:['comp'],label: 'composition 3 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 3 (fr)'}) },
    line_4: { en: fields.string({cssClasses:['comp'],label: 'composition 4 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 4 (fr)'}) },
    line_5: { en: fields.string({cssClasses:['comp'],label: 'composition 5 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 5 (fr)'}) },
    line_6: { en: fields.string({cssClasses:['comp'],label: 'composition 6 (en)'}), fr: fields.string({cssClasses:['comp'],label: 'composition 6 (fr)'}) }
  };
  
  var formfields = {
    data: fields.string({ widget: widgets.hidden(), value: JSON.stringify( data ) }),
    material_name: fields.string({ require: true, value: data.name }),
    material_color: fields.string({ require: true, value: data.color }),
    description: {
      en:fields.string({ label:"Description (en)" ,required: true, value: data.description.en , widget: widgets.textarea() }),
      fr:fields.string({ label:"Description (fr)" , value: data.description.fr , widget: widgets.textarea() })
    },
    composition: comps
  };
  var formhtml = forms.create( formfields ).toHTML();
  var formhead = "<header><h1>"+data.material_id+"</h1></header>";
  var galleryhtml = '<img class="small" src="'+datauri(data.small_image)+'"><img class="large" src="'+datauri(data.large_image)+'">'
  var form = '<form>'+formhead+'<div class="images">'+galleryhtml+'</div><div class="fields">'+formhtml+'</div></form>';
  html.push( form );
  // console.log( forms.create(formfields).toHTML() );
}

var createProductForm = function(data) {
  // console.log('CREATE PRODUCT FORM', data);
  var gallery = data.images;
  
  var formfields = {
    data: fields.string({ widget: widgets.hidden(), value: JSON.stringify( data ) }),
    name: fields.string({ required: true, value: data.name }),
    subname: fields.string({ required: true, value: data.subname }),
    price: fields.string({ required: true, value: data.subname }),
    description: {
      en: fields.string({ label:"Description (en)" ,required: true, value: data.description.en , widget: widgets.textarea() }),
      fr: fields.string({ label:"Description (fr)" ,value: data.description.fr, widget: widgets.textarea() })
    },
    materials: fields.string({
      choices: materials.reduce( function( opts, mat ){ opts[mat.material_id] = materialLabel(mat); return opts; }, {} ),
      widget: widgets.multipleCheckbox()
    }),
    shipping_class: fields.string({
      choices: { furniture: 'furniture', accessories: 'accessories'},
      widget: widgets.multipleRadio()
    }),
    
    
  };
  var galleryhtml = gallery.reduce(function( h, image, idx ) {
    return h + '<img class="image-'+idx+'" src="'+datauri(image)+'" width="150" height="90">';
  }, '');
  var formhtml = forms.create( formfields ).toHTML();
  var formhead = "<header><h1>"+productFormTitle(data)+"</h1></header>";
  var form = '<form>'+formhead+'<div class="images">'+galleryhtml+'</div><div class="fields">'+formhtml+'</div></form>';
  html.push( form );
  
}

mat_dirs.forEach(function(dir) {
  var fullpath = path.join(root, dir);
  var isDir = fs.lstatSync(fullpath).isDirectory();
  var material_id;
  
  if (isDir) {
    material_id = path.basename(fullpath)
    var idx = materials.push({material_id:material_id}) - 1;
    var small_image = null;
    var large_image = null;
    
    try {
      small_image = fs.readFileSync(path.join(fullpath, 'small.jpg'));
    } catch (e) {}
    try {
      large_image = fs.readFileSync(path.join(fullpath, 'large.jpg'));
    } catch (e) {}
    
    if (small_image && large_image) {
      materials[idx].small_image = path.join(fullpath, 'small.jpg');
      materials[idx].large_image = path.join(fullpath, 'large.jpg');
      createMaterialForm({
        material_id: material_id,
        small_image: path.join(fullpath, 'small.jpg'),
        large_image: path.join(fullpath, 'large.jpg'),
        path: fullpath,
        description: { en: null, fr: null },
        material_name: null,
        material_color: null,
        composition: [ ]
      });
    }
  }
});

var readTextFile = function(file) {
  var content = null;
  try {
    content = fs.readFileSync(file);
  } catch (e) {}
  return content;
}
categories.forEach(function(category_obj) {
  var category = category_obj.category;
  var subcategory = category_obj.subcategory;
  var cat_base = category_obj.path;
  var product_paths = fs.readdirSync(cat_base);

  product_paths.forEach(function(prod_path) {
    prod_path = path.join(cat_base, prod_path);
    var product = {
      name: readTextFile(path.join(prod_path, 'name.txt')),
      subname: readTextFile(path.join(prod_path, 'subname.txt')),
      description: {
        en: readTextFile(path.join(prod_path, 'description-en.txt')),
        fr: readTextFile(path.join(prod_path, 'description-fr.txt'))
      },
      price: readTextFile(path.join(prod_path, 'price.txt')),
      category: category,
      subcategory: subcategory,
      path: prod_path,
      folder: path.basename(prod_path),
      materials: []
    };
    product.pdf = null;
    product.shematic = null;
    product.images = [];
    var images = fs.readdirSync(path.join(prod_path, 'gallery'));
    var assets = fs.readdirSync(path.join(prod_path, 'assets'));
    if (assets.length > 0) {
      assets.forEach(function(asset) {

        if (/pdf/.test(asset)) {
          product.pdf = path.join(prod_path, 'assets', asset);
        } else if (/.jpg/.test(asset)) {
          product.schematic = path.join(prod_path, 'assets', asset);
        }
      });
    }
    if (images.length > 1) {
      images = images.reduce(function(files, file) {
        var filepath = path.join(prod_path, 'gallery', file)
        var isDir = fs.lstatSync(filepath).isDirectory();
        if (!isDir) {
          files.push(filepath)
        }
        return files;
      }, []);
      images.sort(function(a, b) {
        var name_a = path.basename(a);
        var name_b = path.basename(b);
        var a = parseFloat(name_a.match(/(\d+).jpg$/)[1]);
        var b = parseFloat(name_b.match(/(\d+).jpg$/)[1]);
        return name_a > name_b ? 1 : -1;
      });
      product.images = images;
      createProductForm(product);
    }

  });

});
html.push(html_foot);
fs.writeFileSync('imports.html', html.join("\n"));