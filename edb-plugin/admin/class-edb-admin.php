<?php

/**
 * The admin-specific functionality of the plugin.
 *
 * @link       http://akr.club
 * @since      1.0.0
 *
 * @package    Edb
 * @subpackage Edb/admin
 */

/**
 * The admin-specific functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Edb
 * @subpackage Edb/admin
 * @author     Franko <franko@akr.club>
 */
class Edb_Admin {

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
		 * defined in Edb_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/edb-admin.css', array(), $this->version, 'all' );

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
		 * defined in Edb_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Edb_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_script( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'js/edb-admin.js', array( 'jquery' ), $this->version, false );

	}
	
	public function edb_ajax_guess_shipping_zone(){
	  global $Edb_Shipping_Method;
	  if(!empty($_POST['data'])){
	    $answer = $Edb_Shipping_Method->get_zone_from_postal_code( $_POST['data'] );
	    wp_send_json( array( 'postcode' => $_POST['data'], 'zone'=> $answer) );
      
	  }
	  
	 
	}
	
	public function user_settings_fields( $user ){
	  $levels = array('vip','vvip','vvvip','vvvvip');
	  $current_status = absint(get_user_meta($user->ID, '_edb_user_is_designer', true ));
	  $current_level = get_user_meta($user->ID, '_edb_designer_level', true );
	  $options = array();
	  if(empty($current_status)){
	    $current_status = 0;
	  }
	  foreach($levels as $level ){
	    $options[$level] = __($level, 'edb');
	  }
	  ?>
	  <h3>EDB Designer Information</h3>
    <table class="form-table">
      <tr>
        <th><label for="designer-status">Is A Designer?</label></th>
        <td>
          <label for="designer-status-yes">Yes <input type="radio" name="_edb_user_is_designer" id="designer-status-yes" <?php echo $current_status == 1 ? 'checked="checked"' : '' ?> value="1" class="radio" /></label>
          <label for="designer-status-no">No <input type="radio" name="_edb_user_is_designer" id="designer-status-no" <?php echo $current_status == 0 ? 'checked="checked"' : '' ?> value="0" class="radio" /></label>
          <br />
        </td>
      </tr>
      <tr id="designer-fields" style="display:none;">
        <th><label for="designer-level-select">Designer Level</label></th>
        <td>
          <select id="designer-level-select" name="">
            <?php foreach( $options as $key => $value ){ 
              $checked = !empty($current_level) && $current_level == $key ? ' selected="selected" ' : '';
              $key  = esc_attr( $key );
              $value = esc_attr( $value );
              echo "<option value='$key' $checked>$value</option>";
            }; ?>
          </select>
          <input type="hidden" value="<?php echo $current_level ?>" name="_edb_designer_level" />
        </td>
      </tr>
    </table>
	  <?php
	}
	
	public function save_user_settings_fields( $user_id ){
	  if( !current_user_can('edit_user', $user_id ) ){
	    return false;
	  }
	  $is_designer = isset($_POST['_edb_user_is_designer']) && !empty($_POST['_edb_user_is_designer']) ? $_POST['_edb_user_is_designer'] : 0;
	  $designer_level = isset($_POST['_edb_designer_level']) && !empty($_POST['_edb_designer_level']) ? $_POST['_edb_designer_level'] : null;
	  update_user_meta( absint($user_id), '_edb_user_is_designer', $is_designer );
	  if(!is_null($designer_level)){
	    update_user_meta( absint($user_id), '_edb_designer_level', $designer_level );
	  }
	}
	
  
	public function product_settings_fields( ){
	  global $post;
	  $edb_available_delay = get_post_meta( $post->ID, '_edb_available_delay', true );
    $edb_backorder_delay = get_post_meta( $post->ID, '_edb_backorder_delay', true );
    $edb_introduction_video = get_post_meta( $post->ID, '_edb_introduction_video', true );
    $edb_instruction_video = get_post_meta( $post->ID, '_edb_instruction_video', true );
    
    $attachment_images = get_attached_media( 'image', $post->ID );
    $image_options = array();
    
    foreach( $attachment_images as $image){
      $image_options[$image->ID] = wp_get_attachment_image_src($image->ID, 'thumb');
    }
    echo "<p><b>EDB Shipping Delays</b></p>";
    woocommerce_wp_text_input(
     array(
       'id' => '_edb_available_delay' ,
       'label' => __('Min shipping delay when item is <b>in stock</b>', 'edb'),
       'desc_tip' => true,
       'description' => __('ex: +7 days', 'edb'),
       'placeholder' => '+7 days',
       'value' => isset( $edb_available_delay ) && !empty( $edb_available_delay ) ? $edb_available_delay : '+7 days'
       )
    );
    woocommerce_wp_text_input(
     array(
       'id' => '_edb_backorder_delay' ,
       'label' => __('Min shipping delay when item is <b>backorder</b>', 'edb'),
       'desc_tip' => true,
       'description' => __('ex: +14 days', 'edb'),
       'placeholder' => '+14 days',
       'value' => isset( $edb_backorder_delay ) && !empty( $edb_backorder_delay ) ? $edb_backorder_delay : '+14 days'
       )
    );
    echo "<hr><p><b>EDB Related Media</b></p>";
    woocommerce_wp_image_select(
     array(
       'id' => '_edb_technical_image' ,
       'label' => __('Image to use as technical detail.', 'edb'),
       'value' => null,
       'options' => $image_options
     )
    );
    woocommerce_wp_text_input(
     array(
       'id' => '_edb_introduction_video' ,
       'label' => __('ID of youtube video for product introduction', 'edb'),
       'desc_tip' => true,
       'value' => isset( $edb_introduction_video ) && !empty( $edb_introduction_video ) ? $edb_introduction_video : null
       )
    );
    woocommerce_wp_text_input(
     array(
       'id' => '_edb_instruction_video' ,
       'label' => __('ID of youtube video for product introduction', 'edb'),
       'desc_tip' => true,
       'value' => isset( $edb_instruction_video ) && !empty( $edb_instruction_video ) ? $edb_instruction_video : null
       )
    );
    echo "<hr>" ;
	}
	
	public function variation_settings_fields($loop, $variation_data, $variation){
	  global $post;
	  
	  $default_available_delay = get_post_meta( $post->ID, '_edb_available_delay', true );
    $default_backorder_delay = get_post_meta( $post->ID, '_edb_backorder_delay', true );
	  $edb_available_delay = get_post_meta( $variation->ID, '_edb_variation_available_delay', true );
    $edb_backorder_delay = get_post_meta( $variation->ID, '_edb_variation_backorder_delay', true );
    echo "<hr><p><b>EDB Shipping Delays</b> <small>(overrides product settings at variation level)</small></p>";
    woocommerce_wp_hidden_input(
      array(
        'id' => '_edb_variation_product_id',
        'value'=> $post->ID
      )
    );
    
	  woocommerce_wp_text_input(
	    array(
	      'id' => '_edb_variation_available_delay' ,
	      'label' => __('Min shipping delay when item is <b>in stock</b>', 'edb'),
	      'desc_tip' => true,
	      'description' => __('ex: +7 days', 'edb'),
	      'placeholder' => '+7 days',
	      
	      'value' => isset( $edb_available_delay ) && !empty( $edb_available_delay ) ? $edb_available_delay : $default_available_delay 
	      )
	   );
	   
	   
	   woocommerce_wp_text_input(
      array(
        'id' => '_edb_variation_backorder_delay' ,
        'label' => __('Min shipping delay  when item is <b>backorder</b>', 'edb'),
        'desc_tip' => true,
        'description' => __('ex: +14 days', 'edb'),
        'placeholder' => '+14 days',
        'value' => isset( $edb_backorder_delay ) && !empty( $edb_backorder_delay ) ? $edb_backorder_delay : $default_backorder_delay
        )
     );
	}
	
	public function is_valid_delay_string( $string ){
	  $date = date_parse( $string );
	  $valid = $date['error_count'] == 0; //(  && checkdate($date["month"], $date["day"], $date["year"]) ) ? true : false;
	  return $valid;
	}
	
	public function save_product_settings_fields( $post_id ){
	 
	  $edb_available_delay = (isset( $_POST['_edb_available_delay'] ) && !empty($_POST['_edb_available_delay'])) ? $_POST['_edb_available_delay'] : '+7 days';
    $edb_backorder_delay = (isset( $_POST['_edb_backorder_delay'] ) && !empty($_POST['_edb_backorder_delay'])) ? $_POST['_edb_backorder_delay'] : '+14 days';
    $edb_technical_image = (isset($_POST['_edb_technical_image']) && !empty($_POST['_edb_technical_image'])) ? $_POST['_edb_technical_image'] : null;
    
    $edb_introduction_video = (isset($_POST['_edb_introduction_video']) && !empty($_POST['_edb_introduction_video'])) ? $_POST['_edb_introduction_video'] : null;
    $edb_instruction_video = (isset($_POST['_edb_instruction_video']) && !empty($_POST['_edb_instruction_video'])) ? $_POST['_edb_instruction_video'] : null;
    
    $technical_image = wp_get_attachment_image_src($edb_technical_image, 'thumb');
    
    if($this->is_valid_delay_string( $edb_available_delay  )){
      update_post_meta( $post_id, '_edb_available_delay', esc_attr( $edb_available_delay ) );
    }
    
    if($this->is_valid_delay_string( $edb_backorder_delay  )){
      update_post_meta( $post_id, '_edb_backorder_delay', esc_attr( $edb_backorder_delay ) );
    }
    
    if(!empty($technical_image)){
      update_post_meta( $post_id, '_edb_technical_image', esc_attr( $edb_technical_image )  );
    }
    
    if(!empty($edb_introduction_video)){
      update_post_meta( $post_id, '_edb_introduction_video', esc_attr( $edb_introduction_video ));
    }
    if(!empty($edb_instruction_video)){
      update_post_meta( $post_id, '_edb_instruction_video', esc_attr( $edb_instruction_video ));
    }
    
	}
	
	
	public function save_variation_settings_fields( $post_id){
	  $variation_product_id = $_POST['_edb_variation_product_id'];
	  $default_available_delay = get_post_meta( $variation_product_id, '_edb_available_delay', true );
    $default_backorder_delay = get_post_meta( $variation_product_id, '_edb_backorder_delay', true );
	  $edb_available_delay = (isset( $_POST['_edb_variation_available_delay'] ) && !empty($_POST['_edb_variation_available_delay'])) ? $_POST['_edb_variation_available_delay'] : $default_available_delay;
	  $edb_backorder_delay = (isset( $_POST['_edb_variation_backorder_delay'] ) && !empty($_POST['_edb_variation_backorder_delay'])) ? $_POST['_edb_variation_backorder_delay'] : $default_backorder_delay;
	 
	  if($this->is_valid_delay_string( $edb_available_delay  )){
      update_post_meta( $post_id, '_edb_variation_available_delay', esc_attr( $edb_available_delay ) );
    }
    if($this->is_valid_delay_string( $edb_backorder_delay  )){
      
      update_post_meta( $post_id, '_edb_variation_backorder_delay', esc_attr( $edb_backorder_delay ) );
    }
	}
	
	public function get_all_possible_materials(){
    global $wpdb;
    $results = $wpdb->get_results( "SELECT DISTINCT `meta_value` FROM ".$wpdb->prefix."postmeta WHERE wp_postmeta.meta_key = 'attribute_edb_material';");
    return wp_list_pluck($results, 'meta_value');
	}
	
	public function material_post_material_selector(){
	 global $post;
	 $edb_materials = $this->get_all_possible_materials();
	 $material_options = array();
	 foreach( $edb_materials as $material_id ){
	   $material_options[$material_id] = __($material_id,'edb');
	 }
	 $selected_material = get_post_meta( $post->ID, '_edb_material' , true);
	 
	 woocommerce_wp_select(
	   array(
	     'id' => '_edb_material',
	     'label'=> __('Material ID'),
	     'options' => $material_options,
	     'value' => $selected_material
	   )
	 );
	 
	 
	}
	
	public function save_material_meta_boxes( $post_id, $post ){
    
	  if(isset($_POST['_edb_material']) && $post->post_type == 'edb_material_desc'){
	    $edb_material = esc_attr($_POST['_edb_material']);
	    $args = array(
          'meta_key' => '_edb_material',
          'meta_value' => $edb_material,
          'post_type' => 'edb_material_desc',
          'post_status' => 'any',
          'posts_per_page' => 1
      );
      $posts = get_posts($args);
      if(count($posts) == 0){
        update_post_meta( $post_id, '_edb_material', $_POST['_edb_material'] );  
      }else{
        update_post_meta( $post_id, '_edb_material_duplicate', $posts[0]->ID );
      }
	  }

	}
	
	
	public function ignore_duplicate_material_description( $post_id, $post , $update ){
	  $duplicate = get_post_meta($post_id, '_edb_material_duplicate', true);
	  if(!empty($duplicate)){
      wp_delete_post( $post_id, true );
	    exit;
	  }
	  
	}
	
  public function add_material_meta_boxes(){
    add_meta_box('edb_material_reference','Material', array( $this, 'material_post_material_selector' ), 'edb_material_desc', 'normal', 'high');
  }
	
	public function register_custom_post_types(){
	  
	  // set up labels
    $labels = array(
       'name' => 'Material Descriptions',
        'singular_name' => 'Material Description',
        'add_new' => 'Add New Material Description',
        'add_new_item' => 'Add New Material Description',
        'edit_item' => 'Edit Material Description',
        'new_item' => 'New Material Description',
        'all_items' => 'All Material Descriptions',
        'view_item' => 'View Material Description',
        'search_items' => 'Search Material Descriptions',
        'not_found' =>  'No Material Descriptions Found',
        'not_found_in_trash' => 'No Material Descriptions found in Trash', 
        'parent_item_colon' => '',
        'menu_name' => 'Material Descriptions',
      );
      //register post type
    register_post_type( 'edb_material_desc', array(
      'labels' => $labels,
      'has_archive' => true,
       'public' => true,
      'supports' => array( 'title',  'thumbnail','page-attributes' ),
      'exclude_from_search' => true,
      'capability_type' => 'post',
      'rewrite' => array( 'slug' => 'materials' ),
      )
    );
	}
	

}