<?php
/**
 * Cart Page
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.3.8
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
global $WC_Edb;
wc_print_notices();

do_action( 'woocommerce_before_cart' ); ?>

<form id="cartForm" action="<?php echo esc_url( WC()->cart->get_cart_url() ); ?>" method="post">

<?php do_action( 'woocommerce_before_cart_table' ); ?>


		<?php do_action( 'woocommerce_before_cart_contents' ); ?>

		<?php
		foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
			$_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
			
			
		
			$product_id   = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );
      
			if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
			  
				?>
				<div id="cart-item-<?php echo $cart_item_key;?>" class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">

          <div class="cart-item-image">
            <?php edb_cart_item_image( $cart_item_key, $cart_item ); ?>
          </div>
          <div class="cart-item-info">
            <div class="cart-item-name">
            <?php edb_cart_item_name( $cart_item_key, $cart_item ); ?>
            </div>
            <div class="cart-item-material">
            <?php edb_cart_item_material( $cart_item_key, $cart_item ); ?>
            </div>
            <div class="cart-item-category">
            <?php edb_cart_item_category( $cart_item_key, $cart_item ); ?>
            </div>
            
            <div class="cart-item-availability">
            <?php edb_cart_item_availability( $cart_item_key, $cart_item ); ?>
            </div>
            <?php
              // Backorder notification
              //if ( $_product->backorders_require_notification() && $_product->is_on_backorder( $cart_item['quantity'] ) ) {
              //  echo '<p class="backorder_notification">' . esc_html__( 'Available on backorder', 'woocommerce' ) . '</p>';
              //}
            ?>
          </div>
          <div class="cart-item-options">
            <div class="cart-item-quantity-input">
              <?php 
              if ( $_product->is_sold_individually() ) {
                $product_quantity = sprintf( '1 <input type="hidden" name="cart[%s][qty]" value="1" />', $cart_item_key );
              } else {
                $product_quantity = woocommerce_quantity_input( array(
                  'input_name'  => "cart[{$cart_item_key}][qty]",
                  'input_value' => $cart_item['quantity'],
                  'max_value'   => $_product->backorders_allowed() ? '' : $_product->get_stock_quantity(),
                  'min_value'   => '0'
                ), $_product, false );
              }
              ?>
              <span class="qty-widget">
                <a href="#" class="qty-minus">-</a><span class="qty-val"><?php echo $cart_item['quantity']; ?></span><a href="#" class="qty-plus">+</a>
           <?php
             echo '<div style="display:none">' . apply_filters( 'woocommerce_cart_item_quantity', $product_quantity, $cart_item_key, $cart_item ) . '</div>';
           ?>
              </span>
            
           
            </div>
            <div class="cart-item-line-total">
              <?php
                echo apply_filters( 'woocommerce_cart_item_subtotal', WC()->cart->get_product_subtotal( $_product, $cart_item['quantity'] ), $cart_item, $cart_item_key );
              ?>
            </div>
          </div>
          <div class="cart-item-actions">
            <div class="cart-item-remove">
              <?php
                echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf(
                  '<a href="%s" class="remove" title="%s" data-product_id="%s" data-product_sku="%s">'.__('remove', 'edb').' &times;</a>',
                  esc_url( WC()->cart->get_remove_url( $cart_item_key ) ),
                  __( 'remove this item', 'edb' ),
                  esc_attr( $product_id ),
                  esc_attr( $_product->get_sku() )
                ), $cart_item_key );
              ?>
            </div>
          </div>
					
					
				</div>
				<?php
			}
		}

		do_action( 'woocommerce_cart_contents' );
		?>
		
		<div class="hidden-cart-actions" style="display:none">
			<!--<td colspan="6" class="actions">-->

				<?php if ( WC()->cart->coupons_enabled() ) { ?>
					<div class="coupon">

						<label for="coupon_code"><?php _e( 'coupon', 'edb' ); ?>:</label> <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="<?php esc_attr_e( 'Coupon code', 'woocommerce' ); ?>" /> <input type="submit" class="button" name="apply_coupon" value="<?php esc_attr_e( 'apply coupon', 'edb' ); ?>" />

						<?php do_action( 'woocommerce_cart_coupon' ); ?>
					</div>
				<?php } ?>

				<input type="submit" class="button" name="update_cart" value="<?php esc_attr_e( 'update cart', 'edb' ); ?>" />

				<?php do_action( 'woocommerce_cart_actions' ); ?>

				<?php wp_nonce_field( 'woocommerce-cart' ); ?>
			<!--</td>-->
		</div>

		<?php do_action( 'woocommerce_after_cart_contents' ); ?>


<?php do_action( 'woocommerce_after_cart_table' ); ?>

</form>

<div class="cart-collaterals">

	<?php do_action( 'woocommerce_cart_collaterals' ); ?>

</div>

<?php do_action( 'woocommerce_after_cart' ); ?>
