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
$cart_item_count = WC()->cart->cart_contents_count;
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
			    <?php 
				    $attributes = $_product->get_variation_attributes(); 
				    $variationID = $attributes['attribute_edb_material'];
				    echo btk_material_name($variationID);
				  ?>
			 </span>
			 <br />
			
        <span class="availability">
            <?php
              // var_dump($cart_item);
              $stock_qty = get_post_meta($cart_item['variation_id'],'_stock',true);
				      $stock_delay = get_post_meta($cart_item['variation_id'],'_stock_backorder_delay',true);
				      $stock_avail = $stock_qty > 0 ? '1 week' : btk_time_elapsed( strtotime($stock_delay));
						  echo  "$stock_avail";
				    ?>
		    </span>  
		    <br />
		    <span class="selected-quantity">
		    <?php _e('qty', 'btk'); ?>: <?php echo $cart_item['quantity']; ?>
		    </span>
			</div>
			
			<div class="product-shipping-options">
			  <?php if($cart_item_count > 1): ?>
				<label><input checked type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]"><?php _e('Ship item when complete order is ready', 'btk'); ?></label>
				<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]"><?php _e('Ship item as soon as it\'s ready', 'btk'); ?></label>
				<?php endif; ?>
				<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]"><?php _e('Rush it for an extra $75.00. Item will leave the warehouse in 24 hours.', 'btk'); ?></label>
				<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]"><?php _e('Self pick up. No delivery', 'btk'); ?></label>
			</div>
			
      <div class="cart-item-buttons">
      	<?php
					echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf( '<a href="%s" class="cart-item-remove" title="remove">%s</a>', esc_url( WC()->cart->get_remove_url( $cart_item_key ) ), __( 'remove', 'btk' ) ), $cart_item_key );
				?>
        
        <a class="cart-item-edit" href="<?php echo esc_url(home_url('/')); ?>cart?guest=<?php echo $_GET['guest'] ?>">edit</a>
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

