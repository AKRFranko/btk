<?php
/**
 * Customer new account email
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates/Emails
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php do_action( 'woocommerce_email_header', $email_heading ); ?>

<p><?php printf( __("Hello %s", 'edb') , esc_html( $user_login ) ); ?></p>

<p><?php _e("Thanks for joining elementdebase.com", "edb"); ?></p>
 
<p>
  <?php printf(__("Your username: %s",'edb'),  esc_html( $user_login )); ?><br /> 
  <?php _e("Your password: ******",'edb'); ?><br />
</p>
 
<p>
<?php _e("If you’ve forgotten your password, just ask us to send you a new one when you log-in. ", "edb"); ?><br/>
<?php _e("We look forward to seeing you soon,", "edb"); ?>
</p>

<p>
<?php _e("The team at elementdebase.com","edb"); ?> 
T. 1-844-738-6484
</p>

<p>
<?php _e("We’re excited you’ve joined us on our quest for inspiring furniture at affordable prices. We’ve founded this new company for all the creatives out there, just like you. ", "edb"); ?><br/>
<?php _e("All those who dare to be unique, those who colour outside the lines, the style makers and the dreamers. ", "edb"); ?>
</p>
 
<p><?php _e("Welcome to edb!","edb"); ?></p> 


<?php do_action( 'woocommerce_email_footer' ); ?>
