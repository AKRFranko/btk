<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package buteek
 */
?>

		</div><!-- #content -->
	</div><!-- main content -->



	<!-- footer -->
	<div id="footer-box">
		<div class="container">
			<div class="row">
				<footer id="colophon" class="site-footer" role="contentinfo">
					<p class="alignleft">&copy; Frond-End Ninjas <?php echo date('Y'); ?></p>
					<p class="alignright">
						<a href="<?php echo esc_url( __( 'http://wordpress.org/', 'btk' ) ); ?>"><?php printf( __( 'Proudly powered by %s', 'btk' ), 'WordPress' ); ?></a>
						<span class="sep"> | </span>
						<?php printf( __( 'Theme: %1$s by %2$s.', 'btk' ), 'buteek', '<a href="http://underscores.me/" rel="designer">Ronins</a>' ); ?>
					</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- footer -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
