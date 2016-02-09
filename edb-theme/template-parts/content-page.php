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
    if ( has_post_thumbnail() ) {
      $image_id = get_post_thumbnail_id( get_the_ID() );
      $image_src = wp_get_attachment_image_src( $image_id, 'full')[0];
      ?>
      <header class="entry-header image-header">
        <div class="post-image" style="background-image:url('<?php echo esc_attr($image_src); ?>');">
          <?php the_post_thumbnail(); ?>
        </div>
        <div class="titles">
        <?php
        if ( is_single() ) {
          the_title( '<h1 class="entry-title">', '</h1>' );
        } else {
          the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );
        }
        ?>
        </div>
      </header>
      <?php
    }else{
      ?>
      <header class="entry-header text-header">
        <div class="titles">
        <?php
        if(!is_cart() && !is_checkout() &&!is_page('my-account')){
          
        
        if ( is_single() ) {
          the_title( '<h1 class="entry-title">', '</h1>' );
        } else {
          the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );
        }
        }
        ?>
        </div>
      </header>
      <?php
    }
    ?>
  
  

  <div class="entry-content">
    <?php
      the_content( sprintf(
        /* translators: %s: Name of current post. */
        wp_kses( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'edb' ), array( 'span' => array( 'class' => array() ) ) ),
        the_title( '<span class="screen-reader-text">"', '"</span>', false )
      ) );
     
    //   wp_link_pages( array(
    //     'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'edb' ),
    //     'after'  => '</div>',
    //   ) );
    ?>
  </div><!-- .entry-content -->

  <!-- <footer class="entry-footer">
    <?php _s_entry_footer(); ?>
  </footer>-->
</article><!-- #post-## -->
