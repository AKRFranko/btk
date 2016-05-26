<?php

/**
 * The public-facing functionality of the plugin.
 *
 * @link       http://akr.club
 * @since      1.0.0
 *
 * @package    Edb
 * @subpackage Edb/public
 */

/**
 * The public-facing functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Edb
 * @subpackage Edb/public
 * @author     Franko <franko@akr.club>
 */
class Edb_Public {

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
		 * defined in Edb_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/edb-public.css', array(), $this->version . 'a', 'all' );

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
		 * defined in Edb_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_script( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'js/edb-public.js', array( 'jquery' ), $this->version . '.e', false );

	}
	
	public function edb_api_get_products( $product_data, $product ){
	  write_log( 'API GET PRODUCTS');  
	  $product_data['subtitle'] = get_post_meta( $product->id, '_subtitle', true );
	  return $product_data;
	}
	
	public function check_redirect_state( $returnto ){
	  
	  write_log('check_redirect_state');
	  write_log( $returnto );
	  if(isset($_POST['return_to']) && $_POST['return_to'] == 'checkout'){
	    write_log('return to checkout');
	    return home_url( '/checkout/' );
	  }
	  write_log('do nothing?');
	  write_log( $_REQUEST );
	  if( !empty($_REQUEST['register']) ){
	    return get_permalink( woocommerce_get_page_id('myaccount') )."?new";
	  }
	  if( !empty($_REQUEST['login']) ){
      return get_permalink( woocommerce_get_page_id('myaccount') );
    }
	}
	
	
	
	
	public function maybe_login_user_before_checkout(){
	  #write_log('maybe_login_user_before_checkout');
	  #write_log('is_checkout? '.(is_checkout() ? 'true' : 'false'));
	  #write_log('is_cart()? '.(is_cart() ? 'true' : 'false'));
	  #write_log('is_user_logged_in?'.(is_user_logged_in() ? 'true' : 'false'));
	  
	 // write_log( 'template redirect');
	  
	 // write_log('session?'.( WC()->session->get('edb_user_checkout_as_guest') ? 'true' : 'false' ));
	  if(isset($_REQUEST['guest'])){
	    $requests_guest = $_REQUEST['guest'] == 'yes' ? ( is_user_logged_in() ? false : true ) : false;  
	    WC()->session->set('edb_user_checkout_as_guest', $requests_guest );
	  }
	  
	  if(is_account_page()){
	  
      $return_to_checkout = isset($_REQUEST['return_to']) && $_REQUEST['return_to'] == 'checkout';
      if($return_to_checkout){
        if( is_user_logged_in() || WC()->session->get('edb_user_checkout_as_guest') ){
          // write_log('REDIRECTING: checkout');
          wp_redirect( home_url( '/checkout/' ) );
          exit();
        }
      }
      
	  }

	  if( is_checkout() ){
	    write_log( '- is checkout');
	    write_log( $_REQUEST );
	    if( is_user_logged_in() || WC()->session->get('edb_user_checkout_as_guest') || isset($_REQUEST['pay_for_order']) ){
	     // if(isset($_REQUEST['pay_for_order'])){
	     //   foreach( $_REQUEST as $field => $value ){
	     //     if( preg_match('billing', $field) ){
	     //       WC()->customer->{$field} = $value;
	            
	     //     }
	     //   }
	     // }
	      return;
	    }else{
	      wp_redirect( home_url( '/my-account/?return_to=checkout' ) );  
	      exit();
	    }
	  }
    
    
    
	}
	
	public function get_shipping_delays( $product ){
	  $this->get_decorated_product( $product );
	  $product_id = $product->id;
	  if(empty($product_id)){
	    write_log($product);
	    $product_id = $product->parent->id;
	  }
	  
	  $delays = array(
      'available' => get_post_meta( $product_id, '_edb_available_delay', true ),
      'backorder' => get_post_meta( $product_id, '_edb_backorder_delay', true )
    );
    
	  if(isset($product->variation_id)){
	    
	    $variation_id = $product->variation_id;
	    $available = get_post_meta( $variation_id, '_edb_variation_available_delay', true );
	    $backorder = get_post_meta( $variation_id, '_edb_variation_backorder_delay', true );
	    if(!empty($available)){
	      $delays['available'] = $available;
	    } 
	    if(!empty($backorder)){
        $delays['backorder'] = $backorder;
      } 
      
	  }
	  return $delays;
	}
	
	public function get_product_availability_html( $data, $product ){
	  $this->get_shipping_delays( $product );
	  $is_product_display = !is_cart() && !is_checkout();
	  
	  if( $is_product_display ){
      // $data['availability']	= 
	    return array('availability'=>'n weeks', 'class' => 'in-stock');
	  }else{
	    return array('availability'=>'1 @ n weeks', 'class' => 'in-stock');
	  }
	  return $availability;
	}
	
	public function get_decorated_product( $product ){
	  return new Edb_Product_Decorator( $product );
	}
	
	
	
	
	
	

}
