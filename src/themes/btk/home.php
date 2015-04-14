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
			<div class="main-slider">
				<ul class="slider">
				<?php
$my_query = new WP_Query('category_name=carousel&posts_per_page=5');
while ($my_query->have_posts()): $my_query->the_post();
	?>
						<li style="background-image: url(<?php if (has_post_thumbnail()): $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
		echo $src[0];endif;?>);">
						<?php if (has_post_thumbnail()): ?>
						<?php
	$hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
	$lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'large');
	echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '">';
	?>
						<?php endif;?>
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



		<?php
$paged = (get_query_var('page')) ? get_query_var('page') : 1;
$my_query = new WP_Query(array(
	"paged" => $paged,
	"category_name" => "news",
	"posts_per_page" => 5,
));
?>
		<?php if ($my_query->have_posts()): ?>

		<?php /* Start the Loop */?>
			<?php while ($my_query->have_posts()): $my_query->the_post();?>
					<div class="main-article">
						<a href="<?php echo get_permalink();?>">
						<?php if (has_post_thumbnail()): ?>
							<?php
	$hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
	$lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'medium');
	echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '">';
	?>
						<?php ;endif;?></a>
						<p>
							<?php //btk_home_entry_categories();?>
							<a href="<?php echo get_permalink();?>"><?php the_title();?></a>
						</p>
						<?php //btk_home_entry_tags();?>
					</div>
				<?php endwhile;?>

			<?php //the_posts_navigation();?>

		<?php else: ?>

			<?php get_template_part('content', 'none');?>

		<?php endif;?>


		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer();?>
