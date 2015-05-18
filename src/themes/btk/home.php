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
			<div class="edb-slider">
				<?php btk_edb_slider('category_name=carousel&posts_per_page=5');?>
				<div class="controls">
					<a class="prev" href="#"><span class="icon-arrow-lite-left-white"></span></a>
					<span class="index">0</span>
					<span class="separator"> | </span>
					<span class="total"> 5 </span>
					<a class="next" href="#"><span class="icon-arrow-lite-right-white"></span></a>
				</div>
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
			<?php while ($my_query->have_posts()): $my_query->the_post();?>
				<div class="main-article">
					<a href="<?php echo get_permalink();?>">
					<?php if (has_post_thumbnail()): ?>
						<?php
							$hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
							$lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'medium');
							echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '" alt="' . get_the_title() . '">';
						?>
					<?php ;endif;?></a>
					<div class="title">
						<h2 class="upper"><a href="<?php echo get_permalink();?>"><?php the_title();?></a></h2>
						<?php the_excerpt(); ?>
						<span class="icon-chevron-lite-right-black"></span>
					</div>
				</div>
			<?php endwhile;?>

			<?php //the_posts_navigation();?>

		<?php else: ?>

			<?php get_template_part('content', 'none');?>

		<?php endif;?>


		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer();?>
