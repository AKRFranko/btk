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


$categories = array(
 'sofas',
 'sofa-beds',
 'sectionals',
 'coffee-tables',
 'armchairs',
 'benches-ottomans',
 'headboards',
 'storage',
 'accessories',
);

$sub_categories = array(
  'sofas'=> array( '2-seater', '3-seater'),
  'sectionals' => array('left-facing','right-facing'),
  'accessories' => array('pillows','rugs', 'other'),
);

$shipping_classes = array(
  'sofas' => 'furniture',
  'sofa-beds'=> 'furniture',
  'sectionals'=> 'furniture',
  'coffee-tables'=> 'furniture',
  'armchairs'=> 'furniture',
  'benches-ottomans'=> 'furniture',
  'headboards'=> 'furniture',
  'storage'=> 'accessories',
  'accessories'=> 'accessories',
);

$category_materials = array(
  'sofas' => array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'sofa-beds'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'sectionals'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'coffee-tables'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'armchairs'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'benches-ottomans'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'headboards'=> array('001','002','003','004','005','006'),
  'storage'=> array('001','002'),
  'accessories'=> array('001','002','003','004','005','006'),
);


$cat_loops = array();

foreach( $categories as $category ){
  $slug = $category;
  $has_sub = array_key_exists( $category, $sub_categories );
  if(!$has_sub){
    $cat_loops[] = array(
      'subcategory' => false,
      'category' => $category,
      'parent'=>false,
      'shipping_class' => $shipping_classes[$category],
      'materials'=>$category_materials[$category]
    );
  }else{
    $subs = $sub_categories[$category];
    foreach($subs as $sub){
      $cat_loops[] = array(
        'subcategory' => true,
        'category'=> $sub,
        'parent'=>$category,
        'shipping_class' => $shipping_classes[$category],
        'materials'=>$category_materials[$category]
      );
    }
  }
}
function get_sku( $category, $material, $index, $parent=false ){
  if($parent != false){
    return strtoupper($parent[0].$parent[1].$category[0].'-'.$material.'-'.$index);
  }else{
    return strtoupper($category[0].$category[1].$category[2].'-'.$material.'-'.$index); 
  }
  
}
function create_post( $varname, $name, $slug, $parent, $type ){
  
  $line = $varname.'=`wp post create ./post-content.txt --post_title="'.$name.'" --post_type='.$type.' --post_status=publish --post_name='.$slug;
  if(!is_null($parent)){
    $line .= ' --post_parent="$'.$parent.'" ';    
  }
  return $line.' --porcelain`';
}
$product_ids = array();
$script = array();
$varimages = array(
  '001' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_001.jpg",
  '002' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_002.jpg",
  '003' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_003.jpg",
  '004' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_004.jpg",
  '005' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_005.jpg",
  '006' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_006.jpg",
  '007' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_007.jpg",
  '008' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_008.jpg",
  '009' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_009.jpg",
  '010' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_010.jpg",
  '011' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_011.jpg",
  '012' => "/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/materials/parc_mat_012.jpg",
);
$prodimages = array(
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_2.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_3.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_1.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_2.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_3.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_4.jpg',
  
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_5.jpg',
  '/home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/ambiance/photo_6.jpg'
);

foreach( $cat_loops as $index => $loop ){
  $category = $loop['category'];
  $product_varname = '_'.str_replace('-', '_', $category).'_product_'.$index;
  $product_name = singularize($category);
  $product_slug = str_replace('-','_',$product_name);
  $script[] = create_post( $product_varname, $product_name, $product_slug, null, 'product' );
  $script[] = 'wp post meta update $'.$product_varname.' _visibility visible';
  $script[] = 'wp post meta update $'.$product_varname.' _product_attributes '.escapeshellarg( json_encode( array( 'edb_material' => array( 'name' => 'edb_material', 'value' => implode('|', $loop['materials'] ), 'is_visible' => 1, 'is_variation' => 1, 'taxonomy'=>1 ) ) ) ).' --format=json';
  $script[] = 'wp post term set $'.$product_varname.' product_shipping_class '.$loop['shipping_class'].'';
  $script[] = 'wp post term set $'.$product_varname.' product_cat '.$category;
  $script[] = 'wp post term set $'.$product_varname.' product_type variable';
  $script[] = 'wp media import /home/franko/Code/edb.com/btk/src/data/gdrive-catalog/sofas/2-seater/court/images/cutout/photo_1.jpg --post_id=$'.$product_varname.' --featured_image=true';
  foreach($prodimages as $image){
    $script[] = 'wp media import '.$image.' --post_id=$'.$product_varname.' ';
  }
  foreach( $loop['materials'] as $material ){
    $variation_varname = $product_varname.'_'.$material;
    $variation_name = $category. ' ' . $material;   
    $variation_slug = $product_slug.'_'.$material;
    $sku = get_sku($category,$material, $index, $loop['parent'] );
    $script[] = create_post($variation_varname,$variation_name,$variation_slug, $product_varname, 'product_variation' );
    $script[] = 'wp post meta update $'.$variation_varname.' _visibility visible';
    $script[] = 'wp post meta update $'.$variation_varname.' attribute_edb_material '.$material;
    $script[] = 'wp post meta update $'.$variation_varname.' _stock 2';
    $script[] = 'wp post meta update $'.$variation_varname.' _stock_status instock';
    $script[] = 'wp post meta update $'.$variation_varname.' _manage_stock yes';
    $script[] = 'wp post meta update $'.$variation_varname.' _backorders yes';
    $script[] = 'wp post meta update $'.$variation_varname.' _price '.($loop['shipping_class'] == 'furniture' ? '350.00' : '15.00');
    $script[] = 'wp post meta update $'.$variation_varname.' _regular_price '.($loop['shipping_class'] == 'furniture' ? '350.00' : '15.00');
    $script[] = 'wp post meta update $'.$variation_varname.' _sku '.$sku;
    $script[] = 'wp media import '.$varimages[$material] .' --post_id=$'.$variation_varname.' --featured_image=true';
  }
}


file_put_contents('catalog-create.sh', implode("\n",$script) );




?>