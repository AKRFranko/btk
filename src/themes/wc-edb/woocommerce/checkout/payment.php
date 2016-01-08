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
  
  <fieldset id="payment-info-panel" class="checkout-panel">
    
    
	   <?php if ( WC()->cart->needs_payment() ) : ?>
     <div class="payment_methods methods">
       <?php
         if ( ! empty( $available_gateways ) ) {
           foreach ( $available_gateways as $gateway ) {
             wc_get_template( 'checkout/payment-method.php', array( 'gateway' => $gateway ) );
           }
         } else {
           if ( ! WC()->customer->get_country() ) {
             $no_gateways_message = __( 'Please fill in your details above to see available payment methods.', 'woocommerce' );
           } else {
             $no_gateways_message = __( 'Sorry, it seems that there are no available payment methods for your state. Please contact us if you require assistance or wish to make alternate arrangements.', 'woocommerce' );
           }
   
           echo '<li>' . apply_filters( 'woocommerce_no_available_payment_methods_message', $no_gateways_message ) . '</li>';
         }
       ?>
     </div>
     <?php endif; ?>

     <?php if (WC()->cart->coupons_enabled() ) { ?>
       <div class="checkout-coupon">
         <h1><?php _e('Do you have a promo code?', 'wc-edb'); ?></h1>
         <input type="text" name="coupon_code" placeholder="<?php esc_attr_e( 'promo code', 'woocommerce' ); ?>" id="coupon_code" value="" />
       </div>
     <?php }; ?>
     


    
      <h1>ORDER SUMMARY</h1>
     
      <div class="cart-costs">
        <?php do_action( 'woocommerce_review_order_before_order_total' ); ?>
        <div class="cart-total cost-line">
          <span class="label"><?php _e('Order Total', 'wc-edb'); ?></span>
          <span class="value"><?php wc_cart_totals_order_total_html(); ?></span>
        </div>
        <?php do_action( 'woocommerce_review_order_after_order_total' ); ?>
        
        <div class="cart-subtotal cost-line">
          <span class="label"><?php _e( 'Subtotal', 'wc-edb' ); ?></span>
          <span class="value"><?php wc_cart_totals_subtotal_html(); ?></span>
        </div>
        
        <?php foreach ( WC()->cart->get_coupons() as $code => $coupon ) : ?>
          <div class="cart-discount cost-line coupon-<?php echo esc_attr( sanitize_title( $code ) ); ?>">
            <span class="label"><?php wc_cart_totals_coupon_label( $coupon ); ?></span>
            <span class="value"><?php wc_cart_totals_coupon_html( $coupon ); ?></span>
          </div>
        <?php endforeach; ?>
        
        <div class="cart-shipping-total cost-line">
          <span class="label"><?php _e('Shipping', 'wc-edb'); ?></span>
          <span class="value"><?php echo WC()->cart->get_cart_shipping_total(); ?></span>
        </div>
    
    
        <?php foreach ( WC()->cart->get_fees() as $fee ) : ?>
          <div class="fee cart-fee cost-line">
            <span class="label"><?php echo esc_html( $fee->name ); ?></span>
            <span class="value"><?php wc_cart_totals_fee_html( $fee ); ?></span>
          </div>
        <?php endforeach; ?>
    
        <?php if ( wc_tax_enabled() && WC()->cart->tax_display_cart === 'excl' ) : ?>
          <?php if ( get_option( 'woocommerce_tax_total_display' ) === 'itemized' ) : ?>
            <?php foreach ( WC()->cart->get_tax_totals() as $code => $tax ) : ?>
              <div class="cart-tax cost-line tax-rate tax-rate-<?php echo sanitize_title( $code ); ?>">
                <span class="label"><?php echo esc_html( $tax->label ); ?></span>
                <span class="value"><?php echo wp_kses_post( $tax->formatted_amount ); ?></span>
              </div>
            <?php endforeach; ?>
          <?php else : ?>
            <div class="tax-total cart-tax-total cost-line">
              <span class="label"><?php echo esc_html( WC()->countries->tax_or_vat() ); ?></span>
              <span class="value"><?php wc_cart_totals_taxes_total_html(); ?></span>
            </div>
          <?php endif; ?>
        <?php endif; ?>
    
      
      </div><!-- .cart-costs -->
  
    <div class="cart-review-items">
      <?php
        do_action( 'woocommerce_review_order_before_cart_contents' );
  
        foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
          $_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
  
          if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_checkout_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
            ?>
            <div class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">
              <div class="cart-item-image">
                <?php
                  $thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );
    
                  if ( ! $_product->is_visible() ) {
                    echo $thumbnail;
                  } else {
                    printf( '<a href="%s">%s</a>', esc_url( $_product->get_permalink( $cart_item ) ), $thumbnail );
                  }
                ?>
              </div>
              <div class="cart-item-info">
                <div class="cart-item-name">
                  <?php echo apply_filters( 'woocommerce_cart_item_name', $_product->get_title(), $cart_item, $cart_item_key ) . '&nbsp;'; ?>
                </div>  
                <div class="cart-item-material">
                  <?php
                    // Meta data
                    //echo WC()->cart->get_item_data( $cart_item );
                  ?>
                  <?php
                    echo $cart_item['variation']['attribute_edb_material'];
                  ?>
                </div>
                <div class="cart-item-category">
                  <?php
                    echo $_product->get_categories();
                  ?>
                </div>
                <div class="cart-item-availability">
                  <?php
                    echo $WC_Edb->get_product_availability( array('availability'=>array()), $_product )['availability'];
                  ?>
                </div>
              </div>
              <div class="cart-item-actions">
                <div class="cart-item-remove">
                  <?php
                  
                    echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf(
                      '<a href="%s" class="remove" title="%s" data-product_id="%s" data-product_sku="%s">&times;</a>',
                      esc_url( WC()->cart->get_remove_url( $cart_item_key ) ),
                      __( 'Remove this item', 'woocommerce' ),
                      esc_attr( $_product->id ),
                      esc_attr( $_product->get_sku() )
                    ), $cart_item_key );
                  ?>
                </div>
              </div>
              
                
            </div>
            <?php
          }
        }
  
        do_action( 'woocommerce_review_order_after_cart_contents' );
      ?>
    </div><!-- cart-review-items -->

  </fieldset><!-- #payment-info-panel -->

  <fieldset id="place-order-panel" class="checkout-panel">
    
    <div class="cart-costs-review">
      <h1>Total</h1>
      <div class="cart-costs-repeat">
    
      </div>
      <div class="cart-review-items-repeat">
        
      </div>
    
    </div>
    
    <div class="cart-address-review">
      <h1>DELIVERED TO</h1>
      <p>
        <?php echo WC()->customer->shipping_address_1;  ?>,<?php echo WC()->customer->shipping_address_2;  ?>
      <br>
        <?php echo WC()->customer->shipping_city;  ?>,
        <?php echo WC()->customer->shipping_state;  ?>
      <br>
        <?php echo WC()->customer->shipping_country;  ?>,
        <?php echo WC()->customer->shipping_postcode;  ?>
      </p>
    </div>
    
    <div class="cart-payment-review">
      <h1>Payment Method</h1>
      <p class="credit-card-type"></p>
      <p class="credit-card-number"></p>
    </div>
    
    
    <div class="form-row place-order">
    
      <noscript><?php _e( 'Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so.', 'woocommerce' ); ?><br/><input type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="<?php esc_attr_e( 'Update totals', 'woocommerce' ); ?>" /></noscript>
    
      <?php wp_nonce_field( 'woocommerce-process_checkout' ); ?>
    
      <?php do_action( 'woocommerce_review_order_before_submit' ); ?>
    
      <?php echo apply_filters( 'woocommerce_order_button_html', '<input type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="' . esc_attr( $order_button_text ) . '" data-value="' . esc_attr( $order_button_text ) . '" />' ); ?>
    
      <?php if ( wc_get_page_id( 'terms' ) > 0 && apply_filters( 'woocommerce_checkout_show_terms', true ) ) : ?>
        <p class="form-row terms">
          <label for="terms" class="checkbox"><?php printf( __( 'I&rsquo;ve read and accept the <a href="%s" target="_blank">terms &amp; conditions</a>', 'woocommerce' ), esc_url( wc_get_page_permalink( 'terms' ) ) ); ?></label>
          <input type="checkbox" class="input-checkbox" name="terms" <?php checked( apply_filters( 'woocommerce_terms_is_checked_default', isset( $_POST['terms'] ) ), true ); ?> id="terms" />
        </p>
      <?php endif; ?>
    
      <?php do_action( 'woocommerce_review_order_after_submit' ); ?>
    
    </div>
    
  </fieldset><!-- #place-order-panel -->


</div><!-- #payment -->

<?php if ( ! is_ajax() ) : ?>
	<?php do_action( 'woocommerce_review_order_after_payment' ); ?>
<?php endif; ?>
