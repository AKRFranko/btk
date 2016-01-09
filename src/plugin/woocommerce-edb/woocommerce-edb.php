<?php
/**
 * Plugin Name: WooCommerce EDB
 * Plugin URI: http://edb.com/products/woocommerce-edb/
 * Description: Your extension's description text.
 * Version: 1.0.0
 * Author: WooThemes
 * Author URI: http://woothemes.com/
 * Developer: Your Name
 * Developer URI: http://yourdomain.com/
 * Text Domain: wc-edb
 * Domain Path: /languages
 *
 * Copyright: © 2009-2015 WooThemes.
 * License: GNU General Public License v3.0
 * License URI: http://www.gnu.org/licenses/gpl-3.0.html
 */
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}
/**
 * Check if WooCommerce is active
 **/
if (in_array('woocommerce/woocommerce.php', apply_filters('active_plugins', get_option('active_plugins')))) {
  
    load_plugin_textdomain('wc-edb', false, dirname(plugin_basename(__FILE__)) . '/');
    // function wc_edb_plugin_path(){
    //   return untrailingslashit( plugin_dir_path( __FILE__ ) );
    // }
    
    
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
    
    if (!class_exists('WC_Edb')) {

        class WC_Edb
        {
            
            public function __construct()
            {
                // called just before the woocommerce template functions are included
                add_action('init', array(
                    $this,
                    'include_template_functions'
                ), 20);
                
                // called only after woocommerce has finished loading
                add_action('woocommerce_init', array(
                    $this,
                    'woocommerce_loaded'
                ));
                
                // called after all plugins have loaded
                add_action('plugins_loaded', array(
                    $this,
                    'plugins_loaded'
                ));
                
                
                // indicates we are running the admin
                if (is_admin()) {
                    // ...
                }
                
                // indicates we are being served over ssl
                if (is_ssl()) {
                    // ...
                }
                
                // take care of anything else that needs to be done immediately upon plugin instantiation, here in the constructor
            }
            
            /**
             * Override any of the template functions from woocommerce/woocommerce-template.php
             * with our own template functions file
             */
            public function include_template_functions()
            {
               //include('woocommerce-template.php');
            }
            
            /**
             * Take care of anything that needs woocommerce to be loaded.
             * For instance, if you need access to the $woocommerce global
             */
            public function woocommerce_loaded()
            {
                // ...
            }
            
            /**
             * Take care of anything that needs all plugins to be loaded
             */
            public function plugins_loaded()
            {
                if( class_exists( 'WC_Integration')){
                  include_once 'includes/class-wc-edb-integration.php';
                  add_filter('woocommerce_integrations', array( $this, 'add_integration' ) );
                }
                if( class_exists('WC_Shipping_Method')){
                  include_once 'includes/class-wc-edb-shipping.php';
                  $GLOBALS['WC_Edb_Shipping_Method'] = new WC_Edb_Shipping_Method();
                  $GLOBALS['WC_Edb_Shipping_Method_Self_Pickup'] = new WC_Edb_Shipping_Method_Self_Pickup( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Ready'] = new WC_Edb_Shipping_Method_Ship_Ready( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_1'] = new WC_Edb_Shipping_Method_Ship_Bundle_1( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_2'] = new WC_Edb_Shipping_Method_Ship_Bundle_2( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_3'] = new WC_Edb_Shipping_Method_Ship_Bundle_3( __FILE__ );
                  
                  add_filter('woocommerce_shipping_methods', array( $this, 'add_shipping_method' ) );
                  
                  add_filter( 'woocommerce_cart_shipping_method_full_label' , array( $GLOBALS['WC_Edb_Shipping_Method'], 'cart_shipping_method_full_label' ));
                  add_filter( 'woocommerce_add_cart_item_data', array( $GLOBALS['WC_Edb_Shipping_Method'], 'add_cart_item_custom_data' ) , 10, 2 );
                  add_filter( 'woocommerce_get_cart_item_from_session', array($GLOBALS['WC_Edb_Shipping_Method'], 'get_cart_items_from_session'), 1, 3 );
                  add_action('woocommerce_cart_shipping_packages', array( $GLOBALS['WC_Edb_Shipping_Method'], 'cart_shipping_packages'), 10, 1);
                  // add_action( 'woocommerce_checkout_update_order_review', array( $GLOBALS['WC_Edb_Shipping_Method'], 'before_order_review'), 10, 0 );
                  add_action( 'woocommerce_review_order_before_shipping', array( $GLOBALS['WC_Edb_Shipping_Method'], 'review_order_before_shipping'), 10, 0 );
                  add_action( 'woocommerce_review_order_after_shipping', array( $GLOBALS['WC_Edb_Shipping_Method'], 'review_order_after_shipping'), 10, 0 ); 
                  add_action('template_redirect',array( $GLOBALS['WC_Edb_Shipping_Method'], 'persist_chosen_shipping_methods' ));
                }
                // custom fields for products
                add_filter('woocommerce_product_options_general_product_data', array( $this, 'add_custom_product_fields'));
                add_filter('woocommerce_process_product_meta', array( $this, 'process_custom_product_fields'));
                // combine that with overrides for html output
                add_filter('woocommerce_get_availability', array( $this, 'get_product_availability' ), 1, 2 );
                add_filter('woocommerce_checkout_fields', array( $this, 'checkout_fields'));
                // add_action('woocommerce_review_order_before_shipping', array( $this, 'sync_shipping_update') );
                // add_action('woocommerce_package_rates', array( $this,'before_calculate_totals'), 100, 2);
                // dammed ajax fragments 
                // add_filter('woocommerce_update_order_review_fragments', array( $this, 'update_order_review_fragments' ));
                
                
                
            }
            
            // public function before_calculate_totals( $data ){
              
            //   write_log('before_calculate_totals');
            //   // write_log( wp_list_pluck( WC()->shipping->packages, 'rates') );
            //   // write_log($data);
            //   // write_log(WC()->session->set('shipping_method_counts', array() ));
            //   // WC()->cart->reset();
            // }
            // public function sync_shipping_update( ){
            //   // write_log('SYNC SHIPPING');
              
              
            //   // WC()->shipping->calculate_shipping(WC()->shipping->packages);
            //   // WC()->cart->calculate_totals();
              
            // }
            
           public function checkout_fields($fields) {
            // write_log('FIELD OVERRIDE');
             
             $fields['billing']['billing_first_name']['placeholder'] = 'first name';
             $fields['billing']['billing_last_name']['placeholder'] = 'last name';
             $fields['billing']['billing_email']['placeholder'] = 'email address';
             $fields['shipping']['shipping_first_name']['placeholder'] = 'first name';
             $fields['shipping']['shipping_last_name']['placeholder'] = 'last name';
             $fields['shipping']['shipping_email']['placeholder'] = 'email address';
             //$fields['billing']['billing_postcode']['default'] = '';
           //   $fields['shipping']['shipping_first_name']['placeholder'] = 'first name';
           //   $fields['shipping']['shipping_last_name']['placeholder'] = 'last name';
           //   $fields['shipping']['shipping_email']['placeholder'] = 'email address';
             
              // $fields['billing']['billing_country']['required'] = false;
              // $fields['shipping']['shipping_country']['required'] = false;
              //unset($fields['billing']['billing_address']);
           //   unset($fields['billing']['billing_address_2']);
           //   unset($fields['billing']['billing_email']);
           //   unset($fields['billing']['billing_phone']);
             unset($fields['order']['order_comments']);
             return $fields;
           }
            // public function update_order_review_fragments( $array ){
            //   return $a;
            // }
            
            public function get_package_availability( $package_product, $is_backorder){
              $now = strtotime(date(DATE_RFC2822));
              $edb_backorder_delay = get_post_meta( $package_product->post->ID, '_edb_backorder_delay', true);
              $edb_available_delay = get_post_meta( $package_product->post->ID, '_edb_available_delay', true);
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
              
              foreach( WC()->cart->cart_contents as $cart_item ){
                if( $cart_item['variation_id'] == $product_id ){
                  $qty_in_cart += $cart_item['quantity'];
                }
              }
              if( $qty_in_stock == 0 ){
                $delay_in_words = time_elapsed(strtotime( $edb_backorder_delay, $now ));
                $availability['availability'] = "$qty_in_cart &times; <i>$delay_in_words</i>";
              }else{
                // write_log(
                //   array(
                //     'in_stock' => $qty_in_stock,
                //     'in_cart'=> $qty_in_cart,
                //     'edb_backorder_delay' => $edb_backorder_delay,
                //     'edb_available_delay' => $edb_available_delay
                //   )
                // );
                if( $qty_in_stock < $qty_in_cart){
                  $backorder_delay_in_words = time_elapsed(strtotime( $edb_backorder_delay, $now ));
                  $available_delay_in_words = time_elapsed(strtotime( $edb_available_delay, $now ));
                  $backorder_qty = $qty_in_cart - $qty_in_stock;
                  $availability['availability'] = "$backorder_qty &times; <i>$available_delay_in_words</i>, $qty_in_stock &times; <i>$backorder_delay_in_words</i>";
                }else{
                  
                  $delay_in_words = time_elapsed(strtotime( $edb_available_delay, $now ));
                  $availability['availability'] = "$qty_in_cart &times; <i>$delay_in_words</i>";
                }
              }
              
              return $availability;
              
            }
            
            /* receive custom product fields */
            public function process_custom_product_fields( $post_id ){
              if( !empty($_POST['_edb_backorder_delay'])){
                  update_post_meta( $post_id, '_edb_backorder_delay', esc_attr( $_POST['_edb_backorder_delay'] ) );
              }
              if( !empty($_POST['_edb_available_delay'])){
                  update_post_meta( $post_id, '_edb_available_delay', esc_attr( $_POST['_edb_available_delay'] ) );
              }
            }
            
            /* add custom product fields */
            public function add_custom_product_fields(){
              global $woocommerce, $post;
              
              echo '<div class="options_group">';
              woocommerce_wp_text_input(array(
                'id' => '_edb_backorder_delay',
                'label' => __('Shipping days to add when item is backorder','wc-edb'),
                'description' => __('ex: +(n)day where n is number of days (other keywords: week, month)','wc-edb'),
                'placeholder'=> '+2days',
                'desc_tip' => 'true',
                'type' => 'text',
                'default'=> '+7day'
              ));
              woocommerce_wp_text_input(array(
                'id' => '_edb_available_delay',
                'label' => __('Shipping days to add when item is available','wc-edb'),
                'description' => __('ex: +(n)day where n is number of days (other keywords: week, month)','wc-edb'),
                'placeholder'=> '+2days',
                'desc_tip' => 'true',
                'type' => 'text',
                'default'=> '+7day'
               
              ));
              echo '</div>';
            }
            
            /**
             * Add a new integration to WooCommerce.
             */
            public function add_integration( $integrations ) {
              $integrations[] = 'WC_Edb_Integration';
              return $integrations;
            }
            /**
             * Add a new shipping method to WooCommerce.
             */
            public function add_shipping_method( $methods ) {
              // $methods[] = 'WC_Edb_Shipping_Method';
              $methods[] = 'WC_Edb_Shipping_Method_Self_Pickup';
              $methods[] = 'WC_Edb_Shipping_Method_Ship_Ready';
              $methods[] = 'WC_Edb_Shipping_Method_Ship_Bundle_1';
              $methods[] = 'WC_Edb_Shipping_Method_Ship_Bundle_2';
              $methods[] = 'WC_Edb_Shipping_Method_Ship_Bundle_3';
              return $methods;
            }
        }
        
        // finally instantiate our plugin class and add it to the set of globals
        
        $GLOBALS['WC_Edb'] = new WC_Edb( __FILE__ );
    }
    
}

?>