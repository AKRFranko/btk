<?php
/**
 * The template for displaying product content in the single-product.php template
 *
 * Override this template by copying it to yourtheme/woocommerce/content-single-product.php
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php
foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
	$_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
	$product_id   = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );
	$categories = wp_get_post_terms( $_product->id, 'product_cat' );
	$category = $categories[count($categories) - 1];
  $json_data = json_encode( array( "price"=>$_product->price, "category"=>$category->slug  ));
	if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
		?>
		<div data-json="<?php echo htmlentities($json_data, ENT_QUOTES, 'UTF-8'); ?>" class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">

			<?php if ( ! is_checkout() ) { ?>
			<div class="product-remove alignright">
				<?php
					echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf( '<a href="%s" class="remove" title="%s">&times;</a>', esc_url( WC()->cart->get_remove_url( $cart_item_key ) ), __( 'Remove this item', 'btk' ) ), $cart_item_key );
				?>
			</div>
			<?php } ?>

			<div class="product-thumbnail">
				<?php
					$thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );
					if ( ! $_product->is_visible() )
						echo $thumbnail;
					else
						printf( '<a href="%s">%s</a>', $_product->get_permalink( $cart_item ), $thumbnail );
				?>
			</div>

			<div class="product-name">
				<?php
				  
					if ( ! $_product->is_visible() )
						echo apply_filters( 'woocommerce_cart_item_name', $_product->get_title(), $cart_item, $cart_item_key ) . '&nbsp;';
					else
						echo apply_filters( 'woocommerce_cart_item_name', sprintf( '<a href="%s">%s </a>', $_product->get_permalink( $cart_item ), $_product->get_title() ), $cart_item, $cart_item_key );
						
            
       				// Backorder notification
    //   				if ( $_product->backorders_require_notification() && $_product->is_on_backorder( $cart_item['quantity'] ) )
    //   					echo '<p class="backorder_notification">' . __( 'Available on backorder', 'btk' ) . '</p>';
				// 
				?>
				<span class="category">
				  <?php echo $category->name; ?>
				</span>
				<br />
				<span class="material">
			    <?php echo $cart_item['variation']['attribute_edb_material']; ?>
			 </span>
			 <br />
			
        <span class="availability">
            <?php
              $stock_qty = get_post_meta($cart_item['variation_id'],'_stock',true);
				      $stock_delay = get_post_meta($cart_item['variation_id'],'_stock_backorder_delay',true);
				      $stock_avail = $stock_qty > 0 ? '1 week' : btk_time_elapsed( strtotime($stock_delay));
						  echo  "$stock_avail";
				    ?>
		    </span>  
			</div>
			
			<div class="product-quantity">
				
				<?php
				// 	if ( $_product->is_sold_individually() ) {
				// 		$product_quantity = sprintf( '1 <input type="hidden" name="cart[%s][qty]" value="1" />', $cart_item_key );
				// 	} else {
				// 		$product_quantity = woocommerce_quantity_input( array(
				// 			'input_name'  => "cart[{$cart_item_key}][qty]",
				// 			'input_value' => $cart_item['quantity'],
				// 			'max_value'   => $_product->backorders_allowed() ? '' : $_product->get_stock_quantity(),
				// 			'min_value'   => '0'
				// 		), $_product, false );
				// 	}

				// 	echo apply_filters( 'woocommerce_cart_item_quantity', $product_quantity, $cart_item_key );
				?>
		
				<input type="number" class="qty" name="cart[<?php echo $cart_item_key; ?>][qty]" value="<?php echo $cart_item['quantity']; ?>">
			</div>
			<div class="product-price">
				<?php
					echo apply_filters( 'woocommerce_cart_item_price', WC()->cart->get_product_price( $_product ), $cart_item, $cart_item_key );
				?>
			</div>

			

			<?php
				if ( ! empty($cart_item['variation_id']) ) {
					foreach ( $cart_item['variation'] as $name => $value ) {
						if ( '' === $value )
							continue;

						$taxonomy = wc_attribute_taxonomy_name( str_replace( 'attribute_pa_', '', urldecode( $name ) ) );

						// If this is a term slug, get the term's nice name and description
						if ( taxonomy_exists( $taxonomy ) ) {
							$term = get_term_by( 'slug', $value, $taxonomy );
							if ( ! is_wp_error( $term ) && $term && $term->name ) {
			?>
			<div class="product-color">
				<span class="valign"><?php echo $term->name; ?></span>
				<a class="alignright" style="background-color: <?php echo $term->description; ?>">&nbsp;</a>
			</div>
			<?php
							}
						}
					}
				}
			?>
		</div>
		<?php
	}
}

?>

