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


				
<div id="back-to-top" class="lower center">
					<a href="#top"><?php _e('Back to top', 'btk'); ?></a>
				</div>
	<!-- footer -->
	<div id="footer-box">
	
		<div class="container">
			<div class="row">


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

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.development.elementdebase.com.com"]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//anal.akr.club/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 4]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//anal.akr.club/piwik.php?idsite=4" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->
<?php $toastID = get_ID_by_page_name('contest-toast'); ?>
<div id="toast" data-toast="<?php echo $toastID; ?>">
<a href="#" class="close">close</a>

<div class="page">

<?php $recent = new WP_Query("page_id=$toastID"); while($recent->have_posts()) : $recent->the_post();?>
	<?php
	  $bgimage = null;
		if ( has_post_thumbnail() ) {
		   $thumbnail = wp_get_attachment_image_src( get_post_thumbnail_id($toastID), 'full' );
		}
		if ($thumbnail[0]){
		  $bgimage = $thumbnail[0];
		}
	?>
  <div class="image" style="background-image:url('<?php echo $bgimage; ?>')">
	</div>
	<div class="content">
	     <h3 class="title"><?php the_title(); ?></h3>
       <div class="body"><?php the_content(); ?></div>
	</div>
  
<?php endwhile; ?>
</div>
</div>
<!-- <script src="http://badb0x.akr.club:35729/livereload.js"></script> -->
<!--

<?php //print_r( get_included_files() ) ?>

-->
</body>
</html>
