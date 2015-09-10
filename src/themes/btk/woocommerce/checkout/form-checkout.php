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

//do_action( 'woocommerce_before_checkout_form', $checkout );

// If checkout registration is disabled and not logged in, the user cannot checkout
if ( ! $checkout->enable_signup && ! $checkout->enable_guest_checkout && ! is_user_logged_in() ) {
	echo apply_filters( 'woocommerce_checkout_must_be_logged_in_message', __( 'You must be logged in to checkout.', 'btk' ) );
	return;
}

// filter hook for include new pages inside the payment method
$get_checkout_url = apply_filters( 'woocommerce_get_checkout_url', WC()->cart->get_checkout_url() ); ?>


<?php 
/*
<form action="<?php echo esc_url( WC()->cart->get_checkout_url() ); ?>" method="post">
	<div class="cart-contents">
		<?php wc_get_template( 'cart/cart-contents.php' ); ?>
	</div>
</form>
*/
?>

<div class="tabbar">

  <a class="tab active" data-pane="shipping-pane" href="#"><?php _e('Shipping Address', 'btk'); ?></a>
  
  <a class="tab" data-pane="delivery-pane" href="#"><?php _e('Delivery Fees', 'btk'); ?></a>
  
  <a class="tab" data-pane="payment-pane" href="#"><?php _e('Payment Details', 'btk'); ?></a>
  
  <a class="tab" data-pane="review-pane" href="#"><?php _e('Review & Submit', 'btk'); ?></a>
  
</div>


<div class="forms">
	<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( $get_checkout_url ); ?>" enctype="multipart/form-data">
	

	<?php if ( sizeof( $checkout->checkout_fields ) > 0 ) : ?>

			<?php do_action( 'woocommerce_checkout_before_customer_details' ); ?>
  <div class="tabpane active" id="shipping-pane">
			
				  <div class="col-1">
					<?php do_action( 'woocommerce_checkout_shipping' ); ?>
				</div>
				<div>
	  	<a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
	  	</div>
	</div>
	<div class="tabpane" id="delivery-pane">
	
		<div>
		<a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
		</div>
		
    </div>
    <div class="tabpane" id="payment-pane">
  
	  	  <div class="col-2">
			    <input type="text" name="coupon_code" class="input-text lower" placeholder="<?php _e( 'Promo Code', 'btk' ); ?>" id="coupon_code" value="" />
			
			    <input type="submit" class="button lower right" name="apply_coupon" value="<?php _e( 'Apply', 'btk' ); ?>" />
		    </div>
        <div class="col-2">
					<?php do_action( 'woocommerce_checkout_billing' ); ?>
				</div>
		    <div>
		        <a href="#" class="tabnext"><?php _e('save & continue', 'btk'); ?></a>
		    </div>
    </div>


				
			
			<?php do_action( 'woocommerce_checkout_after_customer_details' ); ?>

		<?php endif; ?>
		
		
		



<div class="tabpane" id="review-pane">
<?php do_action( 'woocommerce_checkout_before_order_review' ); ?>

		<div id="order_review" class="woocommerce-checkout-review-order">
			<?php do_action( 'woocommerce_checkout_order_review' ); ?>
		</div>

		<?php do_action( 'woocommerce_checkout_after_order_review' ); ?>

	
</div>

</form>

	

		
  <?php /*
	<form class="checkout-coupon" method="post">
		<h3><?php _e('Discount', 'btk'); ?></h3>
		<p class="form-row">
			<input type="text" name="coupon_code" class="input-text lower" placeholder="<?php _e( 'Enter code', 'btk' ); ?>" id="coupon_code" value="" />
			<input type="submit" class="button lower right" name="apply_coupon" value="<?php _e( 'Apply', 'btk' ); ?>" />
		</p>
	</form>



	<form name="checkout" method="post" class="checkout woocommerce-checkout" action="<?php echo esc_url( $get_checkout_url ); ?>" enctype="multipart/form-data">

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

		<?php do_action( 'woocommerce_checkout_before_order_review' ); ?>

		<div id="order_review" class="woocommerce-checkout-review-order">
			<?php do_action( 'woocommerce_checkout_order_review' ); ?>
		</div>

		<?php do_action( 'woocommerce_checkout_after_order_review' ); ?>

	</form>

*/

?>
</div>
<?php do_action( 'woocommerce_after_checkout_form', $checkout ); ?>


<div class="cart-collaterals">
	<span class="alignright">
		<span class="valign"><?php _e('go back to shopping', 'btk'); ?></span>
		<a href="<?php echo esc_url(home_url('/'));?>products/" class="valign icon-arrow-lite-left-white"></a>
	</span>
</div>


