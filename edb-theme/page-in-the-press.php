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
    <main id="main" class="site-main in-the-press" role="main">

      
      <section id="press-review-listing">
        <?php 
            query_posts(array( 
                'post_type' => 'edb_press_review',
                'showposts' => -1
            ) );  
        ?>
        <?php while (have_posts()) : the_post(); ?>
          <?php 
            $press_review = array(
              'title'=> get_the_title(),
              'url' => rwmb_meta( 'edb_press_review_link'),
              'text' => rwmb_meta( 'edb_press_review_text'),
              'logo' => get_the_post_thumbnail_url( get_the_ID(), 'full')
            );
          ?>
          <article class="press-review-listing-item">
            <a href="<?php echo $press_review['url']; ?>">
              <div class="press-review-item-logo" style="background-image:url('<?php echo esc_attr($press_review['logo']); ?>')">
                <img src="<?php echo $press_review['logo']; ?>">
              </div>
              <div class="press-review-item-title">
                <?php echo $press_review['title']; ?>
              </div>
              <div class="press-review-item-text">
                <?php echo $press_review['text']; ?>
              </div>
            </a>
          </article>
            
        <?php endwhile;?>
        <?php wp_reset_postdata(); ?>

      </section>

    </main><!-- #main -->
  </div><!-- #primary -->

<?php
get_sidebar();
get_footer();
