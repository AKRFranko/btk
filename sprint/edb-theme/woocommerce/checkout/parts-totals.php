<?php
if ( ! defined( 'ABSPATH' ) ) {
 
  exit;
}
?>
<?php 
//do_action( 'woocommerce_review_order_before_order_total' ); 
?>
<div class="cart-total cost-line">
  <span class="label"><?php _e('Order Total', 'edb'); ?></span>
  <span class="value"><?php wc_cart_totals_order_total_html(); ?></span>
</div>
<?php do_action( 'woocommerce_review_order_after_order_total' ); ?>

<div class="cart-subtotal cost-line">
  <span class="label"><?php _e( 'Subtotal', 'edb' ); ?></span>
  <span class="value"><?php wc_cart_totals_subtotal_html(); ?></span>
</div>

<?php foreach ( WC()->cart->get_coupons() as $code => $coupon ) : ?>
  <div class="cart-discount cost-line coupon-<?php echo esc_attr( sanitize_title( $code ) ); ?>">
    
    <?php if($code !== 'selfserve'){ ?>
      <span class="label"><?php wc_cart_totals_coupon_label( $coupon ); ?></span>
      <span class="value"><?php wc_cart_totals_coupon_html( $coupon ); ?></span>
    <?php }else{ ?>
      <span class="label">Self serve discount</span>
      <span class="value">-<?php echo wc_price(WC()->cart->get_coupon_discount_amount('selfserve',WC()->cart->display_cart_ex_tax )); ?></span>
    <?php };?>
  </div>
<?php endforeach; ?>

<div class="cart-shipping-total cost-line">
  <span class="label"><?php _e('Shipping', 'edb'); ?></span>
  <span class="value"><?php edb_cart_shipping_total();?></span>
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