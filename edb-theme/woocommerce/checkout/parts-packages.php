<?php
if ( ! defined( 'ABSPATH' ) ) {
 
  exit;
}
?>
<?php

global $Edb_Shipping_Method;

 $edb_shipping_methods = array(
  'edb_self_pickup' => __("i will pick up", 'edb'),
  'edb_ship_ready' => __("ship when ready",'edb'),
  'edb_ship_bundle_1' => __("ship bundle 1",'edb'),
  'edb_ship_bundle_2' => __("ship bundle 2",'edb'),
  'edb_ship_bundle_3' => __("ship bundle 3",'edb')
); 
$shipments = array();
foreach($Edb_Shipping_Method->packages as $key => $item)
{
   $shipments[$item['edb_shipping']][$key] = $item;
}

foreach( $shipments as $shipping_method => $packages ){
  $name = $edb_shipping_methods[$shipping_method];
  ?>
  <div class="shipment-items">
    <h3><?php echo $name; ?></h3>
  <?php
  foreach( $packages as $index => $package){
  ?>
 <div class="cart_item">
   <div class="cart-item-image">
     
     <?php
         edb_package_item_image( $index, $package['contents'][0] );
     ?>
   </div>
   <div class="cart-item-info">
     <div class="cart-item-name">
       <?php
           edb_package_item_name( $index, $package['contents'][0] );
       ?>
     </div>
     <div class="cart-item-material">
       <?php
           edb_package_item_material( $index, $package['contents'][0] );
       ?>
     </div>
     <div class="cart-item-category">
       <?php
           edb_package_item_category( $index, $package['contents'][0] );
           // echo $total;
       ?>
       
     </div>
     <div class="cart-item-availability">
       <?php 
        
         edb_shipping_item_availability($package['contents'][0]);
      
       ?>
        
     </div>
   </div>
   <div class="cart-item-options">
     
   
   </div>
   
   <div class="cart-item-actions">
     <div class="cart-item-remove">
       
     </div>
     <div class="cart-item-edit">
       <a href="<?php echo WC()->cart->get_cart_url(); ?>"><?php _e('edit', 'edb'); ?></a>
     </div>
   </div>
   
 
 </div>
 <?php
}
?></div><?php
}

?>