<?php
/**
 * My Account page
 *

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
  $credit_coupon_code = get_points_coupon_for_email( $current_user->user_email );
  if(!empty($credit_coupon_code) ){
    $info = get_points_info_for_coupon_code($credit_coupon_code);
    ?>
    <div id="personal-coupon-info">
      <div class="info-line">
        <p><?php printf( __( 'Your very own personal coupon code is: %s', 'edb'), '<code>'.$info['coupon_code'].'</code>' ); ?></p>
      </div>
      
      <?php if($info['points_available'] > 0){ ?>
      <div class="info-line">
        <p><?php printf( __( 'You currently have a balance of %s.', 'edb'), '<b>'.wc_price($info['points_available'] ).'</b>') ; ?></p>
      </div>
      <?php }else{ ?>
      <div class="info-line">
        <?php
        // __( 'Share this code with your friends and family and you get credited 10% of every sale.', 'edb'); 
        ?>
      </div>
      <?php }; ?>
    </div>
    
  <?php  
  }
  $edb_credits = absint(get_user_meta($current_user->ID, '_edb_manual_credit', true));
  if(!empty($edb_credits) && $edb_credits > 0){
    ?>
    <div id="personal-coupon-info">
      <hr>
      <div class="info-line">
        
        <p><?php printf( __( 'You currently have a credit balance of %s.', 'edb'), '<b>'.wc_price($edb_credits ).'</b>') ; ?></p>
      </div>
      </div>
    <?php
  }
  
?>  


<?php wc_get_template( 'myaccount/my-downloads.php' ); ?>

<?php wc_get_template( 'myaccount/my-orders.php', array( 'order_count' => $order_count ) ); ?>

<?php wc_get_template( 'myaccount/my-address.php' ); ?>

<?php do_action( 'woocommerce_after_my_account' ); ?>
