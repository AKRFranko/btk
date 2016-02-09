<?php

/**
 * The admin-specific functionality of the plugin.
 *
 * @link       http://akr.club
 * @since      1.0.0
 *
 * @package    Edb_Lookbook
 * @subpackage Edb_Lookbook/admin
 */

/**
 * The admin-specific functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Edb_Lookbook
 * @subpackage Edb_Lookbook/admin
 * @author     Franko <franko@akr.club>
 */
class Edb_Lookbook_Admin {

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
		 * defined in Edb_Lookbook_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Lookbook_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */
    
    //$this->version
		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/edb-lookbook-admin.css', array(), time(), 'all' );

	}
	
	
	
	public function add_meta_boxes( $post ){
	  
	  add_meta_box(
        'lookbook-slide',
        __( 'Slides', 'edb' ),
        array( $this, 'lookbook_slide_metabox'),
        'lookbook',
        'normal',
        'core'
    );
    
    add_meta_box(
        'lookbook-slide-meta',
        __( 'Lookbook', 'edb' ),
        array( $this, 'lookbook_slide_meta_metabox'),
        'lookbook_slide',
        'side',
        'core'
    );
    
    
    add_meta_box(
        'lookbook-slide-products',
        __( 'Products', 'edb' ),
        array( $this, 'lookbook_slide_products_metabox'),
        'lookbook_slide',
        'normal',
        'core'
    );
	}
	

	
  public function save_meta_boxes( $post_id ){
    global $post; 
    if(!empty($post) && !empty($post->post_type)){
        if ($post->post_type == 'lookbook'){
             
         
        
          if(!empty($_POST['add_slide'])){
            
            remove_action('save_post', array( $this, 'save_meta_boxes') );
            $slide = array('post_type' => 'lookbook_slide', 'post_parent' => $post_id, 'post_status' => 'publish');
            $slide_id  = wp_insert_post( $slide );
            write_log("NEW slide id: $slide_id");
            add_action('save_post', array( $this, 'save_meta_boxes') );
            
          }
          if(!empty($_POST['delete_slide'])){
            wp_delete_post($_POST['delete_slide'], true );
          }
          
    
        }else if(isset($post->post_type) && $post->post_type == 'lookbook_slide'){
          
          if(!empty($_POST['product_skus'])){
            update_post_meta( $post_id, 'product_skus', $_POST['product_skus'] );
          }
          
        }
    }
   
    
  }
  
  public function lookbook_slide_products_metabox( $post ){
    global $post;
    $skus = implode(',',get_post_meta( $post->ID, 'product_skus'));
    
    echo "<p class=\"product-sku-input\"><label>Product SKUS (coma separated)</label><input type=\"text\" name=\"product_skus\" value=\"$skus\"></p>";
  }
  
  public function lookbook_slide_meta_metabox( $post_id ){
    global $post;
    echo "<a href='".get_edit_post_link($post->post_parent)."'>back to lookbook</a>";
    
  }
  
  public function lookbook_slide_metabox( $post ){
    $children = get_posts(array(
     'post_parent' => $post->ID,
     'orderby'     => 'title', 
     'order'       => 'ASC', 
     'post_type' => 'lookbook_slide',
     'post_status' => 'any',
     'numberposts' => -1
    ));
    
    echo "<p><button id='add_lookbook_slide' type=\"submit\" name=\"add_slide\" value=\"1\">add slide</button></p>";
    // write_log( $children );
    // $this->lookbook_slide_fields( $post );    
    // echo "<hr />";
    foreach($children as $index => $slide ){
      echo "<div class=\"slide-fields\">";
      echo "<div class='slide-image'>";
      $name = empty($slide->post_title) ? "#$index" : $slide->post_title ;
      $thumb = get_the_post_thumbnail( $slide->ID, 'thumb' );
      $edit = get_edit_post_link( $slide->ID );
      echo $thumb;
      echo "</div>";
      echo "<div class='slide-name'>";
      echo "<h1>$name</h1>";
      echo "</div>";
      echo "<div class='slide-actions'>";
      echo "<a href=\"$edit\">edit</a>";
      echo "<button type='submit' name='delete_slide' value='".$slide->ID."'>delete</button>";
      echo "</div>";
      echo "</div>";
    }


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
		 * defined in Edb_Lookbook_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Lookbook_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */
    // wp_enqueue_script('media-upload');
    // wp_enqueue_script('thickbox');
		wp_enqueue_script( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'js/edb-lookbook-admin.js', array( 'jquery' ), $this->version, false );

	}

}
