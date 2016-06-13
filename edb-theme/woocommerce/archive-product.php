<?php
/**
 * The Template for displaying product archives, including the main shop page which is a post type archive.
 *
 * Override this template by copying it to yourtheme/woocommerce/archive-product.php
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

get_header( 'shop' ); ?>


	<?php
		/**
		 * woocommerce_before_main_content hook
		 *
		 * @hooked woocommerce_output_content_wrapper - 10 (outputs opening divs for the content)
		 * @hooked woocommerce_breadcrumb - 20
		 */
		do_action( 'woocommerce_before_main_content' );
	?>

		<?php if ( apply_filters( 'woocommerce_show_page_title', true ) ) : ?>

			<!--<h1 class="page-title"><?php woocommerce_page_title(); ?></h1>-->

		<?php endif; ?>

		<?php
			/**
			 * woocommerce_archive_description hook
			 *
			 * @hooked woocommerce_taxonomy_archive_description - 10
			 * @hooked woocommerce_product_archive_description - 10
			 */
			//do_action( 'woocommerce_archive_description' );
			if($_GET['on_sale'] == 1){
			  $args = array(
            'post_type'      => 'product',
            'meta_query'     => array(
                'relation' => 'OR',
                array( // Simple products type
                    'key'           => '_sale_price',
                    'value'         => 0,
                    'compare'       => '>',
                    'type'          => 'numeric'
                ),
                array( // Variable products type
                    'key'           => '_min_variation_sale_price',
                    'value'         => 0,
                    'compare'       => '>',
                    'type'          => 'numeric'
                )
            )
        );
        
        query_posts( $args );
			}
		?>

		<?php if ( have_posts() ) : ?>

			<?php
				/**
				 * woocommerce_before_shop_loop hook
				 *
				 * @hooked woocommerce_result_count - 20
				 * @hooked woocommerce_catalog_ordering - 30
				 */
				do_action( 'woocommerce_before_shop_loop' );
			?>

			<?php woocommerce_product_loop_start(); ?>
        
				<?php woocommerce_product_subcategories(); ?>

				<?php while ( have_posts() ) : the_post(); ?>

					<?php 
					
					# wc_get_template_part( 'content', 'product' ); 
				  ?>
					<article class="article">
					  
              
              <a class="article-link" href="<?php echo get_permalink();?>">
                <?php if (has_post_thumbnail()): ?>
                  <?php
                    global $product;
                    $hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                    $lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                    
                  ?>
                <?php endif;?>
                <?php 
                  $stock = $product->get_total_stock();
                  $stockclass='';
                  if($stock > 0){
                    $stockclass = ' instock';
                  }
                ?>
                <span class="article-image<?php echo $stockclass ?>" style="background-image:url('<?php echo $hires[0]; ?>');">
                  <?php echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '">'; ?>
                </span>
                
                <span class="article-info">
                <h2 class="article-title">
                    <?php 
                      echo apply_filters('the_title', $product->post->post_title );
                    ?>
                    <?php if(!empty($product->subtitle )){ echo "_"; } ?>
                    <?php echo apply_filters('the_title', $product->subtitle ); ?>
                </h2>
                  <p class="article-subtitle">
                    <?php 
                      if(!$product->is_on_sale()){
                        echo wc_price($product->price);  
                      }else{
                        $regular_price =end($product->get_variation_prices()['regular_price']);
                        echo "<s class=\"onsale\">".wc_price($regular_price)."</s> <span class=\"saleprice\">".wc_price($product->get_price())."</span>";
                      }
                      
                    ?>
                  </p>  
                
                
                <span class="article-body">
                  
                  <?php the_excerpt(); ?>
                </span>
              </a>
            
          </article>

				<?php endwhile; // end of the loop. ?>

			<?php woocommerce_product_loop_end(); ?>

			<?php
				/**
				 * woocommerce_after_shop_loop hook
				 *
				 * @hooked woocommerce_pagination - 10
				 */
				do_action( 'woocommerce_after_shop_loop' );
			?>

		<?php elseif ( ! woocommerce_product_subcategories( array( 'before' => woocommerce_product_loop_start( false ), 'after' => woocommerce_product_loop_end( false ) ) ) ) : ?>

			<?php wc_get_template( 'loop/no-products-found.php' ); ?>

		<?php endif; ?>

	<?php
		/**
		 * woocommerce_after_main_content hook
		 *
		 * @hooked woocommerce_output_content_wrapper_end - 10 (outputs closing divs for the content)
		 */
		do_action( 'woocommerce_after_main_content' );
	?>

	<?php
		/**
		 * woocommerce_sidebar hook
		 *
		 * @hooked woocommerce_get_sidebar - 10
		 */
		do_action( 'woocommerce_sidebar' );
	?>

<?php get_footer( 'shop' ); ?>
