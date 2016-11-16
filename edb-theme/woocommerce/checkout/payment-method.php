<?php
/**
 * Output a single payment method
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

?>
<div class="edb-paypal-pro">
  
  
	<input style="display:none" id="payment_method_<?php echo $gateway->id; ?>" type="radio" class="input-radio" name="payment_method" value="<?php echo esc_attr( $gateway->id ); ?>" <?php checked( $gateway->chosen, true ); ?> data-order_button_text="<?php echo esc_attr( $gateway->order_button_text ); ?>" />

	<!--<label for="payment_method_<?php echo $gateway->id; ?>">-->
	<!--	<?php echo $gateway->get_title(); ?> <?php echo $gateway->get_icon(); ?>-->
	<!--</label>-->
	
	<?php if ( $gateway->has_fields() || $gateway->get_description() ) : ?>
		<div class="payment_box payment_method_<?php echo $gateway->id; ?>" <?php if ( ! $gateway->chosen ) : ?>style="display:none;"<?php endif; ?>>
			<?php $gateway->payment_fields(); ?>
		</div>
		<p class="payment-supported-cards"><?php _e('We only accept payments through Visa or MasterCard.', 'edb'); ?></p>
	<?php endif; ?>

  
  <div class="partial-payment-notice">
    <?php 
      global $post;
      $order = new WC_Order($post->ID);
      $order_id = $order->id;
      ?>
        
    <p><?php _e("More than 8 weeks of waiting time? You can reserve your items by paying a deposit."); ?></p>
    <p><a href="/partial-payment?order_id=<?php echo $order_id; ?>"><?php _e("Click here to choose this option."); ?></a></p>
  </div>
  
</div>