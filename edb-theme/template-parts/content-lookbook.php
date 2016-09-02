<?php
/**
 * Template part for displaying page content in page.php.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package edb
 */

?>


<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
  <?php 
    $image_id = get_post_thumbnail_id( get_the_ID() );
    $image_src = wp_get_attachment_image_src( $image_id, 'full')[0];
  ?>
    <div class="edb-slider" zooms>
      <h1 class="edb-slider-main-title"><?php the_title(); ?></h1>
      <div class="edb-slider-main-text"><?php the_excerpt(); ?></div>
      <div class="edb-slides">
          <?php 
            $children = get_posts(array(
             'post_parent' => $post->ID,
             'orderby'     => 'title', 
             'order'       => 'ASC', 
             'post_type' => 'lookbook_slide',
             'post_status' => 'publish',
             'numberposts' => -1
            ));
            
          foreach( $children as $idx => $slide){ 
            
            $image_id = get_post_thumbnail_id( $slide->ID );
            $image_src = wp_get_attachment_image_src( $image_id, 'full')[0];
            $skus = get_post_meta( $slide->ID, 'product_skus', true );
            $features = edb_get_products_with_skus( $skus );?><div class="edb-slide<?php echo $idx == 0 ? ' active' : ''?>">
            
            <div class="backdrop" style="background-image:url('<?php echo $image_src; ?>');">
              <img src="<?php echo $image_src ?>">
            </div>
            
            <div class="titles">
              <!--<h1><?php echo $slide->post_title; ?></h1>-->
              <p><?php echo $slide->post_excerpt; ?></p>
            </div>
            
            <div class="support">
              
                
              
              <?php if(!empty($features)){ ?>
                <ul class="features">
                  <?php foreach( $features as $feature){ ?>
                    <?php 
                      
                      
                      $decorated = $feature;
                      if(!empty($decorated)){
                        $catlink = edb_get_category_url($decorated->category);  
                        
                    
                      

                    ?>
                    <li>
                      <a class="category" href="<?php echo $catlink ;?>">
                        <?php echo $decorated->category; ?>
                      </a><a class="title <?php echo empty($decorated->subtitle) ? 'large' : '';?>" href="<?php echo $decorated->url; ?>">
                        <?php echo $decorated->system_name; ?>
                      </a><a class="price" href="<?php echo $decorated->url; ?>">
                        <?php echo wc_price($decorated->price); ?>
                      </a>
                    </li>
                  <?php } } ?> 
                </ul>

              <?php }; ?>
                
            </div><!-- support -->
</div><?php }; ?></div>
      
      <div class="controls">
          <a href="#" class="prev">&lt;</a>
          <span class="indicator current">-</span>
          <span class="separator"></span>
          <span class="indicator last">-</span>
          <a href="#" class="next">&gt;</a>
      </div>
      
    </div>
  

  
</article><!-- #post-## -->
