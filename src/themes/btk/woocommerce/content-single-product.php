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

	 $pin_image = '';
	 if ( has_post_thumbnail() ) {
	 	$pin_image = wp_get_attachment_url( get_post_thumbnail_id() );
	 }
?>

<div itemscope itemtype="<?php echo woocommerce_get_product_schema(); ?>" id="product-<?php the_ID(); ?>" <?php post_class(); ?>>

	<div class="product-images loading">
	<?php if ( ! count( $product->get_gallery_attachment_ids() ) > 0 ) { ?>
		<div class="single-image">
		<?php
			if ( has_post_thumbnail() ) {
				$image_title 	= esc_attr( get_the_title( get_post_thumbnail_id() ) );
				$image_link  	= wp_get_attachment_url( get_post_thumbnail_id() );
				echo '<img src="' . $image_link . '" alt="' . $image_title . '">';
			} else {
				echo apply_filters( 'woocommerce_single_product_image_html', sprintf( '<img src="%s" alt="%s" />', wc_placeholder_img_src(), __( 'Placeholder', 'woocommerce' ) ), $post->ID );
			}
		?>

		</div>

		<?php } else { ?>
		<div class="edb-slider">
			<?php btk_edb_single_product_slider();?>
			<div class="controls">
				<a class="prev" href="#"><span class="icon-arrow-lite-left-black"></span></a>
					<span class="index"> - </span>
					<span class="separator"> | </span>
					<span class="total"> - </span>
				<a class="next" href="#"><span class="icon-arrow-lite-right-black"></span></a>

			</div>
		</div>
	<?php } ?>
	</div>


	<?php
		if ( $product->is_type('variable') ) {
			$available_variations = $product->get_available_variations();
			$attributes = $product->get_variation_attributes();
			$selected_attributes = $product->get_variation_default_attributes();
	?>
	<div id="user-product-settings">
	<div class="product-color-choice">
		<p class="center">
		  <?php _e('select color', 'btk'); ?> <b class="colorname"></b>
		</p>
		<ul>
		<?php
			$count = 0;
			

			foreach ( $attributes['edb_material'] as $color ){
				foreach( $available_variations as $variation){
          if($variation['attributes']['attribute_edb_material'] === $color){
            $variation_id = $variation['variation_id'];
          };
        };
				$current = $_REQUEST[ 'attribute_edb_material' ] === $color ? 'current' : '';
				$galleryImageID = get_post_meta( get_the_ID(), "_product_variation_image_$color", true );
				$galleryImageSRC = wp_get_attachment_image_src($galleryImageID, 'large')[0];
				$stock_qty = get_post_meta($variation_id,'_stock',true);
				$stock_delay = get_post_meta($variation_id,'_stock_backorder_delay',true);
				$stock_avail = $stock_qty > 0 ? '' : date('Y-m-d', strtotime($stock_delay));
				$stock_msg = $stock_qty > 0 ? 'in stock' : '';
				$stock_class = $stock_qty > 0 ? 'instock' : '';
				$src = get_bloginfo('template_directory'). "/img/textures/$color.jpg";
				$html = '<li><a href="#" data-variation-availability-delay="'.$stock_avail.'" data-variation-image="'.$galleryImageSRC.'" data-variation="'.sanitize_title($color).'" data-variation-attribute="attribute_edb_material" data-variation-id="'.$variation_id.'" title="'.sanitize_title($color).'" class="product-color-choice-option edb-material-'.sanitize_title($color).'">';
				$html .= '<img class=\"material\" src="'.$src.'">';
				$html .= "<b class=\"$stock_class\">$stock_msg</b>";
				$html .= '</a></li>';
				echo $html;
				$count++;
			};
			while($count < 14){
				$count++;
				echo '<li><a href="#" class="na"></a></li>';
			}
		?>
		</ul>
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
  </div><!-- #user-product-settings -->


	<div class="product-summary">
		<h2 class="product-title upper"><?php the_title(); ?></h2>
		<p class="product-price valign">_ <?php echo $product->get_price_html(); ?></p>
		<p class="sharing alignright">
			<a href="https://www.facebook.com/sharer.php?u=<?php echo get_permalink(); ?>" class="fa fa-facebook-square" title="<?php _e('Share to facebook', 'btk'); ?>" target="_blank">
			</a>
			<a href="https://twitter.com/share?text=<?php echo rawurlencode(get_the_title() . ' on element de base'); ?>&amp;url=<?php echo get_permalink(); ?>&amp;via=elementdebase" class="fa fa-twitter-square" title="<?php _e('Share to twitter', 'btk'); ?>" target="_blank"></a>
			<span class="fa fa-pinterest-square" title="<?php _e('Share to pinterest', 'btk'); ?>">
				<a href="//fr.pinterest.com/pin/create/button/?url=<?php echo get_permalink(); ?>&amp;media=<?php echo $pin_image; ?>&amp;description=<?php echo rawurlencode(get_the_title()); ?>" data-pin-do="buttonPin" data-pin-config="none">
					<img src="//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png" alt="pinterest" /></a>
				<script type="text/javascript" async defer src="//assets.pinterest.com/js/pinit.js"></script>
			</span>
		</p>
	</div>


	<div class="product-description clearfix">
		<p class="desc"><?php echo get_the_content(); ?></p>
		
		<p class="tech"><?php echo btk_product_technical_drawing(); ?></p>
		<p class="right">
		  <?php echo btk_product_pdf_link( get_the_ID(), $post->post_name ); ?>
		
			<!-- <a href="" class="pr-rev"><?php _e('Customer reviews', 'btk'); ?></a> -->
		</p>
	</div>


	<?php //comments_template( 'single-product-reviews.php' ); ?>

	

	<?php if (! empty( $_COOKIE['woocommerce_recently_viewed'] ) ) { ?>
	  <h2><?php _e('Recently viewed', 'btk'); ?></h2>
    <?php btk_recently_viewed(); ?>
	<?php } ?>


	<meta itemprop="url" content="<?php the_permalink(); ?>" />

</div>


<?php do_action( 'woocommerce_after_single_product' ); ?>
