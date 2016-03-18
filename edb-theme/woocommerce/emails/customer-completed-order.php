<?php
/**
 * Customer completed order email
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates/Emails
 * @version     2.4.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php do_action( 'woocommerce_email_header', $email_heading ); ?>

<?php 
  $has_pickup_items =false;
  $num_pickup_items=0;
  $has_non_pickup_items=false;
  $shipping_methods = $order->get_shipping_methods();
  foreach($shipping_methods as $sm){
    if($sm['name'] == 'edb_self_pickup'){
      $has_pickup_items=true;
    }else if($sm['name'] != 'edb_self_pickup'){
      $has_non_pickup_items=true;
    }
  }
?>

<p><?php printf( __( "Hi there. Your recent order on %s has been completed. Your order details are shown below for your reference:", 'woocommerce' ), get_option( 'blogname' ) ); ?></p>

<?php if($has_pickup_items && !$has_non_pickup_items){ ?>
  <p><?php _('Your items are ready for pickup', 'edb'); ?></p>
<?php }else if($has_pickup_items && $has_non_pickup_items){ ?>
  <p><?php _e('Your items for pickup are ready, the others have been shipped.', 'edb'); ?></p>
<?php }else{ ?>
  <p><?php _e('Your order has been shipped.', 'edb'); ?></p>
<?php }; ?>

<?php do_action( 'woocommerce_email_before_order_table', $order, $sent_to_admin, $plain_text ); ?>

<table class="td" cellspacing="0" cellpadding="6" style="width: 100%; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;" border="1">
  <thead>
    <tr><th style="text-align:center" colspan="3"><?php printf( __( 'Order #%s', 'woocommerce' ), $order->get_order_number() ); ?> (<?php printf( '<time datetime="%s">%s</time>', date_i18n( 'c', strtotime( $order->order_date ) ), date_i18n( wc_date_format(), strtotime( $order->order_date ) ) ); ?>)</th></tr>
    
  </thead>
  <tbody>
    <?php
      switch ( $order->get_status() ) {
        case "completed" :
          echo $order->email_order_items_table( $order->is_download_permitted(), false, true );
        break;
        case "processing" :
          echo $order->email_order_items_table( $order->is_download_permitted(), true, true );
        break;
        default :
          echo $order->email_order_items_table( $order->is_download_permitted(), true, false );
        break;
      }
    ?>
  </tbody>
  <tfoot>
    <?php
      
      if ( $totals = $order->get_order_item_totals() ) {
        $i = 0;
        foreach ( $totals as $total ) {
          $i++;
          if( $total['label'] == 'Shipping:' || $total['label'] == 'Livraison:'){
            if($total['value'] != 'edb_self_pickup'){
            ?><tr>
              
              <td class="td" colspan="2" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php echo $total['label']; ?></td>
              <td class="td" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php edb_order_shipping_total( $order ) ?></td>
            </tr><?php  
            }else{
              ?>
            <tr>
              
              <td class="td" colspan="2" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php echo $total['label']; ?></td>
              <td class="td" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php echo $total['value']; ?></td>
            </tr>  
              <?php
            }  
          }else{
          ?><tr>
            
            <td class="td" colspan="2" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php echo $total['label']; ?></td>
            <td class="td" style="text-align:left; <?php if ( $i == 1 ) echo 'border-top-width: 4px !important;'; ?>"><?php echo $total['value']; ?></td>
          </tr><?php    
          }
          
          
          
        }
      }
    ?>
  </tfoot>
</table>

<?php do_action( 'woocommerce_email_after_order_table', $order, $sent_to_admin, $plain_text ); ?>

<?php do_action( 'woocommerce_email_order_meta', $order, $sent_to_admin, $plain_text ); ?>

<?php do_action( 'woocommerce_email_customer_details', $order, $sent_to_admin, $plain_text ); ?>

<?php do_action( 'woocommerce_email_footer' ); ?>
