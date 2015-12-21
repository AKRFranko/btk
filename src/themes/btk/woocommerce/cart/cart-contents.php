<?php
/**
 * The template for displaying product content in the single-product.php template
 *
 * Override this template by copying it to yourtheme/woocommerce/content-single-product.php
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>
<div class="btk-cart-items">
<?php

foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
  
  echo btk_cart_item_html( $cart_item_key, $cart_item, 'cart' );
}
?>
</div>

<input type="hidden" class="update-cart-button" name="update_cart" value="<?php esc_attr_e( 'Update Cart', 'woocommerce' ); ?>" />
