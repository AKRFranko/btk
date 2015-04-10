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
?>
<div class="shop_table woocommerce-checkout-review-order-table">
<?php
	do_action( 'woocommerce_review_order_before_cart_contents' );

	foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
		$_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );

		if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_checkout_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
			?>
			<div class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?> clearfix">
				<span class="product-name alignleft">
					<?php echo apply_filters( 'woocommerce_cart_item_name', $_product->get_title(), $cart_item, $cart_item_key ) . '&nbsp;'; ?>
					<?php echo apply_filters( 'woocommerce_checkout_cart_item_quantity', sprintf( '&times; %s', $cart_item['quantity'] ), $cart_item, $cart_item_key ); ?>
					<?php echo WC()->cart->get_item_data( $cart_item ); ?>
				</span>
				<span class="product-total alignright">
					<?php echo apply_filters( 'woocommerce_cart_item_subtotal', WC()->cart->get_product_subtotal( $_product, $cart_item['quantity'] ), $cart_item, $cart_item_key ); ?>
				</span>
			</div>
			<?php
		}
	}

	do_action( 'woocommerce_review_order_after_cart_contents' );
?>

		<div class="cart-subtotal clearfix">
			<span class="alignleft"><?php _e( 'Cart subtotal', 'woocommerce' ); ?></span>
			<span class="alignright"><?php wc_cart_totals_subtotal_html(); ?></span>
		</div>

		<div class="cart-discount clearfix coupon">
		<?php if ( count(WC()->cart->get_coupons()) > 0 ) : ?>
		<?php foreach ( WC()->cart->get_coupons() as $code => $coupon ) : ?>
			<span class="alignleft">Discount: <?php wc_cart_totals_coupon_label( $coupon ); ?></span>
			<span class="alignright"><?php wc_cart_totals_coupon_html( $coupon ); ?></span>
		<?php endforeach; ?>
		<?php else : ?>
			<span class="alignleft">Discount</span>
			<span class="alignright">-</span>
		<?php endif; ?>
		</div>

		<?php foreach ( WC()->cart->get_fees() as $fee ) : ?>
		<div class="fee clearfix">
			<span class="alignleft"><?php echo esc_html( $fee->name ); ?></span>
			<span class="alignright"><?php wc_cart_totals_fee_html( $fee ); ?></span>
		</div>
		<?php endforeach; ?>

		<?php if ( WC()->cart->tax_display_cart === 'excl' ) : ?>
			<?php if ( get_option( 'woocommerce_tax_total_display' ) === 'itemized' ) : ?>
				<?php foreach ( WC()->cart->get_tax_totals() as $code => $tax ) : ?>
					<div class="tax-rate clearfix tax-rate-<?php echo sanitize_title( $code ); ?>">
						<span class="alignleft"><?php echo esc_html( $tax->label ); ?></span>
						<span class="alignright"><?php echo wp_kses_post( $tax->formatted_amount ); ?></span>
					</div>
				<?php endforeach; ?>
			<?php else : ?>
				<div class="tax-total clearfix">
					<span class="alignleft"><?php echo esc_html( WC()->countries->tax_or_vat() ); ?></span>
					<span class="alignright"><?php echo wc_price( WC()->cart->get_taxes_total() ); ?></span>
				</div>
			<?php endif; ?>
		<?php endif; ?>

		<?php if ( WC()->cart->needs_shipping() && WC()->cart->show_shipping() ) : ?>

			<?php do_action( 'woocommerce_review_order_before_shipping' ); ?>

			<?php wc_cart_totals_shipping_html(); ?>

			<?php do_action( 'woocommerce_review_order_after_shipping' ); ?>

		<?php endif; ?>

		<?php do_action( 'woocommerce_review_order_before_order_total' ); ?>

		<div class="order-total clearfix">
			<span class="alignleft"><?php _e( 'Total', 'woocommerce' ); ?></span>
			<span class="alignright"><?php wc_cart_totals_order_total_html(); ?></span>
		</div>

		<?php do_action( 'woocommerce_review_order_after_order_total' ); ?>

</div>