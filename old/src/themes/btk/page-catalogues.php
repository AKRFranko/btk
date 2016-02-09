<?php
/**
 * The template for displaying the catalogue page.
 *
 * @package buteek
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main lower" role="main">

			<h1><?php the_title(); ?></h1>

			<?php
				$my_query = new WP_Query('category_name=pdf&posts_per_page=10');
				while ( $my_query->have_posts() ) : $my_query->the_post();
			?>
			<div class="pdf">
			  <div class="attachment-thumbnail-wrapper">
				<?php
					if ( has_post_thumbnail() ) {
						echo get_the_post_thumbnail();
					}
				?>
				</div>
				<div class="title">
					<?php the_content(); ?>
					<span class="icon-chevron-lite-right-black"></span>
				</div>
			</div>
			<?php endwhile; ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer(); ?>
