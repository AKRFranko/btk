<?php

function time_elapsed($ptime) {
    $etime = $ptime - time();
    // write_log("etime: $etime ptime: $ptime");
    if ($etime < 1) {
      
        return '0 seconds';
    }
/*
12 * 30 * 24 * 60 * 60 => 'year',
30 * 24 * 60 * 60 => 'month'*/
    $a = array(
        7 * 24 * 60 * 60 => 'week'
        // 24 * 60 * 60 => 'day',
        // 60 * 60 => 'hour',
        // 60 => 'min',
        // 1 => 'sec'
    );

    foreach ($a as $secs => $text) {
        $d = $etime / $secs;
        if ($d >= 1) {
            $r = round($d);
            return " " . $r . ' ' . $text . ($r > 1 ? 's' : '');
        }
    }
}

function startsWith($haystack, $needle) {
    // search backwards starting from haystack length characters from the end
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}
function endsWith($haystack, $needle) {
    // search forward starting from end minus needle length characters
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== FALSE);
}


// class Edb_Vip_Coupon extends WC_Coupon{
//   function __construct( $level ){
    
//   }
// }

class Edb_Shipping_Method extends WC_Shipping_Method{
 
  public $shipping_debug = false;
  public $cart_item_shipments = array(); 
  
  public $rates_table = array(
     'furniture' => array( 
       'min' => 500,
       'below'=> array(
         'zone-1'=> 65,
         'zone-2'=> 150,
         'zone-3'=> 200
         ),
       'above'=> array(
         'zone-1'=> 0,
         'zone-2'=> 100,
         'zone-3'=> 300
         )
     ),
     'accessories'=> array(
       'min' => 50,
       'below'=> array(
         'zone-1'=>15,
         'zone-2'=>15,
         'zone-3'=>15
         ),
       'above'=> array(
         'zone-1'=>0,
         'zone-2'=>0,
         'zone-3'=>0
       )
     )
   );
 public $level_discounts_table = array(
   'vip' => array( 'regular' => 10,'sale' => 2),
   'vvip' => array( 'regular' => 15,'sale' => 3),
   'vvvip' => array( 'regular' => 20,'sale' => 6),
   'vvvvip' => array( 'regular' => 25,'sale' => 12)
 );
 
  
  function init() {
      
      
    
    
    if($this->shipping_debug) write_log('shipping init '.$this->id);
    
    $status_options = get_option( 'woocommerce_status_options', array() );
    $status_options['shipping_debug_mode'] = 1;
    update_option('woocommerce_status_options',$status_options);
  }
  
  
  public function get_checkout_value( $value, $input ){
    write_log('get_checkout_value: '.$input);
    $cust = WC()->session->customer;
    if(isset($cust[$input])){
      return $cust[$input];
    }
    
    write_log('CART NEEDS SHIIPNIG: ' . $value );
    return $value;
    
  }
  
  public function order_get_items( $items, $order ){
    write_log('order_get_items');
    foreach($items as $key => $item){
      // write_log( $item );
      if($item['type'] == 'line_item'){
        if(!empty($items[$key]['edb_shipments'])){
          $items[$key]['edb_shipments'] = unserialize($items[$key]['edb_shipments']);  
          $items[$key]['edb_shipping'] = array_keys($items[$key]['edb_shipments'])[0];
          
        }else{
          write_log('SHIPMENTS EMPTY');
          // write_log( $items[$key] );
        }
        if(!empty($items[$key]['edb_availabilities'])){
          $items[$key]['edb_availabilities'] = unserialize($items[$key]['edb_availabilities']);  
        }else{
          write_log('AVAILABILITES EMPTY');
          // write_log( $items[$key] );
        }
        
      }
    }
    
    return $items;
  }
  public function checkout_split_order_item( $order, $item, $item_id){
    $shipment_meta  = $item['edb_shipments'];
    $availabilities = $item['edb_availabilities'];
    
    $original_qty = $item['item_meta']['_qty'][0];
    $product = $order->get_product_from_item( $item );
    $per_item_total = $item['line_total'] / $original_qty;
    $per_item_subtotal = $item['line_subtotal'] / $original_qty;
    $per_item_subtotal_tax = $item['line_subtotal_tax'] / $original_qty;
    $per_item_tax = $item['line_tax'] / $original_qty;
    $original_tax_data = unserialize($item['item_meta']['_line_tax_data'][0]);
    $per_item_tax_data = array( 'total' => array(), 'subtotal' => array());
    // write_log('ORIGINAL TAX DATA');
    // write_log($original_tax_data);
    foreach($original_tax_data['total'] as $i => $value ){
      $per_item_tax_data['total'][$i] = $value / $original_qty;
    }
    foreach($original_tax_data['subtotal'] as $i => $value ){
      $per_item_tax_data['subtotal'][$i] = $value / $original_qty;
    }
    $index = 0;
    foreach( $shipment_meta as $shipping_method => $qty){
      $availability = $availabilities[$shipping_method];
      $ships = array( );
      $avails = array( );
      $ships[$shipping_method] = $qty;
      $avails[$shipping_method] = $availability;
      $totals = array(
                'subtotal'=> $qty * $per_item_subtotal,
                'subtotal_tax' => $qty * $per_item_subtotal_tax,
                'total' => $qty * $per_item_total,
                'tax' => $qty * $per_item_tax,
                );
      $tax_data = array('total'=>array(), 'subtotal' => array() );
      foreach($per_item_tax_data['total'] as $i => $per_item_value ){
        $tax_data['total'][$i] = $per_item_value * $qty;
      }
      foreach($per_item_tax_data['subtotal'] as $i=> $per_item_value ){
        $tax_data['subtotal'][$i] = $per_item_value* $qty;
      }
      
      $totals['tax_data'] =  $tax_data ;
      // write_log('NEW TAX DATA');
      // write_log($tax_data);
      if($index == 0){
        $args = array( 'qty' => $qty, 'totals' => $totals );
        $order->update_product( $item_id, $product, $args );
        wc_update_order_item_meta( $item_id, 'edb_shipments', $ships);
        wc_update_order_item_meta( $item_id, 'edb_availabilities', $avails );
        wc_update_order_item_meta( $item_id, '_line_tax_data', $tax_data );
      }else{
        write_log('ADDING TAX_DATA META!');
        $new_item_id = $order->add_product( $product, $qty, array(
          'variation'=> array( 'attribute_edb_material' => $item['edb_material']),
          'totals' => $totals
        ) );
        wc_add_order_item_meta( $new_item_id, 'edb_shipments', $ships);
        wc_add_order_item_meta( $new_item_id, 'edb_availabilities', $avails );
      }
      $index++;
    }
    // $order->update_taxes();
    
  }
  
  public function checkout_update_order_meta( $order_id, $posted ){
    $order = wc_get_order( $order_id );
    write_log("woocommerce_checkout_update_order_meta");  
    write_log( "BEFORE ORDER HAD: " . count( $order->get_items() ) . " line items.");

    $original_items = $order->get_items();
    foreach($original_items as $item_id => $item ){
      
      if(count($item['edb_shipments']) > 1){
        $this->checkout_split_order_item( $order, $item, $item_id);
      }
      
    }
    $order->update_taxes();
    write_log( "NOW ORDER HAS: " . count( $order->get_items() ) . " line items." );
    
  }
  public function set_custom_field_on_order_item( $item_id, $values, $cart_item_key  ){
    global $Edb_Shipping_Method;
    write_log('set_custom_field_on_order_item');
    
    // write_log( "item_id: $item_id");
    // write_log( "cart_item_key: $cart_item_key");
    // write_log($item);
    $shipments=array();
    $availability_dates=array();
    foreach($Edb_Shipping_Method->packages as $package){
      
      if(empty($shipments[$cart_item_key])){
        $shipments[$cart_item_key] = array();
      }
      if(empty($availability_dates[$cart_item_key])){
        $availability_dates[$cart_item_key] = array();
      }
      if($package['cart_item_key'] == $cart_item_key ){
        $shipments[$cart_item_key][$package['edb_shipping']] =  $package['contents'][0]['quantity'];
        $availability_dates[$cart_item_key][$package['edb_shipping']] = $package['contents'][0]['edb_availability'];
      }
      
    }
    // write_log('add_order_item_meta');
    woocommerce_add_order_item_meta( $item_id, 'edb_shipments', $shipments[$cart_item_key] );
    woocommerce_add_order_item_meta( $item_id, 'edb_availabilities', $availability_dates[$cart_item_key] );
    
  }
  // public function set_custom_fields_on_order( $order_id ){
  //   write_log('set_custom_fields_on_order');
  //   write_log($_POST);
    
    
  // }

  public function cart_needs_shipping( $needs_shipping ){
    // $customer = WC()->session->customer;
    
    // $customer['calculated_shipping'] = 0;
    // $customer = WC()->session->customer;
    
    // $customer['calculated_shipping'] = 0;
    
    // WC()->session->set('customer', $customer );
    // write_log(WC()->customer);
    return true;
  }
  
  public function get_package_availability( $package_product, $is_backorder){
    $now = strtotime(date(DATE_RFC2822));
    $edb_backorder_delay = get_post_meta( $package_product->post->ID, '_edb_backorder_delay', true);
    $edb_available_delay = get_post_meta( $package_product->post->ID, '_edb_available_delay', true);
    if(empty($edb_available_delay)){
      $edb_available_delay = '+7 days';
    }
    if(empty($edb_backorder_delay)){
      
      $edb_backorder_delay = '+14 days';
    }
    if( $is_backorder ){
      return trim(time_elapsed(strtotime( $edb_backorder_delay, $now )));
    }else{
      return trim(time_elapsed(strtotime( $edb_available_delay, $now )));
    }
  }
  
  public function get_product_availability( $availability, $_product ){
    $now = strtotime(date(DATE_RFC2822));
    $post_id = $_product->post->ID;
    $product_id = $_product->variation_id;
    $qty_in_stock = $_product->get_total_stock();
    $qty_in_cart  = 0;
    if($qty_in_stock < 0){
      $qty_in_stock = 0;
    }
    $html = '';
    $edb_backorder_delay = get_post_meta( $post_id, '_edb_backorder_delay', true);
    $edb_available_delay = get_post_meta( $post_id, '_edb_available_delay', true);
    if(empty($edb_available_delay)){
      $edb_available_delay = '+7 days';
    }
    if(empty($edb_backorder_delay)){
      
      $edb_backorder_delay = '+14 days';
    }
    foreach( WC()->cart->cart_contents as $cart_item ){
      if( $cart_item['variation_id'] == $product_id ){
        $qty_in_cart += $cart_item['quantity'];
      }
    }
    if( $qty_in_stock == 0 ){
      $availability['availability'] = $this->availability_html($qty_in_cart,$edb_backorder_delay );
    }else{
      
      if( $qty_in_stock < $qty_in_cart){
        $backorder_delay_in_words = time_elapsed(strtotime( $edb_backorder_delay, $now ));
        $available_delay_in_words = time_elapsed(strtotime( $edb_available_delay, $now ));
        $backorder_qty = $qty_in_cart - $qty_in_stock;
        $availabilities = array(
          $this->availability_html($backorder_qty,$edb_available_delay ),
          $this->availability_html($qty_in_stock,$edb_backorder_delay )
        );
        $char = is_cart() || is_checkout() ? ', ' : ' ~ ';
        $availability['availability'] = implode( $char, $availabilities );
      }else{
        $availability['availability'] = $this->availability_html($qty_in_cart,$edb_available_delay );
      }
    }
    
    return $availability;
    
  }
  
  public function availability_html( $qty, $delay, $symbol = '@' ){
    $now = strtotime(date(DATE_RFC2822));
    $delay_in_words = time_elapsed( strtotime( $delay, $now ) );
    if( !is_cart() && !is_checkout()){
      return $delay_in_words;
    }else{
      return "<span class='quantity'>$qty</span> <span class='symbol'>$symbol</span> <i>$delay_in_words</i>";
    }
  }
  
  
  public function get_user_level_discounts( ){
    $user = wp_get_current_user();
    $current_level = get_user_meta($user->ID, '_edb_designer_level', true );
    if(empty($current_level)) return null;
    return array("$current_level-regular-items","$current_level-sale-items");
  }
  
  public function get_user_level_discount_percents( $level ){
    global $Edb_Shipping_Method;
    return $Edb_Shipping_Method->level_discounts_table[$level];
  }
  
  public function calculate_user_level_discount_fees($cart){
    $designerDiscounts = $this->get_user_level_discounts();
    $saleItemsTotal = 0;
    $regularItemsTotal = 0;
    
    if(!is_null($designerDiscounts)){
      $user = wp_get_current_user();
      $current_level = get_user_meta($user->ID, '_edb_designer_level', true );
      if($this->shipping_debug) write_log(' *** HAS DESIGNER DISOCUNTS *** ');
      
      foreach($cart->cart_contents as $car_item_key => $cart_item ){
        if($cart_item['data']->is_on_sale()){
          $saleItemsTotal += $cart_item['line_total'];
        }else{
          $regularItemsTotal += $cart_item['line_total'];
        }
      }
      $percents = $this->get_user_level_discount_percents( $current_level );
      $rRebate = ($percents['regular'] * $regularItemsTotal)/100;
      $sRebate = ($percents['sale'] * $saleItemsTotal)/100;
      if(abs($rRebate) !== 0){
        WC()->cart->add_fee($current_level.' regular items', -1 * $rRebate);  
      }
      if(abs($sRebate) !== 0){
        WC()->cart->add_fee($current_level.' sale items', -1 * $sRebate );  
      }
      
      
      
    }
    return $cart;
  }
  
  public function calculate_self_pickup_discount_fees($cart){
    global $Edb_Shipping_Method;
    write_log('calculate_self_pickup_discount_fees');
    $packages = $Edb_Shipping_Method->packages;
    $totals = 0;
    foreach($packages as $package ){
      if(!empty($package['edb_shipping']) && $package['edb_shipping'] == 'edb_self_pickup'){
        $line_total = $package['contents'][0]['line_total'];
        write_log($package['edb_shipping'] . ' line total: ' . $package['contents'][0]['line_total']);
        $totals += $line_total;
      }
    }
    if($totals > 0){
      $rebate = (5 * $totals)/100;  
      WC()->cart->add_fee('self pickup discount', -1 * $rebate );
    }
    
    
    return $cart;
  }

  public function calculate_fees( $cart ){
    // if($this->shipping_debug) write_log('**********************CALC FEES**********');
    $this->calculate_user_level_discount_fees( $cart );
    $this->calculate_self_pickup_discount_fees( $cart );
    
   
  }
  
  public function review_order_after_shipping(  ){
    global $Edb_Shipping_Method;
    
    if($this->shipping_debug) write_log( 'review after shipping');
    
  
  
    
    if($this->shipping_debug) write_log('------------------------------------------'.time().'------------------------------------------------');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log('');
    
  }
  
  // public function review_order_before_submit( $order ){
  //   write_log('review_order_before_submit');
  //   write_log( $order );
  // }
  
  public function fix_credit_card_fields( $default_fields, $this_id ){
    foreach( $default_fields as $field => $html){
      $value = WC()->session->get('edb_paypal_pro_'.str_replace('-field', '', $field ) );
      if(isset($value)){
        $dom = new DOMDocument();
        @$dom->loadHTML($html);
        $x = new DOMXPath($dom);
        
        foreach($x->query("//input") as $node)
        {   
            $node->setAttribute("value",$value);
            if($field == 'card-number-field'){
              $node->setAttribute("placeholder", '**** **** **** ****');
            }
        }
        $newHtml = $dom->saveHtml();
        $default_fields[$field] = $newHtml;  
      }
    }
    return $default_fields;
  }
  
  public function order_status_completed( $order_id ){
    write_log('woocommerce_order_status_completed');
    if(WC() && WC()->session){
      WC()->session->set('edb_paypal_pro_card-number', null );
      WC()->session->set('edb_paypal_pro_card-expiry', null );
      WC()->session->set('edb_paypal_pro_card-cvc', null );
      WC()->session->set('edb_payment_info_card_expiry', null );
      WC()->session->set('edb_payment_info_card_number', null );
      WC()->session->set('edb_payment_info_card_number', null );
      WC()->session->set('ship_to_same_address', 1 );
      WC()->session->set('do_not_ship', false );  
    }
    
    
  }
  // public function can_coupon_apply_to_product( $valid, $product, $inst, $values){
  //   // write_log( $inst );
  //   return $valid;
  // }
  
  public function check_shipping_postcode(){
    
    // write_log('check_shipping_postcode');
    // WC()->cart->calculate_totals();
    // write_log($_POST);
    if(isset($_POST['calc_shipping_postcode'])){
          WC()->customer->shipping_postcode = $_POST['calc_shipping_postcode'] ;
          WC()->customer->set_shipping_postcode( $_POST['calc_shipping_postcode'] );
    }
    WC()->cart->calculate_totals();
    return WC()->customer->get_shipping_postcode();
    

  }
  

  
  public function review_order_before_shipping(  ){
      if($this->shipping_debug) write_log( 'review before shipping');
      // write_log(WC()->shipping);
      WC()->shipping->reset_shipping();
      global $Edb_Shipping_Method;
      if(!empty($_POST)){
        if(isset($_POST['post_data'])){
          $data = array();
          $cc_changed = false;
          parse_str( $_POST['post_data'], $data );
          
            if( $data['current_panel'] && is_checkout() ){
              WC()->session->set('edb_active_panel', $data['current_panel'] );
            }  
            if( isset($data['paypal_pro-card-number'])){
              $old = WC()->session->get('edb_payment_info_card_number');
              $fuzzed = substr($data['paypal_pro-card-number'], 0, 4) . str_repeat('*', strlen($data['paypal_pro-card-number']) - 8) . substr($data['paypal_pro-card-number'], -4);
              if(!empty($old) && $old !== $fuzzed){
                $cc_changed = true;
              }
              WC()->session->set('edb_payment_info_card_number',  $fuzzed );
              //write_log('ORDER');
              WC()->session->set('edb_paypal_pro_card-number',  $data['paypal_pro-card-number'] );

              
            }
            if( isset($data['paypal_pro-card-expiry']) ){
              WC()->session->set('edb_payment_info_card_expiry', $data['paypal_pro-card-expiry'] );
              WC()->session->set('edb_paypal_pro_card-expiry',  $data['paypal_pro-card-expiry'] );
            }else if($cc_changed){
              WC()->session->set('edb_payment_info_card_expiry', null );
            }
            if( isset($data['paypal_pro-card-cvc'])){
              WC()->session->set('edb_paypal_pro_card-cvc',  $data['paypal_pro-card-cvc'] );
            }
        }
        
        
      }
      
      $customer = WC()->session->customer;

      $customer['calculated_shipping'] = 0;
      
      WC()->session->set('customer', $customer );
      WC()->cart->calculate_totals();   
      if($this->shipping_debug) write_log('CART TOTAL: '.WC()->cart->shipping_total );
      if($this->shipping_debug) write_log('');
           
    
    
  }
  
  function created_customer( $customer_id ) {
    //write_log('created_customer');
    if ( isset( $_POST['billing_first_name'] ) ) {
      // WordPress default first name field.
      update_user_meta( $customer_id, 'first_name', sanitize_text_field( $_POST['billing_first_name'] ) );
  
      // WooCommerce billing first name.
      update_user_meta( $customer_id, 'billing_first_name', sanitize_text_field( $_POST['billing_first_name'] ) );
    }
  
    if ( isset( $_POST['billing_last_name'] ) ) {
      // WordPress default last name field.
      update_user_meta( $customer_id, 'last_name', sanitize_text_field( $_POST['billing_last_name'] ) );
  
      // WooCommerce billing last name.
      update_user_meta( $customer_id, 'billing_last_name', sanitize_text_field( $_POST['billing_last_name'] ) );
    }
  
    if ( isset( $_POST['billing_city'] ) ) {
      // WooCommerce billing city
      update_user_meta( $customer_id, 'billing_city', sanitize_text_field( $_POST['billing_city'] ) );
    }
  }
  
  function copy_billing_fields_to_shipping( $data ){
    //write_log('copy_billing_fields_to_shipping');
    
    $current_user = wp_get_current_user();
    $customer_id = $current_user->ID;
    $customer = WC()->session->get('customer');
    foreach( $data as $field => $value ){
      if( startsWith(  $field, 'billing') ){
        $shipping_field = str_replace('billing', 'shipping', $field );
        //write_log('copy '.$field.' to '. $shipping_field);
        $value = sanitize_text_field( $value );
        update_user_meta( $customer_id, $shipping_field, $value );
        WC()->customer->__set( $shipping_field, $value);
        WC()->customer->__set( $field, $value);
        $customer[$shipping_field] = $value;
        $customer[$field]  = $value;
      }
    }
    WC()->session->set('customer', $customer );
  }
  function clear_shipping_fields( $data ){
    //write_log('clear_shipping_fields');
    // write_log(WC()->customer);
    $current_user = wp_get_current_user();
    $customer_id = $current_user->ID;
    $customer = WC()->session->get('customer');
    $woocommerce_shipping_fields = array( 'shipping_first_name','shipping_last_name', 'shipping_company',  'shipping_country', 'shipping_address_1','shipping_address_2','shipping_city','shipping_state','shipping_postcode');
    foreach($woocommerce_shipping_fields as $field  ){
        update_user_meta( $customer_id , $field, null );
        WC()->customer->__set( $field, null);
        
    } 
  // WC()->session->set('customer', $customer ); 
  }
  
  
  function checkout_update_order_review( $postdata ){
    //write_log('checkout_update_order_review');
    $data = array();
    parse_str( $postdata, $data );
    $current_user = wp_get_current_user();
    $customer_id = $current_user->ID;
    // $customer = WC()->session->get('customer');
    $wordpress_fields = array(
      'first_name' => 'billing_first_name',
      'last_name' => 'billing_last_name' 
    );
    // write_log( "customer id: $customer_id");
    $woocommerce_billing_fields = array( 'billing_first_name','billing_last_name', 'billing_company', 'billing_email', 'billing_phone', 'billing_country', 'billing_address_1','billing_address_2','billing_city','billing_state','billing_postcode');
    $woocommerce_shipping_fields = array( 'shipping_first_name','shipping_last_name', 'shipping_company',  'shipping_country', 'shipping_address_1','shipping_address_2','shipping_city','shipping_state','shipping_postcode');
    
    foreach($wordpress_fields as $field => $equivalent){
      if(isset($data[$equivalent])){
        update_user_meta( $customer_id , $field, sanitize_text_field( $data[$equivalent]) );  
      }
      
    }
    foreach($woocommerce_billing_fields as $field ){
      if(isset($data[$field])){
        update_user_meta( $customer_id , $field, sanitize_text_field( $data[$field]) );
        WC()->checkout->posted[$field] = sanitize_text_field( $data[$field]) ;
        // $customer[$field] = $data[$field];
        WC()->customer->__set( $field, $data[$field]);
      }
    }
    foreach($woocommerce_shipping_fields as $field ){
      if(isset($data[$field])){
        update_user_meta( $customer_id , $field, sanitize_text_field( $data[$field]) );
        WC()->checkout->posted[$field] = sanitize_text_field( $data[$field]) ;
        
        WC()->customer->__set( $field, $data[$field]);
        // $customer[$field] = $data[$field];
      }
    }
    
    if(isset($data['do_not_ship'])){
      //write_log('SETTING NO SHIP');
      WC()->session->set('do_not_ship', 1);
      
    }else{
      //write_log('SETTING YES SHIP');
      WC()->session->set('do_not_ship', 0);  
      
    }
    
    // write_log("needs shipping address?: ".(WC()->cart->needs_shipping_address()  ? 'true' : 'false'));
    // $ship_not_same_address = $data['ship_to_same_address'];
    if(isset($data['ship_to_same_address'])){
      if(WC()->session->get('ship_to_same_address')  !== 1){
        //write_log('CHANGED A');
      }
      WC()->session->set('ship_to_same_address', 1);
      //write_log('SHIPPING TO SAME');
      $this->copy_billing_fields_to_shipping( $data );
        
    }else{
      $was = WC()->session->get('ship_to_same_address');
      if($was === 1){
        //write_log('CHANGED B');
        $this->clear_shipping_fields( $data );
      }else{
       //write_log('ELSE?');
       
      }
      
      //write_log('SHIPPING TO DIFF');
      
      WC()->session->set('ship_to_same_address', false);
      
      WC()->customer->save_data();
      // write_log(WC()->session->customer);
    }
    
    
    // WC()->session->set('customer', $customer );
    // write_log(WC()->customer);
    // write_log();
    // WC()->session->set('customer', WC()->customer );
    //WC()->customer->save_data();
      // write_log(json_encode(WC()->customer));
  }
  
  
  //Store the custom field
  
  function add_cart_item_custom_data( $cart_item_meta, $product_id ) {
    
    global $woocommerce;
    if($this->shipping_debug) write_log('add_cart_item_custom_data');
    $cart_item_meta['edb_shipping'] = 'edb_ship_bundle_1';
    // write_log('set cart item meta edb_Shipping as: edb_ship_bundle_1' );
    return $cart_item_meta; 
  }
  
  //Get it from the session and add it to the cart variable
  function get_cart_items_from_session( $item, $values, $key ) {
      if($this->shipping_debug) write_log('get_cart_items_from_session');
      // write_log( $values );
      if ( array_key_exists( 'edb_shipping', $values ) ){
        // if($this->shipping_debug) write_log('get_cart_items_from_session ('.$key.') :  '.json_encode( $values ));
        $item[ 'edb_shipping' ] = $values['edb_shipping'];
      }
      
      
      return $item;
  }
  // add_filter( 'woocommerce_get_cart_item_from_session', 'get_cart_items_from_session', 1, 3 );


  // public function remove_cart_item(){
  //   if($this->shipping_debug) write_log('remove_cart_item');
  // }
  // public function reset_shipping_methods( $cart_item_key, $cart_item ){
    
  //   if($this->shipping_debug) write_log(array('cart_item_key'=>$cart_item_key));
  // }
  
  public function cart_shipping_method_full_label( $label ){
    $regex = '#<[^>]+>(.*?)</[^>]+>#';
    $label = preg_replace( $regex, '', $label);
    $label = str_replace( ':', '', $label );
    $label = str_ireplace( '(Free)', '', $label );
     return trim($label);
  }
  
  public function free_price_html(  ){
    return '$0.00';
  }
 
  /**
   * calculate_shipping function.
   *
   * @access public
   * @param mixed $package
   * @return void
   */
  public function calculate_shipping( $package=array() ) {
    global $Edb_Shipping_Method;
    // if($this->shipping_debug) write_log('# calculate shipping '. $this->id );
    
    
    if( $this->id == 'edb_self_pickup'){
      if($this->shipping_debug) write_log('');
    }
    if($this->shipping_debug) write_log('');
    if($this->shipping_debug) write_log( '###########['.$this->id. ']##############');
    
    $packages = $this->cart_shipping_packages();
    
    
    
    
    $bundles = array('edb_self_pickup' => array(), 'edb_ship_ready'=> array(), 'edb_ship_bundle_1'=> array(),'edb_ship_bundle_2'=> array(),'edb_ship_bundle_3'=> array());
    foreach($packages as $package_key => $package_data ){
      $edb_shipping = $package_data['edb_shipping'];
      if(empty($edb_shipping)){
        $edb_shipping = 'edb_ship_bundle_1';
      }
      if(empty($bundles[$edb_shipping])){
        $newitems = array();
        foreach( $package_data['contents'] as $item ){
          $item['package_key'] = $package_key;
          $newitems[]=$item;
        }
        $package_data['contents']=$newitems;
        $bundles[$edb_shipping] = $package_data;
      }else{
        foreach($package_data['contents'] as $item ){
          $item['package_key'] = $package_key;
          $bundles[$package_data['edb_shipping']]['contents'][] = $item;
        }
      }
    }
    
    
    foreach( $bundles as $method => $bundle  ){
      if( $method == $this->id){
        // if($this->shipping_debug) write_log( 'had rate:' . json_encode( $this->rates ));
        if( empty( $bundle) ){
            if($this->shipping_debug) write_log("NUM ITEMS: 0");
            $rate = array(
                  'id' => $method,
                  'label' => $method,
                  'cost' => 0
                );
        }else{
          // if($this->shipping_debug) write_log("Bundle $method has ".count($bundle['contents'])." items.");
          $num = count($bundle['contents']);
          if($this->shipping_debug) write_log("NUM ITEMS: $num");
          $rate = $this->calculate_shipping_for_bundle( $bundle );  
          
        } 
        // if($this->shipping_debug) write_log( "Add: ".$rate['cost']);
        $this->add_rate( $rate ); 
        $Edb_Shipping_Method->rates[$this->id]=$rate;
        if(isset($bundle['contents'])){
          $Edb_Shipping_Method->rates[$this->id]['item_count']=count($bundle['contents']);  
        }
        
      }
    }
    

    if( $this->id == 'edb_ship_bundle_3'){
      
      WC()->session->set('_edb_cart_current_shipping_rates', $Edb_Shipping_Method->rates );
      if($this->shipping_debug) write_log(count($this->packages).' packages calculated.');
      if($this->shipping_debug) write_log('');  
      // write_log('calculated shipping: ');
      // write_log($Edb_Shipping_Method->rates);
    }
    
    
    
    
  }
  
  public function get_shipping_class_from_items( $items ){
    if( !empty( $items['data'] ) ){
      $items =array($items);
    }
    foreach( $items as $item){
      $product = $item['data'];
      $product_shipping_class = $product->get_shipping_class(); 
      if( $product_shipping_class == 'furniture'){
        return 'furniture';
      }
    }
    return 'accessories'; 
  }
  
  
  public function get_zone_from_postal_code( $postcode ){
    //if($this->shipping_debug) write_log("postcode: $postcode");
    $postcode = strtolower($postcode);
    if($postcode[0] == 'h'){
      return 'zone-1';
    }
    if($postcode[0] == 'm'){
      return 'zone-2';
    }
    return 'zone-3';
  }
  
  public function get_shipping_class_items_cost( $shipping_class, $items ){
    //if($this->shipping_debug) write_log("get_shipping_class_items_cost: $shipping_class = ".count($items)." items.");
    // if($this->shipping_debug) write_log( $items );
    if(count($items) == 0){ return 0;} 
    $postcode = WC()->customer->get_shipping_postcode();
    if(isset($_POST['calc_shipping_postcode'])){
      $postcode = $_POST['calc_shipping_postcode'];
      // WC()->customer->set_shipping_postcode($postcode);
    }
    if(!empty($postcode)){
      if($this->shipping_debug) write_log('USING POSTCODE: '.$postcode );
      $zone = $this->get_zone_from_postal_code($postcode);
    }else{
      if($this->shipping_debug) write_log('USING NO POSTCODE!!!' );
      
      $zone = 'zone-3';  
    }
    if($this->shipping_debug) write_log('FOUND ZONE: '.$zone);
    $items_total_cost = array_sum( wp_list_pluck( $items, 'line_total' ) );
    
    
    $table = $this->rates_table[$shipping_class];
    $min = $table['min'];
    $criteria = $items_total_cost > $min ? 'above' : 'below';
    // if($this->shipping_debug) write_log('is_above_minimum: '.($items_total_cost > $min ? 'yes' : 'no') );
    if($this->shipping_debug) write_log('SHIPPING CLASS USED: '. $shipping_class);
    if($this->shipping_debug) write_log('TABLE RATE SAYS: '.$table[$criteria][$zone]);
    return $table[$criteria][$zone];
  }
  
  public function get_available_items( $item, $wants, $have ){
    global $Edb;
    $newitem = $item;
    $newitem['quantity'] = $have;
    $newitem['line_total'] = ( $item['line_total'] / $wants ) * $have;
    $newitem['line_tax'] = ( $item['line_tax'] / $wants ) * $have;
    $newitem['line_subtotal'] = ( $item['line_subtotal'] / $wants ) * $have;
    $newitem['line_subtotal_tax'] = ( $item['line_subtotal_tax'] / $wants ) * $have;
    $newitem['edb_availability'] = $this->get_package_availability( $item['data'], false);
    if(isset($newitem['line_tax_data']['total']) && is_array($newitem['line_tax_data']['total'])){
      foreach($newitem['line_tax_data']['total'] as $index => $total ){
        $newitem['line_tax_data']['total'][$index] = ( $item['line_tax_data']['total'][$index] / $wants ) * $have;
      }  
    }
    if(isset($newitem['line_tax_data']['subtotal']) && is_array($newitem['line_tax_data']['subtotal'])){
      foreach($newitem['line_tax_data']['subtotal'] as $index => $total){
        $newitem['line_tax_data']['subtotal'][$index] = ( $item['line_tax_data']['subtotal'][$index] / $wants ) * $have;
      }  
    }
    
    return $newitem;
  }
  
  public function get_backorder_items( $item, $wants, $have ){
    global $Edb;
    $newitem = $item;
    $qty = $wants - $have;
    $newitem['quantity'] = $qty;
    $newitem['line_total'] = ( $item['line_total'] / $wants ) * $qty;
    $newitem['line_tax'] = ( $item['line_tax'] / $wants ) * $qty;
    $newitem['line_subtotal'] = ( $item['line_subtotal'] / $wants ) * $qty;
    $newitem['line_subtotal_tax'] = ( $item['line_subtotal_tax'] / $wants ) * $qty;
    $newitem['edb_availability'] = $this->get_package_availability( $item['data'], true);
    if(isset($newitem['line_tax_data']['total']) && is_array($newitem['line_tax_data']['total'])){
      foreach($newitem['line_tax_data']['total'] as $index => $total ){
        $newitem['line_tax_data']['total'][$index] = ( $item['line_tax_data']['total'][$index] / $wants ) * $qty;
      }  
    }
    if(isset($newitem['line_tax_data']['subtotal']) && is_array($newitem['line_tax_data']['subtotal'])){
      foreach($newitem['line_tax_data']['subtotal'] as $index => $total){
        $newitem['line_tax_data']['subtotal'][$index] = ( $item['line_tax_data']['subtotal'][$index] / $wants ) * $qty;
      }
    }
    return $newitem;
    
  }
  
  public function create_package( $items, $shipping_method , $cart_item_key, $availability_type ){
    
    $items['edb_shipping'] = $shipping_method;
    return array(
      // 'ship_via' => array($shipping_method),
      'contents' => array( $items ),
      'cart_item_key'=> $cart_item_key,
      'edb_shipping' => $shipping_method,
      // 'edb_availability'=> $availability_type,
      'contents_cost' => array_sum( wp_list_pluck( array($items), 'line_total' ) ),
      'applied_coupons' => WC()->cart->applied_coupons,
      'destination' => array(
         'country' => WC()->customer->get_shipping_country(),
         'state' => WC()->customer->get_shipping_state(),
         'postcode' => WC()->customer->get_shipping_postcode(),
         'city' => WC()->customer->get_shipping_city(),
         'address' => WC()->customer->get_shipping_address(),
         'address_2' => WC()->customer->get_shipping_address_2()
      )
    );
  }
  
  
  
  public function get_product_availability_date( $product ){
    global $Edb;
    $stock_qty = $product->get_stock_quantity();
    return $this->get_package_availability( $product, $stock_qty == 0);
  }
  /**
   * calculate_shipping function.
   *
   * @access public
   * @param mixed $package
   * @return void
   */
  public function split_items_by_availability( $items ){
    $split = array();
    foreach( $items as $item ){
      $product = $item['data'];
      // $date    = $this->get_product_availability_date( $product );
      $date = $item['edb_availability'];
      if(!isset($split[$date])){
        $split[$date] = array();
      }
      $split[$date][]=$item;
    }
    return $split;
  }
  
  public function persist_chosen_shipping_methods(){
    // write_log('persist_chosen_shipping_methods. is cart? '. (is_cart() ? 'yes' : 'no'));
    // write_log( 'persist_chosen_shipping_methods' );
    // write_log( $_POST );
    // write_log( WC()->session->customer );
    if(is_cart()){
      $_SESSION['edb_shipping'] = array();
      // write_log('setting chosen shiping to emtpy array()');
      WC()->session->set('chosen_shipping_methods', array() );
    }else{
      // write_log(WC()->session->get('chosen_shipping_methods'));
      $_SESSION['edb_shipping']= WC()->session->get('chosen_shipping_methods'); 
    }
       
      
    
  }
  
  public function generate_package_id( $type, $items, $key ){
    
    $counted_names = '';
    
    
    // foreach( $items as $item ){
      $counted_names = $items['product_id']. '@' . $items['quantity'];
    // }
    return  md5( $type . $counted_names. $key );
  }

  public function verify_do_not_ship(){
    
    
    
    if(!empty($_POST) && isset($_POST['post_data'])){
      $data = array();
      parse_str($_POST['post_data'], $data );
      
      if(isset($data['current_panel']) && $data['current_panel'] == '#address-info-panel' ){
        
        if(isset($data['do_not_ship']) && $data['do_not_ship']){
          // write_log('defaulting to self pickup');
          $sessionMethods = WC()->session->get('chosen_shipping_methods');
          
          $overrideMethods = array();
          if(!empty($sessionMethods)){
            foreach($sessionMethods as $package_key => $method){
              $overrideMethods[$package_key] = 'edb_self_pickup';
            }
            if($this->shipping_debug) write_log('setting shipping method overrides for no ship.');
            // WC()->session->set('previous_shipping_methods', $sessionMethods );
            // WC()->session->set('do_not_ship', true );
            // write_log('setting to overriedes');
            // write_log($overrideMethods);
            WC()->session->set('chosen_shipping_methods', $overrideMethods );
          }
        }else{
          // write_log('defaulting to ship bundle 1');
          $sessionMethods = WC()->session->get('chosen_shipping_methods');
          $overrideMethods = array();
          if(!empty($sessionMethods)){
            foreach($sessionMethods as $package_key => $method){
              if($method == 'edb_self_pickup'){
                $overrideMethods[$package_key] = 'edb_ship_bundle_1';
              }else{
                $overrideMethods[$package_key] = $method;
              }
            }
          }
          // write_log('VERIFY DO NOT SHIP', json_encode($overrideMethods));
          // write_log('setting to overriedes 2');
          // write_log($overrideMethods);
          // WC()->session->set('do_not_ship', false );
          WC()->session->set('chosen_shipping_methods', $overrideMethods );
          
        }
      }
    }
  }
  public function cart_shipping_packages( $packages = array() ){
    // global $Edb;
    global $Edb_Shipping_Method;
    $Edb_Shipping_Method->cart_item_shipments = array();
    
    
    if($this->shipping_debug) write_log('CART_SHIPPING_PACKAGES');
    if(is_cart()){
      // write_log('IS CART');  
      $sessionMethods = WC()->session->get('chosen_shipping_methods');
      if(!empty($sessionMethods)){
        foreach($sessionMethods as $key => $method  ){
          $sessionMethods[$key] = 'edb_ship_bundle_1';
        }  
      }
      
      WC()->session->set('chosen_shipping_methods', $sessionMethods );
    }else{
      
      $this->verify_do_not_ship();  
    }
    
    if(empty(WC()->session->get('chosen_shipping_methods'))){
      if(isset($_REQUEST['shipping_method'])){
        WC()->session->set('chosen_shipping_methods', $_REQUEST['shipping_method'] );
      }else if($_SESSION['edb_shipping']){
        WC()->session->set('chosen_shipping_methods', $_SESSION['edb_shipping'] );
      }
      
    }
    
    
    $shipping_methods = WC()->session->get('chosen_shipping_methods');
    
    //write_log('took shipping methods from session');
    //  write_log($shipping_methods);
      
    
    
    
    $packages = array();
    
    foreach( WC()->cart->get_cart() as $item_key => $item ){
      $product   = $item['data'];
      $stock_qty = $product->get_stock_quantity();
      if($stock_qty < 0){
        $stock_qty = 0;
      }
      $wants_qty = abs($item['quantity']);
      if( $stock_qty > 0 && $wants_qty > $stock_qty ){
        
        $available_items = $this->get_available_items( $item, $wants_qty, $stock_qty );
        $backorder_items = $this->get_backorder_items( $item, $wants_qty, $stock_qty );
        $packageID_1 = $this->generate_package_id( 'available'.$item_key, $available_items , $item_key);
        $packageID_2 = $this->generate_package_id( 'backorder'.$item_key, $backorder_items , $item_key);
        
        if(empty($shipping_methods[$packageID_1])){
          $shipping_methods[$packageID_1] = 'edb_ship_bundle_1';
        }
        if(empty($shipping_methods[$packageID_2])){
          $shipping_methods[$packageID_2] = 'edb_ship_bundle_1';
        }
        $shipping_method_1 = $shipping_methods[$packageID_1];
        $shipping_method_2 = $shipping_methods[$packageID_2];
        $packages[$packageID_1]=$this->create_package($available_items, $shipping_method_1,$item_key,'available');
        $packages[$packageID_2]=$this->create_package($backorder_items,$shipping_method_2,$item_key,'backorder');
        
        // if(!in_array($item_key, $Edb_Shipping_Method->cart_item_shipments)){
        //   $Edb_Shipping_Method->cart_item_shipments[$item_key] = array();
        // }
        // $Edb_Shipping_Method->cart_item_shipments[$item_key] = array($shipping_method_1,$shipping_method_2);
      }else{
        $item['edb_availability'] = $this->get_package_availability( $item['data'], false);
        
        $packageID_1 = $this->generate_package_id( 'other'.$item_key, $item, $item_key );
        if(empty($shipping_methods[$packageID_1])){
          $shipping_methods[$packageID_1] = 'edb_ship_bundle_1';
        }
        $shipping_method = $shipping_methods[$packageID_1];
        $packages[$packageID_1]=$this->create_package($item,$shipping_method,$item_key,'available');
        // if(!in_array($item_key, $Edb_Shipping_Method->cart_item_shipments)){
        //   $Edb_Shipping_Method->cart_item_shipments[$item_key] = array();
        // }
        // $Edb_Shipping_Method->cart_item_shipments[$item_key] = array($shipping_method);
      }
    }
    $counts = array();
    foreach( $packages as $k => $p){
      $counts[$k] = 5;
    }
    
    // write_log('setting:');
    // write_log($shipping_methods);
    WC()->session->set('chosen_shipping_methods',$shipping_methods);
    $this->packages = $packages;
    
    $customer = WC()->session->customer;
    
    $customer['calculated_shipping'] = 0;
    
    WC()->session->set('customer', $customer );
    if($this->shipping_debug) write_log('END CART_SHIPPING_PACKAGES');
    return $packages;
  }
  
}
class Edb_Shipping_Method_Self_Pickup extends Edb_Shipping_Method{
  public function __construct() {
    $this->id                 = 'edb_self_pickup'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'self serve';
    $this->method_title       = __( 'EDB Self Pickup', 'edb' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' , 'edb'); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
  
  public function calculate_shipping_for_bundle( $bundle ){
    $rate = array(
          'id' => $this->id,
          'label' => $this->id,
          'cost' => 0
        );
        
    return $rate;
  }
  
} 
class Edb_Shipping_Method_Ship_Ready extends Edb_Shipping_Method{
  public function __construct() {
    $this->id                 = 'edb_ship_ready'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'ship when ready';
    $this->method_title       = __( 'EDB Ship Ready', 'edb' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.', 'edb' ); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
 
  public function calculate_shipping_for_bundle( $bundle ){
      $split = array();
      foreach( $bundle['contents'] as $item ){
        $pk = $item['package_key'];
        if($this->shipping_debug) write_log($item['package_key']);
        if(!isset($split[$pk])){
          $split[$pk] = array();
        }
        $split[$pk][] = $item;
      }
      $total = 0;
      $rates = wp_list_pluck(WC()->shipping->packages, 'rates');
      foreach( $split as $pk => $items ){
        $shipping_class = $this->get_shipping_class_from_items( $items  );
        $sub = $this->get_shipping_class_items_cost( $shipping_class, $items );  
        $total += $sub;
      }
      
      $rate = array(
        'id' => $this->id,
        'label' => 'ship when ready',
        'cost' =>$total/count(array_keys( $split ))
      );
      
      return $rate;
      
  }
  
} 
class Edb_Shipping_Method_Ship_Bundle_1 extends Edb_Shipping_Method{
  public function __construct() {
    $this->id                 = 'edb_ship_bundle_1'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'bundle 1';
    $this->method_title       = __( 'EDB Ship Bundle 1', 'edb' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.', 'edb' ); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
  
  public function calculate_shipping_for_bundle( $bundle ){
      
      // $split = array();
      // foreach($bundle['contents'] as $item ){
      //   $sclass = $this->get_shipping_class_from_items( $item );
        
      // }
      $shipping_class = $this->get_shipping_class_from_items( $bundle['contents'] );
      $total = $this->get_shipping_class_items_cost( $shipping_class, $bundle['contents'] );
      
      $rate = array(
        'id' => $this->id,
        'label' => $this->id,
        'cost' => $total/count($bundle['contents'])
      );
      
      return $rate;
      
  }
  
} 

class Edb_Shipping_Method_Ship_Bundle_2 extends Edb_Shipping_Method_Ship_Bundle_1{
  public function __construct() {
    $this->id                 = 'edb_ship_bundle_2'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'bundle 2';
    $this->method_title       = __( 'EDB Ship Bundle 2' , 'edb');  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' , 'edb'); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
  
  public function calculate_shipping_for_bundle( $bundle ){
      
      $shipping_class = $this->get_shipping_class_from_items( $bundle['contents'] );
      $total = $this->get_shipping_class_items_cost( $shipping_class, $bundle['contents'] );
      
      $rate = array(
        'id' => $this->id,
        'label' => $this->id,
        'cost' => $total/count($bundle['contents'])
      );
      
      return $rate;
      
  }
  
 
} 

class Edb_Shipping_Method_Ship_Bundle_3 extends Edb_Shipping_Method_Ship_Bundle_1{
  public function __construct() {
    $this->id                 = 'edb_ship_bundle_3'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'bundle 3';
    $this->method_title       = __( 'EDB Ship Bundle 3', 'edb' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' , 'edb'); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
  
  public function calculate_shipping_for_bundle( $bundle ){
      
      $shipping_class = $this->get_shipping_class_from_items( $bundle['contents'] );
      $total = $this->get_shipping_class_items_cost( $shipping_class, $bundle['contents'] );
      
      $rate = array(
        'id' => $this->id,
        'label' => $this->id,
        'cost' => $total/count($bundle['contents'])
      );
      
      return $rate;
      
  }
  
  
} 





?>
