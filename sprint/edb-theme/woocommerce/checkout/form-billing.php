<?php
/**
 * Checkout billing information form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.1.2
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

/** @global WC_Checkout $checkout */
?>
<div class="woocommerce-billing-fields">
  
	<h1><?php _e( 'Billing Address', 'wc-edb' ); ?></h1>

	<?php do_action( 'woocommerce_before_checkout_billing_form', $checkout ); ?>

	<?php foreach ( $checkout->checkout_fields['billing'] as $key => $field ) : ?>
    
		<?php woocommerce_form_field( $key, $field, $checkout->get_value( $key ) ); ?>

	<?php endforeach; ?>
  
  <?php
    $ship_to_same_address = WC()->session->get( 'ship_to_same_address' );
    $do_not_ship = WC()->session->get('do_not_ship');
    
  ?>
  
  <label class="option-checkbox" for="do-not-ship-option">
    
    <div id="do-not-ship">
      <input id="do-not-ship-option" class="input-checkbox" <?php checked( $do_not_ship, 1 ); ?> type="checkbox" name="do_not_ship" value="1" />  
    </div>
    <?php _e('I want to pick it up myself', 'edb'); ?>
  </label>
  

  <label class="option-checkbox" for="ship-to-same-address-option">
    
    <div id="ship-to-different-address">
      <input id="ship-to-same-address-option" class="input-checkbox" <?php checked( $ship_to_same_address, 1 ); ?> type="checkbox" name="ship_to_same_address" value="1" >
      <input id="ship-to-different-address-option" class="input-checkbox" type="hidden" name="ship_to_different_address" value="<?php echo $ship_to_same_address == 1 ? 0 : 1; ?>" />  
    </div>
    <?php _e('Ship to same address', 'edb'); ?>
  </label>
  

	<?php do_action('woocommerce_after_checkout_billing_form', $checkout ); ?>

  <!--<input type="hidden" name="createaccount" value="1" />-->

<!--
	<?php if ( ! is_user_logged_in() && $checkout->enable_signup ) : ?>

		<?php if ( $checkout->enable_guest_checkout ) : ?>

			<p class="form-row form-row-wide create-account">
				<input class="input-checkbox" id="createaccount" <?php checked( ( true === $checkout->get_value( 'createaccount' ) || ( true === apply_filters( 'woocommerce_create_account_default_checked', false ) ) ), true) ?> type="checkbox" name="createaccount" value="1" /> <label for="createaccount" class="checkbox"><?php _e( 'Create an account?', 'woocommerce' ); ?></label>
			</p>

		<?php endif; ?>

		<?php do_action( 'woocommerce_before_checkout_registration_form', $checkout ); ?>

		<?php if ( ! empty( $checkout->checkout_fields['account'] ) ) : ?>

			<div class="create-account">

				<p><?php _e( 'Create an account by entering the information below. If you are a returning customer please login at the top of the page.', 'woocommerce' ); ?></p>

				<?php foreach ( $checkout->checkout_fields['account'] as $key => $field ) : ?>
            
					<?php woocommerce_form_field( $key, $field, $checkout->get_value( $key ) ); ?>

				<?php endforeach; ?>

				<div class="clear"></div>

			</div>

		<?php endif; ?>

		<?php do_action( 'woocommerce_after_checkout_registration_form', $checkout ); ?>

	<?php endif; ?>
-->	
  
	
	
</div>
