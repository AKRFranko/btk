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

			<div class="lookbook woocommerce lower">
				<?php wc_print_notices(); ?>
				<ul class="products">
				<?php
					$args = array( 'post_type' => 'product', 'post_per_page' => '5', 'product_cat' => 'lookbook' );
					$my_query = new WP_Query($args);
					while ( $my_query->have_posts() ) : $my_query->the_post();
				?>
					<?php wc_get_template_part( 'content', 'product' ); ?>
				<?php endwhile; ?>
				</ul>
			</div>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php //get_sidebar(); ?>
<?php get_footer(); ?>
