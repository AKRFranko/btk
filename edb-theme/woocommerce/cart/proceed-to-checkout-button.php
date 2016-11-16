<?php
/**
 * Proceed to checkout button
 *
 * Contains the markup for the proceed to checkout button on the cart
 *
 * @author  WooThemes
 * @package WooCommerce/Templates
 * @version 2.4.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
?>
<div class="shipping-review-notice">
  
  <p><?php _e('We offer the self pick-up option. Come pick up your order at tour warehouse and save an additional 5% on the last ticketed price', "edb"); ?></p>
</div>
<form method="post" action="<?php echo WC()->cart->get_checkout_url(); ?>">
  
<?php
  echo '<button class="checkout-button button alt wc-forward">' . __( 'proceed to checkout', 'edb' ) . '</button>';
?>
</form>
