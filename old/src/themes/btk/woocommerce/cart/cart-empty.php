<?php
/**
 * Empty cart page
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

wc_print_notices();

?>

<p class="cart-empty"><?php _e( 'Your cart is currently empty.', 'btk' ) ?></p>

<?php do_action( 'woocommerce_cart_is_empty' ); ?>

<div class="cart-collaterals">
	<span>
		<span class="valign"><?php _e( 'Return To Shop', 'btk' ) ?></span>
		<a class="valign icon-arrow-lite-left-white" href="<?php echo apply_filters( 'woocommerce_return_to_shop_redirect', home_url('/')); ?>"></a>
	</span>
</div>
