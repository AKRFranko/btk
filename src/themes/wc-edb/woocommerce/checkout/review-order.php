<?php
/**
 * Review order table
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
global $WC_Edb;
?>

<fieldset id="shipping-packages-panel" class="checkout-panel woocommerce-checkout-review-order-table">
<div class="shipping-method-choices">
   <div>Self pickup</div>
   <div>Ship ready</div>
   <div>Bundle 1</div>
   <div>Bundle 2</div>
   <div>Bundle 3</div>
</div>
	  <div class="shipping-review">
      <?php if ( WC()->cart->needs_shipping() && WC()->cart->show_shipping() ) : ?> 
        <?php do_action( 'woocommerce_review_order_before_shipping' ); ?>
        <?php wc_cart_totals_shipping_html(); ?>
        <?php do_action( 'woocommerce_review_order_after_shipping' ); ?>
      <?php endif; ?>
      
      <div class="shipping-review-total">
        <span class="label"><?php _e('total delivery', 'wc-edb'); ?></span>
        <span class="value"><?php echo WC()->cart->get_cart_shipping_total(); ?></span>
      </div>
      
      <div class="shipping-review-notice">
        <p>based on your selection, the final delivery fees will adjust automatically. shipping items individuallu may add shipping fees. for more information on how delivery fees are calculated click here.</p>
      </div>
      
    </div><!-- shipping-review -->
  
</fieldset><!-- .woocommerce-checkout-review-order-table -->
  







