<?php
/**
 * The template for displaying 404 pages (not found).
 *
 * @package buteek
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

			<article class="error-404">
				<img src="<?php echo get_template_directory_uri();?>/img/404.jpg" class="attachment-post-thumbnail" alt="404">
				<div class="entry-content lower">
					<h1 class="entry-title"><?php _e( 'Oops! That page can&rsquo;t be found.', 'btk' ); ?></h1>
					<p>
						<span><?php _e('Back home', 'btk'); ?></span>
						<a href="<?php echo esc_url( home_url( '/' ) ); ?>" class="button fa fa-long-arrow-left"></a>
					</p>
				</div>
			</article><!-- .error-404 -->

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_footer(); ?>
