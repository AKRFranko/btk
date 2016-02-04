<?php
/**
 * Checkout shipping information form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.2.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

$needs_shipping = WC()->cart->needs_shipping_address() === true && WC()->session->get('ship_to_different_address');
$ship_to_same_address = WC()->session->get( 'ship_to_same_address' );
$do_not_ship = WC()->session->get('do_not_ship');

?>
<div class="woocommerce-shipping-fields" >
	<?php if ( !$do_not_ship ) : ?>

		<?php
		// 	if ( empty( $_POST ) ) {

		// 		$ship_to_different_address = get_option( 'woocommerce_ship_to_destination' ) === 'shipping' ? 1 : 0;
		// 		$ship_to_different_address = apply_filters( 'woocommerce_ship_to_different_address_checked', $ship_to_different_address );

		// 	} else {

		// 		$ship_to_different_address = $checkout->get_value( 'ship_to_different_address' );

		// 	}
		?>

		<div class="shipping_address">
		  
      <h1><?php _e( 'Shipping Address', 'wc-edb' ); ?></h1>
      
			<?php do_action( 'woocommerce_before_checkout_shipping_form', $checkout ); ?>

			<?php foreach ( $checkout->checkout_fields['shipping'] as $key => $field ) : ?>
        <?php if($ship_to_same_address){ $field['custom_attributes'] = array('readonly'=>'readonly'); } ?>
				<?php woocommerce_form_field( $key, $field, $checkout->get_value( $key ) ); ?>

			<?php endforeach; ?>

			<?php do_action( 'woocommerce_after_checkout_shipping_form', $checkout ); ?>

		</div>

	<?php endif; ?>
  <!-- 
	<?php do_action( 'woocommerce_before_order_notes', $checkout ); ?>

	<?php if ( false && apply_filters( 'woocommerce_enable_order_notes_field', get_option( 'woocommerce_enable_order_comments', 'yes' ) === 'yes' ) ) : ?>

		<?php if ( ! WC()->cart->needs_shipping() || WC()->cart->ship_to_billing_address_only() ) : ?>

			<h3><?php _e( 'Additional Information', 'woocommerce' ); ?></h3>

		<?php endif; ?>

		<?php foreach ( $checkout->checkout_fields['order'] as $key => $field ) : ?>

			<?php woocommerce_form_field( $key, $field, $checkout->get_value( $key ) ); ?>

		<?php endforeach; ?>

	<?php endif; ?>

	<?php do_action( 'woocommerce_after_order_notes', $checkout ); ?>
	-->
</div>
