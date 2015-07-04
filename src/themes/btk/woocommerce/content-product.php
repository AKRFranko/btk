<?php
/**
 * The template for displaying product content within loops.
 *
 * Override this template by copying it to yourtheme/woocommerce/content-product.php
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

global $product, $woocommerce_loop;

// Store loop count we're currently on
if ( empty( $woocommerce_loop['loop'] ) )
	$woocommerce_loop['loop'] = 0;

// Store column count for displaying the grid
if ( empty( $woocommerce_loop['columns'] ) )
	$woocommerce_loop['columns'] = apply_filters( 'loop_shop_columns', 4 );

// Ensure visibility
if ( ! $product || ! $product->is_visible() )
	return;

// Increase loop count
$woocommerce_loop['loop']++;

// Extra post classes
$classes = array();
if ( 0 == ( $woocommerce_loop['loop'] - 1 ) % $woocommerce_loop['columns'] || 1 == $woocommerce_loop['columns'] )
	$classes[] = 'first';
if ( 0 == $woocommerce_loop['loop'] % $woocommerce_loop['columns'] )
	$classes[] = 'last';
?>
<li <?php post_class( $classes ); ?>>

	<?php do_action( 'woocommerce_before_shop_loop_item' ); ?>

	<a href="<?php the_permalink(); ?>" class="product-image">

		<?php
			/**
			 * woocommerce_before_shop_loop_item_title hook
			 *
			 * @hooked woocommerce_show_product_loop_sale_flash - 10
			 * @hooked woocommerce_template_loop_product_thumbnail - 10
			 */
			do_action( 'woocommerce_before_shop_loop_item_title' );
		?>

		<?php if ( $product->is_in_stock() ) { ?>
		<span class="in-stock"><?php _e('in stock', 'btk'); ?></span>
		<?php } ?>

	</a>

	<div class="product-desc lower">
		<a href="<?php the_permalink(); ?>">
			<span class="product-title upper"><?php the_title(); ?> <span data-text="<?php _e('shop', 'btk' ); ?>" class="shopnow"></span></span>
			<span class="product-price">_ <?php echo $product->get_price_html(); ?></span>
		</a>
		<?php the_excerpt(); ?>
		<span class="icon-chevron-lite-right-black"></span>
	</div>

	<?php

		/**
		 * woocommerce_after_shop_loop_item hook
		 *
		 * @hooked woocommerce_template_loop_add_to_cart - 10
		 */
		do_action( 'woocommerce_after_shop_loop_item' );

	?>


<?php if ( is_page('lookbook') ) { ?>

	<?php
		if ( $product->is_type('variable') ) {
			$available_variations = $product->get_available_variations();
			$attributes = $product->get_variation_attributes();
			$selected_attributes = $product->get_variation_default_attributes();
	?>
	<div class="product-color-choice clearfix">
		<p class="center"><?php _e('select color', 'btk'); ?></p>
		<?php foreach ( $attributes as $name => $options ) : ?>
		<ul>
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

						echo '<li style="background-color:' . $term->description . '"><a data-variation="' . $variation . '" title="' . apply_filters( 'woocommerce_variation_option_name', $term->name ) . '"></a></li>';
					}
				}
			}
		?>
		</ul>
		<?php endforeach;?>
	</div>
	<?php } ?>

	<div class="product-add">
		<?php
			if ( $product->is_type('variable') ) {
				wp_enqueue_script( 'wc-add-to-cart-variation' );
				wc_get_template( 'single-product/add-to-cart/variable.php', array(
					'available_variations'  => $product->get_available_variations(),
					'attributes'   			=> $product->get_variation_attributes(),
					'selected_attributes' 	=> $product->get_variation_default_attributes()
				) );
			} else {
				wc_get_template( 'single-product/add-to-cart/simple.php' );
			}
		?>
	</div>

<?php } ?>

</li>
