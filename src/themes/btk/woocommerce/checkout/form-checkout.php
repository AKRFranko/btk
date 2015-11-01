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
global $current_user;
      get_currentuserinfo();

?>
<div class="tabbar">

  <a class="tab" data-pane="shipping-pane" href="#"><?php _e('Address', 'btk'); ?></a>
  
  <a class="tab" data-pane="delivery-pane" href="#"><?php _e('Delivery Fees', 'btk'); ?></a>
  
  <a class="tab" data-pane="payment-pane" href="#"><?php _e('Payment Details', 'btk'); ?></a>
  
  <a class="tab" data-pane="review-pane" href="#"><?php _e('Review & Submit', 'btk'); ?></a>
  
</div>


<div class="summary-bar">

  <div class="billing-address-summary summary-box">
  
      <h3><?php _e('Billing Address', 'btk'); ?></h3>
      
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
            <h3><?php _e('Choose Your Delivery Options', 'btk'); ?></h3>
            
    			  <!-- BEGIN DELIVERY FEES  -->
    			  
    			  <?php do_action( 'woocommerce_before_cart_table' ); ?>

<?php do_action( 'woocommerce_before_cart_contents' ); ?>

	<div class="cart-contents lower">

		<?php wc_get_template( 'cart/cart-delivery-contents.php' ); ?>



		<?php do_action( 'woocommerce_cart_actions' ); ?>

		<?php wp_nonce_field( 'woocommerce-cart' ); ?>

		<?php do_action( 'woocommerce_after_cart_contents' ); ?>
	</div>
	<div class="cart-collaterals lower">
	
	 <div class="cart-totals calculated-shipping">
    <p><?php _e('total delivery', 'btk'); ?>&nbsp;<span class="calculated-amount">---</span> </p>
    
    </div>
    <div class="cart-totals message">
      <p><?php _e("Based on your selection, the final delivery fees will adjust automatically. Shipping items individuallu may add shipping fees. For more information on how delivery fees are calculated ",'btk'); ?><a class="clickhere" href="/about-shipping">click here</a>. </p>
  </div>
  
	</div>
	






<?php do_action( 'woocommerce_after_cart_table' ); ?>
  <!-- END DELIVERY FEES -->
  
    			 <!-- <div class="col-2">
    				<!--
    		  		<p class="cust-form-row" id="delivery_fees_subtotal"><span class="fake-label">Delivery fees:</span><span class="value"></span></p>
    			  	<p class="cust-form-row" id="delivery_time_estimate"><span class="fake-label">Delivery by:</span><span class="value"><?php echo date('Y-m-d', strtotime("+30 days")); ?></span></p>
    				
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
    			
    				<p class="form-row form-row " id="shipping_email_field"><input type="text" class="input-text " name="shipping_email" id="shipping_email" placeholder="" value=""></p>
    		  	</div>
    		  	-->
    			
      		</div>
    		
    		<div>
    	  	<a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
    		</div>
    		
        </div><!-- end delivery-pane -->
    
        <div class="tabpane" id="payment-pane">
      
    	  	  <!-- ppl -->
    				
    		    <div class="half">
      		    <h3><?php _e('Payment Details', 'btk'); ?></h3>
      		    <div id="paypal-payment-gateway"  class="col-2">
      
      	        
      	        <?php $gateway = new WC_Gateway_Paypal_Pro(); ?>
      	        <div class="hide-next-child"></div>
      			    <?php $gateway->payment_fields(); ?>
                <input id="payment_method_<?php echo $gateway->id; ?>" type="hidden" class="input-radio" name="payment_method" value="<?php echo esc_attr( $gateway->id ); ?>" data-order_button_text="<?php echo esc_attr( $gateway->order_button_text ); ?>" />
      
              </div>
              <br />
              <br />
              <h3><?php _e('Have a promo code?', 'btk'); ?></h3>
              <div class="col-2">
      			    <input type="text" name="coupon_code" class="input-text lower" placeholder="<?php _e( 'Promo Code', 'btk' ); ?>" id="coupon_code" value="" />
      			    <!--<input type="submit" class="button lower right" name="apply_coupon" value="<?php _e( 'Apply', 'btk' ); ?>" />-->
      		    </div>
    		    </div>
    		    <div class="half" style="padding-left:1em">
    		      <h3><?php _e('Order Summary', 'btk'); ?></h3>
    		      
    		      <table>
    		        <tr>
    		          <td>Subtotal</td><td><?php wc_cart_totals_subtotal_html(); ?></td>
    		        </tr>
    		        <tr>
    		          <td>Shipping & Handling</td><td><?php wc_cart_totals_fee_html('shipping'); ?></td>
    		        </tr>
    		        <tr>
    		          <td>Taxes</td><td><?php wc_cart_totals_taxes_total_html(); ?></td>
    		        </tr>
    		        <tr>
    		          <td>Total</td><td><?php wc_cart_totals_order_total_html(); ?></td>
    		        </tr>
    		      </table>
    		      
    		      
    		      		  <?php do_action( 'woocommerce_before_cart_table' ); ?>



	<div class="cart-contents lower">
	<h3><?php _e('Cart'); ?></h3>
    <?php do_action( 'woocommerce_before_cart_contents' ); ?>
		<?php wc_get_template( 'cart/cart-review-contents.php' ); ?>



		
		<?php do_action( 'woocommerce_after_cart_contents' ); ?>
	</div>






<?php do_action( 'woocommerce_after_cart_table' ); ?>
    		    </div>
    		    
    		    
            
            
    			
    
    
    
    
    		    <div>
    		        <a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
    		    </div>
        </div><!-- end payment pane -->


        <div class="tabpane" id="review-pane">
          
            <div class="half">
            
            
            <table>
                <tr>
    		          <th>Order Total</th><th><?php wc_cart_totals_order_total_html(); ?></th>
    		        </tr>
    		        <tr>
    		          <td>Subtotal</td><td><?php wc_cart_totals_subtotal_html(); ?></td>
    		        </tr>
    		        <tr>
    		          <td>Promo Code</td><td>-$0</td>
    		        </tr>
    		        <tr>
    		          <td>Shipping & Handling</td><td><?php wc_cart_totals_fee_html('shipping'); ?></td>
    		        </tr>
    		        <tr>
    		          <td>Taxes</td><td><?php wc_cart_totals_taxes_total_html(); ?></td>
    		        </tr>
    		        
    		      </table>
    		      <br /><br />
    		      	<div class="cart-contents lower">
	<h3><?php _e('Cart'); ?></h3>
    <?php do_action( 'woocommerce_before_cart_contents' ); ?>
		<?php wc_get_template( 'cart/cart-review-contents.php' ); ?>



		
		<?php do_action( 'woocommerce_after_cart_contents' ); ?>
	</div>






<?php do_action( 'woocommerce_after_cart_table' ); ?>
    		    </div><!-- end half 1 -->
    		    
    		    <div class="half">
    		      
    		      	<?php if ( is_user_logged_in() ) : ?>
    		      	<div class="review-block">
    		      	  <div class="label">Signed In:</div>
      		      	<div class="value"><?php echo $current_user->user_nicename; ?></div>
      		      	<div class="action"><a href="<?php echo wp_logout_url( home_url('/') ); ?>"><?php _e('sign out', 'btk'); ?></a></div>
      		      </div>
                <?php endif; ?>
                
                <div class="review-block">
    		      	  <div class="label">Delivered To:</div>
      		      	<div class="value">
      		      	  Shipping user name<br>
      		      	  Shipping user street<br>
      		      	  City, Province<br>
      		      	  postal code, country<br>
      		      	</div>
      		      	
      		      	<div class="action"><a class="tab" data-pane="shipping-pane" href="#"><?php _e('edit', 'btk'); ?></a></div>
                </div>
                <div class="review-block">
    		      	  <div class="label">Payment:</div>
      		      	<div class="value">
      		      	  Visa<br>
      		      	  XXXX XXXX XXXX 1234<br>
      		      	</div>
      		      	
      		      	<div class="action"><a class="tab" data-pane="payment-pane" href="#"><?php _e('edit', 'btk'); ?></a></div>
                </div>
                <div class="review-block">
                  <h3><?php _e('Final Checklist'); ?></h3>
    		      	  <label><input type="checkbox" name="final_checklist_fits"> <?php _e('I made sure the item fits.', 'btk'); ?></label>
    		      	  <label><input type="checkbox" name="final_checklist_noinclude"> <?php _e('The delivery does not include...', 'btk'); ?></label>
    		      	  <label><input type="checkbox" name="final_checklist_variation"> <?php _e('I am aware that there can be slight variation in the colors of the swatches and the dinal product due to dye lot difference.', 'btk'); ?></label>
                </div>
    		    </div>
    		    

           <!---- -->
           
            
            <div id="payment" class="woocommerce-checkout-payment">
            
            	<div class="form-row place-order">
            
            		<noscript><?php _e( 'Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so.', 'woocommerce' ); ?><br/><input type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="<?php esc_attr_e( 'Update totals', 'woocommerce' ); ?>" /></noscript>
            
            		<?php wp_nonce_field( 'woocommerce-process_checkout' ); ?>
            
            		<?php do_action( 'woocommerce_review_order_before_submit' ); ?>
            
            		<?php echo apply_filters( 'woocommerce_order_button_html', '<input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="' . esc_attr( $order_button_text ) . '" data-value="' . esc_attr( $order_button_text ) . '" />' ); ?>
            
            		
            
            		<?php do_action( 'woocommerce_review_order_after_submit' ); ?>
            
            	</div>
            
            	
            </div>


        	
        </div>
<?php endif; ?>

</form>
</div>

<?php do_action( 'woocommerce_after_checkout_form', $checkout ); ?>
