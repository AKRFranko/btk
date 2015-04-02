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
					$my_query = new WP_Query('category_name=news&posts_per_page=10');
					while ($my_query->have_posts()):$my_query->the_post();
				?>
					<li style="background-image: url(<?php if (has_post_thumbnail()) : $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full'); echo $src[0];endif;?>);">
					<?php if (has_post_thumbnail()):the_post_thumbnail('full');endif;?>
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

<!--
			<div class="sliders lower">
				<ul class="slider-collections">
					<?php
						$my_query = new WP_Query('category_name=collection&posts_per_page=3');
						while ($my_query->have_posts()):$my_query->the_post();
					?>
					<li>
					<?php if (has_post_thumbnail()):the_post_thumbnail('full');endif;?>
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

			<div class="sliders lower">
				<ul class="slider-news">
					<?php
						$my_query = new WP_Query('category_name=news&posts_per_page=3');
						while ($my_query->have_posts()):$my_query->the_post();
					?>
					<li>
					<?php if (has_post_thumbnail()):the_post_thumbnail('full');endif;?>
						<div class="caption">
							<p><a href="<?php echo get_permalink();?>"><?php the_title();?></a></p>
						</div>
					</li>
					<?php endwhile;?>
				</ul>
				<div class="news-controls">
					<span id="news-prev" class="icon-chevron-lite-left-black"></span>
					<span id="news-next" class="icon-chevron-lite-right-black"></span>
				</div>
			</div>

			<div class="sliders lower">
				<ul class="slider-article">
					<?php
						$my_query = new WP_Query('category_name=article&posts_per_page=3');
						while ($my_query->have_posts()):$my_query->the_post();
					?>
					<li>
					<?php if (has_post_thumbnail()):the_post_thumbnail('full');endif;?>
						<div class="caption">
							<p><a href="<?php echo get_permalink();?>"><?php the_title();?></a></p>
						</div>
					</li>
					<?php endwhile;?>
				</ul>
				<div class="article-controls">
					<span id="article-prev" class="icon-chevron-lite-left-black"></span>
					<span id="article-next" class="icon-chevron-lite-right-black"></span>
				</div>
			</div>
-->


			<!-- collection -->
			<div class="main-collection">
			<?php
				$my_query = new WP_Query('category_name=collection&posts_per_page=1');
				while ( $my_query->have_posts() ): $my_query->the_post();
			?>
				<?php if ( has_post_thumbnail() ) { ?>
				<a href="<?php echo get_permalink(); ?>">
				<?php the_post_thumbnail('full'); ?>
				</a>
				<?php } ?>

				<p>
					<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					<span class="icon-chevron-lite-right-black"></span>
				</p>
			<?php endwhile;?>
			</div>


			<!-- news -->
			<div class="main-news">
			<?php
				$my_query = new WP_Query('category_name=news&posts_per_page=1');
				while ( $my_query->have_posts() ): $my_query->the_post();
			?>
				<?php if ( has_post_thumbnail() ) { ?>
				<a href="<?php echo get_permalink(); ?>">
				<?php the_post_thumbnail('full'); ?>
				</a>
				<?php } ?>

				<p>
					<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					<span class="icon-chevron-lite-right-black"></span>
				</p>
			<?php endwhile;?>
			</div>


			<!-- article -->
			<div class="main-article">
			<?php
				$my_query = new WP_Query('category_name=article&posts_per_page=1');
				while ( $my_query->have_posts() ): $my_query->the_post();
			?>
				<?php if ( has_post_thumbnail() ) { ?>
				<a href="<?php echo get_permalink(); ?>">
				<?php the_post_thumbnail('full'); ?>
				</a>
				<?php } ?>

				<p>
					<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					<span class="icon-chevron-lite-right-black"></span>
				</p>
			<?php endwhile;?>
			</div>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer();?>
