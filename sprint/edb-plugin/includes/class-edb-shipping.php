<?php

function time_elapsed($ptime) {
    $etime = $ptime - time();

    if ($etime < 1) {
        return '0 seconds';
    }

    $a = array(12 * 30 * 24 * 60 * 60 => 'year',
        30 * 24 * 60 * 60 => 'month',
        7 * 24 * 60 * 60 => 'week',
        24 * 60 * 60 => 'day',
        60 * 60 => 'hour',
        60 => 'min',
        1 => 'sec'
    );

    foreach ($a as $secs => $text) {
        $d = $etime / $secs;
        if ($d >= 1) {
            $r = round($d);
            return " " . $r . ' ' . $text . ($r > 1 ? 's' : '');
        }
    }
}

class Edb_Vip_Coupon extends WC_Coupon{
  function __construct( $level ){
    
  }
}

class Edb_Shipping_Method extends WC_Shipping_Method{
 
  
  function init() {
      
      $this->rates_table = array(
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
    $this->level_discounts_table = array(
      'vip' => array( 'regular' => '10%','sale' => '2%'),
      'vvip' => array( 'regular' => '15%','sale' => '3%'),
      'vvvip' => array( 'regular' => '20%','sale' => '6%'),
      'vvvvip' => array( 'regular' => '25%','sale' => '12%')
    );
    
    
    
    write_log('shipping init '.$this->id);

  }
  
  public function cart_needs_shipping( $needs_shipping ){
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
      
      $edb_backorder_delay = '+7 days';
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
      
      $edb_backorder_delay = '+7 days';
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

  public function calculate_fees( $cart ){
    
    $designerDiscounts = $this->get_user_level_discounts();
    $saleItemsTotal = 0;
    $regularItemsTotal = 0;
    if(!is_null($designerDiscounts)){
      $user = wp_get_current_user();
      $current_level = get_user_meta($user->ID, '_edb_designer_level', true );
      write_log(' *** HAS DESIGNER DISOCUNTS *** ');
      
      foreach($cart->cart_contents as $car_item_key => $cart_item ){
        if($cart_item['data']->is_on_sale()){
          $saleItemsTotal += $cart_item['line_total'];
        }else{
          $regularItemsTotal += $cart_item['line_total'];
        }
      }
      $rRebate = (10 * $regularItemsTotal)/100;
      $sRebate = (5 * $saleItemsTotal)/100;
      if(abs($rRebate) !== 0){
        WC()->cart->add_fee($current_level.' regular items', -1 * $rRebate);  
      }
      if(abs($sRebate) !== 0){
        WC()->cart->add_fee($current_level.' sale items', -1 * $sRebate );  
      }
      
      
      
    }
    return $cart;
  }
  
  public function review_order_after_shipping(  ){
    global $Edb_Shipping_Method;
    
    // write_log( 'review after shipping');
    
    
    $rates = $Edb_Shipping_Method->rates;
    if(isset($rates['edb_self_pickup'])){
      
      if(isset($rates['edb_self_pickup']['item_count']) && $rates['edb_self_pickup']['item_count'] > 0){
        if(!WC()->cart->has_discount('selfserve')){
          WC()->cart->add_discount( 'selfserve');
          write_log('ADD 5% DISCOUNT');  
          
        }
      }else{
        if(WC()->cart->has_discount('selfserve')){
          WC()->cart->remove_coupons( 'selfserve');
          write_log('REMOVED 5% DISCOUNT');  
        }
      }
      wc_clear_notices();
    }
    write_log('------------------------------------------'.time().'------------------------------------------------');
    write_log('');

  }
  public function review_order_before_shipping(  ){
      global $Edb_Shipping_Method;
      if(!empty($_POST)){
        if(isset($_POST['post_data'])){
          $data = array();
          $cc_changed = false;
          parse_str( $_POST['post_data'], $data );
            if( $data['current_panel'] ){
              WC()->session->set('edb_active_panel', $data['current_panel'] );
            }  
            if( $data['paypal_pro-card-number']){
              $old = WC()->session->get('edb_payment_info_card_number');
              
              $fuzzed = substr($data['paypal_pro-card-number'], 0, 4) . str_repeat('*', strlen($data['paypal_pro-card-number']) - 8) . substr($data['paypal_pro-card-number'], -4);
              if(!empty($old) && $old !== $fuzzed){
                $cc_changed = true;
              }
              WC()->session->set('edb_payment_info_card_number',  $fuzzed );
            }
            if( $data['paypal_pro-card-expiry'] ){
              WC()->session->set('edb_payment_info_card_expiry', $data['paypal_pro-card-expiry'] );
            }else if($cc_changed){
              WC()->session->set('edb_payment_info_card_expiry', null );
            }
        }
        
        
      }
      
      $customer = WC()->session->customer;
      $customer['calculated_shipping'] = 0;
      
      WC()->session->set('customer', $customer );
      
      
      
      write_log('CART TOTAL: '.WC()->cart->shipping_total );
      write_log('');
      WC()->cart->calculate_totals();
    
  }
  
  //Store the custom field
  
  function add_cart_item_custom_data( $cart_item_meta, $product_id ) {
    
    global $woocommerce;
    write_log('add_cart_item_custom_data');
    $cart_item_meta['edb_shipping'] = 'edb_self_pickup';
    return $cart_item_meta; 
  }
  
  //Get it from the session and add it to the cart variable
  function get_cart_items_from_session( $item, $values, $key ) {
      write_log('get_cart_items_from_session');
      if ( array_key_exists( 'edb_shipping', $values ) ){
        // write_log('get_cart_items_from_session ('.$key.') :  '.json_encode( $values ));
        $item[ 'edb_shipping' ] = $values['edb_shipping'];
      }
      
      
      return $item;
  }
  // add_filter( 'woocommerce_get_cart_item_from_session', 'get_cart_items_from_session', 1, 3 );


  // public function remove_cart_item(){
  //   write_log('remove_cart_item');
  // }
  // public function reset_shipping_methods( $cart_item_key, $cart_item ){
    
  //   write_log(array('cart_item_key'=>$cart_item_key));
  // }
  
  public function cart_shipping_method_full_label( $label ){
    $regex = '#<[^>]+>(.*?)</[^>]+>#';
    $label = preg_replace( $regex, '', $label);
    $label = str_replace( ':', '', $label );
    $label = str_ireplace( '(Free)', '', $label );
     return trim($label);
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
    // write_log('# calcualte shipping'. $this->id );
    if( $this->id == 'edb_self_pickup'){
      write_log('');
    }
    write_log('');
    write_log( '###########['.$this->id. ']##############');
    
    $packages = $this->cart_shipping_packages();
    $bundles = array('edb_self_pickup' => array(), 'edb_ship_ready'=> array(), 'edb_ship_bundle_1'=> array(),'edb_ship_bundle_2'=> array(),'edb_ship_bundle_3'=> array());
    foreach($packages as $package_key => $package_data ){
      
      $edb_shipping = $package_data['edb_shipping'];
      if(empty($edb_shipping)){
        $edb_shipping = 'edb_self_pickup';
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
        // write_log( 'had rate:' . json_encode( $this->rates ));
        if( empty( $bundle) ){
            write_log("NUM ITEMS: 0");
            $rate = array(
                  'id' => $method,
                  'label' => $method,
                  'cost' => 0
                );
        }else{
          // write_log("Bundle $method has ".count($bundle['contents'])." items.");
          $num = count($bundle['contents']);
          write_log("NUM ITEMS: $num");
          $rate = $this->calculate_shipping_for_bundle( $bundle );  
          
        } 
        // write_log( "Add: ".$rate['cost']);
        $this->add_rate( $rate ); 
        $Edb_Shipping_Method->rates[$this->id]=$rate;
        if(isset($bundle['contents'])){
          $Edb_Shipping_Method->rates[$this->id]['item_count']=count($bundle['contents']);  
        }
        
      }
    }
    

    if( $this->id == 'edb_ship_bundle_3'){
      
      WC()->session->set('_edb_cart_current_shipping_rates', $Edb_Shipping_Method->rates );
    //   write_log(count($this->packages).' packages calculated.');
    //   write_log('');  
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
    //write_log("postcode: $postcode");
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
    //write_log("get_shipping_class_items_cost: $shipping_class = ".count($items)." items.");
    // write_log( $items );
    if(count($items) == 0){ return 0;} 
    $postcode = WC()->customer->get_shipping_postcode();
    
    if(!empty($postcode)){
      write_log('USING POSTCODE: '.$postcode );
      $zone = $this->get_zone_from_postal_code($postcode);
    }else{
      write_log('USING NO POSTCODE!!!' );
      $zone = 'zone-3';  
    }
    write_log('FOUND ZONE: '.$zone);
    $items_total_cost = array_sum( wp_list_pluck( $items, 'line_total' ) );
    
    
    $table = $this->rates_table[$shipping_class];
    $min = $table['min'];
    $criteria = $items_total_cost > $min ? 'above' : 'below';
    // write_log('is_above_minimum: '.($items_total_cost > $min ? 'yes' : 'no') );
    write_log('SHIPPING CLASS USED: '. $shipping_class);
    write_log('TABLE RATE SAYS: '.$table[$criteria][$zone]);
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
  
  public function create_package( $items, $shipping_method , $cart_item_key ){
  
    $items['edb_shipping'] = $shipping_method;
    return array(
      // 'ship_via' => array($shipping_method),
      'contents' => array( $items ),
      'cart_item_key'=> $cart_item_key,
      'edb_shipping' => $shipping_method,
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
    
      $_SESSION['edb_shipping'] = WC()->session->get('chosen_shipping_methods'); 
      
    
  }
  
  public function generate_package_id( $type, $items ){
    
    $counted_names = '';
    // write_log(array_keys($items));
    foreach( $items as $item ){
      $counted_names .= $items['product_id']. '@' . $items['quantity'];
    }
    return  md5( $type . $counted_names );
  }

  public function verify_do_not_ship(){
    if(!empty($_POST) && isset($_POST['post_data'])){
      $data = array();
      parse_str($_POST['post_data'], $data );
      if(isset($data['do_not_ship']) && $data['do_not_ship']){
        $sessionMethods = WC()->session->get('chosen_shipping_methods');
        
        $overrideMethods = array();
        if(!empty($sessionMethods)){
          foreach($sessionMethods as $package_key => $method){
            $overrideMethods[$package_key] = 'edb_self_pickup';
          }
          write_log('setting shipping method overrides for no ship.');
          // WC()->session->set('previous_shipping_methods', $sessionMethods );
          WC()->session->set('do_not_ship', true );
          WC()->session->set('chosen_shipping_methods', $overrideMethods );
        }
      }else{
        WC()->session->set('do_not_ship', false );
      }
    }
  }
  public function cart_shipping_packages( $packages = array() ){
    global $Edb;
    write_log('CART_SHIPPING_PACKAGES');
    $this->verify_do_not_ship();
    
    $shipping_methods = WC()->session->get('chosen_shipping_methods');
    if(empty($shipping_methods) && !empty($_REQUEST['shipping_method'])){
      // write_log('took shipping methods from request');
      $shipping_methods = $_REQUEST['shipping_method'];
    }else if(!empty($shipping_methods)){
      // write_log('took shipping methods from session');
      # write_log('request had');
     #  write_log($_REQUEST);
    }
    
    
    
    
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
        $packageID_1 = $this->generate_package_id( 'available'.$item_key, $available_items );
        $packageID_2 = $this->generate_package_id( 'backorder'.$item_key, $backorder_items );
        
        if(empty($shipping_methods[$packageID_1])){
          $shipping_methods[$packageID_1] = 'edb_self_pickup';
        }
        if(empty($shipping_methods[$packageID_2])){
          $shipping_methods[$packageID_2] = 'edb_self_pickup';
        }
        $shipping_method_1 = $shipping_methods[$packageID_1];
        $shipping_method_2 = $shipping_methods[$packageID_2];
        $packages[$packageID_1]=$this->create_package($available_items, $shipping_method_1,$item_key);
        $packages[$packageID_2]=$this->create_package($backorder_items,$shipping_method_2,$item_key);
      }else{
        $item['edb_availability'] = $this->get_package_availability( $item['data'], false);
        $packageID_1 = $this->generate_package_id( 'other'.$item_key, $item );
        $shipping_method = $shipping_methods[$packageID_1];
        $packages[$packageID_1]=$this->create_package($item,$shipping_method,$item_key);
      }
    }
    $counts = array();
    foreach( $packages as $k => $p){
      $counts[$k] = 5;
    }
    
    WC()->session->set('chosen_shipping_methods',$shipping_methods);
    
    $this->packages = $packages;
    
    return $packages;
  }
  
}
class Edb_Shipping_Method_Self_Pickup extends Edb_Shipping_Method{
  public function __construct() {
    $this->id                 = 'edb_self_pickup'; // Id for your shipping method. Should be uunique.
    $this->rate_label         = 'self serve';
    $this->method_title       = __( 'EDB Self Pickup' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

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
    $this->method_title       = __( 'EDB Ship Ready' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

    $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
    $this->title              = "EDB Ready Shipping"; // This can be added as an setting but for this example its forced.
    $this->init();
  }
 
  public function calculate_shipping_for_bundle( $bundle ){
      $split = array();
      foreach( $bundle['contents'] as $item ){
        $pk = $item['package_key'];
        write_log($item['package_key']);
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
    $this->method_title       = __( 'EDB Ship Bundle 1' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

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
    $this->method_title       = __( 'EDB Ship Bundle 2' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

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
    $this->method_title       = __( 'EDB Ship Bundle 3' );  // Title shown in admin
    $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

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
