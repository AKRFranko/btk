<?php
/**
 * Order Item Details
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.4.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

if ( ! apply_filters( 'woocommerce_order_item_visible', true, $item ) ) {
	return;
}
 
do_action( 'woocommerce_order_item_meta_start', $item_id, $item, $order );
?>
<div class="cart_item">
  <div class="cart-item-image">
    
    <?php
        edb_package_item_image( $item_id, $item );
    ?>
  </div>
  <div class="cart-item-info">
    <div class="cart-item-name">
      <?php
          edb_package_item_name( $item_id, $item );
      ?>
    </div>
    <div class="cart-item-material">
      <?php
          edb_package_item_material( $item_id, $item );
      ?>
    </div>
    <div class="cart-item-category">
      <?php
          edb_package_item_category( $item_id, $item );
          // echo $total;
      ?>
      
    </div>
    <div class="cart-item-availability">
      <?php 
        if($shipping_method != 'edb_self_pickup'){
          edb_order_item_availability($item, $order);  
        }
        
     
      ?>
       
    </div>
  </div>

  

</div>
<?php

do_action( 'woocommerce_order_item_meta_end', $item_id, $item, $order );

if(false): ?>
<!--
<div class="<?php echo esc_attr( apply_filters( 'woocommerce_order_item_class', 'order_item', $item, $order ) ); ?>">
	<div class="product-name">
		<?php
			$is_visible = $product && $product->is_visible();
      // var_dump( $shipments );
			echo apply_filters( 'woocommerce_order_item_name', $is_visible ? sprintf( '<a href="%s">%s</a>', get_permalink( $item['product_id'] ), $item['name'] ) : $item['name'], $item, $is_visible );
			echo apply_filters( 'woocommerce_order_item_quantity_html', ' <strong class="product-quantity">' . sprintf( '&times; %s', $item['qty'] ) . '</strong>', $item );

			do_action( 'woocommerce_order_item_meta_start', $item_id, $item, $order );
      // write_log($item);
		// 	$order->display_item_meta( $item );
		// 	$order->display_item_downloads( $item );

			do_action( 'woocommerce_order_item_meta_end', $item_id, $item, $order );
		?>
	</div>
	<div class="product-total">
		<?php echo $order->get_formatted_line_subtotal( $item ); ?>
	</div>
</div>

<?php if ( $order->has_status( array( 'completed', 'processing' ) ) && ( $purchase_note = get_post_meta( $product->id, '_purchase_note', true ) ) ) : ?>
<div class="product-purchase-note">
	<div colspan="3"><?php echo wpautop( do_shortcode( wp_kses_post( $purchase_note ) ) ); ?></div>
</div>
<?php endif; ?>
-->
<?php endif; ?>