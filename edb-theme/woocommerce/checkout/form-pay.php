<?php
/**
 * Pay for order form
 *
 * @author   WooThemes
 * @package  WooCommerce/Templates
 * @version  2.4.7
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}


$gates = WC()->payment_gateways->get_available_payment_gateways();
$i = 0;
$main_gateway = null;
foreach( $gates as $k => $gate){
  if($i == 0 ) $main_gateway = $gate;
  $i++;
}
$main_gateway->chosen=true;
$order->set_payment_method( $main_gateway );
// $gateway->chosen = true;


foreach($order->get_address('shipping') as $k => $v ){
  // if($k == 'first_name' || $k == 'last_name'){
  //   WC()->customer->${k} = $v;
  // }else{
    $key = "shipping_$k";
    WC()->customer->{$key} = $v;
  // }

}
foreach($order->get_address('billing') as $k => $v ){
  if($k == 'first_name' || $k == 'last_name' || $k == 'email' || $k == 'phone'){
    WC()->customer->{$k} = $v;
  }
  $key = "$k";
  WC()->customer->{$key} = $v;
}

// write_log('**************************');
// $cart = WC()->cart;
// $checkout = WC()->checkout;
// $checkout->order = $order;
// $checkout->enable_guest_checkout=true;
// foreach( $order->get_items() as $order_item){
//   $cart->add_to_cart( $order_item['product_id'], $order_item['qty'], $order_item['variation_id']);
// }
// write_log(WC()->checkout);
// write_log('**************************');
// do_action( 'woocommerce_before_checkout_form', $checkout );
// filter hook for include new pages inside the payment method
// $get_checkout_url = apply_filters( 'woocommerce_get_checkout_url', WC()->cart->get_checkout_url() ); 
?>


<form class="form-pay-order" id="order_review" method="post">
  
  <div class="pay-order-address">
    <h2><?php _e('billing address', 'edb'); ?></h2>
    <?php 
      
      $billing_fields = WC()->countries->get_address_fields( 'CA', 'billing_' );
      #edb_formated_customer_address( 'billing' ); 
    ?>
    <?php 
      # do_action( 'woocommerce_before_checkout_billing_form', $checkout ); 
    ?>
  
    <?php foreach ( $billing_fields as $key => $field ) : ?>
    
      <?php 
      
          woocommerce_form_field( $key, $field, $order->{$key}  ); 
      
      
      ?>
  
    <?php endforeach; ?>
    
    
    
  </div>
  <div class="pay-order-address">
    
    <h2><?php _e('shipping address', 'edb'); ?></h2>
    <?php 
      
      $shipping_fields = WC()->countries->get_address_fields( 'CA', 'shipping_' );
      #edb_formated_customer_address( 'billing' ); 
    ?>
    <?php 
      # do_action( 'woocommerce_before_checkout_billing_form', $checkout ); 
    ?>
  
    <?php foreach ( $shipping_fields as $key => $field ) : ?>
      <?php 
      if(!empty($order->{$key})){
        echo $order->{$key} . "<br/>";
        // $field['custom_attributes']['readonly'] = true;
        // array_push($field['class'], 'no-edit');
        //   woocommerce_form_field( $key, $field, $order->{$key}  );   
      }
      
      
      
      ?>
  
    <?php endforeach; ?>
    <!--<?php edb_formated_customer_address( 'shipping' ); ?>-->
  </div>
  <div class="pay-order-items">
    <h1><?php _e('items', 'edb')?></h1>
  <?php 
  foreach( $order->get_items() as $item_id => $item ){
    
    ?>
    <div class="cart_item">
      <div class="cart-item-image">
        
        <?php
            edb_package_item_image( $item_id, $item );
        ?>
      </div>
      <div class="cart-item-info">
        <div class="cart-item-name">
          <?php
              
              edb_package_item_name( $item_id, $item );
          ?>
        </div>
        <div class="cart-item-material">
          <?php
              edb_package_item_material( $item_id, $item );
          ?>
        </div>
        <div class="cart-item-category">
          <?php
              edb_package_item_category( $item_id, $item );
              // echo $total;
          ?>
          
        </div>
        
        <div class="cart-item-availability">
          <?php 
            // if($shipping_method != 'edb_self_pickup'){
              edb_order_item_availability($item, $order);  
            // }
          ?>
        </div>
        <div class="cart-item-quantity">
          <?php 
            // if($shipping_method != 'edb_self_pickup'){
              edb_order_item_quantity($item, $order);  
            // }
          ?>
        </div>
      </div>
  
    </div>
    <?php
  }
  ?>
  </div>
  <div class="pay-order-totals">
    <h1><?php _e('totals', 'edb')?></h1>
  <?php
    if ( $totals = $order->get_order_item_totals() ) foreach ( $totals as $total ) :
      ?>
      <div class="cost-line">
        <span class="label"><?php echo $total['label']; ?></span>
        <span class="value"><?php echo $total['value']; ?></span>
      </div>
      
      <?php
    endforeach;
  ?>
  <div class="pay-order-payment">
    <h1><?php _e('payment', 'edb')?></h1>
  <div class="payment_methods methods">
    <?php
    if ( $available_gateways = WC()->payment_gateways->get_available_payment_gateways() ) {
      if ( ! empty( $available_gateways ) ) {
        foreach ( $available_gateways as $gateway ) {
          wc_get_template( 'checkout/payment-method.php', array( 'gateway' => $gateway ) );
        }
      } else {
        if ( ! WC()->customer->get_country() ) {
          $no_gateways_message = __( 'please fill in your details above to see available payment methods.', 'edb' );
        } else {
          $no_gateways_message = __( 'sorry, it seems that there are no available payment methods for your state. please contact us if you require assistance or wish to make alternate arrangements.', 'edb' );
        }
  
        echo '<li>' . apply_filters( 'woocommerce_no_available_payment_methods_message', $no_gateways_message ) . '</li>';
      }
    }
    ?>
  </div>  
  <div class="pay-order-submit">
    
          <?php wp_nonce_field( 'woocommerce-pay' ); ?>
          <?php
                  $pay_order_button_text = apply_filters( 'woocommerce_pay_order_button_text', __( 'Pay for order', 'woocommerce' ) );

                  echo apply_filters( 'woocommerce_pay_order_button_html', '<input type="submit" class="button alt" id="place_order" value="' . esc_attr( $pay_order_button_text ) . '" data-value="' . esc_attr( $pay_order_button_text ) . '" />' );
          ?>
          <input type="hidden" name="woocommerce_pay" value="1" />
  </div>
  </div>
  </div>
 
  
  
 
  
  

</form>

