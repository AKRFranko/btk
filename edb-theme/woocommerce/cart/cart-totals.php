<?php
/**
 * Cart totals
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.6
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

?>
<div class="cart_totals <?php if ( WC()->customer->has_calculated_shipping() ) echo 'calculated_shipping'; ?>">

	<?php do_action( 'woocommerce_before_cart_totals' ); ?>

  <?php if( is_cart() ){ ?>
  <?php 
    $calculated = '--';
    $estimated_label = __( 'estimated shipping cost', 'edb' );
    if(!empty(WC()->customer->get_shipping_postcode()) ){
      $calculated = WC()->cart->get_cart_shipping_total();
      $estimated_label = sprintf(__( 'estimated shipping cost for %s', 'edb' ),'<b class="postcode">'.strtoupper(WC()->customer->get_shipping_postcode()).'</b>');
    }
    
    
    ?>
    <p class="total-line cart-subtotal"><span class="label"><?php _e( 'total', 'edb' ); ?></span><span class="value"><?php wc_cart_totals_subtotal_html(); ?></span></p>
    
    <p class="total-line cart-shipping"><span class="label"><?php echo $estimated_label ?></span><span class="value"><?php echo $calculated; ?></span></p>
    <p class="total-line cart-delay"><span class="label"><?php _e('estimated delay', 'edb'); ?></span><span class="value"><?php echo edb_latest_availability( WC()->cart ); ?></span></p>
    <?php woocommerce_shipping_calculator(); ?>
    <!--<p class="total-line cart-message">-->
    <!--  Lorem ipsum dolor sit amet, consectetur adipiscing elit. ut pellentesque vulputate venenatis. vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; donec ut lacinia ligula. aenean vel velit molestie, dapibus tortor eget, dignissim nibh.-->
    <!--</p>-->
    
    
  <?php };
    /*
	
<!--
	<table cellspacing="0">

		<tr class="cart-subtotal">
			<th> _e( 'subtotal', 'woocommerce' ); ?></th>
			<td> wc_cart_totals_subtotal_html(); ?></td>
		</tr>

		 foreach ( WC()->cart->get_coupons() as $code => $coupon ) : ?>
			<tr class="cart-discount coupon-<?php echo esc_attr( sanitize_title( $code ) ); ?>">
				<th> wc_cart_totals_coupon_label( $coupon ); ?></th>
				<td> wc_cart_totals_coupon_html( $coupon ); ?></td>
			</tr>
		 endforeach; ?>
     if( false ): ?>
     if (  WC()->cart->needs_shipping() && WC()->cart->show_shipping() ) : ?>

			 do_action( 'woocommerce_cart_totals_before_shipping' ); ?>

			 wc_cart_totals_shipping_html(); ?>

			 do_action( 'woocommerce_cart_totals_after_shipping' ); ?>

		 elseif (  WC()->cart->needs_shipping() ) : ?>

			<tr class="shipping">
				<th> _e( 'shipping', 'woocommerce' ); ?></th>
				<td> woocommerce_shipping_calculator(); ?></td>
			</tr>

		 endif; ?>
		 endif; ?>
		
    <tr class="shipping-total">
      <td>Shipping total</td>
      <td><?php echo WC()->cart->get_cart_shipping_total(); ?></td>
      <?php woocommerce_shipping_calculator(); ?>
    </tr>
		 foreach ( WC()->cart->get_fees() as $fee ) : ?>
			<tr class="fee">
				<th><?php echo esc_html( $fee->name ); ?></th>
				<td><?php wc_cart_totals_fee_html( $fee ); ?></td>
			</tr>
		 endforeach; ?>

		 if ( wc_tax_enabled() && WC()->cart->tax_display_cart == 'excl' ) : ?>
			 if ( get_option( 'woocommerce_tax_total_display' ) == 'itemized' ) : ?>
				 foreach ( WC()->cart->get_tax_totals() as $code => $tax ) : ?>
					<tr class="tax-rate tax-rate-<?php echo sanitize_title( $code ); ?>">
						<th><?php echo esc_html( $tax->label ); ?></th>
						<td><?php echo wp_kses_post( $tax->formatted_amount ); ?></td>
					</tr>
				 endforeach; ?>
			 else : ?>
				<tr class="tax-total">
					<th><?php echo esc_html( WC()->countries->tax_or_vat() ); ?></th>
					<td><?php wc_cart_totals_taxes_total_html(); ?></td>
				</tr>
			 endif; ?>
		 endif; ?>

		 do_action( 'woocommerce_cart_totals_before_order_total' ); ?>

		<tr class="order-total">
			<th> _e( 'Total', 'woocommerce' ); ?></th>
			<td> wc_cart_totals_order_total_html(); ?></td>
		</tr>

		 do_action( 'woocommerce_cart_totals_after_order_total' ); ?>

	</table>
	-->
	
   }; ?>
  
	 if ( false && WC()->cart->get_cart_tax() ) : ?>
		<p class="wc-cart-shipping-notice"><small>

			$estimated_text = WC()->customer->is_customer_outside_base() && ! WC()->customer->has_calculated_shipping()
				? sprintf( ' ' . __( ' (taxes estimated for %s)', 'woocommerce' ), WC()->countries->estimated_for_prefix() . __( WC()->countries->countries[ WC()->countries->get_base_country() ], 'woocommerce' ) )
				: '';

			printf( __( 'Note: Shipping and taxes are estimated%s and will be updated during checkout based on your billing and shipping information.', 'woocommerce' ), $estimated_text );

		?></small></p>
	 endif; 
	 */
	 ?>

	<div class="cart-checkout">
		<?php do_action( 'woocommerce_proceed_to_checkout' ); ?>

	</div>

	<?php do_action( 'woocommerce_after_cart_totals' ); ?>

</div>
