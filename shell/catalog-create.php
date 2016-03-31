#!/bin/env php
<?php

/**
* Singularize a string.
* Converts a word to english singular form.
*
* Usage example:
* {singularize "people"} # person
*/
function singularize ($params)
{
    if (is_string($params))
    {
        $word = $params;
    } else if (!$word = $params['word']) {
        return false;
    }

    $singular = array (
        '/(quiz)zes$/i' => '\\1',
        '/(matr)ices$/i' => '\\1ix',
        '/(vert|ind)ices$/i' => '\\1ex',
        '/^(ox)en/i' => '\\1',
        '/(alias|status)es$/i' => '\\1',
        '/([octop|vir])i$/i' => '\\1us',
        '/(cris|ax|test)es$/i' => '\\1is',
        '/(shoe)s$/i' => '\\1',
        '/(o)es$/i' => '\\1',
        '/(bus)es$/i' => '\\1',
        '/([m|l])ice$/i' => '\\1ouse',
        '/(x|ch|ss|sh)es$/i' => '\\1',
        '/(m)ovies$/i' => '\\1ovie',
        '/(s)eries$/i' => '\\1eries',
        '/([^aeiouy]|qu)ies$/i' => '\\1y',
        '/([lr])ves$/i' => '\\1f',
        '/(tive)s$/i' => '\\1',
        '/(hive)s$/i' => '\\1',
        '/([^f])ves$/i' => '\\1fe',
        '/(^analy)ses$/i' => '\\1sis',
        '/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$/i' => '\\1\\2sis',
        '/([ti])a$/i' => '\\1um',
        '/(n)ews$/i' => '\\1ews',
        '/s$/i' => ''
    );

    $irregular = array(
        'person' => 'people',
        'man' => 'men',
        'child' => 'children',
        'sex' => 'sexes',
        'move' => 'moves'
    );  

    $ignore = array(
        'equipment',
        'information',
        'rice',
        'money',
        'species',
        'series',
        'fish',
        'sheep',
        'press',
        'sms',
    );

    $lower_word = strtolower($word);
    foreach ($ignore as $ignore_word)
    {
        if (substr($lower_word, (-1 * strlen($ignore_word))) == $ignore_word)
        {
            return $word;
        }
    }

    foreach ($irregular as $singular_word => $plural_word)
    {
        if (preg_match('/('.$plural_word.')$/i', $word, $arr))
        {
            return preg_replace('/('.$plural_word.')$/i', substr($arr[0],0,1).substr($singular_word,1), $word);
        }
    }

    foreach ($singular as $rule => $replacement)
    {
        if (preg_match($rule, $word))
        {
            return preg_replace($rule, $replacement, $word);
        }
    }

    return $word;
}


echo "Would you like to delete all products beforehand? (y/N) - ";
$stdin = fopen('php://stdin', 'r');
$response = fgetc($stdin);
$delete_all=($response === 'n' ? false : true);



$shipping_classes = array(
  'sofas' => 'furniture',
  'sofa-beds'=> 'furniture',
  'sectionals'=> 'furniture',
  'coffee-tables'=> 'furniture',
  'side-tables'=> 'furniture',
  'armchairs'=> 'furniture',
  'modular'=> 'furniture',
  'benches-ottomans'=> 'furniture',
  'headboards'=> 'furniture',
  'storage'=> 'accessories',
  'accessories'=> 'accessories'
);


$skumap = array(
  'sofas' => 'SOF',
  'sofa-beds'=> 'SOB',
  'sectionals'=> 'SEC',
  'coffee-tables'=> 'TAB',
  'side-tables'=> 'TAB',
  'armchairs'=> 'ARM',
  'benches-ottomans'=> 'BNO',
  'headboards'=> 'HED',
  'storage'=> 'STO',
  'accessories'=> 'ACC',
  '2-seater'=>'2ST',
  '3-seater'=>'3ST',
  'left-facing'=>'LFT',
  'right-facing'=>'RGT',
  'modular'=>'MOD',
  'pillows'=>'PIL',
  'rugs'=>'RUG',
  'other'=>'OTH',
);


$script = array('#!/bin/bash');
$descriptions = json_decode( file_get_contents( './data/products/descriptions.json'), true );
// var_dump($descriptions);
if($delete_all){
  $script[]='echo "removing products and their variatons"';
  $script[]='wp post delete $(wp post list --post_type=product,product_variation --format=ids) --force --quiet';
}
$skips = json_decode(@file_get_contents('./data/skip.json'));

if(empty($skips)){
  $skips = array();   
}

$skumap = array(
  'sofas' => 'SOF',
  'sofa-beds'=> 'SOB',
  'sectionals'=> 'SEC',
  'coffee-tables'=> 'TAB',
  'side-tables'=> 'TAB',
  'armchairs'=> 'ARM',
  'benches-ottomans'=> 'BNO',
  'headboards'=> 'HED',
  'storage'=> 'STO',
  'accessories'=> 'ACC',
  '2-seater'=>'2ST',
  '3-seater'=>'3ST',
  'left-facing'=>'LFT',
  'right-facing'=>'RGT',
  'modular'=>'MOD',
  'pillows'=>'PIL',
  'rugs'=>'RUG',
  'other'=>'OTH',
);
function get_sku( $category, $name, $material ){
  global $skumap;
  $index = bin2hex( mhash( MHASH_ADLER32, $name ) );
  $parts = array();
  if(!empty($category)){
    $parts[]=$skumap[$category];
  }
  if(!empty($material)){
    $parts[]=$material;
  }else{
    $parts[]='XXX';
  }
  $parts[]=$index;
  return implode('', $parts);
}

function get_varname( $product ){
  return '_'.str_replace('-','_', $product->sku);
}
function get_slugname( $product ){
  return strtolower(str_replace('-','_',$product->name)."_".str_replace('-','_', $product->sku));
}

function sortproducts( $a, $b ){
  $ma = array();
  $mb = array();
  preg_match( "/(\d+)-.*/i", $a, $ma );
  preg_match( "/(\d+)-.*/i", $b, $mb );
  $na = abs($ma[1]);
  $nb = abs($mb[1]);
  if($na == $nb){
     return 0;
  }
  return ($na < $nb ) ? 1 : -1; 
}
function sortimages($a, $b){
  $ma = array();
  $mb = array();
  preg_match( "/(\d+)\.jpg/i", $a, $ma );
  preg_match( "/(\d+)\.jpg/i", $b, $mb );
  $na = abs($ma[1]);
  $nb = abs($mb[1]);
  if($na == $nb){
     return 0;
  }
  return ($na < $nb ) ? -1 : 1; 
}


function get_array_copy( $array ){
  return json_decode( json_encode($array) );
}

function get_file_list( $dir ){
  $files=array();
  if( $dh = opendir($dir)){
    while (($file = readdir($dh)) !== false){
      if ($file == '.' or $file == '..') continue;
      $files[]="$dir/$file";
    }
  }
  return $files;
}


function read_products( $dir ){
  global $skips;
  $files=array();
  $products=array();
  if( $dh = opendir($dir)){
    while (($file = readdir($dh)) !== false){
      if ($file == '.' or $file == '..') continue;
      if(is_dir("$dir/$file")){
        $files[]="$dir/$file";  
      }
    }
  }
  usort($files, 'sortproducts');
  foreach( $files as $file ){
    $matches = array();
    preg_match( "/(\d+)-.*/i", $file, $matches );
    $order = abs( $matches[1]);
    $json = json_decode(file_get_contents( "$file/data.json" ));
    $names = explode('_',$json->name);
    if(count($names) > 1){
      $json->name = $names[0];
      $json->subname = $names[1];
    }
    $images = get_file_list( "$file/gallery");
    
    usort( $images, 'sortimages');
    $feature = array_shift( $images );
    
    $json->order = $order;
    $json->images  = $images;
    $json->feature = $feature;
    if(!in_array( basename($file), $skips)){
      echo "Add:  $file\n";
      $products[]=$json;    
    }else{
      echo "Skip: $file\n";
    }
  }
  return $products;
}

function create_product_post( $product ){
  global $script;
  global $descriptions;
  
  $varname = get_varname($product);
  $name = $product->name;
  $description = "{:en}Lorem ipsum...{:}{:fr}Lorem ipsum...{:}";
  if( array_key_exists( $name, $descriptions) ){
    $en = $descriptions[$name]['en'];
    if(array_key_exists('fr',$descriptions[$name])){
      $fr = $descriptions[$name]['fr'];  
    }else{
      $fr = $en;
    }
    $description = "{:en}$en{:}{:fr}$fr{:}";
  }
  $line = $varname.'=`wp post create --post_title="'.$product->name.'" --menu_order='.$product->order.' --post_name="'.$product->slug.'" --post_content='.escapeshellarg($description).' --post_type=product --post_status=publish';
  $script[]='echo "Creating Product: '.$product->name.'"';
  $script[]=$line.' --porcelain`';
}
function create_product_meta( $product ){
  global $script;
  $varname = get_varname($product);
  $script[]='echo "Setting meta for: '.$product->name.'"';
  if(!empty($product->subname)){
    $script[] = 'wp post meta update $'.$varname.' _subtitle "{:en}'.$product->subname.'{:}{:fr}'.$product->subname.'{:}"';
  }
  $cats = (empty($product->subcategory) ? $product->category : $product->category.'-'.$product->subcategory);
  
  $script[] = 'wp post meta update $'.$varname.' _visibility visible';
  $script[] = 'wp post meta update $'.$varname.' _product_attributes '.escapeshellarg( json_encode( array( 'edb_material' => array( 'name' => 'edb_material', 'value' => implode('|', $product->materials ), 'is_visible' => 1, 'is_variation' => 1, 'taxonomy'=>1 ) ) ) ).' --format=json';
  $script[] = 'wp post meta update $'.$varname.' _price '.($product->shipping_class == 'furniture' ? '350.00' : '15.00');
  $script[] = 'wp post meta update $'.$varname.' _regular_price '.($product->shipping_class == 'furniture' ? '350.00' : '15.00');
  $script[] = 'wp post term set $'.$varname.' product_shipping_class '.$product->shipping_class.'';
  $script[] = 'wp post term set $'.$varname.' product_cat '.$cats;
  $script[] = 'wp post term set $'.$varname.' product_type variable';
  if(!empty($product->alt_category)){
    $script[] = 'wp post term add $'.$varname.' product_cat '.$product->alt_category;
    
  }
  if(!empty($product->subname)){
    $enfr = "{:en}".$product->subname."{:}{:fr}".$product->subname."{:}";
    $script[] = 'wp post meta update $'.$varname.' _subtitle "'.$enfr.'"';
  }
  
  $script[] = 'wp media import '.$product->feature.' --post_id=$'.$varname.' --featured_image=true';
  
  $mvars=array();
  // var_dump( $product->images );
  foreach( $product->images as $index => $image ){
    $mvar = $varname.'_'.$index;
    $script[] = $mvar.'=`wp media import '.$image.' --post_id=$'.$varname.' --porcelain`';
    $mvars[]='$'.$mvar;
    
  }
  $script[] = 'wp post meta update $'.$varname.' _product_image_gallery '.implode(',',$mvars);
}

function create_variation_post( $product ){
  global $script;
  $varname = get_varname($product);
  $name = $product->name;
  $line = $varname.'=`wp post create --post_title="'.$product->name.'" --post_parent=$'.$product->parent.' --post_content="lorem ipsum dolore..." --post_type=product_variation --post_status=publish --post_name='.$product->slug;
  $script[]='echo "Creating Variation: '.$product->name.'"';
  $script[]=$line.' --porcelain`';
}
function create_variation_meta( $product ){
  global $script;
  $varname = get_varname($product);
  $script[]='echo "Setting meta for product: '.$product->name.' Variation: '.$product->material.'"';
  $script[] = 'wp post meta update $'.$varname.' _visibility visible';
  $script[] = 'wp post meta update $'.$varname.' attribute_edb_material '.$product->material;
  $script[] = 'wp post meta update $'.$varname.' _stock 2';
  $script[] = 'wp post meta update $'.$varname.' _stock_status instock';
  $script[] = 'wp post meta update $'.$varname.' _manage_stock yes';
  $script[] = 'wp post meta update $'.$varname.' _backorders yes';
  $script[] = 'wp post meta update $'.$varname.' _price '.($product->shipping_class == 'furniture' ? '350.00' : '15.00');
  $script[] = 'wp post meta update $'.$varname.' _regular_price '.($product->shipping_class == 'furniture' ? '350.00' : '15.00');
  $script[] = 'wp post meta update $'.$varname.' _sku '.$product->sku;
  $script[] = 'wp media import '. $product->feature .' --post_id=$'.$varname.' --featured_image=true';
}

function generate_script( $products ){
  global $shipping_classes;
  foreach( $products as $product ){
    if($product->category == 'coffee-tables'){
      $product->category = 'side-tables';
    }
    $sku = get_sku( !empty($product->subcategory) ? $product->subcategory : $product->category,  $product->name, null );
    $product->sku = $sku;
    $slug = get_slugname( $product );
    $product->slug = $slug;
    $product->shipping_class = $shipping_classes[$product->category];
    create_product_post( $product );
    create_product_meta( $product );
    foreach($product->materials as $material_id ){
      $variation = get_array_copy( $product );
      $variation->name = $variation->name."-$material_id";
      $variation->material = $material_id;
      $variation->slug = $product->slug."$material_id";
      $variation->sku = get_sku( !empty($variation->subcategory) ? $variation->subcategory : $variation->category,  $variation->name, $material_id );
      $variation->parent = get_varname( $product );
      $variations[$material_id] = $variation;
      create_variation_post( $variation );
      create_variation_meta( $variation );
    }
  }
}

generate_script( read_products('./data/products') );


$shell_script = implode("\n",$script) ;
// echo $shell_script;
file_put_contents('./shell/catalog-create.sh', $shell_script );

?>