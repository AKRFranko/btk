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
  <h1><?php _e('choose your delivery options', 'edb'); ?></h1>
    <?php $edb_shipping_methods = array(
            'edb_self_pickup' => __("self pickup", 'edb'),
            'edb_ship_ready' => __("ship when ready",'edb'),
            'edb_ship_bundle_1' => __("delivery",'edb'),
            'edb_ship_bundle_2' => __("ship bundle 2",'edb'),
            'edb_ship_bundle_3' => __("ship bundle 3",'edb')
          );?>
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
      <?php 
        $do_not_ship = WC()->session->get('do_not_ship');
        if(!isset($do_not_ship) || !$do_not_ship){
      ?>
      <div class="shipping-review-total">
        
        <?php if(!empty(WC()->customer->shipping_postcode)){ ?>
          <span class="label"><?php _e('total delivery', 'edb'); ?></span>
          <span class="value"><?php edb_cart_shipping_total();?></span>        
        <?php }else{ ?>
          <div class="warning"><a href="#" class="panel-link" data-panel="#address-info-panel"><?php _e('please click here to fill in your address information.','edb'); ?></a></div>
        <?php } ?>

      </div>  
      <?php  }; ?>
      
      <?php
        $fees = WC()->cart->get_fees();
        if(!empty($fees)){
          foreach($fees as $fee){
            if($fee->id == 'self-pickup-discount'){
            ?>
            <div class="shipping-review-total">
              <span class="label"><?php _e('self pickup discount', 'edb'); ?></span>
              <span class="value"><?php echo wc_price($fee->amount); ?></span>
            </div>
            
            <?php
 
          }
        }
      }
      ?>
      
      
      <div class="shipping-review-notice">
        <p><?php _e('For the items ordered, please choose your delivery options : self pick up (at our Montréal warehouse) or delivery to the adresse submitted. Based on your selection, the final delivery fees will adjust automatically. for more information on how delivery fees are calculated', 'edb');?><a target="_blank" href="<?php echo home_url('/about-shipping'); ?>"> <?php _e('click here', 'edb'); ?></a>.</p>
        <p><?php _e('We offer the self pick-up option. Come pick up your order at our warehouse and save an additional 5% on the last ticketed price', "edb"); ?></p>
      </div>
      
    </div><!-- shipping-review -->
  <button type="button" class="edb-save-and-continue"><?php _e('save & continue', 'edb'); ?></button>
</fieldset><!-- .woocommerce-checkout-review-order-table -->
  







