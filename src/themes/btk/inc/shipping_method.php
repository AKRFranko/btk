<?php

function startsWith($haystack, $needle) {
    // search backwards starting from haystack length characters from the end
    
}


function btk_init_shipping_method(){
class WC_EDB_Shipping_Method extends WC_Shipping_Method{
    /**
     * Constructor for your shipping class
     *
     * @access public
     * @return void
     */
    public function __construct() {
      $this->id                 = 'edb_shipping'; // Id for your shipping method. Should be uunique.
      $this->method_title       = __( 'EDB Shipping Rules' );  // Title shown in admin
      $this->method_description = __( 'A custom shipping module.' ); // Description shown in admin

      $this->enabled            = "yes"; // This can be added as an setting but for this example its forced enabled
      $this->title              = "EDB Shipping"; // This can be added as an setting but for this example its forced.
      $this->init();
    }

    /**
     * Init your settings
     *
     * @access public
     * @return void
     */
    function init() {
      // Load the settings API
      $this->init_form_fields(); // This is part of the settings API. Override the method to add your own settings
      $this->init_settings(); // This is part of the settings API. Loads settings you previously init.

      // Save settings in admin if you have any defined
      add_action( 'woocommerce_update_options_shipping_' . $this->id, array( $this, 'process_admin_options' ) );
    }

    /**
    * find psotal zone based on postal code function.
    *
    * @access private
    * @return number
    */
    
    private function get_postal_zone( $postcode ){
      $postcode = strtolower($postcode);
      if(!$postcode) return 'zone-3';
      if($postcode[0] == 'h'){
        return 'zone-1';
      }
      if($postcode[0] == 'm'){
        return 'zone-2';
      }
      return 'zone-3';
    }
    /**
    * calculate_shipping_for_bundle function.
    *
    * @access private
    * @return number
    */
    
    private function calculate_shipping_for_bundle( $package, $total, $items  ){
      $shipping_class = 'accessories';
      
      foreach( $items as $item_key => $item ){
        if($item['data']->get_shipping_class() == 'furniture'){
          $shipping_class = 'furniture';
        }
        
      }
      
      $postcode = WC()->customer->get_shipping_postcode();
      $postzone = $this->get_postal_zone( $postcode );
      
      
      if($shipping_class == 'furniture'){
        if( $total < 500 ){
          switch( $postzone){
            case 'zone-1':
              return 65;
            case 'zone-2':
              return 150;
            case 'zone-3':
              return 200;
          }
        }else{
          switch( $postzone){
            case 'zone-1':
              return 0;
            case 'zone-2':
              return 100;
            case 'zone-3':
              return 300;
          }
        }
      }else{
        if( $total < 50 ){
          switch( $postzone){
            case 'zone-1':
              return 15;
            case 'zone-2':
              return 15;
            case 'zone-3':
              return 15;
          }
        }else{
          switch( $postzone){
            case 'zone-1':
              return 0;
            case 'zone-2':
              return 0;
            case 'zone-3':
              return 0;
          }
        }
      }
      return 0;
    }
    /**
     * calculate_shipping function.
     *
     * @access public
     * @param mixed $package
     * @return void
     */
    public function calculate_shipping( $package ) {
      
      
      

      $ship_ready_count=0;
      $ship_bundle_1_count=0;
      $ship_bundle_2_count=0;
      $ship_bundle_3_count=0;
      
      $ready=array();
      $bundle1=array();
      $bundle2=array();
      $bundle3=array();
      

      
      foreach($package["contents"] as $item_key => $item){
          $edb_shipping_value = $item['edb_shipping'];
          if($edb_shipping_value == 'ship_ready'){
            $ship_ready_count+=$item['line_total'];
            $ready[] = $item;
          }else if($edb_shipping_value == 'ship_bundle_1'){
            $ship_bundle_1_count+=$item['line_total'];
            $bundle1[] = $item;
          }else if($edb_shipping_value == 'ship_bundle_2'){
             $ship_bundle_2_count+=$item['line_total'];
             $bundle2[] = $item;
          }else if($edb_shipping_value == 'ship_bundle_3'){
              $ship_bundle_3_count+=$item['line_total'];
              $bundle3[] = $item;
          }
      }
      
      
     
     
     if($edb_shipping_value == 'ship_ready'){
      $edb_shipping_cost = $this->calculate_shipping_for_bundle( $package, $ship_ready_count, $ready );  
      // $edb_shipping_cost=$ship_ready_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_1'){
      $edb_shipping_cost = $this->calculate_shipping_for_bundle( $package , $ship_bundle_1_count, $bundle1 );  
      // $edb_shipping_cost=$ship_bundle_1_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_2'){
      $edb_shipping_cost = $this->calculate_shipping_for_bundle( $package, $ship_bundle_2_count, $bundle2 );  
        // $edb_shipping_cost=$ship_bundle_2_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_3'){
      $edb_shipping_cost = $this->calculate_shipping_for_bundle( $package, $ship_bundle_3_count, $bundle3 );  
        // $edb_shipping_cost=$ship_bundle_4_count > 500 ? 0 : 65;
     }
     // $cost = $ship_ready_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_1_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_2_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_3_count > 500 ? 0 : 65;
     
    // if($pickup_item_count > 0){
    //   var_dump('PIC');
    //   var_dump($pickup_item_count);
    //     WC()->cart->add_discount( 'selfserve' );
    // }
     
     $rate = array(
       'id' => $this->id,
       'label' => $edb_shipping_value,
       'cost' => $edb_shipping_cost
      // , 'calc_tax' => 'per_item'
     );

     // Register the rate
     $this->add_rate( $rate );
     
    }
}
}

add_action( 'woocommerce_shipping_init', 'btk_init_shipping_method' );

function btk_add_shipping_method( $methods ) {
  $methods[] = 'WC_EDB_Shipping_Method';
  return $methods;
}

add_filter( 'woocommerce_shipping_methods', 'btk_add_shipping_method' );

?>