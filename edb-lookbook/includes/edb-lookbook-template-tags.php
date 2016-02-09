<?php

function edb_find_product_by_sku( $sku ){
  global $wpdb;
  $facto = new WC_Product_Factory();
  $product_id = $wpdb->get_var( $wpdb->prepare( "SELECT post_id FROM $wpdb->postmeta WHERE meta_key='_sku' AND meta_value='%s' ORDER BY post_id DESC LIMIT 1", $sku ) );
  
  if ( $product_id ) return $facto->get_product( $product_id );
  return null;
}


function edb_get_products_with_skus( $skus  ){
  if(empty($skus)){
    return null;
  }
  if(!is_array($skus)){
    $skus = explode(',', $skus);
  }
  $products = array();
  foreach($skus as $sku){
    $products[] = edb_find_product_by_sku( $sku );
  }
  return $products;
}
?>