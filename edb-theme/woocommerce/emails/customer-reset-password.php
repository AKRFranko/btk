<?php
/**
 * Customer Reset Password email
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates/Emails
 * @version     2.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php do_action( 'woocommerce_email_header', $email_heading ); ?>

<p><?php printf(__("Hello %s,", "edb"), $user_login ); ?></p>

<p><?php _e("There was recently a request to change the password to your elementdebase account. If you requested this password change, please click on the following link to reset your password. ", "edb"); ?></p> 
 
<a class="link" href="<?php echo esc_url( add_query_arg( array( 'key' => $reset_key, 'login' => rawurlencode( $user_login ) ), wc_get_endpoint_url( 'lost-password', '', wc_get_page_permalink( 'myaccount' ) ) ) ); ?>"><?php _e( 'Click here to reset your password', 'edb' ); ?></a>
 
<p><?php _e('If the link does not work, please copy and paste the URL into your browser.', "edb"); ?></p>

<p><?php _e('If you did not make this request, please ignore this message and your password will remain the same.', "edb"); ?></p>
 
<p><?php _e('If you have any questions about this email, please don’t hesitate to contact our Member services team and we’ll be happy to assist you.', "edb"); ?></p>

<p><?php _e('The team at edb', "edb"); ?></p> 

<p>534, rue McCaffrey<br/>
1-844-738-6484<br/>
www.elementdebase.com<br/>
</p>

<?php do_action( 'woocommerce_email_footer' ); ?>
