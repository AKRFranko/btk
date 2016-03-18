<?php
/**
 * Order details
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.4.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
// write_log(array_keys($GLOBALS));
$order = wc_get_order( $order_id );
?>

<div class="boxes">
  
  <div class="box half">
    
    <!--<h1><?php _e('order details', 'edb'); ?></h1>-->
    
    <div class="cart-items">
      
		<?php
		$edb_shipping_methods = array(
      'edb_self_pickup' => __("I will pick up.",'edb'),
      'edb_ship_ready' => __("ship when ready",'edb'),
      'edb_ship_bundle_1' => __("ship bundle 1",'edb'),
      'edb_ship_bundle_2' => __("ship bundle 2",'edb'),
      'edb_ship_bundle_3' => __("ship bundle 3",'edb')
    );
    
		  $split = array();
      foreach( $order->get_items() as $item_id => $item ) {
        foreach( $item['edb_shipments'] as $method => $qty ){
          if(empty($split[$method])){
            $split[$method]= array();
          }
          $split[$method][]=array( 'item_id' => $item_id, 'item' => $item, 'quantity' => $qty );
        }
      }
      foreach( $split as $method => $items ){
        
        echo "<h2>".$edb_shipping_methods[$method]."</h2>";
        foreach( $items as $copy ){
          //echo "<pre>".json_encode($copy['item'])."</pre>";
          $item_product = $order->get_product_from_item( $copy['item'] );
          // $item_line_total = $copy['item']['line_total'];
          // $item_line_qty    = $copy['item']['item_meta']['_qty'][0];
          
          // $per_item_cost = $item_line_total / $item_line_qty;
          
          // $copy['item']['edb_shipping'] = $method;
          // $copy['item']['qty'] = $copy['quantity'];
          // $copy['item']['line_total'] = $per_item_cost * $copy['quantity'];
          // $copy['item']['line_subtotal'] = $per_item_cost * $copy['quantity'];
          // $copy['item']['item_meta']['_qty'] = $copy['quantity'];
          // $copy['item']['item_meta']['_line_total'] = $per_item_cost * $copy['quantity'];
          // $copy['item']['item_meta']['_line_subtotal'] = $per_item_cost * $copy['quantity'];
          
          wc_get_template( 'order/order-details-item.php', array(
            'order'   => $order,
            'item_id' => $copy['item_id'],
            'item'    => $copy['item'],
            'shipping_method'=> $method,
            'product' => apply_filters( 'woocommerce_order_item_product', $item_product, $item )
          ) );      
        }
      }
    
		?>
		<?php do_action( 'woocommerce_order_items_table', $order ); ?>
		
		</div>
      </div>
      <div class="box half">
        <h1><?php _e('totals','edb'); ?></h1>
        <div class="cart-costs">
        <?php
          foreach ( $order->get_order_item_totals() as $key => $total ) {
            ?>
            <div class="cost-line">
              <?php if( $key =='shipping'){ ?>
              <span class="label"><?php echo $total['label']; ?></span>
                <span class="value"><?php edb_cart_shipping_total();?></span> 
              <?php }else{ ?>
                <span class="label"><?php echo $total['label']; ?></span>
                <span class="value"><?php echo $total['value']; ?></span>
              <?php }; ?>
              <?php 
                #write_log( $key ); 
              ?>
              
            </div>
            
            <?php
          }
        ?>
        </div>
        <?php do_action( 'woocommerce_order_details_after_order_table', $order ); ?>
        <?php wc_get_template( 'order/order-details-customer.php', array( 'order' =>  $order ) ); ?>
      </div>
    </div>
	



