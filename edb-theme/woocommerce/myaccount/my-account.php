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
if(isset($_GET['new'])){
  wc_add_notice(__('Thank you for registering with elementdebase.com','edb'), 'success');  
}

wc_print_notices(); 

?>
<br />
<h1><?php _e('My Account', 'edb'); ?></h1>
<p class="myaccount_user">
	<?php
	printf(
		__( 'Hello <strong>%1$s</strong> (not %1$s? <a href="%2$s">Sign out</a>).', 'woocommerce' ) . ' ',
		$current_user->display_name,
		wc_get_endpoint_url( 'customer-logout', '', wc_get_page_permalink( 'myaccount' ) )
	);
	?>
</p>
<p>
  <?php
  
  printf( __( 'From your account dashboard you can view your recent orders, manage your shipping and billing addresses and <a href="%s">edit your password and account details</a>.', 'woocommerce' ),
    wc_customer_edit_account_url()
  );
  ?>
</p>

<?php do_action( 'woocommerce_before_my_account' ); ?>

<?php 
  $personal_coupon = edb_current_user_personal_coupon_info();
  if(!empty($personal_coupon)){
?>
  <div id="personal-coupon-info">
    <div class="info-line">
      <?php printf( __( 'Your very own personal coupon code is: %s', 'edb'), '<code>'.$personal_coupon['code'].'</code>' ); ?>  
    </div>
    <div class="info-line">
      <?php printf( __( 'You currently have a %s credit left.', 'edb'), '<b>'.wc_price($personal_coupon['credits_available'] ).'</b>') ; ?>
    </div>
    
  </div>
<?php };?>

<?php wc_get_template( 'myaccount/my-downloads.php' ); ?>

<?php wc_get_template( 'myaccount/my-orders.php', array( 'order_count' => $order_count ) ); ?>

<?php wc_get_template( 'myaccount/my-address.php' ); ?>

<?php do_action( 'woocommerce_after_my_account' ); ?>
