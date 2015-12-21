<?php
/**
 * Cart Page
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.8
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

wc_print_notices();

do_action( 'woocommerce_before_cart' ); ?>

<form id="cartForm" action="<?php echo esc_url( WC()->cart->get_cart_url() ); ?>" method="post">

<?php do_action( 'woocommerce_before_cart_table' ); ?>

<?php do_action( 'woocommerce_before_cart_contents' ); ?>

	<div class="cart-contents lower">

		<?php wc_get_template( 'cart/cart-contents.php' ); ?>



		<?php do_action( 'woocommerce_cart_actions' ); ?>

		<?php wp_nonce_field( 'woocommerce-cart' ); ?>

		<?php do_action( 'woocommerce_after_cart_contents' ); ?>
	</div>






<?php do_action( 'woocommerce_after_cart_table' ); ?>

</form>

<div class="cart-collaterals lower">


  <div class="cart-totals subtotal">
    <p><?php _e('Total', 'btk'); ?>&nbsp;<?php echo WC()->cart->get_cart_subtotal(); ?></p>
    
  </div>
  <div class="cart-totals estimation">
    <p><?php _e('estimated shipping cost', 'btk'); ?>&nbsp;<span class="estimated-amount">---</span> </p>
    
  </div>
  <div class="cart-totals availability">
  <?php 
    $current_time = time();
    $latest_delay = $current_time;
    foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
      
        $stock_delay = strtotime(get_post_meta($cart_item['variation_id'],'_stock_backorder_delay',true));
        $stock_qty = get_post_meta($cart_item['variation_id'],'_stock',true);
				$stock_wanted = $cart_item['quantity'];
				if( $stock_wanted <= $stock_qty ){
				  $stock_delay = 0;
				}

        if($stock_delay > $latest_delay){
          $latest_delay = $stock_delay;
        }
    };
    
    if($latest_delay !== $current_time){
      echo "<p>" . btk_time_elapsed($latest_delay)."</p>";  
    }else{
      echo "<p>1 Week</p>";
    }
    
    ?>
    
  <?php
    
        //       $stock_qty = get_post_meta($cart_item['variation_id'],'_stock',true);
				    //   $stock_delay = get_post_meta($cart_item['variation_id'],'_stock_backorder_delay',true);
				    //   $stock_avail = $stock_qty > 0 ? '' : btk_time_elapsed( strtotime($stock_delay));
						  // echo  "$stock_avail";
				    ?>
  </div>
  <div class="cart-totals message">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut pellentesque vulputate venenatis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ut lacinia ligula. Aenean vel velit molestie, dapibus tortor eget, dignissim nibh.</p>
  </div>
	<div class="cart-buttons">
	<span class="alignleft">
		<span class="valign"><?php _e('continue shopping', 'btk'); ?></span>
		<a href="<?php echo esc_url(home_url('/'));?>" class="valign icon-arrow-lite-left-white btk-cart-back-button"></a>
	</span>
	<span class="alignright">
		<span class="valign"><?php _e('check out', 'btk'); ?></span>
		  <?php 
		    $checkouturl = esc_url( home_url('/') ) . 'checkout/?guest='.$_GET['guest']; 
		  ?>
		  <a href="<?php echo $checkouturl; ?>" class="valign icon-arrow-lite-right-white btk-cart-checkout-button"></a>
	</span>

  </div>
</div>

<?php //do_action( 'woocommerce_after_cart' ); ?>


