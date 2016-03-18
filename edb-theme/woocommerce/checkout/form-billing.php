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
  
	<h1><?php _e( 'billing address', 'edb' ); ?></h1>

	<?php do_action( 'woocommerce_before_checkout_billing_form', $checkout ); ?>

	<?php foreach ( $checkout->checkout_fields['billing'] as $key => $field ) : ?>
	
	  <?php 
	  
	  if($key == 'shipping_postcode' || $key == 'billing_postcode' ){
	      $billingValue = $checkout->get_value('billing_postcode' );
	      $shippingValue = $checkout->get_value('shipping_postcode' );
	      $customerValue = WC()->customer->get_shipping_postcode();
        if(!empty($shippingValue)){
          $value = $shippingValue;
        }
        if(!empty($billingValue)){
          $value = $billingValue;
        }

        if(empty($value)){
          $value = $customerValue;
        }
        
        if(empty($value) && isset($_REQUEST['shipping_postcode'])){
          $value = $_REQUEST['shipping_postcode'];
        }

	      woocommerce_form_field( $key, $field, $value ); 
	      
	  }else{ 
		    woocommerce_form_field( $key, $field, $checkout->get_value( $key ) ); 
		};
		
		?>

	<?php endforeach; ?>
  
  <?php
    $ship_to_same_address = WC()->session->get( 'ship_to_same_address' );
    $do_not_ship = WC()->session->get('do_not_ship');
    
  ?>
  
  <label class="option-checkbox" for="do-not-ship-option">
    
    <div id="do-not-ship">
      <input id="do-not-ship-option" class="input-checkbox" <?php checked( $do_not_ship, 1 ); ?> type="checkbox" name="do_not_ship" value="1" />  
    </div>
    <?php _e('self pickup, save 5% extra', 'edb'); ?>
  </label>
  

  <label class="option-checkbox" for="ship-to-same-address-option">
    
    <div id="ship-to-different-address">
      <input id="ship-to-same-address-option" class="input-checkbox" <?php checked( $ship_to_same_address, 1 ); ?> type="checkbox" name="ship_to_same_address" value="1" >
      <input id="ship-to-different-address-option" class="input-checkbox" type="hidden" name="ship_to_different_address" value="<?php echo $ship_to_same_address == 1 ? 0 : 1; ?>" />  
    </div>
    <?php _e('ship to same address', 'edb'); ?>
  </label>
  

	<?php do_action('woocommerce_after_checkout_billing_form', $checkout ); ?>

  <!--<input type="hidden" name="createaccount" value="1" />-->

	
	
</div>
