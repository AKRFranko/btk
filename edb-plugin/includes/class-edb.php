<?php

/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * public-facing side of the site and the admin area.
 *
 * @link       http://akr.club
 * @since      1.0.0
 *
 * @package    Edb
 * @subpackage Edb/includes
 */

/**
 * The core plugin class.
 *
 * This is used to define internationalization, admin-specific hooks, and
 * public-facing site hooks.
 *
 * Also maintains the unique identifier of this plugin as well as the current
 * version of the plugin.
 *
 * @since      1.0.0
 * @package    Edb
 * @subpackage Edb/includes
 * @author     Franko <franko@akr.club>
 */


class Edb {

	/**
	 * The loader that's responsible for maintaining and registering all hooks that power
	 * the plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      Edb_Loader    $loader    Maintains and registers all hooks for the plugin.
	 */
	protected $loader;

	/**
	 * The unique identifier of this plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      string    $plugin_name    The string used to uniquely identify this plugin.
	 */
	protected $plugin_name;

	/**
	 * The current version of the plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      string    $version    The current version of the plugin.
	 */
	protected $version;

	/**
	 * Define the core functionality of the plugin.
	 *
	 * Set the plugin name and the plugin version that can be used throughout the plugin.
	 * Load the dependencies, define the locale, and set the hooks for the admin area and
	 * the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function __construct() {

		$this->plugin_name = 'edb';
		$this->version = '1.0.0';

		$this->load_dependencies();
		$this->set_locale();
		
		$this->define_admin_hooks();
		$this->define_public_hooks();
		
		$this->loader->add_action('plugins_loaded', $this, 'load_shipping');
		
		
    $this->loader->add_filter('woocommerce_shipping_methods', $this, 'register_shipping_methods');
    $this->loader->add_filter( 'woocommerce_integrations', $this, 'register_integration' );
    
    $this->loader->add_action('wp_enqueue_scripts', $this, 'dequeue_scripts', 9999 );
    

	}
	public function dequeue_scripts(){
	 // write_log('DEQ');
	  wp_deregister_script('wc-cart-new');
    wp_dequeue_script( 'wc-cart-new', '/srv/http/wordpress/wp-content/plugins/woocommerce-edb/assets/js/cart.js');
  }

	/**
	 * Load the required dependencies for this plugin.
	 *
	 * Include the following files that make up the plugin:
	 *
	 * - Edb_Loader. Orchestrates the hooks of the plugin.
	 * - Edb_i18n. Defines internationalization functionality.
	 * - Edb_Admin. Defines all hooks for the admin area.
	 * - Edb_Public. Defines all hooks for the public side of the site.
	 *
	 * Create an instance of the loader which will be used to register the hooks
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function load_dependencies() {

		/**
		 * The class responsible for orchestrating the actions and filters of the
		 * core plugin.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-loader.php';

		/**
		 * The class responsible for defining internationalization functionality
		 * of the plugin.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-i18n.php';

		/**
		 * The class responsible for defining all actions that occur in the admin area.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'admin/class-edb-admin.php';

		/**
		 * The class responsible for defining all actions that occur in the public-facing
		 * side of the site.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'public/class-edb-public.php';
		
		/**
		 * The class responsible for keeping sanity when rendering products in custom ways.
		 * 
		 */
		 
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-product-decorator.php';
		
		

		$this->loader = new Edb_Loader();

	}

	/**
	 * Define the locale for this plugin for internationalization.
	 *
	 * Uses the Edb_i18n class in order to set the domain and to register the hook
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function set_locale() {

		$plugin_i18n = new Edb_i18n();

		$this->loader->add_action( 'plugins_loaded', $plugin_i18n, 'load_plugin_textdomain' );
		

	}
	/**
   * Add a new integration to WooCommerce.
   */
  public function register_integration( $integrations ) {
    
    $integrations[] = 'Edb_Wc_Integration';
    return $integrations;
  }
  
  
	public function register_shipping_methods( $methods ){
	 
	 if(!array_key_exists('Edb_Shipping_Method_Self_Pickup', $methods)){
	   //write_log('register_shipping_methods');
	  $methods[] = 'Edb_Shipping_Method_Self_Pickup';
    $methods[] = 'Edb_Shipping_Method_Ship_Ready';
    $methods[] = 'Edb_Shipping_Method_Ship_Bundle_1';
    $methods[] = 'Edb_Shipping_Method_Ship_Bundle_2';
    $methods[] = 'Edb_Shipping_Method_Ship_Bundle_3';
	 }else{
	   //write_log('ignored register_shipping_methods');
	 }
   return $methods;
	}
	
	
	
	public function load_shipping(){
    // write_log('load_shipping');
    
    require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-shipping.php';
    require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-wc-integration.php';
    
    $GLOBALS['Edb_Shipping_Method'] = new Edb_Shipping_Method();
    $GLOBALS['Edb_Shipping_Method_Self_Pickup'] = new Edb_Shipping_Method_Self_Pickup( __FILE__ );
    $GLOBALS['Edb_Shipping_Method_Ship_Ready'] = new Edb_Shipping_Method_Ship_Ready( __FILE__ );
    $GLOBALS['Edb_Shipping_Method_Ship_Bundle_1'] = new Edb_Shipping_Method_Ship_Bundle_1( __FILE__ );
    $GLOBALS['Edb_Shipping_Method_Ship_Bundle_2'] = new Edb_Shipping_Method_Ship_Bundle_2( __FILE__ );
    $GLOBALS['Edb_Shipping_Method_Ship_Bundle_3'] = new Edb_Shipping_Method_Ship_Bundle_3( __FILE__ );
    
    
    // add_action('woocommerce_reduce_order_stock', array( $this, 'mirror_reduce_order_stock'), 10, 1);
    // add_action('woocommerce_get_stock_quantity', array( $this, 'mirror_get_stock'), 10, 1);
    
    add_filter( 'woocommerce_cart_shipping_method_full_label' ,array( $GLOBALS['Edb_Shipping_Method'], 'cart_shipping_method_full_label') );
    add_filter( 'woocommerce_add_cart_item_data',  array($GLOBALS['Edb_Shipping_Method'], 'add_cart_item_custom_data'  ), 10, 2 );
    add_filter( 'woocommerce_get_cart_item_from_session', array($GLOBALS['Edb_Shipping_Method'], 'get_cart_items_from_session'), 1, 3 );
    
    add_action( 'woocommerce_cart_shipping_packages',  array($GLOBALS['Edb_Shipping_Method'], 'cart_shipping_packages'), 10, 1);
    add_action( 'woocommerce_cart_calculate_fees',  array($GLOBALS['Edb_Shipping_Method'], 'calculate_fees'), 10, 1);
    add_action( 'woocommerce_review_order_before_shipping',  array($GLOBALS['Edb_Shipping_Method'], 'review_order_before_shipping'), 10, 0 );
    add_action( 'woocommerce_review_order_after_shipping',  array($GLOBALS['Edb_Shipping_Method'], 'review_order_after_shipping'), 10, 0 );
    
    add_action('woocommerce_cart_needs_shipping', array($GLOBALS['Edb_Shipping_Method'], 'cart_needs_shipping'), 10, 1 );
    add_action('woocommerce_cart_needs_shipping_address',array($GLOBALS['Edb_Shipping_Method'], 'cart_needs_shipping_address'), 10, 1 );
    
    
    add_action('template_redirect', array($GLOBALS['Edb_Shipping_Method'], 'persist_chosen_shipping_methods') );
    
    add_filter('woocommerce_free_price_html', array($GLOBALS['Edb_Shipping_Method'],'free_price_html'));
    add_filter('woocommerce_free_sale_price_html', array($GLOBALS['Edb_Shipping_Method'],'free_price_html'));
    add_filter('woocommerce_variable_free_price_html', array($GLOBALS['Edb_Shipping_Method'],'free_price_html'));
    add_filter('woocommerce_variation_free_price_html', array($GLOBALS['Edb_Shipping_Method'],'free_price_html'));
    
    add_filter('woocommerce_checkout_get_value',array($GLOBALS['Edb_Shipping_Method'],'get_checkout_value'), 10, 2);
    
    add_filter('woocommerce_credit_card_form_fields',array($GLOBALS['Edb_Shipping_Method'],'fix_credit_card_fields'), 10, 2);
    
    
    add_action( 'woocommerce_checkout_update_order_review',  array($GLOBALS['Edb_Shipping_Method'], 'checkout_update_order_review') );
    add_action( 'woocommerce_created_customer', array($GLOBALS['Edb_Shipping_Method'],'created_customer') );
    add_action( 'woocommerce_order_status_completed', array($GLOBALS['Edb_Shipping_Method'],'order_status_completed') );
    
    // add_action('woocommerce_checkout_update_order_meta', array($GLOBALS['Edb_Shipping_Method'],'set_custom_fields_on_order') );
    add_action('woocommerce_add_order_item_meta', array($GLOBALS['Edb_Shipping_Method'],'set_custom_field_on_order_item'), 10, 3 );
    add_action('woocommerce_order_get_items', array($GLOBALS['Edb_Shipping_Method'],'order_get_items'), 10, 2 );
    add_action('woocommerce_checkout_update_order_meta', array($GLOBALS['Edb_Shipping_Method'],'checkout_update_order_meta'), 10, 2 );
    
    add_action('woocommerce_before_checkout_process', array($GLOBALS['Edb_Shipping_Method'],'before_checkout_process'));
    add_action('woocommerce_after_checkout_validation',array($GLOBALS['Edb_Shipping_Method'],'after_checkout_validation'));
    add_action('woocommerce_before_checkout_shipping_form', array($GLOBALS['Edb_Shipping_Method'],'before_shipping_form'));
    
    add_action('woocommerce_before_pay_action', array($GLOBALS['Edb_Shipping_Method'],'before_pay_action'));
    
    add_filter('woocommerce_reduce_order_stock', array($GLOBALS['Edb_Shipping_Method'],'reduce_restock') );
    
    add_filter('woocommerce_get_regular_price', array( $this, 'get_regular_price'), 10, 2 );
    add_filter('woocommerce_get_sale_price', array( $this, 'get_sale_price'), 10, 2 );
    
    // add_action( 'woocommerce_review_order_before_submit',  array($GLOBALS['Edb_Shipping_Method'], 'review_order_before_submit') );
    
    // add_action( 'woocommerce_before_checkout_billing_form', array($GLOBALS['Edb_Shipping_Method'],'before_checkout_billing_form') );
    
    // add_action( 'woocommerce_checkout_update_order_meta',  array($GLOBALS['Edb_Shipping_Method'], 'checkout_update_order_meta'), 10, 2 );
    
    
    // add_filter('woocommerce_coupon_is_valid_for_product', array($GLOBALS['Edb_Shipping_Method'], 'can_coupon_apply_to_product') , 10, 4 );
    
    
    
	}
  // public function get_regular_price( $price, $product ){
  //   write_log( 'GET REGULAR PRICE');
    
  //   write_log($product);
  // }
  
  // public function get_sale_price( $price, $product ){
  //   write_log( 'GET SALE PRICE');
  //   write_log($product->product_type);
  // }
	
	public function mirror_reduce_order_stock( $order ){
	 // write_log('mirror_reduce_order_stock');
	  
	 // foreach( $order->get_items() as $item ){
	    
	 //   if( !empty($item['product_id']) ){
	 //     $target = get_product( $item['product_id'] );
	 //     $mirror_from = $target->get_attribute('edb_mirror_stock_from');
	      
	 //     if(!empty($mirror_from)){
	 //       $source = get_product( $mirror_from );
	 //       $source_target = $source->get_attribute('edb_mirror_stock_to');
	 //       if(!empty($source_target) && $source_target == $item['product_id']){
	 //           $target_variation = get_product( $item['variation_id'] );
	 //           $target_material = $target_variation->get_attribute('edb_material');
	 //           $source_variations = $source->get_available_variations();
	 //           foreach($source_variations as $source_variation){
	 //             if($source_variation['attributes']['attribute_edb_material'] == $target_material){
	 //               $source_variation = get_product( $source_variation['variation_id'] );
	 //               $target_variation->set_stock( $source_variation->get_stock_quantity() );
	 //             }
	 //           }
	 //       }
	 //     }
	 //   }
	 // }
	  
	  
	}
	

	/**
	 * Register all of the hooks related to the admin area functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_admin_hooks() {

		$plugin_admin = new Edb_Admin( $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_action( 'admin_enqueue_scripts', $plugin_admin, 'enqueue_styles' );
		$this->loader->add_action( 'admin_enqueue_scripts', $plugin_admin, 'enqueue_scripts' );

    
    
    
    $this->loader->add_action( 'init', $plugin_admin, 'register_custom_post_types');
    $this->loader->add_action( 'add_meta_boxes', $plugin_admin, 'add_material_meta_boxes');
    $this->loader->add_action( 'save_post', $plugin_admin, 'save_material_meta_boxes', 10, 2);
    $this->loader->add_action( 'wp_insert_post', $plugin_admin, 'ignore_duplicate_material_description', 10, 3);
    
    $this->loader->add_action( 'woocommerce_product_options_general_product_data', $plugin_admin, 'product_settings_fields', 10, 3 );
    $this->loader->add_action( 'woocommerce_product_after_variable_attributes', $plugin_admin, 'variation_settings_fields', 10, 3 );
    $this->loader->add_action('show_user_profile', $plugin_admin, 'user_settings_fields', 10, 1);
    $this->loader->add_action('edit_user_profile', $plugin_admin, 'user_settings_fields', 10, 1);
    
    $this->loader->add_action( 'woocommerce_process_product_meta', $plugin_admin, 'save_product_settings_fields', 10, 1 );
    $this->loader->add_action( 'woocommerce_save_product_variation', $plugin_admin, 'save_variation_settings_fields', 10 , 1 );
    $this->loader->add_action('personal_options_update', $plugin_admin, 'save_user_settings_fields', 10, 1);
    $this->loader->add_action('edit_user_profile_update', $plugin_admin, 'save_user_settings_fields', 10, 1);


    $this->loader->add_action( 'wp_ajax_edb_guess_shipping_zone', $plugin_admin,'edb_ajax_guess_shipping_zone' );
    $this->loader->add_action( 'wp_ajax_nopriv_edb_guess_shipping_zone', $plugin_admin,'edb_ajax_guess_shipping_zone' );
    
    
    
    # $this->loader->add_action( 'woocommerce_reduce_order_stock', $this, 'mirror_reduce_order_stock' );
	}

	/**
	 * Register all of the hooks related to the public-facing functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_public_hooks() {

		$plugin_public = new Edb_Public( $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_styles' );
		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_scripts' );
		
		// availability html;
		$this->loader->add_filter('woocommerce_get_availability', $plugin_public, 'get_product_availability_html', 1, 2 );
  
    $this->loader->add_action('template_redirect', $plugin_public, 'maybe_login_user_before_checkout' );
    $this->loader->add_action('woocommerce_login_redirect', $plugin_public, 'check_redirect_state'  );
    $this->loader->add_action('woocommerce_registration_redirect', $plugin_public, 'check_redirect_state'  );
    // $this->loader->add_action('user_register', $plugin_public, 'user_register'  );
    $this->loader->add_action('woocommerce_api_product_response', $plugin_public, 'edb_api_get_products', 10, 2 );
	}
  
	/**
	 * Run the loader to execute all of the hooks with WordPress.
	 *
	 * @since    1.0.0
	 */
	public function run() {
		$this->loader->run();
	}

	/**
	 * The name of the plugin used to uniquely identify it within the context of
	 * WordPress and to define internationalization functionality.
	 *
	 * @since     1.0.0
	 * @return    string    The name of the plugin.
	 */
	public function get_plugin_name() {
		return $this->plugin_name;
	}

	/**
	 * The reference to the class that orchestrates the hooks with the plugin.
	 *
	 * @since     1.0.0
	 * @return    Edb_Loader    Orchestrates the hooks of the plugin.
	 */
	public function get_loader() {
		return $this->loader;
	}

	/**
	 * Retrieve the version number of the plugin.
	 *
	 * @since     1.0.0
	 * @return    string    The version number of the plugin.
	 */
	public function get_version() {
		return $this->version;
	}

}
