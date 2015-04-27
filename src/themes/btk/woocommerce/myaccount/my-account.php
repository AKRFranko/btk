<?php
/**
 * My Account page
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

$customer_id = get_current_user_id();

wc_print_notices(); ?>

<p class="myaccount_user">
	<?php
	printf(
		__( 'Welcome <strong>%1$s</strong> (not %1$s? <a href="%2$s">Sign out</a>)<br />', 'woocommerce' ) . ' ',
		$current_user->display_name,
		wc_get_endpoint_url( 'customer-logout', '', wc_get_page_permalink( 'myaccount' ) )
	);

	printf( __( 'From your account dashboard you can view your recent orders, manage your shipping and billing addresses and <a href="%s">edit your password and account details</a>.', 'woocommerce' ),
		wc_customer_edit_account_url()
	);
	?>
</p>

<?php do_action( 'woocommerce_before_my_account' ); ?>

<div class="edit-account">
	<h2>Account details</h2>
	<?php wc_get_template( 'myaccount/form-edit-account.php', array( 'user' => $current_user ) ); ?>
</div>

<?php wc_get_template( 'myaccount/my-downloads.php' ); ?>

<div class="edit-address">
	<?php wc_get_template( 'myaccount/my-address.php' ); ?>
	<h2>My addresses</h2>
	<p class="myaccount_address">
		<?php echo apply_filters( 'woocommerce_my_account_my_address_description', __( 'The following addresses will be used on the checkout page by default.', 'woocommerce' ) ); ?>
	</p>
	<?php
		$billing = apply_filters( 'woocommerce_my_account_my_address_formatted_address', array(
			'billing_first_name'  => get_user_meta( $customer_id, 'billing_first_name', true ),
			'billing_last_name'   => get_user_meta( $customer_id, 'billing_last_name', true ),
			'billing_company'     => get_user_meta( $customer_id, 'billing_company', true ),
			'billing_address_1'   => get_user_meta( $customer_id, 'billing_address_1', true ),
			'billing_address_2'   => get_user_meta( $customer_id, 'billing_address_2', true ),
			'billing_city'        => get_user_meta( $customer_id, 'billing_city', true ),
			'billing_state'       => get_user_meta( $customer_id, 'billing_state', true ),
			'billing_postcode'    => get_user_meta( $customer_id, 'billing_postcode', true ),
			'billing_country'     => get_user_meta( $customer_id, 'billing_country', true )
		), $customer_id);
	?>
	<?php wc_get_template( 'myaccount/form-edit-address.php', array( 'billing' => $billing ) ); ?>
</div>

<?php wc_get_template( 'myaccount/my-orders.php', array( 'order_count' => $order_count ) ); ?>

<?php do_action( 'woocommerce_after_my_account' ); ?>
