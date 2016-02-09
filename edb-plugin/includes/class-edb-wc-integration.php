<?php
/**
 * Integration Demo Integration.
 *
 * @package  WC_EDB
 * @category Integration
 * @author   WooThemes
 */

if ( ! class_exists( 'Edb_Wc_Integration' ) ) :



class Edb_Wc_Integration extends WC_Integration {

  /**
   * Init and hook in the integration.
   */
  public function __construct(  ) {
    global $woocommerce;
    
    $this->id                 = 'wc-edb';
    $this->method_title       = __( 'EDB Integration', 'wc-edb' );
    $this->method_description = __( 'An integratino demo to show you how easy it is to extend WooCommerce.', 'wc-edb' );

    // Load the settings.
    $this->init_form_fields();
    $this->init_settings();

    // Define user set variables.
    $this->api_key          = $this->get_option( 'api_key' );
    $this->debug            = $this->get_option( 'debug' );

    // Actions.
    add_action( 'woocommerce_update_options_integration_' .  $this->id, array( $this, 'process_admin_options' ) );

    // Filters.
    add_filter( 'woocommerce_settings_api_sanitized_fields_' . $this->id, array( $this, 'sanitize_settings' ) );
    
    
    // add_action( 'wp_enqueue_scripts', array( $this, 'custom_cart_script') );
    
    
    
    
    // add_action('woocommerce_checkout_process', array( $this, 'process_checkout') );
    
    // add_action( 'wp_ajax_nopriv_update_cart_item_quantities', array($this, 'update_cart_item_quantities'));
    // add_action( 'wp_ajax_post_update_cart_item_quantities', array($this, 'update_cart_item_quantities'));
    // add_action('woocommerce_before_cart_contents', array($this,'before_cart_contents'));
    // add_action('woocommerce_cart_updated', array($this,'cart_updated') );
    
    // add_filter( 'woocommerce_checkout_fields' , array( $this, 'custom_override_checkout_fields' ));
    
    

  }
  
  
  public function custom_override_checkout_fields( $fields ) {
  
      // $fields['shipping']['custom_field'] = array(
      //     'label' => 'Custom field',
      //     'required' => 1,
      //     'class' => array ('address-field', 'update_totals_on_change' )
      // );
  
      // return $fields;
  } 
 
  
  
  // public function process_checkout(){
    
  //   if( !$_POST['current_panel'] || $_POST['current_panel'] !== '#place-order-panel'){
  //     wc_add_notice( __('Please Review You Order '), 'error' );
  //   }
  // }

  // }
  // public function before_cart_contents(){
  //   wp_nonce_field('edb_cart_update','edb_cart_update');
  // }
  
  // public function update_cart_item_quantities(){
  //     write_log('update_cart_item_quantities');
  //     var_dump('YAIA!');
  // }
  
  public function custom_cart_script() {
            // wp_dequeue_script( 'wc-cart' );
            
          #  $plugin_dir = plugins_url().'/woocommerce-edb';
            
           # wp_enqueue_script( 'wc-cart-new', $plugin_dir . '/assets/js/cart.js', array( 'jquery' ) );
          #  wp_localize_script( 'wc-cart-new','edb_cart_ajax', array(
           #   'ajax_url' => admin_url('admin-ajax.php')));
            
               
         }


  /**
   * Initialize integration settings form fields.
   *
   * @return void
   */
   
  public function init_form_fields() {
    
    $form_fields = array();
    
    $shipping_classes  = array('furniture', 'accessories');
    foreach($shipping_classes as $shipping_class ){
      $form_fields[$shipping_class] = array(
          'title' => "$shipping_class minimum",
          'type' => 'text',
          'description' => 'minimum amount for shipping calculations',
          'default'=> 0
      );
    }
    $this->form_fields = $form_fields;
   
  }


  /**
   * Generate Button HTML.
   */
  public function generate_button_html( $key, $data ) {
    $field    = $this->plugin_id . $this->id . '_' . $key;
    $defaults = array(
      'class'             => 'button-secondary',
      'css'               => '',
      'custom_attributes' => array(),
      'desc_tip'          => false,
      'description'       => '',
      'title'             => '',
    );

    $data = wp_parse_args( $data, $defaults );

    ob_start();
    ?>
    <tr valign="top">
      <th scope="row" class="titledesc">
        <label for="<?php echo esc_attr( $field ); ?>"><?php echo wp_kses_post( $data['title'] ); ?></label>
        <?php echo $this->get_tooltip_html( $data ); ?>
      </th>
      <td class="forminp">
        <fieldset>
          <legend class="screen-reader-text"><span><?php echo wp_kses_post( $data['title'] ); ?></span></legend>
          <button class="<?php echo esc_attr( $data['class'] ); ?>" type="button" name="<?php echo esc_attr( $field ); ?>" id="<?php echo esc_attr( $field ); ?>" style="<?php echo esc_attr( $data['css'] ); ?>" <?php echo $this->get_custom_attribute_html( $data ); ?>><?php echo wp_kses_post( $data['title'] ); ?></button>
          <?php echo $this->get_description_html( $data ); ?>
        </fieldset>
      </td>
    </tr>
    <?php
    return ob_get_clean();
  }


  /**
   * Santize our settings
   * @see process_admin_options()
   */
  public function sanitize_settings( $settings ) {
    
    
    return $settings;
  }



  /**
   * Display errors by overriding the display_errors() method
   * @see display_errors()
   */
  public function display_errors( ) {

    // loop through each error and display it
    foreach ( $this->errors as $key => $value ) {
      ?>
      <div class="error">
        <p><?php _e( 'Looks like you made a mistake with the ' . $value . ' field. Make sure it isn&apos;t longer than 20 characters', 'woocommerce-integration-demo' ); ?></p>
      </div>
      <?php
    }
  }


}

endif;