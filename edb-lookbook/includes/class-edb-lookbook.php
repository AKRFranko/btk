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
 * @package    Edb_Lookbook
 * @subpackage Edb_Lookbook/includes
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
 * @package    Edb_Lookbook
 * @subpackage Edb_Lookbook/includes
 * @author     Franko <franko@akr.club>
 */
class Edb_Lookbook {

	/**
	 * The loader that's responsible for maintaining and registering all hooks that power
	 * the plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      Edb_Lookbook_Loader    $loader    Maintains and registers all hooks for the plugin.
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

		$this->plugin_name = 'edb-lookbook';
		$this->version = '1.0.0';

		$this->load_dependencies();
		$this->set_locale();
		$this->define_admin_hooks();
		$this->define_public_hooks();

	}

	/**
	 * Load the required dependencies for this plugin.
	 *
	 * Include the following files that make up the plugin:
	 *
	 * - Edb_Lookbook_Loader. Orchestrates the hooks of the plugin.
	 * - Edb_Lookbook_i18n. Defines internationalization functionality.
	 * - Edb_Lookbook_Admin. Defines all hooks for the admin area.
	 * - Edb_Lookbook_Public. Defines all hooks for the public side of the site.
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
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-lookbook-loader.php';

		/**
		 * The class responsible for defining internationalization functionality
		 * of the plugin.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-edb-lookbook-i18n.php';

		/**
		 * The class responsible for defining all actions that occur in the admin area.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'admin/class-edb-lookbook-admin.php';

		/**
		 * The class responsible for defining all actions that occur in the public-facing
		 * side of the site.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'public/class-edb-lookbook-public.php';

		$this->loader = new Edb_Lookbook_Loader();

	}

	/**
	 * Define the locale for this plugin for internationalization.
	 *
	 * Uses the Edb_Lookbook_i18n class in order to set the domain and to register the hook
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function set_locale() {

		$plugin_i18n = new Edb_Lookbook_i18n();

		$this->loader->add_action( 'plugins_loaded', $plugin_i18n, 'load_plugin_textdomain' );
    $this->loader->add_action( 'init', $this, 'register_post_type');
	}

	/**
	 * Register all of the hooks related to the admin area functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_admin_hooks() {

		$plugin_admin = new Edb_Lookbook_Admin( $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_action( 'admin_enqueue_scripts', $plugin_admin, 'enqueue_styles' );
		$this->loader->add_action( 'admin_enqueue_scripts', $plugin_admin, 'enqueue_scripts' );
		$this->loader->add_action( 'add_meta_boxes', $plugin_admin, 'add_meta_boxes' );
		$this->loader->add_action( 'save_post', $plugin_admin, 'save_meta_boxes' );

	}

	/**
	 * Register all of the hooks related to the public-facing functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_public_hooks() {

		$plugin_public = new Edb_Lookbook_Public( $this->get_plugin_name(), $this->get_version() );

		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_styles' );
		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_scripts' );

	}
	
	// Register Custom Post Type
  public function register_post_type() {
  
    $labels = array(
      'name'                  => _x( 'lookbooks', 'Post Type General Name', 'edb' ),
      'singular_name'         => _x( 'lookbook', 'Post Type Singular Name', 'edb' ),
      'menu_name'             => __( 'Lookbooks', 'edb' ),
      'name_admin_bar'        => __( 'Lookbooks', 'edb' ),
      'archives'              => __( 'Lookbook Archives', 'edb' ),
      'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
      'all_items'             => __( 'All Items', 'edb' ),
      'add_new_item'          => __( 'Add New Item', 'edb' ),
      'add_new'               => __( 'Add New', 'edb' ),
      'new_item'              => __( 'New Item', 'edb' ),
      'edit_item'             => __( 'Edit Item', 'edb' ),
      'update_item'           => __( 'Update Item', 'edb' ),
      'view_item'             => __( 'View Item', 'edb' ),
      'search_items'          => __( 'Search Item', 'edb' ),
      'not_found'             => __( 'Not found', 'edb' ),
      'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
      'featured_image'        => __( 'Featured Image', 'edb' ),
      'set_featured_image'    => __( 'Set featured image', 'edb' ),
      'remove_featured_image' => __( 'Remove featured image', 'edb' ),
      'use_featured_image'    => __( 'Use as featured image', 'edb' ),
      'insert_into_item'      => __( 'Insert into item', 'edb' ),
      'uploaded_to_this_item' => __( 'Uploaded to this item', 'edb' ),
      'items_list'            => __( 'Items list', 'edb' ),
      'items_list_navigation' => __( 'Items list navigation', 'edb' ),
      'filter_items_list'     => __( 'Filter items list', 'edb' ),
    );
    $args = array(
      'label'                 => __( 'lookbook', 'edb' ),
      'description'           => __( 'lookbook', 'edb' ),
      'labels'                => $labels,
      'supports'              => array( 'title',  'excerpt', 'thumbnail', 'page-attributes' ),
      'taxonomies'            => array( 'category', 'post_tag' ),
      'hierarchical'          => true,
      'public'                => true,
      'show_ui'               => true,
      'show_in_menu'          => true,
      'menu_position'         => 5,
      'show_in_admin_bar'     => true,
      'show_in_nav_menus'     => true,
      'can_export'            => true,
      'has_archive'           => true,    
      'exclude_from_search'   => true,
      'publicly_queryable'    => true,
      'capability_type'       => 'page',
    );
    register_post_type( 'lookbook', $args );
    $labels = array(
      'name'                  => _x( 'lookbook_slide', 'Post Type General Name', 'edb' ),
      'singular_name'         => _x( 'lookbook slide', 'Post Type Singular Name', 'edb' ),
      'edit_item'             => __( 'Edit Slide', 'edb' ),
    );
    $args = array(
      'label'                 => __( 'lookbook-slide', 'edb' ),
      'description'           => __( 'lookbook-slide', 'edb' ),
      'labels'                => $labels,
      'supports'              => array( 'title', 'excerpt', 'thumbnail' ),
      'hierarchical'          => false,
      'public'                => false,
      'show_ui'               => false,
      'show_in_menu'          => false,
      'menu_position'         => 5,
      'show_in_admin_bar'     => false,
      'show_in_nav_menus'     => false,
      'can_export'            => true,
      'has_archive'           => false,    
      'exclude_from_search'   => true,
      'publicly_queryable'    => true,
      'capability_type'       => 'page',
      'capabilities' => array(
        'create_posts' => false, // Removes support for the "Add New" function ( use 'do_not_allow' instead of false for multisite set ups )
      ),
      'map_meta_cap' => true
    );
    register_post_type( 'lookbook_slide', $args );
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
	 * @return    Edb_Lookbook_Loader    Orchestrates the hooks of the plugin.
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
