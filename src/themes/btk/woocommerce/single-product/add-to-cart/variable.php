<?php
/**
 * Variable product add to cart
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

global $product, $post;

$term_name = reset($selected_attributes);
$term_slug = '';
$terms = wc_get_product_terms($product->id, key($selected_attributes), array( 'fields' => 'all' ));
foreach ($terms as $term) {
	if ($term_name === $term->slug) {
		$term_slug = $term->name;
		$term_desc = $term->description;
	}
}

?>

<?php do_action( 'woocommerce_before_add_to_cart_form' ); ?>


<form class="variations_form cart" method="post" enctype='multipart/form-data' data-product_id="<?php echo $post->ID; ?>" data-product_variations="<?php echo esc_attr( json_encode( $available_variations ) ) ?>">
	<?php if ( ! empty( $available_variations ) ) : ?>

		<?php foreach ( $attributes as $name => $options ) : ?>
		<input type="hidden" class="<?php echo esc_attr( sanitize_title( $name ) ); ?>" name="attribute_<?php echo sanitize_title( $name ); ?>" data-attribute_name="attribute_<?php echo sanitize_title( $name ); ?>" value="<?php echo $term_slug; ?>" />
		<?php
			if ( is_array( $options ) ) {

				if ( isset( $_REQUEST[ 'attribute_' . sanitize_title( $name ) ] ) ) {
					$selected_value = $_REQUEST[ 'attribute_' . sanitize_title( $name ) ];
				} elseif ( isset( $selected_attributes[ sanitize_title( $name ) ] ) ) {
					$selected_value = $selected_attributes[ sanitize_title( $name ) ];
				} else {
					$selected_value = '';
				}

				// Get terms if this is a taxonomy - ordered
				if ( taxonomy_exists( $name ) ) {

					$terms = wc_get_product_terms( $post->ID, $name, array( 'fields' => 'all' ) );

					foreach ( $terms as $term ) {
						if ( ! in_array( $term->slug, $options ) ) { continue; }

						$variation = 0;
						foreach ($available_variations as $color) {
							if ( $color['attributes']['attribute_' . $name] == $term->slug ) {
								$variation = $color['variation_id'];
								if ($selected_value == $term->slug) {
									$default_variation_id = $variation;
								}
							}
						}
					}
				}
			}
		?>
		<?php endforeach;?>

		<?php do_action( 'woocommerce_before_add_to_cart_button' ); ?>

		<div class="single_variation_wrap" style="display:block;">
			<?php do_action( 'woocommerce_before_single_variation' ); ?>

			<input type="hidden" name="add-to-cart" value="<?php echo $product->id; ?>" />
			<input type="hidden" name="product_id" value="<?php echo esc_attr( $post->ID ); ?>" />
			<input type="hidden" name="variation_id" class="variation_id" value="<?php echo $default_variation_id; ?>" />
      
      
      <p class="product-color clearfix">
        <?php if(empty($term_name)){ $term_name = 'color'; }; ?>
				<span class="valign"><?php echo $term_name; ?></span>
        			
				<span class="alignright" style="background-color:<?php echo $term_desc; ?>">&nbsp;</span>
				<a class="material-info-trigger" href="#">i</a>	
			</p>
			<?php woocommerce_quantity_input(); ?>
			<p class="qty-text">
				<span><?php _e('Quantity', 'btk'); ?></span>

			</p>
      <p class="price-text">
    
      </p>
			<p class="product-variation-availability-delay"><?php _e('availability'); ?></p>
      
			
			<div class="product-button-wrap">
			  <span><?php echo $product->single_add_to_cart_text(); ?></span><button type="submit" class="icon-arrow-lite-right-white"></button>
			</div>
			

			<?php do_action( 'woocommerce_after_single_variation' ); ?>
		</div>

		<?php do_action( 'woocommerce_after_add_to_cart_button' ); ?>

	<?php else : ?>

		<p class="stock out-of-stock"><?php _e( 'This product is currently out of stock and unavailable.', 'btk' ); ?></p>

	<?php endif; ?>

</form>

<?php do_action( 'woocommerce_after_add_to_cart_form' ); ?>
