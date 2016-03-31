<?php

/**
 * The admin-specific functionality of the plugin.
 *
 * @link       https://elementdebase.com
 * @since      1.0.0
 *
 * @package    Edb_Order_Tool
 * @subpackage Edb_Order_Tool/admin
 */

/**
 * The admin-specific functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Edb_Order_Tool
 * @subpackage Edb_Order_Tool/admin
 * @author     Franko <developer@elementdebase.com>
 */
class Edb_Order_Tool_Admin {

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
	 * @param      string    $plugin_name       The name of this plugin.
	 * @param      string    $version    The version of this plugin.
	 */
	public function __construct( $plugin_name, $version ) {

		$this->plugin_name = $plugin_name;
		$this->version = $version;

	}

	/**
	 * Register the stylesheets for the admin area.
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

		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/edb-order-tool-admin.css', array(), $this->version, 'all' );

	}

	/**
	 * Register the JavaScript for the admin area.
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

		wp_enqueue_script( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'js/edb-order-tool-admin.js', array( 'jquery' ), $this->version, false );
	

	}
	
	
// 	public function handle_ajax(){
// 	 write_log( $_REQUESST ); 
// 	 echo json_encode(array('YUP'));
// 	 exit();
// 	}
	
	public function product_query(){
	  $sql = "SELECT p.*,
    GROUP_CONCAT(pm.meta_key ORDER BY pm.meta_key DESC SEPARATOR '||') as meta_keys, 
    GROUP_CONCAT(pm.meta_value ORDER BY pm.meta_key DESC SEPARATOR '||') as meta_values,
    GROUP_CONCAT(x.taxonomy SEPARATOR '||') as term_taxnonomies, 
    GROUP_CONCAT(t.name  SEPARATOR '||') as term_values
    FROM wp_posts AS p 
    LEFT JOIN wp_postmeta pm on pm.post_id = p.ID
    LEFT JOIN wp_term_relationships AS tr ON(tr.object_id = p.ID)
    LEFT JOIN wp_term_taxonomy AS x ON(x.term_taxonomy_id = tr.term_taxonomy_id)
    LEFT JOIN wp_terms AS t ON(t.term_id = x.term_id)
    WHERE p.post_type = 'product' and p.post_status = 'publish'
    GROUP BY p.ID";
	  $wpdb->get_results( $sql );
	}

}
