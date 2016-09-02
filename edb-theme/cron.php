<?php

// register_activation_hook( __FILE__, 'edb_check_daily_restock_schedule' );
// function edb_check_daily_restock_schedule(){
//   //Use wp_next_scheduled to check if the event is already scheduled
//   $timestamp = wp_next_scheduled( 'edb_check_daily_restock' );

//   //If $timestamp == false schedule daily backups since it hasn't been done previously
//   if( $timestamp == false ){
//     //Schedule the event for right now, then to repeat daily using the hook 'wi_create_daily_backup'
//     wp_schedule_event( time(), 'daily', 'edb_check_daily_restock' );
//   }
// }

// register_deactivation_hook( __FILE__, 'edb_remove_daily_restock_schedule' );
// function edb_remove_daily_restock_schedule(){
//   wp_clear_scheduled_hook( 'edb_check_daily_restock' );
// }

add_action('init','edb_check_restock');
//Hook our function , wi_create_backup(), into the action wi_create_daily_backup
// add_action( 'edb_check_daily_restock', 'edb_check_restock' );
function edb_check_restock(){
  
  $today = date('Y-m-d',time());
  $params = array(
  'posts_per_page' => -1,
  'post_type' => 'product_variation',
  'meta_query' => array(
    'relation'=>'AND',
    array(
      'key' => '_edb_variation_expected_restock',
      'compare'=>'EXISTS'),
      array(
      'key' => '_edb_variation_expected_restock',
      'value' => $today,
      'type'=>'DATE',
      'compare'=>'<=')
  ));
  $wc_query = new WP_Query($params); // (2)
  if ($wc_query->have_posts()){
    while ($wc_query->have_posts()){
      $wc_query->the_post();
      $restock_qty = intval(get_post_meta( get_the_ID(), '_edb_variation_expected_restock_qty', true ));
      $stock_qty = intval(get_post_meta( get_the_ID(), '_stock', true ));
      $stock_left = ($stock_qty + $restock_qty);
      $variation = new WC_Product_Variation( get_the_ID() );
      write_log("udpated:  $restock_qty + $stock_qty = $stock_left");
      delete_post_meta(get_the_ID(),'_edb_variation_expected_restock');
      delete_post_meta(get_the_ID(),'_edb_variation_expected_restock_qty');
      // update_post_meta(get_the_ID(),'_stock',$stock_left);
      $variation->set_stock($stock_left);
    }
    wp_reset_postdata();
  }

}

// if ( ! wp_next_scheduled( 'edb_mirror_stock' ) ) {
//   wp_schedule_event( time(), 'hourly', 'edb_mirror_stock' );
// }

// add_action( 'edb_mirror_stock', 'edb_mirror_stock' );

// function edb_mirror_stock( $order  ) {
//   write_log( '                                 MIRROR STOCK ');
//   // $order = wc_get_order($order_id);
//   $order_items = $order->get_items();
//   foreach($order_items as $order_item){
//     $product_id = $order_item['item_meta']['_product_id'][0];
//     $variation_id= $order_item['item_meta']['_variation_id'][0];
//     $product = get_product( $product_id );
//     $variation = new WC_Product_variation($variation_id);

//     $target_material = get_post_meta($variation_id,'attribute_edb_material', true);
//     $mirror_product_id = $product->get_attribute('edb_mirror');
//     if(!empty($mirror_product_id)){
//       $mirror_product = get_product($mirror_product_id);
//       foreach($mirror_product->get_available_variations() as $mirror_variation){
//         if($mirror_variation['attributes']['attribute_edb_material'] == $target_material){
//           $mirror_variation_object = new WC_Product_variation($mirror_variation['variation_id']);
//           write_log('item stock qty: '.$order_item['qty']);
//           write_log('main stock qty: '.$variation->get_stock_quantity());
//           write_log('mirr stock qty: '.$mirror_variation_object->get_stock_quantity());
//           $mirror_variation_object->set_stock($variation->get_stock_quantity(), 'set');
//         }
//       }  
//     }
    

//   }

// }



// function edb_mirror_stock( $order  ) {
//   write_log( '                                 MIRROR STOCK ');
//   // $order = wc_get_order($order_id);
//   $order_items = $order->get_items();
//   foreach($order_items as $order_item){
//     $product_id = $order_item['item_meta']['_product_id'][0];
//     $variation_id= $order_item['item_meta']['_variation_id'][0];
//     $product = get_product( $product_id );
//     $variation = new WC_Product_variation($variation_id);

//     $target_material = get_post_meta($variation_id,'attribute_edb_material', true);
//     $stock_holder_product_id = $product->get_attribute('edb_stock_holder');
//     if(!empty($stock_holder_product_id)){
//       $stock_holder_product = get_product($stock_holder_product_id);
//       foreach($stock_holder_product->get_available_variations() as $stock_holder_variation){
//         if($stock_holder_variation['attributes']['attribute_edb_material'] == $target_material){
          
//           $stock_holder_variation_object = new WC_Product_variation($mirror_variation['variation_id']);
//           $stock_holder_variation_object->reduce_stock($order_item['qty']);
//         }
//       }  
//     }
//   }
// }


// function test_edb_mirror_stock(){
//   edb_mirror_stock(37143);
// }
// add_filter( 'woocommerce_reduce_order_stock','edb_mirror_stock' );
//add_action( 'init','test_edb_mirror_stock' );
?>