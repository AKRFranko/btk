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

?>
<div class="tabbar">

  <a class="tab" data-pane="shipping-pane" href="#"><?php _e('Shipping Address', 'btk'); ?></a>
  
  <a class="tab" data-pane="delivery-pane" href="#"><?php _e('Delivery Fees', 'btk'); ?></a>
  
  <a class="tab" data-pane="payment-pane" href="#"><?php _e('Payment Details', 'btk'); ?></a>
  
  <a class="tab" data-pane="review-pane" href="#"><?php _e('Review & Submit', 'btk'); ?></a>
  
</div>


<div class="summary-bar">

  <div class="billing-address-summary summary-box">
  
      <h3><?php _e('Shipping Address', 'btk'); ?></h3>
      
      <div>
        <span class="billing_first_name_summary"></span>
        <span class="billing_last_name_summary"></span>
      </div>
      
      <div>
        <span class="billing_address_1_summary"></span>
      </div>
      <div>
      <span class="billing_city_summary"></span>
      </div>
      <div>
        <span class="billing_country_summary"></span>
      </div>
      <div><span class="billing_postcode_summary"></span></div>
      
  </div>
  <div class="shipping-address-summary summary-box">
      <h3><?php _e('Shipping Address', 'btk'); ?></h3>
      <div>
        <span class="shipping_first_name_summary"></span>
        <span class="shipping_last_name_summary"></span>
      </div>
      <div><span class="shipping_email_summary"></span></div>
      <div>
        <span class="shipping_address_1_summary"></span>
        <span class="shipping_address_2_summary"></span>
      </div>
      <div>
      <span class="shipping_city_summary"></span></div>
      
      <div>
        <span class="shipping_country_summary"></span></div><div>
        <span class="shipping_postcode_summary"></span>
      </div>
      
  </div>
  <div class="delivery-fees-summary summary-box">
      <h3><?php _e('Delivery Fees', 'btk'); ?></h3>
      <div>
          Delivery fees: <span class="delivery_fees_subtotal_summary"></span>
      </div>
      <div>
          Delivery by: <span class="delivery_time_estimate"><?php echo date('Y-m-d', strtotime("+30 days")); ?></span>
      </div>
  </div>
  <div class="payment-details-summary summary-box">
      <h3><?php _e('Payment Details', 'btk'); ?></h3>
      <div>
          Credit Card: <span class="paypal_pro-card-number_summary"></span>
      </div>
      <div>
          Expiry: <span class="paypal_pro-card-expiry"></span>
      </div>
      <!--<div>
          CVC: <span class="paypal_pro-card-cvc"></span>
      </div>-->
  </div>
  <div class="order-review-summary summary-box">
    <h3><?php _e('Total', 'btk'); ?></h3>
    <div class="big-cart-total"></div>
  </div>
  
</div><!-- end summary-bar -->

<?php

wc_print_notices();

do_action( 'woocommerce_before_checkout_form', $checkout );

// If checkout registration is disabled and not logged in, the user cannot checkout
if ( ! $checkout->enable_signup && ! $checkout->enable_guest_checkout && ! is_user_logged_in() ) {
	echo apply_filters( 'woocommerce_checkout_must_be_logged_in_message', __( 'You must be logged in to checkout.', 'woocommerce' ) );
	return;
}

// filter hook for include new pages inside the payment method
$get_checkout_url = apply_filters( 'woocommerce_get_checkout_url', WC()->cart->get_checkout_url() ); ?>
<div class="forms">


<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( $get_checkout_url ); ?>" enctype="multipart/form-data">
	
  <input name="delivery_fees_subtotal" type="hidden" value="-">
  
	<?php if ( sizeof( $checkout->checkout_fields ) > 0 ) : ?>

    	<?php do_action( 'woocommerce_checkout_before_customer_details' ); ?>
      
      <div class="tabpane" id="shipping-pane">
      
    			 <div class="col-2">
    					<?php do_action( 'woocommerce_checkout_billing' ); ?>
    				</div>
    				
    				<div class="col-1">
    					<?php do_action( 'woocommerce_checkout_shipping' ); ?>
    				</div>
    				
    				<div>
    	  	    <a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
    	  	  </div>
    	</div>
    	
    	<div class="tabpane" id="delivery-pane">
    	    <div class="delivery_options" style="display: block;">
            <h3>Delivery Fees</h3>
    			
    			  <div class="col-2">
    				<!--
    		  		<p class="cust-form-row" id="delivery_fees_subtotal"><span class="fake-label">Delivery fees:</span><span class="value"></span></p>
    			  	<p class="cust-form-row" id="delivery_time_estimate"><span class="fake-label">Delivery by:</span><span class="value"><?php echo date('Y-m-d', strtotime("+30 days")); ?></span></p>
    				-->
    			   <p class="cust-form-row">
    			   <input id="rush_delivery_option" class="input-checkbox" type="checkbox" name="rush_or_pickup" value="rush" />
    			   <label for="rush_delivery_option"> Rush it for an extra $75.00</label>
    			   
    			   
    			   </p>
    			   <p class="cust-form-row">
    			    <input id="local_pickup_option" class="input-checkbox" type="checkbox" name="rush_or_pickup" value="local_pickup" />
    			    <label for="local_pickup_option">I want to pick it up, do not charge me delivery.</label>
    					
    					
    			   
    			   </p>
    			   <p class="learn-more">Want to learn more about how the fees are calculated? <a href="/about-shipping">Click here</a>.</p>
    				
    				<div class="clear"></div>
    			
    				<!--<p class="form-row form-row " id="shipping_email_field"><input type="text" class="input-text " name="shipping_email" id="shipping_email" placeholder="" value=""></p>-->
    		  	</div>
    			
      		</div>
    		
    		<div>
    	  	<a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
    		</div>
    		
        </div><!-- end delivery-pane -->
    
        <div class="tabpane" id="payment-pane">
      
    	  	  <!-- ppl -->
    				<div class="col-2">
    			    <input type="text" name="coupon_code" class="input-text lower" placeholder="<?php _e( 'Promo Code', 'btk' ); ?>" id="coupon_code" value="" />
    			
    			    <!--<input type="submit" class="button lower right" name="apply_coupon" value="<?php _e( 'Apply', 'btk' ); ?>" />-->
    		    </div>
    		    
            <div id="paypal-payment-gateway"  class="col-2">
    
    	
    	        <?php $gateway = new WC_Gateway_Paypal_Pro(); ?>
    			    <?php $gateway->payment_fields(); ?>
              <input id="payment_method_<?php echo $gateway->id; ?>" type="hidden" class="input-radio" name="payment_method" value="<?php echo esc_attr( $gateway->id ); ?>" data-order_button_text="<?php echo esc_attr( $gateway->order_button_text ); ?>" />
    
            </div>				
    			
    
    
    
    
    		    <div>
    		        <a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
    		    </div>
        </div><!-- end payment pane -->


        <div class="tabpane" id="review-pane">
        
            <?php do_action( 'woocommerce_checkout_before_order_review' ); ?>
        
        		<div id="order_review" class="woocommerce-checkout-review-order">
        			<?php do_action( 'woocommerce_checkout_order_review' ); ?>
        		</div>
        
        		<?php do_action( 'woocommerce_checkout_after_order_review' ); ?>
        
        	
        </div>
<?php endif; ?>

</form>
</div>

<?php do_action( 'woocommerce_after_checkout_form', $checkout ); ?>
