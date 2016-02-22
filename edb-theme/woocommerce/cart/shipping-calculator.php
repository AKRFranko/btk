<?php
/**
 * Shipping Calculator
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.0.8
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

if ( get_option( 'woocommerce_enable_shipping_calc' ) === 'no' || ! WC()->cart->needs_shipping() ) {
	return;
}

?>

<?php do_action( 'woocommerce_before_shipping_calculator' ); ?>

<form class="woocommerce-shipping-calculator" action="<?php echo esc_url( WC()->cart->get_cart_url() ); ?>" method="post">

	
  <input type="hidden" name="calc_shipping_country" value="CA">
	<section class="shipping-calculator-form">

		<?php if ( apply_filters( 'woocommerce_shipping_calculator_enable_postcode', true ) ) : ?>

      <p class="total-line">
        <span class="label"><?php _e('enter your postal code to calculate shipping costs', 'edb'); ?></span>
        <span class="value">
          <input type="text" value="<?php echo esc_attr( WC()->customer->get_shipping_postcode() ); ?>" placeholder="<?php esc_attr_e( 'postcode / zip', 'edb' ); ?>" name="calc_shipping_postcode" id="calc_shipping_postcode" />
          <button type="submit" name="calc_shipping" value="1" class="button"><?php _e( 'update totals', 'edb' ); ?></button>
        </span>
        
      </p>

		<?php endif; ?>

		

		<?php wp_nonce_field( 'woocommerce-cart' ); ?>
	</section>
</form>

<?php do_action( 'woocommerce_after_shipping_calculator' ); ?>
