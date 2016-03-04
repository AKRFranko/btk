<?php
if ( ! defined( 'ABSPATH' ) ) {
 
  exit;
}
?>
<?php 
//do_action( 'woocommerce_review_order_before_order_total' ); 
?>
<div class="cart-total cost-line">
  <span class="label"><?php _e('order total', 'edb'); ?></span>
  <span class="value"><?php wc_cart_totals_order_total_html(); ?></span>
</div>
<?php do_action( 'woocommerce_review_order_after_order_total' ); ?>

<div class="cart-subtotal cost-line">
  <span class="label"><?php _e( 'subtotal', 'edb' ); ?></span>
  <span class="value"><?php wc_cart_totals_subtotal_html(); ?></span>
</div>

<?php foreach ( WC()->cart->get_coupons() as $code => $coupon ) : ?>
  <div class="cart-discount cost-line coupon-<?php echo esc_attr( sanitize_title( $code ) ); ?>">
    
    
      <span class="label"><?php wc_cart_totals_coupon_label( $coupon ); ?></span>
      <span class="value"><?php wc_cart_totals_coupon_html( $coupon ); ?></span>
    
  </div>
<?php endforeach; ?>

<div class="cart-shipping-total cost-line">
  <span class="label"><?php _e('shipping', 'edb'); ?></span>
  <span class="value"><?php edb_cart_shipping_total();?></span>
</div>


<?php foreach ( WC()->cart->get_fees() as $fee ) : ?>
  <?php if( $fee->id == 'self-pickup-discount' ){ ?>
  <div class="fee cart-fee cost-line">
    <span class="label"><?php _e('self pickup discount', 'edb'); ?></span>
    <span class="value"><?php echo wc_price($fee->amount); ?></span>
  </div>
  
  <?php
  }else{
  ?>
  <div class="fee cart-fee cost-line">
    <span class="label"><?php echo esc_html( $fee->name ); ?></span>
    <span class="value"><?php wc_cart_totals_fee_html( $fee ); ?></span>
  </div>
<?php } ?>
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