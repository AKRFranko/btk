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
                  $GLOBALS['WC_Edb_Shipping_Method_Self_Pickup'] = new WC_Edb_Shipping_Method_Self_Pickup( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Ready'] = new WC_Edb_Shipping_Method_Ship_Ready( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_1'] = new WC_Edb_Shipping_Method_Ship_Bundle_1( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_2'] = new WC_Edb_Shipping_Method_Ship_Bundle_2( __FILE__ );
                  $GLOBALS['WC_Edb_Shipping_Method_Ship_Bundle_3'] = new WC_Edb_Shipping_Method_Ship_Bundle_3( __FILE__ );
                  
                  add_filter('woocommerce_shipping_methods', array( $this, 'add_shipping_method' ) );
                }
                // custom fields for products
                add_filter('woocommerce_product_options_general_product_data', array( $this, 'add_custom_product_fields'));
                add_filter('woocommerce_process_product_meta', array( $this, 'process_custom_product_fields'));
                // combine that with overrides for html output
                add_filter('woocommerce_get_availability', array( $this, 'get_product_availability' ), 1, 2 );
                
            }
            
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
                $availability['availability'] = $delay_in_words;
              }else{
                write_log(
                  array(
                    'in_stock' => $qty_in_stock,
                    'in_cart'=> $qty_in_cart,
                    'edb_backorder_delay' => $edb_backorder_delay,
                    'edb_available_delay' => $edb_available_delay
                  )
                );
                if( $qty_in_stock < $qty_in_cart){
                  $backorder_delay_in_words = time_elapsed(strtotime( $edb_backorder_delay, $now ));
                  $available_delay_in_words = time_elapsed(strtotime( $edb_available_delay, $now ));
                  $backorder_qty = $qty_in_cart - $qty_in_stock;
                  $availability['availability'] = "$backorder_qty &times; $available_delay_in_words, $qty_in_stock &times; $backorder_delay_in_words";
                }else{
                  
                  $delay_in_words = time_elapsed(strtotime( $edb_available_delay, $now ));
                  $availability['availability'] = $delay_in_words;
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