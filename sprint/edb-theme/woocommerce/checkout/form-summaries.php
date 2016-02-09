<?php
  if ( ! defined( 'ABSPATH' ) ) {
   
    exit;
  }
  if(!empty(WC()->session->get('edb_current_panel'))){
    $current_panel = WC()->session->get('edb_current_panel');
  }else{
    $current_panel = '#address-info-panel';
  }
  
  // write_log(WC()->session);
?>
<div class="checkout-tabs-and-summaries">
<div id="checkout-panel-tabs">
  <!--<?php var_dump(WC()->customer ); ?>-->
  <a href="#address-info-panel" class="<?php edb_panel_active('#address-info-panel'); ?>">address</a>
  <a href="#shipping-packages-panel" class="<?php edb_panel_active('#shipping-packages-panel'); ?>">delivery fees</a>
  <a href="#payment-info-panel" class="<?php edb_panel_active('#payment-info-panel'); ?>">payment details</a>
  <a href="#place-order-panel" class="<?php edb_panel_active('#place-order-panel'); ?>">review & submit</a>
</div>

<div id="checkout-panel-summaries">
  <div data-panel="#address-info-panel" class="summary">
    <a href="#" class="summary-toggle">
      <?php _e('Billing Address', 'edb'); ?>
    </a>
    <div class="summary-data">
      <?php edb_checkout_billing_address_summary(); ?>
    </div>
    <?php if( WC()->session->get('do_not_ship') != 1){ ?>
    <div class="summary-title">
      <?php _e('Shipping Address', 'edb'); ?>
    </div>
    <div class="summary-data">
      <?php edb_checkout_shipping_address_summary(); ?>
    </div>
    <?php }; ?>
    
  </div>
  <div data-panel="#shipping-packages-panel" class="summary">
    <a href="#" class="summary-toggle">
      <?php _e('Delivery Fees', 'edb'); ?>
    </a>
    <div class="summary-data">
      <?php edb_checkout_delivery_fees_summary( ); ?>
      
      
    </div>
  </div>
  <div data-panel="#payment-info-panel" class="summary">
    <a href="#" class="summary-toggle">
      <?php _e('Payment Details', 'edb'); ?>
    </a>
    <div class="summary-data">
      <?php edb_checkout_payment_summary(); ?>
      
      
    </div>
  </div>
  <div data-panel="#place-order-panel" class="summary">
    <a href="#" class="summary-toggle">
      <?php _e('Total', 'edb'); ?>
    </a>
    <div class="summary-data">
      <span class="sumary-total"><?php wc_cart_totals_order_total_html(); ?></span>
    </div>
  </div>
</div>

</div>