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
				      $stock_avail = $stock_qty > 0 ? '' : btk_time_elapsed( strtotime($stock_delay));
						  echo  "$stock_avail";
				    ?>
		    </span>  
		    <br />
		    <span class="selected-quantity">
		    <?php _e('qty', 'btk'); ?>: <?php echo $cart_item['quantity']; ?>
		    </span>
			</div>
			</div>
			
		
		<?php
	}
}

?>

