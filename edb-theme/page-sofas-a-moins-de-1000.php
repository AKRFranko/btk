<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package edb
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

			<?php
			while ( have_posts() ) : the_post();

				get_template_part( 'template-parts/content', 'page' );

				// If comments are open or we have at least one comment, load up the comment template.
				if ( comments_open() || get_comments_number() ) :
					comments_template();
				endif;

			endwhile; // End of the loop.
			?>
      
      
        <?php 
        $args = array(
            'posts_per_page' => '30',
            'product_cat' => 'sofas',
            'post_type' => 'product'
        );
    
        
        
        query_posts($args);
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
                  ?>
                  <a class="article-link" href="<?php echo $permalink;?>" data-product="<?php echo esc_attr($ga_product); ?>" onclick="edbStats.recordProductClick(this); return !ga.loaded;">
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
      
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar();
get_footer();
