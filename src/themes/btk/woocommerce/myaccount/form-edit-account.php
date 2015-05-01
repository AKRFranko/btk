<?php
/**
 * Edit account form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.2.7
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php wc_print_notices(); ?>

<form method="post">

	<?php do_action( 'woocommerce_edit_account_form_start' ); ?>

	<p>
		<label for="account_first_name" class="hide"></label>
		<input type="text" class="input-text" name="account_first_name" id="account_first_name" placeholder="<?php _e( 'first name', 'woocommerce' ); ?>" value="<?php echo esc_attr( $user->first_name ); ?>" />
	</p>
	<p>
		<label for="account_last_name" class="hide"></label>
		<input type="text" class="input-text" name="account_last_name" id="account_last_name" placeholder="<?php _e( 'last name', 'woocommerce' ); ?>" value="<?php echo esc_attr( $user->last_name ); ?>" />
	</p>

	<p>
		<label for="account_email" class="hide"></label>
		<input type="email" class="input-text" name="account_email" id="account_email" placeholder="<?php _e( 'email', 'woocommerce' ); ?>" value="<?php echo esc_attr( $user->user_email ); ?>" />
	</p>

	<fieldset>
		<legend><?php _e( 'Password Change', 'woocommerce' ); ?></legend>

		<p>
			<label for="password_current" class="hide"></label>
			<input type="password" class="input-text" name="password_current" id="password_current" placeholder="<?php _e( 'current password (leave blank to leave unchanged)', 'woocommerce' ); ?>" />
		</p>
		<p>
			<label for="password_1" class="hide"></label>
			<input type="password" class="input-text" name="password_1" id="password_1" placeholder="<?php _e( 'new password (leave blank to leave unchanged)', 'woocommerce' ); ?>" />
		</p>
		<p>
			<label for="password_2" class="hide"></label>
			<input type="password" class="input-text" name="password_2" id="password_2" placeholder="<?php _e( 'confirm new password', 'woocommerce' ); ?>" />
		</p>
	</fieldset>

	<?php do_action( 'woocommerce_edit_account_form' ); ?>

	<p class="alignright">
		<?php wp_nonce_field( 'save_account_details' ); ?>
		<span class="valign">save changes</span>
		<input type="submit" class="valign icon-arrow-lite-right-white" name="save_account_details" value="" />
		<input type="hidden" name="action" value="save_account_details" />
	</p>

	<?php do_action( 'woocommerce_edit_account_form_end' ); ?>

</form>
