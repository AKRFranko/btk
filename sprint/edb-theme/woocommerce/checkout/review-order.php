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

<fieldset id="shipping-packages-panel" class="checkout-panel woocommerce-checkout-review-order-table <?php edb_panel_active('#shipping-packages-panel') ?>">
  <h1><?php _e('Choose your delivery options', 'edb'); ?></h1>
    <?php $edb_shipping_methods = array(
      'edb_self_pickup' => "I will pick up.",
      'edb_ship_ready' => "Ship when ready",
      'edb_ship_bundle_1' => "Ship bundle 1",
      'edb_ship_bundle_2' => "Ship bundle 2",
      'edb_ship_bundle_3' => "Ship bundle 3"
    ); ?>
    <div class="shipping-method-choices">
      <?php foreach($edb_shipping_methods as $method_name => $label ){ ?>
      
        <div class="<?php edb_shipping_method_disabled($method_name); ?>">
          <?php echo $label; ?>
        </div>
      <?php }; ?>
       
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
  <button type="button" class="edb-save-and-continue">save & continue</button>
</fieldset><!-- .woocommerce-checkout-review-order-table -->
  







