<?php
/**
 * Lost password form
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php wc_print_notices(); ?>

<form method="post" class="lost_reset_password">

	<?php if( 'lost_password' == $args['form'] ) : ?>

		<p><?php echo apply_filters( 'woocommerce_lost_password_message', __( 'Lost your password? Please enter your username or email address. You will receive a link to create a new password via email.', 'btk' ) ); ?></p>

		<p>
			<label for="user_login" class="hide"></label>
			<input class="input-text" type="text" name="user_login" id="user_login" placeholder="<?php _e( 'username or email', 'btk' ); ?>" />
		</p>

	<?php else : ?>

		<p><?php echo apply_filters( 'woocommerce_reset_password_message', __( 'Enter a new password below.', 'btk') ); ?></p>

		<p>
			<label for="password_1" class="hide"></label>
			<input type="password" class="input-text" name="password_1" id="password_1" placeholder="<?php _e( 'new password', 'btk' ); ?>" />
		</p>
		<p>
			<label for="password_2" class="hide"></label>
			<input type="password" class="input-text" name="password_2" id="password_2" placeholder="<?php _e( 're-enter new password', 'btk' ); ?>" />
		</p>

		<input type="hidden" name="reset_key" value="<?php echo isset( $args['key'] ) ? $args['key'] : ''; ?>" />
		<input type="hidden" name="reset_login" value="<?php echo isset( $args['login'] ) ? $args['login'] : ''; ?>" />

	<?php endif; ?>

	<div class="clear"></div>

	<p class="alignright">
		<input type="hidden" name="wc_reset_password" value="true" />
		<span class="valign"><?php echo 'lost_password' == $args['form'] ? __( 'Reset Password', 'btk' ) : __( 'Save', 'btk' ); ?></span>
		<input class="valign icon-arrow-lite-right-white" type="submit" value="" />
	</p>

	<?php wp_nonce_field( $args['form'] ); ?>

</form>
