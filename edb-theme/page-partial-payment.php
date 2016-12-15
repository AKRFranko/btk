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

get_header(); 
if(!isset(WC()->cart) || WC()->cart->get_cart_contents_count() == 0){
  //var_dump( WC()->cart->get_cart_contents_count() );
  include( get_query_template( '404' ) );
  exit; # so that the normal page isn't loaded after the 404 page
}
?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

      
        <?php
          $current_user = wp_get_current_user(); 
          $customer = WC()->customer;
          
          $user_name = $_POST['name'];
          $user_email = $_POST['email'];
          $user_phone = $_POST['phone'];
          $billing_email = $customer->billing_email;
          $billing_phone = $customer->billing_phone;
          
          $user_name = isset( $_POST['name'] ) && !empty( $_POST['name'] ) ? $_POST['name'] : null;
          $user_email = isset( $_POST['email'] ) && !empty( $_POST['email'] ) ? $_POST['email'] : isset( $billing_email ) && !empty($billing_email) ? $billing_email : null;
          
          $user_phone = isset( $_POST['phone'] ) && !empty( $_POST['phone'] ) ? $_POST['phone'] : isset( $billing_phone ) && !empty($billing_phone) ? $billing_phone : null;
          
          $partial_payment_completed=false;
          
          if( !empty($user_email) && !empty($user_phone) && strtoupper($_SERVER['REQUEST_METHOD'] === 'POST')){
                
                $order_id = WC()->checkout->create_order();
                $order = new WC_Order($order_id);
                $order->update_status('on-hold');
                $order->add_order_note('Partial payment requested on '.date('l jS \of F Y h:i:s A').' name: '.$user_name.' email: '.$user_email.' phone: '.$user_phone);
                $partial_payment_completed = true; 
                
                
          }
          
        ?>
        
        <?php if(!$partial_payment_completed){ ?>
          
        <?php
        while ( have_posts() ) : the_post();
  
          get_template_part( 'template-parts/content', 'page' );
  
          // If comments are open or we have at least one comment, load up the comment template.
          if ( comments_open() || get_comments_number() ) :
            comments_template();
          endif;
  
        endwhile; // End of the loop.
        ?>
        <form id="partial-payment-form" method="POST">
          
            <!--<input type="hidden" name="action" value="partial_payment">-->
            <div class="form-input">
              <input type="text" name="name" placeholder="<?php _e('your name','edb'); ?>" value="<?php echo $user_name ?>">
            </div>
            <div class="form-input <?php echo $_SERVER['REQUEST_METHOD'] == 'POST' && empty($user_email) ? 'error' : '' ?>">
              <!--<input type="hidden" name="order_id" value="<?php echo $_REQUEST['order_id']; ?>">-->
              <input type="email" required name="email" placeholder="<?php _e('email','edb'); ?>" value="<?php echo $user_email ?>">
            </div>
            <div class="form-input <?php echo $_SERVER['REQUEST_METHOD'] == 'POST' && empty($user_email) ? 'error' : '' ?>">
              <input type="tel" required name="phone" placeholder="<?php _e('phone','edb'); ?>" value="<?php echo $user_phone ?>">
            </div>
            <button type="submit"><?php _e('submit', 'edb'); ?></button>
              
      </form>        
      
        <?php }else{
          
          WC()->cart->empty_cart();
        ?>
        
          <script>jQuery('#cart-item-counter').remove();</script>
          <p class="thank-you">
            <?php _e('Thank you for shopping at edb.You will receive an order confirmation with the deposit amount (50%)<br /> that you can settle directly online with a credit card.'); ?>
          </p>
        <?php
        } ?>
        
      
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar();
get_footer();
