<?php

/**
 * The public-facing functionality of the plugin.
 *
 * @link       https://elementdebase.com
 * @since      1.0.0
 *
 * @package    Edb_Order_Tool
 * @subpackage Edb_Order_Tool/public
 */

/**
 * The public-facing functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Edb_Order_Tool
 * @subpackage Edb_Order_Tool/public
 * @author     Franko <developer@elementdebase.com>
 */
class Edb_Order_Tool_Public {

	/**
	 * The ID of this plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $plugin_name    The ID of this plugin.
	 */
	private $plugin_name;

	/**
	 * The version of this plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $version    The current version of this plugin.
	 */
	private $version;

	/**
	 * Initialize the class and set its properties.
	 *
	 * @since    1.0.0
	 * @param      string    $plugin_name       The name of the plugin.
	 * @param      string    $version    The version of this plugin.
	 */
	public function __construct( $plugin_name, $version ) {

		$this->plugin_name = $plugin_name;
		$this->version = $version;
		
		

	}

	/**
	 * Register the stylesheets for the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_styles() {

		/**
		 * This function is provided for demonstration purposes only.
		 *
		 * An instance of this class should be passed to the run() function
		 * defined in Edb_Order_Tool_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Order_Tool_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/edb-order-tool-public.css', array(), $this->version, 'all' );

	}

	/**
	 * Register the JavaScript for the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {

		/**
		 * This function is provided for demonstration purposes only.
		 *
		 * An instance of this class should be passed to the run() function
		 * defined in Edb_Order_Tool_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Order_Tool_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */
		 if(current_user_can('publish_posts') && is_page('order-tool')){
		  wp_enqueue_script( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'edb-poly/app/script/edb.js', array( 'jquery' ), $this->version, false );   
		  $params = array( 'ajaxurl' => admin_url( 'admin-ajax.php', 'https' ) );
      wp_localize_script( $this->plugin_name, 'edb_order_tool_params' , $params );
		 }

		
     
    
     
    
	}

  public function create_order( $jsonData ){
    $order = wc_create_order();
    $items = $jsonData['order']['items'];
    $shipping = $jsonData['order']['shipping_address'];
    $billing = $jsonData['order']['billing_address'];
    $noship = $jsonData['order']['shipping_address']['noship'];
    $jsonData['order']['shipping_address']['noship'] = null;
    if(!empty($shipping)){
      $order->set_address( $shipping, 'shipping');
    }
    if(!empty($billing)){
      $order->set_address( $billing, 'billing');
    }
    
    foreach(  $items as $item ){
      $product = get_product( $item['variation_id'] );
      if($product ){
        $order->add_product( $product,$item['quantity'] );  
      }
      write_log( 'PRODUCT');
    write_log( $product );
      
    }
    $order->calculate_totals();
    // $order->billing_email='franko@akr.club';
    $order->calculate_shipping();
    $order->calculate_totals( true );
    
    $this->order = $order;
    
    return $this->order->get_checkout_payment_url(  );
  }	
	
	public function handle_ajax(){
	  write_log('HANDLE AJAX');
	  $command = isset($_REQUEST['command']) ? $_REQUEST['command'] : false;
	  $upload_dir = wp_upload_dir();
    $path = $upload_dir['basedir'] . '/json';
	  if($command){
	    
	    if( $command == 'initial'){
	      $this->update_product_cache();
	      $this->catalog = file_get_contents( $path."/catalog.json" );
	      echo $this->catalog;
	    }
	    if( $command == 'create_order'){
	      echo $this->create_order( $_REQUEST );
	    }
	  }
	  
    wp_die();
  }
  
  public function update_materials_cache(){
    $args = array( 'post_type'=> array('edb_material_desc'),'post_status'=>'publish','posts_per_page'=>-1);
    $results = get_posts( $args );
    $output = array();
    
    foreach( $results as $desc ){ $material = get_post_meta( $desc->ID, '_edb_material', true );$subtitle = get_post_meta( $desc->ID, '_subtitle', true );$thumb = wp_get_attachment_image_src( get_post_thumbnail_id($desc->ID), 'post-thumbnail' );$url = $thumb['0']; $output[$material] = array("title"=> $desc->post_title,"subtitle" => $subtitle,"material" => $material,"image" => $url);}
    $upload_dir = wp_upload_dir();
    $path = $upload_dir['basedir'] . '/json';
    $url = $upload_dir['baseurl'] . '/json';
    $file = "$path/materials.json";
    if ( !file_exists($path) ) mkdir($path, 0775);
    $fp = fopen($file, 'w');
    fwrite($fp, json_encode( $output ));
    fclose($fp);
  }
  
  public function update_product_cache(){
    
    $args = array('post_type'=> array('product','product_variation'),'post_status'=>'publish','posts_per_page'=>-1);
    $product_results = get_posts( $args );
    $products = array();
    foreach( $product_results as $product ){$deco = edb_decorated_product( $product->ID ); $products[$product->ID] = $deco;}
    $this->cached_query_result = $products;
    $upload_dir = wp_upload_dir();
    $path = $upload_dir['basedir'] . '/json';
    $url = $upload_dir['baseurl'] . '/json';
    $file = "$path/catalog.json";
    if ( !file_exists($path) ) mkdir($path, 0775);
    $fp = fopen($file, 'w');
    fwrite($fp, json_encode( $products ));
    fclose($fp);
    return true;
  }
	/**
   * Get the custom page tempalte
   *
   * @since    1.0.0
   */
  public function get_page_template( $template ) {
    // $this->update_materials_cache();
    // $this->update_product_cache();
    // $this->update_materials_cache();
    if( is_page('order-tool') ){
      return dirname( __FILE__ ) . '/partials/edb-order-tool-public-display.php';
    }
    return $template;

  }
	
	

}
