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
		<main id="main" class="site-main" role="main">

			<div class="main-slider">
				<ul class="slider">
					<?php
						$my_query = new WP_Query('category_name=carousel&posts_per_page=10');
						while ( $my_query->have_posts() ) : $my_query->the_post();
					?>
					<li style="background-image: url(<?php if ( has_post_thumbnail() ) : $src = wp_get_attachment_image_src( get_post_thumbnail_id(), 'full' ); echo $src[0]; endif; ?>);">
					<?php if ( has_post_thumbnail() ) : the_post_thumbnail('full'); endif; ?>
						<div class="caption center">
							<h2 class="upper"><?php the_title(); ?></h2>
						</div>
					</li>
					<?php endwhile; ?>
				</ul>

				<div class="main-controls">
					<p>
						<span id="main-prev" class="fa fa-long-arrow-left"></span>
						<span id="main-next" class="fa fa-long-arrow-right"></span>
					</p>
				</div>
			</div>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer(); ?>
