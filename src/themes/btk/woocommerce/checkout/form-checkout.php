<?php
/**
 * Checkout Form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

wc_print_notices();

do_action( 'woocommerce_before_checkout_form', $checkout );

// If checkout registration is disabled and not logged in, the user cannot checkout
if ( ! $checkout->enable_signup && ! $checkout->enable_guest_checkout && ! is_user_logged_in() ) {
	echo apply_filters( 'woocommerce_checkout_must_be_logged_in_message', __( 'You must be logged in to checkout.', 'woocommerce' ) );
	return;
}

// filter hook for include new pages inside the payment method
$get_checkout_url = apply_filters( 'woocommerce_get_checkout_url', WC()->cart->get_checkout_url() ); ?>

<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( $get_checkout_url ); ?>" enctype="multipart/form-data">
  
  <div id="checkout-panel-tabs">
    <a href="#address-info-panel" class="active">address</a>
    <a href="#shipping-packages-panel">delivery fees</a>
    <a href="#payment-info-panel">payment details</a>
    <a href="#place-order-panel">review & submit</a>
  </div>
  
  <div id="checkout-panel-summaries">
    <div data-panel="#address-info-panel" class="summary">
      <div class="summary-toggle">
          address
      </div>
    </div>
    <div data-panel="#shipping-packages-panel" class="summary">
      <div class="summary-toggle">
        delivery fees
      </div>
    </div>
    <div data-panel="#payment-info-panel" class="summary">
      <div class="summary-toggle">
        payment details
      </div>
    </div>
    <div data-panel="#place-order-panel" class="summary">
      <div class="summary-toggle">
        review & submit
      </div>
    </div>
  </div>
  
  <fieldset id="address-info-panel" class="checkout-panel active">
    <?php if ( sizeof( $checkout->checkout_fields ) > 0 ) : ?>
  
      <?php do_action( 'woocommerce_checkout_before_customer_details' ); ?>
  
      <div class="col2-set" id="customer_details">
        <div class="col-1">
          <?php do_action( 'woocommerce_checkout_billing' ); ?>
        </div>
        
        <div class="col-2">
          
          <?php do_action( 'woocommerce_checkout_shipping' ); ?>
        </div>
      </div>
  
      <?php do_action( 'woocommerce_checkout_after_customer_details' ); ?>
  
    
  
    <?php endif; ?>
      
	</fieldset>
  

	<?php do_action( 'woocommerce_checkout_before_order_review' ); ?>

	<div id="order_review" class="woocommerce-checkout-review-order">
		<?php do_action( 'woocommerce_checkout_order_review' ); ?>
	</div>
  
	<?php do_action( 'woocommerce_checkout_after_order_review' ); ?>
	
 
  
  
</form>



<?php do_action( 'woocommerce_after_checkout_form', $checkout ); ?>
