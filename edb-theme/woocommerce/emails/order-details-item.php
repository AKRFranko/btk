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
<tr class="<?php echo esc_attr( apply_filters( 'woocommerce_order_item_class', 'order_item', $item, $order ) ); ?>">
  <td class="td">
    
    <?php edb_package_item_name( $item_id, $item ); ?><br />
    <?php edb_package_item_material( $item_id, $item ); ?><br />
    <?php edb_package_item_category( $item_id, $item );?>
   
  </td>
  <td class="td">
    <?php echo $item['qty']; ?>
  </td>  
  <td class="td">
    <?php 
        $total= $item['line_total'];
        $subtotal = $item['line_subtotal'];
        if($subtotal > $total ){
          echo "<s>".wc_price($subtotal)."</s>";
        }
    ?>
    
    <?php echo wc_price($item['line_total']); ?>
  </td>
  <td class="td">
  <?php 
      edb_order_item_availability( $item, $order );
  ?>
  </td>
  

    
  

</tr>
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