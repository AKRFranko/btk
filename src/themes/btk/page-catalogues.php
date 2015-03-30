<?php
/**
 * The template for displaying the catalogue page.
 *
 * @package buteek
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

			<?php
				$my_query = new WP_Query('category_name=pdf&posts_per_page=10');
				while ( $my_query->have_posts() ) : $my_query->the_post();
			?>
			<div class="pdf lower">
			<?php
				if ( has_post_thumbnail() ) {
					echo get_the_post_thumbnail();
				}
				the_content();
			?>
			</div>
			<?php endwhile; ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php //get_sidebar(); ?>
<?php get_footer(); ?>
