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
    <main id="main" class="site-main inspiration" role="main">

      <?php
      while ( have_posts() ) : the_post();

        ?>
        <div class="inspiration-header">
        <h2><?php the_title(); ?></h2>
        <p><?php the_content(); ?></p>
        </div>
        <?php

      endwhile; // End of the loop.
      ?>
      <section id="inspiration-listing">
        <?php 
            query_posts(array( 
                'post_type' => 'inspiration',
                'showposts' => -1
            ) );  
        ?>
        <?php while (have_posts()) : the_post(); ?>
          <article class="inspiration-listing-item">
            <h3><a href="<?php echo the_permalink(); ?>"><?php the_title(); ?></a></h3>
            <?php
              $first_image_id = explode(',',get_post_gallery($post->ID, false)['ids'])[0];
              echo do_shortcode('[gallery size="full" ids="'.$first_image_id.'"]');
              
            ?>
            
            <!--<?php the_content(); ?>-->
          </article>
            
        <?php endwhile;?>
      </section>

    </main><!-- #main -->
  </div><!-- #primary -->

<?php
get_sidebar();
get_footer();
