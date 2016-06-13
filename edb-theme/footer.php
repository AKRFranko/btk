<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package edb
 */

?>

	</div><!-- #content -->

	
</div><!-- #page -->
<footer id="colophon" class="site-footer" role="contentinfo">
  <a id="back-to-top" href="#top"><?php _e('back to top', 'edb') ?></a>
  <?php wp_nav_menu( array( 'menu' => 'footer' ) ); ?>
  <?php wp_nav_menu( array( 'menu' => 'footer2' ) ); ?>
  <!--<?php echo do_shortcode('[feather_follow show="facebook, twitter, pinterest, instagram, youtube, tumblr"]'); ?>-->
  <img id="register-seal" src="/wp-content/register-site-seal.gif">
  <a id="paypal-logo" href="https://www.paypal.com/webapps/mpp/paypal-popup" title="How PayPal Works" onclick="javascript:window.open('https://www.paypal.com/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img src="https://www.paypalobjects.com/webstatic/mktg/logo/bdg_secured_by_pp_2line.png" border="0" alt="Secured by PayPal"></a>
</footer><!-- #colophon -->

<?php wp_footer(); ?>
<div id="overlay"></div>
<!--<div id="info-toast" class="toast">-->
<!--  <h1>INFO TOAST</h1>-->
<!--</div>-->

<?php if(is_home()){ ?>
<div id="splash" data-id="welcome" class="toast fullbleed">
  <?php edb_splash_page(); ?>
</div>
<?php }; ?>

<div id="contest" class="toast vertical" data-id="contest-1">
  <?php $toastID = get_ID_by_page_name('contest-toast'); ?>
  
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
<?php if(is_product()){ ?>
  <?php edb_material_toasts(); ?>
<?php } ?>
<?php bustpagecache(); ?>

</body>
</html>
