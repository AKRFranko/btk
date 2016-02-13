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
	 global $product;
	 $product_id = get_the_ID();
	 $edb_product = edb_decorated_product( $product_id );
?>

<div itemscope itemtype="<?php echo woocommerce_get_product_schema(); ?>" id="product-<?php the_ID(); ?>" <?php post_class(); ?>>

  <div class="product-sections">
    
    <div class="product-slideshow">
      <?php edb_product_slideshow( $product_id ); ?>
    </div>
    
    <div class="product-info">
      
      <div class="product-name"><?php echo $edb_product->title; ?></div>
      <div class="product-subname"><?php echo $edb_product->subtitle; ?></div>
      
      <div class="product-price">$<?php echo $edb_product->price; ?></div>
      
      <div class="product-share">
        <ul class="social-share-options">
          <li class="social-share-option"><a href="#" class="social-link">F</a></li>
          <li class="social-share-option"><a href="#" class="social-link">T</a></li>
          <li class="social-share-option"><a href="#" class="social-link">P</a></li>
        </ul>
      </div>
      
    </div>
    <div class="product-description">
      <h2 class="section-title"><?php _e('Description', 'edb'); ?></h2>
      <p><?php echo $edb_product->description; ?></p>
      <?php edb_product_pdf( $product_id ); ?>
      <!--<button id="product-pdf-download" class="">downlaod pdf</button>-->
    </div>
    
    <div class="product-menu">
        <?php
        // $attribute_keys = array_keys( $attributes );
        $available_variations = $edb_product->variations;
        do_action( 'woocommerce_before_add_to_cart_form' ); ?>
        
        <form class="variations_form cart" method="post" enctype='multipart/form-data' data-product_id="<?php echo absint( $product->id ); ?>" data-product_variations="<?php echo esc_attr( json_encode( $available_variations ) ) ?>">
          <?php do_action( 'woocommerce_before_variations_form' ); ?>
          
          <?php if ( empty( $available_variations ) && false !== $available_variations ) : ?>
            <div class="product-color-choices">
              <p class="stock out-of-stock"><?php _e( 'This product is currently out of stock and unavailable.', 'woocommerce' ); ?></p>
            </div>
          <?php else : ?>
            <div class="product-color-choices">
              <?php edb_product_material_picker( $product->id ); ?>
            </div>
          
          
            <?php do_action( 'woocommerce_before_add_to_cart_button' ); ?>
            
            
              <?php edb_add_to_cart_button( $product->id ); ?>
            

            <?php do_action( 'woocommerce_after_add_to_cart_button' ); ?>
          <?php endif; ?>
        
          <?php do_action( 'woocommerce_after_variations_form' ); ?>
          <small>✓ = <?php _e('In Stock'); ?></small>
        </form>
        
        <?php do_action( 'woocommerce_after_add_to_cart_form' ); ?>
        
    </div><!-- .product-menu -->
    
  </div><!-- .product-sections -->
  <div class="product-sub-sections">
    <div class="product-sub-section">
      
      <div class="product-technical-image">
        <?php 
          if(edb_has_tech_image( $product->id )){ 
            edb_product_tech_image( $product->id  );
          };
        ?>
      </div>
      <div class="product-introduction-video">
        <?php edb_product_video_link( $product->id, 'introduction' ); ?>
        <!--<a class="yt-thumb" href="https://www.youtube.com/embed/_qogwJT4QxI">-->
        <!--  <img src="https://img.youtube.com/vi/_qogwJT4QxI/mqdefault.jpg">-->
        <!--</a>-->
      </div>
      
    </div>
    <div class="product-sub-section">
      <div class="product-designer-text">
        <h2 class="section-title">DESIGNER</h2>
        
        <p>
          a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat.
        </p>
      </div>
      <div class="product-designer-image">
        <span class="round-image-wrapper"><img src="https://development.elementdebase.com/wp-content/themes/btk/img/kalle-lasn.jpg"></span>
      </div>
    </div>
    <div class="product-sub-section">
      <div class="product-instruction-video">
        <h2 class="section-title"><?php _e('Assembly Instructions', 'edb'); ?></h2>
        <?php edb_product_video_link( $product->id, 'instruction' ); ?>
        <!--<a class="yt-thumb" href="https://www.youtube.com/embed/_qogwJT4QxI">-->
        <!--  <img src="https://img.youtube.com/vi/_qogwJT4QxI/mqdefault.jpg">-->
        <!--</a>-->
      </div>
      <div class="product-detailed-information">
        <h2 class="section-title"><?php _e('Materials and Dimensions', 'edb'); ?></h2>
        <p>a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat.</p>
      </div>
    </div>
    
    <div class="product-sub-section">
      <div class="product-shipping-return-text">
        <h2 class="section-title"><?php _e('Shipping and Return', 'edb'); ?></h2>
        <p>a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat.</p>
      </div>
      <div class="product-shipping-return-image">
        <span class="round-image-wrapper"></span>
      </div>
    </div>
    
    <div class="product-sub-section">
      <div class="product-sidekick" style="background-image:url(/wp-content/themes/btk/img/diagram.jpg);">
        <div>
          <h2>Special content</h2>
          <p>wooooo</p>
        </div>
      </div>
      
    </div>
    
    <div class="product-sub-section">
      <div class="product-review-text">
        <h2 class="section-title"><?php _e('Why HEather Loves this model', 'edb'); ?></h2>
        <p>a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat.</p>
      </div>
      <div class="product-review-image">
        <span class="round-image-wrapper"></span>
      </div>
    </div>
  </div>
  

  


	<!--<div class="summary entry-summary">

		<?php
			/**
			 * woocommerce_single_product_summary hook
			 *
			 * @hooked woocommerce_template_single_title - 5
			 * @hooked woocommerce_template_single_rating - 10
			 * @hooked woocommerce_template_single_price - 10
			 * @hooked woocommerce_template_single_excerpt - 20
			 * @hooked woocommerce_template_single_add_to_cart - 30
			 * @hooked woocommerce_template_single_meta - 40
			 * @hooked woocommerce_template_single_sharing - 50
			 */
			 
			//do_action( 'woocommerce_single_product_summary' );
		?>

	</div><!-- .summary -->

	<?php
		/**
		 * woocommerce_after_single_product_summary hook
		 *
		 * @hooked woocommerce_output_product_data_tabs - 10
		 * @hooked woocommerce_upsell_display - 15
		 * @hooked woocommerce_output_related_products - 20
		 */
		//do_action( 'woocommerce_after_single_product_summary' );
	?>

	<meta itemprop="url" content="<?php the_permalink(); ?>" />

</div><!-- #product-<?php the_ID(); ?> -->

<?php do_action( 'woocommerce_after_single_product' ); ?>
