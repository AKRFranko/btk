<?php

global $user_login;
wp_get_current_user();
if(!current_user_can('publish_posts')){
  auth_redirect();
  exit(); 
}


global $woocommerce;

$args = array(
  'post_type'      => 'shop_order',
  'post_status'     => 'publish',
  'posts_per_page' => -1,
  'tax_query' => array(
                  array(
                      'taxonomy' => 'shop_order_status',
                      'field' => 'slug',
                      'terms' => array('processing')
                  )
              )
);

$loop = new WP_Query( $args );
$json = array();
while ( $loop->have_posts() ){
  $loop->the_post();

  $order_id = $loop->post->ID;
  
  $order = new WC_Order($order_id);
  $order_items = array();
  foreach( $order->get_items() as $k => $item){
    $order_items[] = $item;
  }
  $order->items = $order_items;
  
  $json[] = $order;
}
?>
<div id="delivery-manager" data-order="<?php echo esc_attr(json_encode($json)); ?>">
  <h1>Delivery Manager</h1>
</div>