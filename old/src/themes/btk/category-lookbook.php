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

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main lower" role="main">
      

      <?php while ( have_posts() ) : the_post(); ?>

			<div class="lookbook">
			  <div class="attachment-thumbnail-wrapper">
			  <a href="/lookbook">
				<?php
					if ( has_post_thumbnail() ) {
						echo get_the_post_thumbnail();
					}
				?>
				</a>
				</div>
				<div class="title">
          <?php the_title( sprintf( '<h2 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h2>' ); ?>
          

					<span class="icon-chevron-lite-right-black"></span>
				</div>
			</div>

			<?php endwhile;  ?>

			
		

		</main><!-- #main -->
	</div><!-- #primary -->

<?php //get_sidebar(); ?>
<?php get_footer(); ?>
