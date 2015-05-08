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

global $current_user;

$page_title = ( $load_address === 'billing' ) ? __( 'Billing Address', 'woocommerce' ) : __( 'Shipping Address', 'woocommerce' );

get_currentuserinfo();

?>

<?php wc_print_notices(); ?>

<form method="post" class="billing-shipping-edit">

	<?php do_action( "woocommerce_before_edit_address_form_{$load_address}" ); ?>

	<?php foreach ( $address as $key => $field ) : ?>

		<?php woocommerce_form_field( $key, $field, ! empty( $_POST[ $key ] ) ? wc_clean( $_POST[ $key ] ) : $field['value'] ); ?>

	<?php endforeach; ?>

	<?php do_action( "woocommerce_after_edit_address_form_{$load_address}" ); ?>

	<p class="alignright">
		<span class="valign">save <?php echo $load_address; ?> address</span>
		<input type="submit" class="valign icon-arrow-lite-right-white" name="save_address" value="<?php _e( 'Save Address', 'woocommerce' ); ?>" />
		<?php wp_nonce_field( 'woocommerce-edit_address' ); ?>
		<input type="hidden" name="action" value="edit_address" />
	</p>

</form>

