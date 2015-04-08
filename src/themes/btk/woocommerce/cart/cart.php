<?php
/**
 * Cart Page
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

wc_print_notices();

do_action( 'woocommerce_before_cart' ); ?>

<form action="<?php echo esc_url( WC()->cart->get_cart_url() ); ?>" method="post">

<?php do_action( 'woocommerce_before_cart_table' ); ?>

<?php do_action( 'woocommerce_before_cart_contents' ); ?>

	<div class="cart-contents lower">

		<?php wc_get_template( 'cart/cart-contents.php' ); ?>

		<input type="submit" class="button" name="update_cart" value="<?php _e( 'Update Cart', 'woocommerce' ); ?>" />

		<?php do_action( 'woocommerce_cart_actions' ); ?>

		<?php wp_nonce_field( 'woocommerce-cart' ); ?>

		<?php do_action( 'woocommerce_after_cart_contents' ); ?>
	</div>






<?php do_action( 'woocommerce_after_cart_table' ); ?>

</form>

<div class="cart-collaterals lower">

	<p class="alignleft">Cart subtotal<span>(excluding tax + shipping)</span></p>

	<?php echo WC()->cart->get_cart_subtotal(); ?>

	<?php do_action( 'woocommerce_cart_collaterals' ); ?>

	<span class="alignright">
		<span class="valign">check out</span>
		<a href="<?php echo esc_url(home_url('/'));?>checkout/" class="valign icon-arrow-lite-right-white"></a>
	</span>
	<span class="alignright">
		<span class="valign">continue shopping</span>
		<a href="<?php echo esc_url(home_url('/'));?>products/" class="valign icon-arrow-lite-left-white"></a>
	</span>

	<?php //woocommerce_cart_totals(); ?>

</div>

<?php do_action( 'woocommerce_after_cart' ); ?>
