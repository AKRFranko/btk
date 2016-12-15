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
      // global $post;
      // $order_id = WC()->order->id;
      // write_log(WC());
      // $order_id = $order;
      
      ?>
        
    <p><?php printf(__("8 weeks and more of waiting time? Choose the option to pay a deposit %s"), '<a href="/partial-payment">'. __("Click here.") .'</a>'); ?></p>
    
  </div>
  
  
</div>