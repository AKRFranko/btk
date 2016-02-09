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
<div class="btk-cart-option-headers">
  
  <div><?php _e('pick up.', 'btk'); ?></div><div><?php _e('Ship Ind.', 'btk'); ?></div><div><?php _e('Bundle 1', 'btk'); ?></div><div><?php _e('Bundle 2', 'btk'); ?></div><div><?php _e('Bundle 3', 'btk'); ?></div>
</div>
<div class="btk-cart-items">
<?php

foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
  
  echo btk_cart_item_html( $cart_item_key, $cart_item, 'delivery' );
}
?>
</div>

<?php
if(false){
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
              $variationID = $_product->get_variation_id();
              $stock_qty = get_post_meta($variationID,'_stock',true);
              // var_dump($stock_qty);
				      $stock_delay = get_post_meta($variationID,'_stock_backorder_delay',true);
				      $stock_wanted = $cart_item['quantity'];
				      $stock_avail = $stock_wanted <= $stock_qty ? '1 week' : btk_time_elapsed( strtotime($stock_delay));
						  echo  "$stock_avail";
				    ?>
		    </span>  
		    
		    <span class="selected-quantity">
		    <?php _e('qty', 'btk'); ?>: <?php echo $cart_item['quantity']; ?>
		    </span>
			</div>
			
			<div class="product-shipping-options">
			  
			  <?php if($cart_item_count > 1): ?>
        <?php 
         $chosen_methods = WC()->session->get( 'chosen_shipping_methods' );
 $chosen_shipping = $chosen_methods[0]; 
// var_dump($chosen_shipping); 
 ?>
				<!--<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]" value="ship_all"><?php _e('Ship item when complete order is ready', 'btk'); ?></label>-->
				<label><input type="radio"  name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]" value="dont_ship_it"></label>
				
				
				<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]" value="ship_when_ready"><?php _e('Ship item as soon as it\'s ready', 'btk'); ?></label>
				<?php endif; ?>
				<!--<label><input type="radio" name="item_shipping_method[<?php echo $cart_item['variation_id']; ?>]" value="ship_it_rush"><?php _e('Rush it for an extra $75.00. Item will leave the warehouse in 24 hours.', 'btk'); ?></label>-->
				
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
}
?>

