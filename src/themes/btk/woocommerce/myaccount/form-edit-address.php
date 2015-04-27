<?php
/**
 * Edit address form
 *
 * @author      WooThemes
 * @package     WooCommerce/Templates
 * @version     2.1.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php wc_print_notices(); ?>

<form method="post">

	<h2>Billing Address</h2>

	<?php do_action( "woocommerce_before_edit_address_form_billing" ); ?>

	<?php foreach ( $billing as $key => $field ) : ?>

	<p>
		<label for="<?php echo $key ?>" class="hide"></label>
		<input type="text" class="input-text" name="<?php echo $key ?>" id="<?php echo $key ?>" placeholder="" value="<?php echo $field; ?><?php if ( ! empty( $_POST[ $key ] ) ) echo esc_attr( $_POST[ $key ] ) ?>">
	</p>

		<?php //woocommerce_form_field( $key, $field, ! empty( $_POST[ $key ] ) ? wc_clean( $_POST[ $key ] ) : $field['value'] ); ?>

	<?php endforeach; ?>

	<?php do_action( "woocommerce_after_edit_address_form_billing" ); ?>

	<p class="alignright">
		<?php wp_nonce_field( 'woocommerce-edit_address' ); ?>
		<span class="valign">save billing address</span>
		<input type="submit" class="valign icon-arrow-lite-right-white" name="save_address" value="<?php _e( 'Save Address', 'woocommerce' ); ?>" />
		<input type="hidden" name="action" value="edit_address" />
	</p>

</form>

