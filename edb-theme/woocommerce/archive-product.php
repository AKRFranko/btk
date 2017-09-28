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
  if( isset($_GET['via']) && $_GET['via'] == 'u1000'){
    // query for the about page
    $posts = new WP_Query( 'pagename=sofas-a-moins-de-1000' );
    // "loop" through query (even though it's just one page) 
    while ( $posts->have_posts() ) : $posts->the_post();
      get_template_part( 'template-parts/content' ,'page');
    endwhile;
    // reset post data (important!)
    wp_reset_postdata();
  }
?>
	<?php

//     $post = get_post(37228);
    
    
    
//   }
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
			if(isset($_GET['on_sale']) && $_GET['on_sale'] == 1){
			  $args = array(
			      'nopaging'=> true,
            'post_type'      => 'product',
            'post__in' => wc_get_product_ids_on_sale()
            // 'meta_query'     => array(
            //     'relation' => 'OR',
            //     array( // Simple products type
            //         'key'           => '_sale_price',
            //         'value'         => 0,
            //         'compare'       => '>',
            //         'type'          => 'numeric'
            //     ),
            //     array( // Variable products type
            //         'key'           => '_min_variation_sale_price',
            //         'value'         => 0,
            //         'compare'       => '>',
            //         'type'          => 'numeric'
            //     )
            // )
        );
      
        query_posts( $args );
			}
			
			
			if( isset($_GET['new']) && $_GET['new'] == 1 ){
       $today = getdate();
      $year = $today['year'];
      $month = $today['mon'];
      $tmonth = $month - 2;
      // $lastpost = strtotime(get_lastpostdate());

      // $lastmonth = date('m', $lastpost);
      // $lastyear = date('Y', $lastpost);
      if($tmonth < 0){
        $tmonth = 12 + $tmonth;
        $year -=1;
      }
        $date_query = array( 'after'=>array( 'year'=>$year, 'month'=>$tmonth ) );
        $args = array( 'nopaging' => true, 'post_type' => 'product', 'date_query' =>  $date_query );
        // $args = array('nopaging' => true, 'post_type' => 'product', 'year'=>$lastyear,'monthnum'=>$lastmonth,'order'=>'DESC');
        //write_log($args);
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
				
				<?php $count =0;while ( have_posts() ) : the_post(); $count++; ?>

					<?php 
            
					# wc_get_template_part( 'content', 'product' ); 
				  ?>
					<article class="article article-product">
					  
              <?php 
                global $product; 
                // echo "<pre>";
                /* NOTE: maybe loop through all and re-duplicate */
                
                // $mirrors = array_map('trim',explode('|',$product->get_attribute('edb_mirror'))); 
                // if(count($mirrors) > 0){
                    
                // }
                // echo "</pre>";
                // if (is_category( )) {
                // $cat = get_query_vars('product_cat');
                // write_log("/////$cat");
                // $current_cat = get_category($cat);
                 
                // }
                
                $deco = edb_decorated_product($product,get_query_var('product_cat'));
                $ga_product = json_encode(array(
                  'id'=>$product->post->ID,
                  'name'=>$deco->full_name,
                  'category'=> $deco->main_category,
                  'position'=>$count));
                
                $query='vc='.get_query_var('product_cat');
                $permalink = get_permalink();
                $pound="";
                $poundPos = -1;
                if( ( $poundPos = strpos( $permalink , "#" ) ) !== false ){
                  $pound = substr( $permalink, $poundPos );
                  $permalink = substr( $permalink, 0, $poundPos );
                }
                $separator = (parse_url($permalink, PHP_URL_QUERY ) == NULL) ? '?' : '&';
                $permalink .= $separator . $query . $pound;
                $stock_status = get_post_meta($deco->product_id, '_stock_status', true);
                $is_in_stock = $stock_status !== 'outofstock';
              ?>
              
              <a class="article-link <?php echo $stock_status; ?>" href="<?php echo $permalink;?>" data-product="<?php echo esc_attr($ga_product); ?>" onclick="edbStats.recordProductClick(this); return !ga.loaded;">
                <?php if (has_post_thumbnail()): ?>
                  <?php
                    $hires = array( $deco->images['featured']);
                    $lores = array( $deco->images['featured']);
                    $first_gallery_image_src = $deco->images['slideshow'][0];
                    // $hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                    // $lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                    // $gallery_ids = $product->get_gallery_attachment_ids();
                    // $first_gallery_image = wp_get_attachment_image_src( $gallery_ids[0],'full');
                    // $first_gallery_image_src = $first_gallery_image[0];
                  ?>
                <?php endif;?>
                <?php 
                  $stock = $product->get_total_stock();
                  $stockclass='';
                  if($stock > 0){
                    $stockclass = ' instock';
                  }
                ?>
                <span data-rollover-image="<?php echo $first_gallery_image_src; ?>" class="article-image<?php echo $stockclass ?>" style="background-image:url('<?php echo $hires[0]; ?>');">
                  <?php echo '<img src="' . $lores[0] . '" alt="item image" data-hires-image="' . $hires[0] . '">'; ?>
                </span>
                
                
                
                <span class="article-info">
                <h2 class="article-title">
                  <?php echo $deco->system_name_html; ?>
                    
                </h2>
                  <p class="article-subtitle">
                    <?php 
                      
                      if(!$product->is_on_sale()){
                        echo $deco->price_html;
                      }else{
                        $regular_price =end($product->get_variation_prices()['regular_price']);
                        echo "<s class=\"onsale\">".wc_price($regular_price)."</s> <span class=\"saleprice\">".wc_price($product->get_price())."</span>";
                      }
                      
                    ?>
                  </p>  
                
                
                <span class="article-body">
                  
                  <?php the_excerpt(); ?>
                </span>
               </span>
                
               <?php if(!$is_in_stock){ ?> 
               
                 <span id="out-of-stock-stamp">
                   <span class="out-of-stock-title"><?php _e('out of stock','edb'); ?></span> 
                   <?php if( product_has_or_expects_stock( $product->id ) ){ ?> 
                     <span class="out-of-stock-time"><?php printf(__('restocking in %s','edb'),edb_product_restock_date($product->id)); ?></span>   
                   <?php } ?>
                   
                 </span>
               <?php }; ?>
                
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

