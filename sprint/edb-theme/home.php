<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package buteek
 */

get_header();?>

  <div id="primary" class="content-area">
    <main id="main" class="site-main lower" role="main">

      <!-- main slider -->
      <div class="home-slider">
        <?php btk_edb_slider('category_name=carousel&posts_per_page=5');?>
        
      </div>




    <?php
$paged = (get_query_var('page')) ? get_query_var('page') : 1;
$my_query = new WP_Query(array(
  "paged" => $paged,
  "category_name" => "news",
  "posts_per_page" => 4,
));
?>
    <?php if ($my_query->have_posts()): ?>
    <?php /* Start the Loop */?>
    <div class="listing-posts">
      <?php while ($my_query->have_posts()): $my_query->the_post();?>
      <div class="listing-post">
          <a href="<?php echo get_permalink();?>">
            <span class="listing-post-image">
            <?php if (has_post_thumbnail()): ?>
              <?php
                $hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                $lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '" alt="' . get_the_title() . '">';
              ?>
            <?php ;endif;?>
            </span>
            <span class="listing-post-info">
            <h2 class="listing-post-title">
              <?php the_title();?>
            </h2>
            <p class="listing-post-subtitle">
              <?php the_subtitle();?>
            </p>
            <span class="listing-post-body">
              <?php the_excerpt(); ?>
            </span>
          </a>
        </div>
      <?php endwhile;?>
      </div>
      <?php //the_posts_navigation();?>
    <?php else: ?>
      <?php get_template_part('content', 'none');?>
    <?php endif;?>
    </main><!-- #main -->
  </div><!-- #primary -->

<?php get_footer();?>
