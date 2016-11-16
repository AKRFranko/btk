<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package edb
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

			<?php
			while ( have_posts() ) : the_post();

				get_template_part( 'template-parts/content', 'page' );

				// If comments are open or we have at least one comment, load up the comment template.
				if ( comments_open() || get_comments_number() ) :
					comments_template();
				endif;

			endwhile; // End of the loop.
			?>
      <form id="partial-payment-form" method="POST" action="<?php echo esc_url( admin_url('admin-post.php') ); ?>">
        <?php 
          $current_user = wp_get_current_user(); 
          if($current_user->user_email){
            $user_email = $current_user->user_email;
          }else{
            $user_email = $_POST['email'];
          }
          $user_phone = $_REQUEST['phone'];
        ?>
        <input type="hidden" name="action" value="partial_payment">
        <div class="form-input <?php echo $_SERVER['REQUEST_METHOD'] == 'POST' && empty($user_email) ? 'error' : '' ?>">
          <input type="hidden" name="order_id" value="<?php echo $_REQUEST['order_id']; ?>">
          <input type="email" name="email" placeholder="<?php _e('email','edb'); ?>" value="<?php echo $user_email ?>">
        </div>
        <div class="form-input <?php echo $_SERVER['REQUEST_METHOD'] == 'POST' && empty($user_email) ? 'error' : '' ?>">
          <input type="tel" name="phone" placeholder="<?php _e('phone','edb'); ?>" value="<?php echo $user_phone ?>">
        </div>
        <button type="submit" value="<?php echo $_REQUEST['order_id']; ?>"><?php _e('submit', 'edb'); ?></button>
          
        
      </form>
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar();
get_footer();
