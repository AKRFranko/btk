<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package buteek
 */
?>

			</div>
		</div><!-- #content -->
	</div><!-- main content -->



	<!-- footer -->
	<div id="box-footer">
		<div class="container">
			<div class="row">

				<div id="back-to-top" class="lower center">
					<a href="#top">Back to top</a>
				</div>

				<footer id="colophon" class="site-footer lower clearfix" role="contentinfo">
					<div class="col-xs-6">
						<nav class="nav-footer valign" role="navigation">
							<?php wp_nav_menu( array( 'menu' => 'footer' ) ); ?>
						</nav><!-- #site-navigation -->
					</div>

					<div class="col-xs-6">
						<nav class="nav-footer valign" role="navigation">
							<?php wp_nav_menu( array( 'menu' => 'footer2' ) ); ?>
						</nav><!-- #site-navigation -->

						<div class="social">
<!--
							<ul>
								<li><a href="https://facebook.com" class="fa fa-facebook-square" rel="external" title="facebook"></a></li>
								<li><a href="https://twitter.com" class="fa fa-twitter-square" rel="external" title="twitter"></a></li>
								<li><a href="https://pinterest.com" class="fa fa-pinterest-square" rel="external" title="pinterest"></a></li>
								<li><a href="https://instagram.com" class="fa fa-instagram" rel="external" title="instagram"></a></li>
								<li><a href="https://youtube.com" class="fa fa-youtube-square" rel="external" title="youtube"></a></li>
								<li><a href="https://tumblr.com" class="fa fa-tumblr-square" rel="external" title="tumblr"></a></li>
							</ul>
-->
							<?php echo do_shortcode('[feather_follow show="facebook, twitter, pinterest, instagram, youtube, tumblr"]'); ?>
						</div>
					</div>

					<div class="norton">
						<div class="col-xs-6">
							<img src="<?php echo get_template_directory_uri();?>/img/norton-secured.png" alt="Norton Secured">
						</div>

						<div class="col-xs-6">
							<div class="cc">
								<ul>
									<li><span class="fa fa-cc-visa" title="visa"></span></li>
									<li><span class="fa fa-cc-amex" title="american express"></span></li>
									<li><span class="fa fa-cc-mastercard" title="mastercard"></span></li>
									<li><span class="fa fa-cc-paypal" title="paypal"></span></li>
								</ul>
							</div>
						</div>
					</div>
				</footer>

			</div>
		</div>
	</div>
	<!-- footer -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
