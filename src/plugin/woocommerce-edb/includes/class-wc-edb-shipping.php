<?php

if (!function_exists('write_log')) {
    function write_log ( $log='' )  {
        if ( true === WP_DEBUG ) {
            if ( is_array( $log ) || is_object( $log ) ) {
                error_log( print_r( $log, true ) );
            } else {
                error_log( $log );
            }
        }
    }
}
class WC_Edb_Shipping_Method extends WC_Shipping_Method{
  /**
   * Init your settings
   *
   * @access public
   * @return void
   */
  // function init_form_field(){
  //     $form_fields = array();
  //     $shipping_classes  = WC()->shipping->get_shipping_classes();
  //     foreach($shipping_classes as $shipping_class ){
  //       $form_fields[$shipping_class] = array(
  //           'title' => "$shipping_class minimum",
  //           'type' => 'text',
  //           'description' => 'minimum amount for shipping calculations',
  //           'default'=> 0
  //       );
  //     }
  //     $this->form_fields = $form_fields;
  // }
  // function admin_options() {
  // }
  // public function __construct() {
  //   $this->id                 = 'edb_shipping'; // Id for your shipping method. Should be uunique.
  //   $this->rate_label         = 'edb shipping';
  //   $this->method_title       = __( 'EDB shipping' );  // Title shown in admin
  //   $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

  //   $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
  //   $this->title              = "EDB Shipping"; // This can be added as an setting but for this example its forced.
  //   $this->init();
  // }
  
  function init() {
    // Load the settings API
    
    // $this->init_form_fields(); // This is part of the settings API. Override the method to add your own settings
    // $this->init_settings(); // This is part of the settings API. Loads settings you previously init.
    
    // $shipping_classes  =WC()->shipping->get_shipping_classes();
    // $edb_settings=WC()->integrations->integrations['wc-edb']->settings;
    
      
    
    
    
      
    
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
    
    
    
    write_log('shipping init '.$this->id);
    // write_log(WC()->shipping->reset_shipping());
    
    
    
    
    
  }
  
  public function review_order_after_shipping(  ){
    write_log( 'review after shipping');

  }
  public function review_order_before_shipping(  ){
      global $WC_Edb_Shipping_Method;
      write_log( 'review before shipping');
      
      $customer = WC()->session->customer;
      $customer['calculated_shipping'] = 0;
      
      WC()->session->set('customer', $customer );
      $packs = WC()->shipping->packages;
      $pcount = count($packs);
      $epcount = count($WC_Edb_Shipping_Method->packages);
      
      if( $pcount != $epcount){
        write_log('WRONG COUNT');
        
        foreach($WC_Edb_Shipping_Method->packages as $k=> $p){
          if(!array_key_exists(  $k, $packs )){
            write_log('MISSING K: '.$k);
            write_log(array_key_exists($k, $WC_Edb_Shipping_Method->packages));
            write_log($WC_Edb_Shipping_Method->rates[$WC_Edb_Shipping_Method->packages[$k]['edb_shipping']]);
            $WC_Edb_Shipping_Method->packages[$k]['rates'] = $WC_Edb_Shipping_Method->rates[ $WC_Edb_Shipping_Method->packages[$k]['edb_shipping'] ];
          }
        }
        WC()->shipping->calculate_shipping( $WC_Edb_Shipping_Method->packages );
      }
      write_log('CART TOTAL: '.WC()->cart->shipping_total );
      WC()->cart->calculate_totals();
    
  }
  
  //Store the custom field
  // add_filter( 'woocommerce_add_cart_item_data', 'add_cart_item_custom_data_vase', 10, 2 );
  function add_cart_item_custom_data( $cart_item_meta, $product_id ) {
    global $woocommerce;
    write_log('add_cart_item_custom_data');
    $cart_item_meta['edb_shipping'] = 'edb_self_pickup';
    return $cart_item_meta; 
  }
  
  //Get it from the session and add it to the cart variable
  function get_cart_items_from_session( $item, $values, $key ) {
      if ( array_key_exists( 'edb_shipping', $values ) ){
        write_log('get_cart_items_from_session ('.$key.') :  '.json_encode( $values ));
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
    global $WC_Edb_Shipping_Method;
    // write_log('# calcualte shipping'. $this->id );
    if( $this->id == 'edb_self_pickup'){
      write_log('');
      write_log('');  
      write_log('');  
      write_log('begin calculating shippings');
      
    }
    write_log( '###########['.$this->id. ']##############');
    
    $packages = $this->cart_shipping_packages();
    $bundles = array('edb_self_pickup' => array(), 'edb_ship_ready'=> array(), 'edb_ship_bundle_1'=> array(),'edb_ship_bundle_2'=> array(),'edb_ship_bundle_3'=> array());
    foreach($packages as $package_key => $package_data ){
      
      $edb_shipping = $package_data['edb_shipping'];
      if(empty($edb_shipping)){
        $edb_shipping = 'edb_self_pickup';
      }
      if(empty($bundles[$edb_shipping])){
        $bundles[$edb_shipping] = $package_data;
      }else{
        foreach($package_data['contents'] as $item ){
          $bundles[$package_data['edb_shipping']]['contents'][] = $item;
        }
      }
    }
    
    
    foreach( $bundles as $method => $bundle  ){
      if( $method == $this->id){
        // write_log( 'had rate:' . json_encode( $this->rates ));
        if( empty( $bundle) ){
            write_log("Bundle $method is empty.");
            $rate = array(
                  'id' => $method,
                  'label' => $method,
                  'cost' => 0
                );
        }else{
          write_log("Bundle $method has ".count($bundle['contents'])." items.");
          $rate = $this->calculate_shipping_for_bundle( $bundle );  
          
        } 
        write_log( "added rate: ".$rate['cost']);
        $this->add_rate( $rate ); 
        $WC_Edb_Shipping_Method->rates[$this->id]=$rate;
      }
    }
    
    if( $this->id == 'edb_ship_bundle_3'){
      write_log('done calculating shippings for '.count($this->packages).' packages');
      write_log('-------');  
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
    if($postcode[2] == 'm'){
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
      $zone = $this->get_zone_from_postal_code($postcode);
    }else{
      $zone = 'zone-3';  
    }
    // write_log('zone: '.$zone);
    $items_total_cost = array_sum( wp_list_pluck( $items, 'line_total' ) );
    // write_log('items_total_cost: '.$items_total_cost );
    
    $table = $this->rates_table[$shipping_class];
    $min = $table['min'];
    $criteria = $items_total_cost > $min ? 'above' : 'below';
    // write_log('is_above_minimum: '.($items_total_cost > $min ? 'yes' : 'no') );
    // write_log('table_Rate: '.$table[$criteria][$zone]);
    return $table[$criteria][$zone];
  }
  
  public function get_available_items( $item, $wants, $have ){
    global $WC_Edb;
    $newitem = $item;
    $newitem['quantity'] = $have;
    $newitem['line_total'] = ( $item['line_total'] / $wants ) * $have;
    $newitem['line_tax'] = ( $item['line_tax'] / $wants ) * $have;
    $newitem['line_subtotal'] = ( $item['line_subtotal'] / $wants ) * $have;
    $newitem['line_subtotal_tax'] = ( $item['line_subtotal_tax'] / $wants ) * $have;
    $newitem['edb_availability'] = $WC_Edb->get_package_availability( $item['data'], false);
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
    global $WC_Edb;
    $newitem = $item;
    $qty = $wants - $have;
    $newitem['quantity'] = $qty;
    $newitem['line_total'] = ( $item['line_total'] / $wants ) * $qty;
    $newitem['line_tax'] = ( $item['line_tax'] / $wants ) * $qty;
    $newitem['line_subtotal'] = ( $item['line_subtotal'] / $wants ) * $qty;
    $newitem['line_subtotal_tax'] = ( $item['line_subtotal_tax'] / $wants ) * $qty;
    $newitem['edb_availability'] = $WC_Edb->get_package_availability( $item['data'], true);
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
  
  
  // public function remove_shipping_package(){
  //   write_log('remove_shipping_package');
  //   $package_to_remove = 
  //   $chosen_shipping_methods = WC()->session->get('chosen_shipping_methods');
  //   if(!empty($chosen_shipping_methods) && isset($chosen_shipping_methods[]))
  //   write_log($_REQUEST);
  // }
  public function get_product_availability_date( $product ){
    global $WC_Edb;
    $stock_qty = $product->get_stock_quantity();
    return $WC_Edb->get_package_availability( $product, $stock_qty == 0);
    // $shipping_class = $product->get_shipping_class(); 
    // $stock_qty = $product->get_stock_quantity();
    // if($stock_qty >= 0){
    //   if($shipping_class == 'furniture'){
    //     return '2weeks';
    //   }else{
    //     return '1weeks';
    //   }
    // }else{
    //   if($shipping_class == 'furniture'){
    //     return '4weeks';
    //   }else{
    //     return '2weeks';
    //   }
    // }
    // return 'now';
  }
  /**
   * calculate_shipping function.
   *
   * @access public
   * @param mixed $package
   * @return void
   */
  public function split_items_by_availability( $items ){
    $bundles = array();
    foreach( $items as $item ){
      $product = $item['data'];
      $date    = $this->get_product_availability_date( $product );
      if(!isset($bundles[$date])){
        $bundles[$date] = array();
      }
      $bundles[$date][]=$item;
    }
    return $bundles;
  }
  
  public function persist_chosen_shipping_methods(){
    
      // write_log('persist_chosen_shipping_methods');
      // write_log(array(
      //             'ajax' => is_ajax() ,
      //             'checkout' => is_checkout(),
      //             'REQ'=> json_encode( $_REQUEST ),
      //             'SESS'=> json_encode( WC()->session->get('chosen_shipping_methods') )
      //           ));
      // //$_REQUEST['shipping_method'] = WC()->session->get('chosen_shipping_methods');
      
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

  public function cart_shipping_packages( $packages = array() ){
    global $WC_Edb;
    // write_log('cart shipping packages '. $this-> id );
    // write_log( count($_REQUEST['shipping_method']) );
    $shipping_methods = WC()->session->get('chosen_shipping_methods');
    if(empty($shipping_methods) && !empty($_REQUEST['shipping_method'])){
      // write_log('took shipping methods from request');
      $shipping_methods = $_REQUEST['shipping_method'];
    }else if(!empty($shipping_methods)){
      // write_log('took shipping methods from session');
     # write_log('request had');
    #  write_log($_REQUEST);
    }
    
    
    
    // write_log( $shipping_methods );
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
        $item['edb_availability'] = $WC_Edb->get_package_availability( $item['data'], false);
        $packageID_1 = $this->generate_package_id( 'other'.$item_key, $item );
        $shipping_method = $shipping_methods[$packageID_1];
        $packages[$packageID_1]=$this->create_package($item,$shipping_method,$item_key);
      }
    }
    $counts = array();
    foreach( $packages as $k => $p){
      $counts[$k] = 5;
    }
    // write_log(WC()->session->get('shipping_method_counts'));
    WC()->session->set('chosen_shipping_methods',$shipping_methods);
    
    $this->packages = $packages;
    // write_log( '');
    // write_log( 'NUM PACKAGES: '. count($packages) );
    // try{
    //   $rt = wp_list_pluck($packages, 'rates');
    // }catch(Exception $e){
    //   $rt = null;
      
    // }
    // if(empty($rt)){
    //   write_log(  'no rates' );
    // }else{
    // write_log(  'rates: ' . json_encode($rt) ); 
    // }
    // write_log( '');
    return $packages;
  }
  
}
class WC_Edb_Shipping_Method_Self_Pickup extends WC_Edb_Shipping_Method{
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
class WC_Edb_Shipping_Method_Ship_Ready extends WC_Edb_Shipping_Method{
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
      $total = 0;
      // $shipments = $this->split_items_by_availability( $bundle['contents'] );
      
      foreach( $bundle['contents'] as $item ){
        $items = array( $item );
        $shipping_class = $this->get_shipping_class_from_items( $items );
        $total=$this->get_shipping_class_items_cost( $shipping_class, $items );
      }
      // foreach( $shipments as $date => $package ){
      //
      //   $total+=$this->get_shipping_class_items_cost( $shipping_class, $package );
      //   write_log( "$date: " . $total . " $shippin_class");
      // }
      $rate = array(
        'id' => $this->id,
        'label' => 'ship when ready',
        'cost' =>$total
      );
      
      return $rate;
      // $this->add_rate( $rate );
  }
  
  // public function calculate_shipping( $package ) {
  //   write_log('CALC SHIP READY');
    
  //   $shipments = 
 
    
  // }
} 
class WC_Edb_Shipping_Method_Ship_Bundle_1 extends WC_Edb_Shipping_Method{
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
      
      $shipping_class = $this->get_shipping_class_from_items( $bundle['contents'] );
      $total = $this->get_shipping_class_items_cost( $shipping_class, $bundle['contents'] );
      
      $rate = array(
        'id' => $this->id,
        'label' => $this->id,
        'cost' => $total
      );
      
      return $rate;
      
  }
  
} 

class WC_Edb_Shipping_Method_Ship_Bundle_2 extends WC_Edb_Shipping_Method_Ship_Bundle_1{
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
        'cost' => $total
      );
      
      return $rate;
      
  }
  
 
} 

class WC_Edb_Shipping_Method_Ship_Bundle_3 extends WC_Edb_Shipping_Method_Ship_Bundle_1{
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
        'cost' => $total
      );
      
      return $rate;
      
  }
  
  
} 





?>
