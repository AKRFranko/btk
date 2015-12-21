<?php

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
      
      foreach($package["contents"] as $item_key => $item){
          $edb_shipping_value = $item['edb_shipping'];
          if($edb_shipping_value == 'ship_ready'){
            $ship_ready_count+=$item['line_total'];
          }else if($edb_shipping_value == 'ship_bundle_1'){
            $ship_bundle_1_count+=$item['line_total'];
          }else if($edb_shipping_value == 'ship_bundle_2'){
             $ship_bundle_2_count+=$item['line_total'];
          }else if($edb_shipping_value == 'ship_bundle_3'){
              $ship_bundle_3_count+=$item['line_total'];
          }
      }
     
     if($edb_shipping_value == 'ship_ready'){
       $edb_shipping_cost=$ship_ready_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_1'){
       $edb_shipping_cost=$ship_bundle_1_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_2'){
        $edb_shipping_cost=$ship_bundle_2_count > 500 ? 0 : 65;
     }else if($edb_shipping_value == 'ship_bundle_3'){
         $edb_shipping_cost=$ship_bundle_4_count > 500 ? 0 : 65;
     }
     // $cost = $ship_ready_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_1_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_2_count > 500 ? 0 : 65;
     // $cost += $ship_bundle_3_count > 500 ? 0 : 65;
     
     
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