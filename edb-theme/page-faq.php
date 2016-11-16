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
<?php
  $gallery_images = get_post_gallery_images($post);
  shuffle($gallery_images);
  // $json = json_encode($gallery_images);
  // echo '<script type="text/javascript">var edb_faq_images='.$json.';</script>';
  function edb_get_next_faq_image(){
    global $gallery_images;
    $image = array_shift($gallery_images);
    array_push($gallery_images, $image);
    return $image;
  }
?>
  <div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">

    <section id="edb-faq">
      <?php 
          query_posts(array( 
              'post_type' => 'edb_faq',
              'showposts' => -1
          ) );  
      ?>
      <?php while (have_posts()) : the_post(); ?>
        <?php 
          $bgColor  = rwmb_meta( 'background_color', 'multiple=false', $post->ID );
          $bgImage  = rwmb_meta( 'background_image', 'size=full', $post->ID );
          $txtColor = rwmb_meta( 'text_color', 'multiple=false', $post->ID );
          
          if(rand(0,1)){
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
          }else{
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
            echo '<div class="faq-image" style="background-image:url('.edb_get_next_faq_image().')"></div>';
          }
          
        ?>
        
        <div class="faq-item">
            <div class="faq-item-content" style="background-color:<?php echo $bgColor; ?>;background-image:url('<?php echo array_shift($bgImage)['url']; ?>');color:<?php echo $txtColor; ?>;">
            <div class="faq-question"><?php the_title(); ?></div>
            <div class="faq-answer"><?php the_excerpt(); ?></div>
            <a href="#" class="faq-close">&times;</a>  
          </div>
          
        </div>
      <?php endwhile;?>
      <?php wp_reset_postdata(); ?>
    </section>

    </main><!-- #main -->
  </div><!-- #primary -->

<?php
get_sidebar();
get_footer();
