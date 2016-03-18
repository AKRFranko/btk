<?php
/**
 * Checkout Payment Section
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.4.7
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
global $WC_Edb;
?>

<?php if ( ! is_ajax() ) : ?>
	<?php do_action( 'woocommerce_review_order_before_payment' ); ?>
	
<?php endif; ?>


<div id="payment" class="woocommerce-checkout-payment">
  
  <fieldset id="payment-info-panel" class="checkout-panel <?php edb_panel_active('#payment-info-panel') ?>">
      <?php 
        do_action( 'woocommerce_review_order_before_cart_contents' ); 
        do_action( 'woocommerce_review_order_before_order_total' ); 
      ?>
    
    
      <div class="boxes">
        <div class="box half">
      
      <h2><?php _e('payment details', 'edb'); ?></h2>
	   <?php if ( WC()->cart->needs_payment() ) : ?>
     <div class="payment_methods methods">
       <?php
         if ( ! empty( $available_gateways ) ) {
           foreach ( $available_gateways as $gateway ) {
             wc_get_template( 'checkout/payment-method.php', array( 'gateway' => $gateway ) );
           }
         } else {
           if ( ! WC()->customer->get_country() ) {
             $no_gateways_message = __( 'please fill in your details above to see available payment methods.', 'edb' );
           } else {
             $no_gateways_message = __( 'sorry, it seems that there are no available payment methods for your state. please contact us if you require assistance or wish to make alternate arrangements.', 'edb' );
           }
   
           echo '<li>' . apply_filters( 'woocommerce_no_available_payment_methods_message', $no_gateways_message ) . '</li>';
         }
       ?>
     </div>
     <?php endif; ?>
     <?php if (WC()->cart->coupons_enabled() ) { ?>
       <div class="checkout-coupon">
         
         <h1><?php _e('do you have a promo code?', 'edb'); ?></h1>
         <input type="text" name="coupon_code" placeholder="<?php esc_attr_e( 'promo code', 'edb' ); ?>" id="coupon_code" value="" />
         <button type="button" class="button" id="apply_coupon"><?php esc_attr_e( 'apply coupon', 'edb' ); ?></button>
       </div>
     <?php }; ?>
     </div>
     <div class="box half">


    
      <h1><?php _e('order summary','edb');?></h1>
     
      <div class="cart-costs">
       <?php get_template_part('woocommerce/checkout/parts', 'totals') ;?>
    
        
      </div><!-- .cart-costs -->
    <h1><?php _e('items', 'edb')?></h1>
    <div class="cart-review-items">
      <?php get_template_part('woocommerce/checkout/parts', 'packages') ;?>
    </div><!-- cart-review-items -->
    </div>
    </div>
    <button type="button" class="edb-save-and-continue"><?php _e('save & continue', 'edb'); ?></button>
    
  </fieldset><!-- #payment-info-panel -->

  <fieldset id="place-order-panel" class="checkout-panel <?php edb_panel_active('#place-order-panel') ?>">
    <div class="boxes">
      
<div class="box half">
    <?php if(!WC()->session->get('do_not_ship')){ ?> 
    <div class="cart-address-review">
      <h1><?php _e('delivered to', 'edb');?></h1>
      <?php if(!empty(WC()->customer->shipping_address_1)){ ?>
      <p>
        <?php echo WC()->customer->shipping_address_1;  ?>,<?php echo WC()->customer->shipping_address_2;  ?>
      <br>
        <?php echo WC()->customer->shipping_city;  ?>,
        <?php echo WC()->customer->shipping_state;  ?>
      <br>
        <?php echo WC()->customer->shipping_country;  ?>,
        <?php echo WC()->customer->shipping_postcode;  ?>
      </p>
      <a href="#" class="panel-link" data-panel="#address-info-panel"><?php _e('edit', 'edb'); ?></a>
      <?php }else{ ?>
        <div class="warning"><a href="#" class="panel-link" data-panel="#address-info-panel"><?php _e('please click here to fill in your address information.','edb'); ?></a></div>
      <?php } ?>
    </div>
    <?php }; ?>
    
    
    
    <div class="cart-payment">
      <h1><?php _e('payment', 'edb'); ?></h1>
      <?php if(!empty(WC()->session->get('edb_payment_info_card_number'))){ ?>
      <p class="credit-card-type"><?php echo WC()->session->get('edb_payment_info_card_number'); ?></p>
      <p class="credit-card-number"><?php echo WC()->session->get('edb_payment_info_card_expiry'); ?></p>
      <a href="#" class="panel-link" data-panel="#payment-info-panel"><?php _e('edit', 'edb'); ?></a>
      <?php }else{ ?>
        <div class="warning"><a href="#" class="panel-link" data-panel="#payment-info-panel"><?php _e('please click here to fill in your payment information.','edb'); ?></a></div>
      <?php }; ?>
      
    </div>
    
    <?php do_action( 'woocommerce_review_order_after_cart_contents' ); ?>
    
<!--    <div class="cart-final-checklist">-->

<!--<h3><?php _e('Final Checklist', 'edb'); ?></h3>-->
<!--    <label class="checklist-checkbox"><input type="checkbox" name="final_checklist_fits"> <span><?php _e('i made sure the item fits.','edb'); ?></span> </label>-->
<!--    <label class="checklist-checkbox"><input type="checkbox" name="final_checklist_noinclude"> <span><?php _e('The delivery does not include...','edb'); ?></span></label>-->
<!--    <label class="checklist-checkbox"><input type="checkbox" name="final_checklist_variation"> <span><?php _e('i am aware that there can be slight variation in the colors of the swatches and the final product due to dye lot difference.','edb'); ?></span></label>-->
<!--    </div>-->
    
    
    </div>
    <div class="box half">
    <div class="cart-costs-review">
      <h1><?php _e('total','edb'); ?></h1>
      <div class="cart-costs-repeat">
         <?php get_template_part('woocommerce/checkout/parts', 'totals') ;?>
      </div>
      <h1><?php _e('items', 'edb')?></h1>
      <div class="cart-review-items-repeat">
        <?php get_template_part('woocommerce/checkout/parts', 'packages') ;?>
      </div>
    
    </div>
    
    </div>
    <div class="form-row place-order">
    
      <noscript><?php _e( 'Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so.', 'woocommerce' ); ?><br/><input type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="<?php esc_attr_e( 'Update totals', 'woocommerce' ); ?>" /></noscript>
    
      <?php wp_nonce_field( 'woocommerce-process_checkout' ); ?>
    
      <?php do_action( 'woocommerce_review_order_before_submit' ); ?>
    
      <?php echo apply_filters( 'woocommerce_order_button_html', '<input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="' . esc_attr( __('place order','edb' )) . '" data-value="' . esc_attr( __('place order','edb' ) ) . '" />' ); ?>
    
      <?php if ( wc_get_page_id( 'terms' ) > 0 && apply_filters( 'woocommerce_checkout_show_terms', true ) ) : ?>
        <p class="form-row terms">
          <label for="terms" class="checkbox"><?php printf( __( 'I&rsquo;ve read and accept the <a href="%s" target="_blank">terms &amp; conditions</a>', 'woocommerce' ), esc_url( wc_get_page_permalink( 'terms' ) ) ); ?></label>
          <input type="checkbox" class="input-checkbox" name="terms" <?php checked( apply_filters( 'woocommerce_terms_is_checked_default', isset( $_POST['terms'] ) ), true ); ?> id="terms" />
        </p>
      <?php endif; ?>
    
      <?php do_action( 'woocommerce_review_order_after_submit' ); ?>
    
    </div>
    </div>
    
  </fieldset><!-- #place-order-panel -->


</div><!-- #payment -->

<?php if ( ! is_ajax() ) : ?>
	<?php do_action( 'woocommerce_review_order_after_payment' ); ?>
<?php endif; ?>
