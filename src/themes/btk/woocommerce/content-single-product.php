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

global $post, $product, $woocommerce;

$attachment_ids = $product->get_gallery_attachment_ids();

?>

<?php
	/**
	 * woocommerce_before_single_product hook
	 *
	 * @hooked wc_print_notices - 10
	 */
	 do_action( 'woocommerce_before_single_product' );

	 if ( post_password_required() ) {
	 	echo get_the_password_form();
	 	return;
	 }
?>

<div itemscope itemtype="<?php echo woocommerce_get_product_schema(); ?>" id="product-<?php the_ID(); ?>" <?php post_class(); ?>>


	<div class="product-images">
		<ul class="<?php if ( count( $product->get_gallery_attachment_ids() ) > 0 ) { echo 'product-slider'; } ?>">
		<?php
			if ( has_post_thumbnail() ) {

				$image_title 	= esc_attr( get_the_title( get_post_thumbnail_id() ) );
				$image_link  	= wp_get_attachment_url( get_post_thumbnail_id() );

				echo '<li><img src="' . $image_link . '" alt="' . $image_title . '"></li>';

			} else {

				echo apply_filters( 'woocommerce_single_product_image_html', sprintf( '<li><img src="%s" alt="%s" /></li>', wc_placeholder_img_src(), __( 'Placeholder', 'woocommerce' ) ), $post->ID );

			}

		?>

		<?php
			if ( $attachment_ids ) {

				foreach ( $attachment_ids as $attachment_id ) {

					$image_link = wp_get_attachment_url( $attachment_id );
					$image_title = esc_attr( get_the_title( $attachment_id ) );

					echo '<li><img src="' . $image_link . '" alt="' . $image_title . '"></li>';

				}
			}
		?>
		</ul>

		<?php if ( $product->is_in_stock() ) { ?>
		<span class="in-stock"<?php if ( count( $product->get_gallery_attachment_ids() ) > 0 ) { echo ' style="bottom:80px;"'; } ?>>in stock</span>
		<?php } ?>

		<?php if ( count( $product->get_gallery_attachment_ids() ) > 0 ) { ?>
		<div class="product-slider-controls">
			<span id="controls-prev" class="icon-arrow-lite-left-black"></span>
			<span id="controls-next" class="icon-arrow-lite-right-black"></span>
		</div>
		<?php } ?>
	</div>


	<div class="product-summary">
		<h2 class="product-title"><?php the_title(); ?></h2>
		<p class="product-price"><?php echo $product->get_price_html(); ?></p>
	</div>


	<div class="product-description clearfix">
		<p class="desc"><?php echo get_the_content(); ?></p>
		<p class="right">
			<a href="" download="" class="upper pr-pdf">PDF</a>
			<a href="" class="pr-rev">Customer reviews</a>
		</p>
	</div>

	<?php comments_template( 'single-product-reviews.php' ); ?>

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


	<meta itemprop="url" content="<?php the_permalink(); ?>" />

</div><!-- #product-<?php the_ID(); ?> -->

<?php do_action( 'woocommerce_after_single_product' ); ?>
