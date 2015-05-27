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
		<div class="edb-slider">
			<?php btk_edb_single_product_slider();?>
			<div class="controls">
				<a class="prev" href="#"><span class="icon-arrow-lite-left-black"></span></a>
					<span class="index">0</span>
					<span class="separator"> | </span>
					<span class="total"> 5 </span>
				<a class="next" href="#"><span class="icon-arrow-lite-right-black"></span></a>
				<?php if ( $product->is_in_stock() ) { ?>
			<span class="in-stock"<?php if ( count( $product->get_gallery_attachment_ids() ) > 0 ) { echo ' style="bottom:80px;"'; } ?>>in stock</span>
		<?php } ?>
			</div>
		</div>

		
	</div>


	<?php
		if ( $product->is_type('variable') ) {
			$available_variations = $product->get_available_variations();
			$attributes = $product->get_variation_attributes();
			$selected_attributes = $product->get_variation_default_attributes();
	?>
	<div class="product-color-choice clearfix">
		<p class="center">select color</p>
		<ul>
		<?php foreach ( $attributes['edb_material'] as $color ){
			$current = $_REQUEST[ 'attribute_edb_material' ] === $color ? 'current' : '';
			$src = get_bloginfo('template_directory'). "/img/textures/$color.jpg";
			$html = '<li><a href="#" data-variation="'.sanitize_title($color).'" title="'.sanitize_title($color).'" class="product-color-choice-option edb-material-'.sanitize_title($color).'">';
			$html .= '<img class=\"material\" src="'.$src.'">';
			$html .= '</a></li>';
			echo $html;
		}; ?>
		
	
		</ul>
	</div>
	<?php } ?>


	<div class="product-summary">
		<h2 class="product-title upper"><?php the_title(); ?></h2>
		<p class="product-price">_ <?php echo $product->get_price_html(); ?></p>
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
