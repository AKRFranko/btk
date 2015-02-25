<?php
/**
 * The template used for displaying page content in page.php
 *
 * @package buteek
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php
		if ( has_post_thumbnail() ) {
			echo get_the_post_thumbnail();
		}
	?>
	<div class="entry-content lower">
		<?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>
		<?php the_content(); ?>
	</div><!-- .entry-content -->
</article><!-- #post-## -->
