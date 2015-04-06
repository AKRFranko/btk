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
		<main id="main" class="site-main" role="main">

			<!-- main slider -->
			<div class="main-slider">
				<ul class="slider">
				<?php
$my_query = new WP_Query('category_name=carousel&posts_per_page=5');
while ($my_query->have_posts()): $my_query->the_post();
	?>
							<li style="background-image: url(<?php if (has_post_thumbnail()): $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
		echo $src[0];endif;?>);">
							<?php if (has_post_thumbnail()): the_post_thumbnail('full');endif;?>
								<div class="caption center">
									<h2 class="upper"><?php the_title();?></h2>
								</div>
							</li>
						<?php endwhile;?>
				</ul>

				<div class="main-controls">
					<p>
						<span class="icon-arrow-lite-left-black left-shadow"></span>
						<span id="main-prev" class="icon-arrow-lite-left-white"></span>
						<span class="icon-arrow-lite-right-black right-shadow"></span>
						<span id="main-next" class="icon-arrow-lite-right-white"></span>
					</p>
				</div>
			</div>

			<!-- collections -->
			<div class="sliders lower">
				<ul class="slider-collections">
					<?php
$my_query = new WP_Query('category_slug=collection&posts_per_page=3');
while ($my_query->have_posts()): $my_query->the_post();
	?>
							<li>
							<?php if (has_post_thumbnail()): the_post_thumbnail('full');endif;?>
								<div class="caption">
									<p><a href="<?php echo get_permalink();?>"><?php the_title();?></a></p>
								</div>
							</li>
							<?php endwhile;?>
				</ul>
				<div class="coll-controls">
					<span id="coll-prev" class="icon-chevron-lite-left-black"></span>
					<span id="coll-next" class="icon-chevron-lite-right-black"></span>
				</div>
			</div>


		<?php $my_query = new WP_Query('category_slug=news&posts_per_page=3');?>
		<?php if ($my_query->have_posts()): ?>

			<?php /* Start the Loop */?>
			<?php while ($my_query->have_posts()): $my_query->the_post();?>

					<?php
	/* Include the Post-Format-specific template for the content.
	 * If you want to override this in a child theme, then include a file
	 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
	 */
	get_template_part('content', get_post_format());
	?>

				<?php endwhile;?>

			<?php the_posts_navigation();?>

		<?php else: ?>

			<?php get_template_part('content', 'none');?>

		<?php endif;?>


		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer();?>
