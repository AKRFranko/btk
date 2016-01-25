<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package _s
 */

?>

	</div><!-- #content -->

	<footer id="colophon" class="site-footer" role="contentinfo">
	  <a id="back-to-top" href="#top"><?php _e('back to top', 'edb') ?></a>
		<?php wp_nav_menu( array( 'menu' => 'footer' ) ); ?>
    <?php wp_nav_menu( array( 'menu' => 'footer2' ) ); ?>
    <!--<?php echo do_shortcode('[feather_follow show="facebook, twitter, pinterest, instagram, youtube, tumblr"]'); ?>-->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>
<div id="overlay"></div>
</body>
</html>
