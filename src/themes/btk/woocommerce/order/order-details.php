<?php
/**
 * Order details
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

$order = wc_get_order( $order_id );

?>

<div class="order-details">
	<h2><?php _e( 'Order Details', 'btk' ); ?></h2>

	<div class="shop_table order_details">
		<?php
		if ( sizeof( $order->get_items() ) > 0 ) {

			foreach( $order->get_items() as $item_id => $item ) {
				$_product  = apply_filters( 'woocommerce_order_item_product', $order->get_product_from_item( $item ), $item );
				$item_meta = new WC_Order_Item_Meta( $item['item_meta'], $_product );

				if ( apply_filters( 'woocommerce_order_item_visible', true, $item ) ) {
					?>
					<div class="<?php echo esc_attr( apply_filters( 'woocommerce_order_item_class', 'order_item', $item, $order ) ); ?> clearfix">
						<span class="product-name alignleft">
							<?php
								if ( $_product && ! $_product->is_visible() ) {
									echo apply_filters( 'woocommerce_order_item_name', $item['name'], $item );
								} else {
									echo apply_filters( 'woocommerce_order_item_name', sprintf( '<a href="%s">%s</a>', get_permalink( $item['product_id'] ), $item['name'] ), $item );
								}

								echo apply_filters( 'woocommerce_order_item_quantity_html', ' <strong class="product-quantity">' . sprintf( '&times; %s', $item['qty'] ) . '</strong> ', $item );

								// Allow other plugins to add additional product information here
								do_action( 'woocommerce_order_item_meta_start', $item_id, $item, $order );

								$item_meta->display();

								if ( $_product && $_product->exists() && $_product->is_downloadable() && $order->is_download_permitted() ) {

									$download_files = $order->get_item_downloads( $item );
									$i              = 0;
									$links          = array();

									foreach ( $download_files as $download_id => $file ) {
										$i++;

										$links[] = '<small><a href="' . esc_url( $file['download_url'] ) . '">' . sprintf( __( 'Download file%s', 'btk' ), ( count( $download_files ) > 1 ? ' ' . $i . ': ' : ': ' ) ) . esc_html( $file['name'] ) . '</a></small>';
									}

									echo '<br/>' . implode( '<br/>', $links );
								}

								// Allow other plugins to add additional product information here
								do_action( 'woocommerce_order_item_meta_end', $item_id, $item, $order );
							?>
						</span>
						<span class="product-total alignright">
							<?php echo $order->get_formatted_line_subtotal( $item ); ?>
						</span>
					</div>
					<?php
				}

				if ( $order->has_status( array( 'completed', 'processing' ) ) && ( $purchase_note = get_post_meta( $_product->id, '_purchase_note', true ) ) ) {
					?>
					<div class="product-purchase-note">
						<span><?php echo wpautop( do_shortcode( wp_kses_post( $purchase_note ) ) ); ?></span>
					</div>
					<?php
				}
			}
		}

		do_action( 'woocommerce_order_items_table', $order );
		?>

	<?php
		$has_refund = false;

		if ( $total_refunded = $order->get_total_refunded() ) {
			$has_refund = true;
		}

		if ( $totals = $order->get_order_item_totals() ) {
			foreach ( $totals as $key => $total ) {
				$value = $total['value'];

				// Check for refund
				if ( $has_refund && $key === 'order_total' ) {
					$refunded_tax_del = '';
					$refunded_tax_ins = '';

					// Tax for inclusive prices
					if ( wc_tax_enabled() && 'incl' == $order->tax_display_cart ) {

						$tax_del_array = array();
						$tax_ins_array = array();

						if ( 'itemized' == get_option( 'woocommerce_tax_total_display' ) ) {

							foreach ( $order->get_tax_totals() as $code => $tax ) {
								$tax_del_array[] = sprintf( '%s %s', $tax->formatted_amount, $tax->label );
								$tax_ins_array[] = sprintf( '%s %s', wc_price( $tax->amount - $order->get_total_tax_refunded_by_rate_id( $tax->rate_id ), array( 'currency' => $order->get_order_currency() ) ), $tax->label );
							}

						} else {
							$tax_del_array[] = sprintf( '%s %s', wc_price( $order->get_total_tax(), array( 'currency' => $order->get_order_currency() ) ), WC()->countries->tax_or_vat() );
							$tax_ins_array[] = sprintf( '%s %s', wc_price( $order->get_total_tax() - $order->get_total_tax_refunded(), array( 'currency' => $order->get_order_currency() ) ), WC()->countries->tax_or_vat() );
						}

						if ( ! empty( $tax_del_array ) ) {
							$refunded_tax_del .= ' ' . sprintf( __( '(Includes %s)', 'btk' ), implode( ', ', $tax_del_array ) );
						}

						if ( ! empty( $tax_ins_array ) ) {
							$refunded_tax_ins .= ' ' . sprintf( __( '(Includes %s)', 'btk' ), implode( ', ', $tax_ins_array ) );
						}
					}

					$value = '<del>' . strip_tags( $order->get_formatted_order_total() ) . $refunded_tax_del . '</del> <ins>' . wc_price( $order->get_total() - $total_refunded, array( 'currency' => $order->get_order_currency() ) ) . $refunded_tax_ins . '</ins>';
				}
				?>
				<div class="order clearfix">
					<span class="alignleft"><?php echo $total['label']; ?></span>
					<span class="alignright"><?php echo $value; ?></span>
				</div>
				<?php
			}
		}

		// Check for refund
		if ( $has_refund ) { ?>
			<tr>
				<th scope="row"><?php _e( 'Refunded:', 'btk' ); ?></th>
				<td>-<?php echo wc_price( $total_refunded, array( 'currency' => $order->get_order_currency() ) ); ?></td>
			</tr>
		<?php
		}

		// Check for customer note
		if ( '' != $order->customer_note ) { ?>
			<tr>
				<th scope="row"><?php _e( 'Note:', 'btk' ); ?></th>
				<td><?php echo wptexturize( $order->customer_note ); ?></td>
			</tr>
		<?php } ?>

	</div>
</div>

<?php do_action( 'woocommerce_order_details_after_order_table', $order ); ?>



<div class="customer-details clearfix">
	<h2><?php _e( 'Customer details', 'btk' ); ?></h2>
	<p>
	<?php
		if ( $order->billing_email ) {
			echo '<span>' . __( 'Email:', 'btk' ) . '&nbsp;&nbsp;' . $order->billing_email . '</span>';
		}

		if ( $order->billing_phone ) {
			echo '<span>' . __( 'Telephone:', 'btk' ) . '&nbsp;&nbsp;' . $order->billing_phone . '</span>';
		}

		// Additional customer details hook
		do_action( 'woocommerce_order_details_after_customer_details', $order );
	?>
	</p>

<?php if ( ! wc_ship_to_billing_address_only() && $order->needs_shipping_address() && get_option( 'woocommerce_calc_shipping' ) !== 'no' ) : ?>

<?php endif; ?>

	<div>
		<h3><?php _e( 'Billing Address', 'btk' ); ?></h3>
		<address>
			<?php
				if ( ! $order->get_formatted_billing_address() ) {
					_e( 'N/A', 'btk' );
				} else {
					echo $order->get_formatted_billing_address();
				}
			?>
		</address>
	</div>

<?php if ( ! wc_ship_to_billing_address_only() && $order->needs_shipping_address() && get_option( 'woocommerce_calc_shipping' ) !== 'no' ) : ?>

	<div>
		<h3><?php _e( 'Shipping Address', 'btk' ); ?></h3>
		<address>
			<?php
				if ( ! $order->get_formatted_shipping_address() ) {
					_e( 'N/A', 'btk' );
				} else {
					echo $order->get_formatted_shipping_address();
				}
			?>
		</address>
	</div>

<?php endif; ?>

</div>

