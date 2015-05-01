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

$get_addresses    = apply_filters( 'woocommerce_my_account_get_addresses', array(
	'billing' => __( 'Billing Address', 'woocommerce' ),
	'shipping' => __( 'Shipping Address', 'woocommerce' )
), $customer_id );

wc_print_notices();

?>

<p class="myaccount_user">
	<?php
	printf(
		__( 'Welcome <strong>%1$s</strong> (not %1$s? <a href="%2$s">Sign out</a>)<br />', 'woocommerce' ) . ' ',
		$current_user->display_name,
		wc_get_endpoint_url( 'customer-logout', '', wc_get_page_permalink( 'myaccount' ) )
	);
	?>
	From your account dashboard you can view your recent orders, manage your <a href="#edit-address">shipping and billing addresses</a> and edit your <a href="#edit-account">password and account details</a>.
</p>

<?php do_action( 'woocommerce_before_my_account' ); ?>

<div id="edit-account">
	<h2>Account details</h2>
	<?php wc_get_template( 'myaccount/form-edit-account.php', array( 'user' => $current_user ) ); ?>
</div>

<?php wc_get_template( 'myaccount/my-downloads.php' ); ?>

<div id="edit-address">
	<h2>My addresses</h2>
	<p class="myaccount_address">
		<?php echo apply_filters( 'woocommerce_my_account_my_address_description', __( 'The following addresses will be used on the checkout page by default.', 'woocommerce' ) ); ?>
	</p>
	<?php foreach ( $get_addresses as $name => $title ) : ?>
	<div>
		<h3 class="alignleft"><?php echo $title; ?></h3>
		<a href="<?php echo wc_get_endpoint_url( 'edit-address', $name ); ?>" class="edit alignright"><?php _e( 'Edit', 'woocommerce' ); ?></a>
	<?php
		$address = apply_filters( 'woocommerce_my_account_my_address_formatted_address', array(
			'first_name'  => get_user_meta( $customer_id, $name . '_first_name', true ),
			'last_name'   => get_user_meta( $customer_id, $name . '_last_name', true ),
			'company'     => get_user_meta( $customer_id, $name . '_company', true ),
			'address_1'   => get_user_meta( $customer_id, $name . '_address_1', true ),
			'address_2'   => get_user_meta( $customer_id, $name . '_address_2', true ),
			'city'        => get_user_meta( $customer_id, $name . '_city', true ),
			'state'       => get_user_meta( $customer_id, $name . '_state', true ),
			'postcode'    => get_user_meta( $customer_id, $name . '_postcode', true ),
			'country'     => get_user_meta( $customer_id, $name . '_country', true )
		), $customer_id, $name);

		$formatted_address = WC()->countries->get_formatted_address( $address );
	?>
		<p>
		<?php
			if ( ! $formatted_address )
				_e( 'You have not set up this type of address yet.', 'woocommerce' );
			else
				echo $formatted_address;
		?>
		</p>
	</div>
	<?php endforeach; ?>
</div>

<div class="recent-orders">
	<?php wc_get_template( 'myaccount/my-orders.php', array( 'order_count' => $order_count ) ); ?>
</div>

<?php do_action( 'woocommerce_after_my_account' ); ?>
