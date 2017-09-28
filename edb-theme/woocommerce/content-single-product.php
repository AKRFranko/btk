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
	 $edb_product = edb_decorated_product( $product_id, $_GET['vc'] );
	 $ga_product = json_encode(array(
   'id'=>$product->post->ID,
   'name'=>$edb_product->full_name,
   'category'=> $edb_product->main_category));
   $legs = maybe_unserialize(get_post_meta($product_id,'edb_leg_options_prices',true));
   
   
   
?>

<div itemscope itemtype="<?php echo woocommerce_get_product_schema(); ?>" id="product-<?php the_ID(); ?>" <?php post_class(); ?> data-product="<?php echo esc_attr($ga_product);?>" data-legs="<?php echo esc_attr(json_encode($legs)) ?>">

  <div class="product-sections">
    
    <div class="product-slideshow">
      <?php edb_product_slideshow( $product_id, $_GET['vc'] ); ?>
    </div>
    
    <div class="product-info">
      
      <div class="product-name"><?php echo $edb_product->system_name_html; ?></div>
      
      <!--<div class="product-subname"><?php echo $edb_product->subtitle; ?></div>-->
      
      <?php if( $edb_product->category_slug == 'accessories-pillows' && $edb_product->product_id !== 1533 ){ 
          $stuff_link=get_permalink(1533);
      ?><p class="product-warning"><?php echo sprintf(__( 'The <a href="%s">stuffing</a> is sold separately. <a href="%s">click here to get some.</a>' ,'edb'), $stuff_link, $stuff_link ); ?></p>
      <?php } ?>
      <div class="product-price"><?php echo $edb_product->price_html; ?></div>
      <?php edb_product_free_shipping( $product->post->ID ); ?>
      <div class="product-share">
        <ul class="social-share-options">
          <li class="social-share-option"><a href="#" class="social-link">F</a></li>
          <li class="social-share-option"><a href="#" class="social-link">T</a></li>
          <li class="social-share-option"><a href="#" class="social-link">P</a></li>
        </ul>
      </div>
      
    </div>


    <div class="product-description">
      
      <h2 class="section-title"><?php _e('description', 'edb'); ?></h2>
      <p><?php echo $edb_product->description; ?></p>
      
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
              <p class="stock out-of-stock"><?php _e( 'this product is currently out of stock and unavailable.', 'edb' ); ?></p>
            </div>
          <?php else : ?>
            <div class="product-color-choices">
              <?php edb_product_material_picker( $product->id ); ?>
            </div>
          
          
            <?php do_action( 'woocommerce_before_add_to_cart_button' ); ?>
            
            
              <?php 
                edb_add_to_cart_button( $product->id ); 
                if(!empty($edb_product->leg_options)){
                  $lv = $_REQUEST['lv'];
                  
                  if(!empty($lv) && in_array( $lv, $edb_product->leg_options) ){
                  
                    echo "<input type=\"hidden\" name=\"leg_option\" value=\"$lv\">";
                  }else{
                    $lv = $edb_product->leg_options[0];
                    echo "<input type=\"hidden\" name=\"leg_option\" value=\"$lv\">";
                  }
                  
                  
                }
                ?>
                

            <?php do_action( 'woocommerce_after_add_to_cart_button' ); ?>
          <?php endif; ?>
        
          <?php do_action( 'woocommerce_after_variations_form' ); ?>
          
          <?php if( !empty( $available_variations ) && count($available_variations) > 1  ){ ?>
            <?php if( product_has_or_expects_stock( $product->id ) ){ ?> 
              <small class="stocknote">= <?php _e('in stock','edb'); ?></small>
              <small class="restocknote">= <?php _e('restocking','edb'); ?></small>
            <?php } ?>
          <?php }; ?>
        </form>
        
        <?php do_action( 'woocommerce_after_add_to_cart_form' ); ?>
        
    </div><!-- .product-menu -->
    
  </div><!-- .product-sections -->
  <div class="product-sub-sections">
    
    <?php 
     $hasTechImage = edb_has_tech_image( $product->id ) ;
     $hasIntroVid = edb_has_introduction_video( $product->id );
     $solo = $hasTechImage && $hasTechImage ? '' : 'solo';
     if( $hasTechImage || $hasIntroVid ){ ?>
     
      <div class="product-sub-section <?php echo $solo; ?>">
        
        <?php  if($hasTechImage){  ?>
          <div class="product-technical-image">
          <?php edb_product_tech_image( $product->id  ); ?>
          </div>
        <?php };?>
        <?php  if($hasIntroVid){  ?>
          <div class="product-introduction-video">
            <?php edb_product_video_link( $product->id, 'introduction' ); ?>
          </div>
        <?php };?>
    </div>  
    <?php } ?>
    <?php if(edb_has_designer( $product->id )){ 
      $designer_post = edb_get_designer( get_post_meta( $product->id, '_edb_designer_id', true ) );
      
      $designer_title = WPGlobus_Core::text_filter($designer_post->post_title);
      $designer_content = WPGlobus_Core::text_filter($designer_post->post_content);
      $thumb_id = get_post_thumbnail_id( $designer_post->ID );
      $thumb_url_array = wp_get_attachment_image_src($thumb_id, 'full', true);
      $designer_image = $thumb_url_array[0];
      ?>
      <div class="product-sub-section">
        <div class="product-designer-text">
          <h2 class="section-title"><?php printf(__('designer: %s', 'edb'),$designer_title); ?></h2>
        
          <p>
            <?php echo strip_tags( $designer_content, '<a>'); ?>
          </p>
        </div>
        <div class="product-designer-image">
          <img src="<?php echo $designer_image; ?>">
        </div>
      </div>
    <?php }; ?>
    
    
    <?php 
      $hasInstruVid = edb_has_instruction_video( $product->id );
      $hasDims = edb_has_dimensions( $product->id );
      $solo = $hasInstruVid && $hasDims ? '' : 'solo';
    ?>
    <?php if($hasInstruVid || $hasDims){ ?>
    <div class="product-sub-section <?php echo $solo; ?>">
      <?php if($hasInstruVid){ ?>
      <div class="product-instruction-video">
        <h2 class="section-title"><?php _e('assembly instructions', 'edb'); ?></h2>
        <?php edb_product_video_link( $product->id, 'instruction' ); ?>
        <!--<a class="yt-thumb" href="https://www.youtube.com/embed/_qogwJT4QxI">-->
        <!--  <img src="https://img.youtube.com/vi/_qogwJT4QxI/mqdefault.jpg">-->
        <!--</a>-->
      </div>
      <?php };?>
      <?php if( $hasDims){ ?>
      <div class="product-detailed-information">
        <h2 class="section-title"><?php _e('materials and dimensions', 'edb'); ?></h2>
        <?php edb_product_dimensions( $product->id ); ?>
      </div>
      <?php };?>
    </div>
    <?php }; ?>
    
    <div class="product-sub-section" style="display:none">
      <div class="product-shipping-return-text">
        <h2 class="section-title"><?php _e('shipping and return', 'edb'); ?></h2>
        <p>a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat. ﻿a light structure supports this neatly outlined sofa, where thin back and armrests are combined with a comfortable generous seat.</p>
      </div>
      <div class="product-shipping-return-image">
        <span class="round-image-wrapper"></span>
      </div>
    </div>
    <?php 
    if(WPGlobus::Config()->language =='en'){
      $anatomy_image = rwmb_meta( 'edb_anatomy_image_en', 'size=full' );   
      $anatomy_title = WPGlobus_Core::text_filter( rwmb_meta( 'edb_anatomy_image_title_en'), WPGlobus::Config()->language ); 
    }else{
      $anatomy_image = rwmb_meta( 'edb_anatomy_image', 'size=full' );
      $anatomy_title = WPGlobus_Core::text_filter( rwmb_meta( 'edb_anatomy_image_title'), WPGlobus::Config()->language ); 
    }
    
    
    ?>
    <?php if( !empty( $anatomy_image ) ){ $aimg = array_shift(array_values($anatomy_image)); ?>
    <div class="product-anatomy">
      <h3 class="product-anatomy-title"><?php echo $anatomy_title; ?></h3>
      <img src="<?php echo $aimg['url'];?>" height="<?php echo $aimg['height']; ?>">
    </div>
    
    <?php }; ?>
    
    <?php 
      $pdfs = rwmb_meta( 'edb_product_pdfs' ); 
      if(WPGlobus::Config()->language =='en'){
        $pdftext = rwmb_meta( 'edb_product_pdfs_text' ); 
        $pdftitle =   rwmb_meta( 'edb_product_pdfs_title' ); 
        $pdfbutton = "Download PDF";
      }else{
        $pdftext = rwmb_meta( 'edb_product_pdfs_text_fr' ); 
        $pdftitle =   rwmb_meta( 'edb_product_pdfs_title_fr' ); 
        $pdfbutton = "T&eacute;l&eacute;charger PDF";
        
      }
      
      if(!empty($pdfs)){
        $pdfs_image = rwmb_meta( 'edb_product_pdfs_image', 'size=full' );
        if( !empty( $pdfs_image ) ){ 
          $pimg = array_shift(array_values($pdfs_image)); 
        }
        
        ?>
        <div class="product-pdfs">
          <div class="product-pdf-title"><?php echo $pdftitle; ?></div>
          <div class="product-pdf-text"><?php echo $pdftext; ?></div>
          <img style="max-width:50%" src="<?php echo $pimg['url'];?>" height="<?php echo $pimg['height']; ?>">
          <div class="pdf-downloads">
            <h3 class="download-title"><?php echo $pdfbutton; ?></h3>
            <?php
            foreach($pdfs as $id => $pdf ){
              $name = $pdf['name'];
              $url = $pdf['url'];
              $title = $pdf['title'];
              echo "<a href=\"$url\" target=\"_blank\" download=\"$name\">$title</a>";
            }
            ?>
          </div>
        </div><?php
      }
      
      ?>
      
      
    
    
    <?php $review_id = get_post_meta($product->id , '_edb_review_id', true); ?>
    
    <?php if( !empty($review_id)){ ?>
    <?php $review_post = get_post( $review_id);
          
          $review_title = WPGlobus_Core::text_filter($review_post->post_title,WPGLobus::Config()->language);
          $review_content = WPGlobus_Core::text_filter($review_post->post_content,WPGLobus::Config()->language);
    ?>
    <div class="product-sub-section">
      <div class="product-review-text">
        <h2 class="section-title"><?php echo $review_title; ?></h2>
        <?php echo $review_content; ?>
      </div>
      <div class="product-review-image">
        <span class="round-image-wrapper black">
        <img src="<?php bloginfo('template_directory'); ?>/img/white-heart.svg" />
        </span>

       
        
      </div>
    </div>
    <?php }; ?>
    
    
    <?php 
    $more_images = rwmb_meta( 'edb_more_images', 'size=full' );
    if(!empty($more_images)){
      
      echo '<div id="more-product-images" class="product-sub-section">';
      echo '<h3 class="more-images-title">'.__('See more', 'edb').'</h3>';
      foreach ( $more_images as $image ) {
        echo "<a href='#' class='more-product-image' style='background-image:url(\"".$image['url']."\")'><img src='{$image['url']}' width='{$image['width']}' height='{$image['height']}' alt='{$image['alt']}' /></a>";
      }
      echo '</div>';
    }
    if( false && !empty($more_images)){
      
      ?>
      
      <div id="modal-swiper" class="swiper-container">
        <div class="swiper-wrapper">
          <?php
          foreach ( $more_images as $image ) {
                $slide = "<img src='{$image['url']}' width='{$image['width']}' height='{$image['height']}' alt='{$image['alt']}' />";
                echo '<div class="swiper-slide">'.$slide.'</div>';
                
                  
              
          }
          ?>
        </div>
        <div class="swiper-pagination"></div>

      </div>
      <?php
    }
    ?>
   
    
    
    
  </div>
  
  
   <?php 
     $famname = rwmb_meta('edb_product_family_name', array(), $product->id);
     if($famname){
       
       $args = array(
         'meta_key' => 'edb_product_family_name',
         'meta_value' => $famname,
         'post_type'  => 'product'
       );
       $query = new WP_Query( $args );
       
     }
   
   ?>
   <?php if ($query->have_posts()) : ?>
   <div class="product-family">
   <h2 class="section-title"><?php _e('Related Products','edb'); ?></h2>
   <div class="related-products">
   <?php while ($query->have_posts()) :
                   $query->the_post(); ?>
      
     
       
         <?php 
           global $product; 
          
           
           $deco = edb_decorated_product($product,get_query_var('product_cat'));
         
           $permalink = get_permalink();
           
         ?>
         
         <a class="related-link" href="<?php echo $permalink;?>">
          <img src="<?php echo $deco->images['featured']; ?>" />
          <h2 class="related-title">
            <?php echo $deco->system_name_html; ?>
          </h2>
         </a>
       

   
   <?php endwhile; ?>
   <?php wp_reset_postdata(); ?>
   </div>
   
   </div>
   <?php endif; ?>   
  
  


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
