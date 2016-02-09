<?php
/**
 * Checkout Payment Section
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

?>

<?php if ( ! is_ajax() ) : ?>
	<?php do_action( 'woocommerce_review_order_before_payment' ); ?>
<?php endif; ?>

<div id="payment" class="woocommerce-checkout-payment">
	<?php if ( WC()->cart->needs_payment() ) : ?>
	<ul class="payment_methods methods">
		<?php
			if ( ! empty( $available_gateways ) ) {
				foreach ( $available_gateways as $gateway ) {
					wc_get_template( 'checkout/payment-method.php', array( 'gateway' => $gateway ) );
				}
			} else {
				if ( ! WC()->customer->get_country() ) {
					$no_gateways_message = __( 'Please fill in your details above to see available payment methods.', 'btk' );
				} else {
					$no_gateways_message = __( 'Sorry, it seems that there are no available payment methods for your state. Please contact us if you require assistance or wish to make alternate arrangements.', 'btk' );
				}

				echo '<p>' . apply_filters( 'woocommerce_no_available_payment_methods_message', $no_gateways_message ) . '</p>';
			}
		?>
	</ul>
	<?php endif; ?>

	<?php if ( wc_get_page_id( 'terms' ) > 0 && apply_filters( 'woocommerce_checkout_show_terms', true ) ) : ?>
		<p class="form-row terms">
			<input type="checkbox" class="input-checkbox" name="terms" <?php checked( apply_filters( 'woocommerce_terms_is_checked_default', isset( $_POST['terms'] ) ), true ); ?> id="terms" />
			<label for="terms" class="checkbox small"><?php printf( __( 'I agree with the <a href="%s" target="_blank">terms &amp; conditions</a>', 'btk' ), esc_url( wc_get_page_permalink( 'terms' ) ) ); ?></label>
		</p>
	<?php endif; ?>

	<p class="form-row alignright clearfix">

		<noscript><?php _e( 'Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so.', 'btk' ); ?><br/><input type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="<?php _e( 'Update totals', 'btk' ); ?>" /></noscript>

		<?php wp_nonce_field( 'woocommerce-process_checkout' ); ?>

		<?php do_action( 'woocommerce_review_order_before_submit' ); ?>

		<?php echo apply_filters( 'woocommerce_order_button_html', '<span class="valign">Place order</span><input type="submit" class="buttons valign icon-arrow-lite-right-white" name="woocommerce_checkout_place_order" id="place_order" value="&nbsp;" data-value="&nbsp;" />' ); ?>

		<?php do_action( 'woocommerce_review_order_after_submit' ); ?>

	</p>

	<div class="clear"></div>
</div>

<?php if ( ! is_ajax() ) : ?>
	<?php do_action( 'woocommerce_review_order_after_payment' ); ?>
<?php endif; ?>
