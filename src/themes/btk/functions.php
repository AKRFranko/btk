<?php
/**
 * buteek functions and definitions
 *
 * @package buteek
 */

/**
 * Session Support Hooks
 */

function btk_session_start() {
	if (!session_id()) {
		session_start();
	}
}

function btk_session_end() {
	session_destroy();
}

add_action('init', 'btk_session_start', 1);
add_action('wp_logout', 'btk_session_end');
add_action('wp_login', 'btk_session_end');


function btk_time_elapsed($ptime) {
    $etime = $ptime - time();

    if ($etime < 1) {
        return '0 seconds';
    }

    $a = array(12 * 30 * 24 * 60 * 60 => 'year',
        30 * 24 * 60 * 60 => 'month',
        24 * 60 * 60 * 7 => 'week',
        24 * 60 * 60 => 'day',
        60 * 60 => 'hour',
        60 => 'min',
        1 => 'sec'
    );

    foreach ($a as $secs => $text) {
        $d = $etime / $secs;
        if ($d >= 1) {
            $r = round($d);
            return $r . ' ' . $text . ($r > 1 ? 's' : '');
        }
    }
}
/**
 * This theme supports woocommerce (and voila! one less anoying admin notification box!)
 */
function woocommerce_support() {
    add_theme_support( 'woocommerce' );
}
add_action( 'after_setup_theme', 'woocommerce_support' );

function get_ID_by_page_name($page_name) {
   global $wpdb;
   $page_name_id = $wpdb->get_var("SELECT ID FROM $wpdb->posts WHERE post_name = '".$page_name."' AND post_type = 'page'");
   return $page_name_id;
}

function btk_get_product_by_sku( $sku ) {

  global $wpdb;



  $product_id = $wpdb->get_var( $wpdb->prepare( "SELECT post_id FROM $wpdb->postmeta WHERE meta_key='_sku' AND meta_value='%s' LIMIT 1", $sku ) );

  if ( $product_id ) return new WC_Product( $product_id );

  return null;

}

/**
 * Synchronize Browser Storage Values With Session Values. (using basil.js in front-end)
 */

function synchronize_browser_storage() {
	if ($_REQUEST['action'] !== 'synchronize_browser_storage') {
		return;
	}

	$utimestamp = microtime(true);
	$timestamp = floor($utimestamp);
	$milliseconds = round(($utimestamp - $timestamp) * 1000000);
	if (!isset($_SESSION['edb-browser-storage'])) {
		$local = json_encode(
			array(
				'lang' => array('time' => $milliseconds, 'value' => null),
				'splash' => array('time' => $milliseconds, 'value' => false),
			)
		);
		$_SESSION['edb-browser-storage'] = $local;
	} else {
		$local = $_SESSION['edb-browser-storage'];
	}
	if (!isset($_REQUEST['edb-browser-storage'])) {
		$response = $local;
	} else {
		$browser = json_decode($_REQUEST['edb-browser-storage']);
		$response = array();
		foreach ($browser as $key => $data) {
			$loc = $local[$key];
			if ($data['time'] > $loc['time']) {
				$response[$key] = $data;
			} else {
				$response[$key] = $loc[$key];
			}
		}
	}
	header('Content-Type: application/json');
	echo json_encode($response);
	wp_die();
}

add_action('wp_ajax_synchronize_browser_storage', 'synchronize_browser_storage');
add_action('wp_ajax_nopriv_synchronize_browser_storage', 'synchronize_browser_storage');

/**
 * Provide Images Marked For Splash Page as Array
 */
function provide_splash_images() {
	global $wpdb;
	if ($_REQUEST['action'] !== 'provide_splash_images') {
		return;
	}

	$response = array();
	if (isset($_REQUEST['edb-splash-images'])) {
		$the_slug = 'splash_page';
		$args = array(
			'name' => $the_slug,
			'post_type' => 'post',
			'post_status' => 'any',
			'numberposts' => 1,
		);
		$posts = get_posts($args);
		if ($posts) {
			$splash_post_id = $posts[0]->ID;
			$images = get_attached_media('image', $splash_post_id);
			foreach ($images as $image) {
			  $imageSource = wp_get_attachment_image_src($image->ID, 'full')[0];
			  if(is_ssl()){
			    $imageSource = preg_replace( "/^http:/", "https:", $imageSource );  
			  }
				array_push($response, $imageSource);
			}
		}
	}
	header('Content-Type: application/json');
	echo json_encode($response);
	wp_die();
}

add_action('wp_ajax_provide_splash_images', 'provide_splash_images');
add_action('wp_ajax_nopriv_provide_splash_images', 'provide_splash_images');

/**
 * Set the content width based on the theme's design and stylesheet.
 */
if (!isset($content_width)) {
	$content_width = 640; /* pixels */
}

if (!function_exists('btk_setup')):
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
	function btk_setup() {

		/*
		 * Make theme available for translation.
		 * Translations can be filed in the /languages/ directory.
		 * If you're building a theme based on buteek, use a find and replace
		 * to change 'btk' to the name of your theme in all the template files
		 */
		load_theme_textdomain('btk', get_template_directory() . '/languages');

		// Add default posts and comments RSS feed links to head.
		add_theme_support('automatic-feed-links');

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		add_theme_support('title-tag');

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
		 */
		//add_theme_support( 'post-thumbnails' );

		// This theme uses wp_nav_menu() in one location.
		register_nav_menus(array(
			'primary' => __('Primary Menu', 'btk'),
		));

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support('html5', array(
			'search-form', 'comment-form', 'comment-list', 'gallery', 'caption',
		));

		/*
		 * Enable support for Post Formats.
		 * See http://codex.wordpress.org/Post_Formats
		 */
		add_theme_support('post-formats', array(
			'aside', 'image', 'video', 'quote', 'link',
		));

		// Set up the WordPress core custom background feature.
		add_theme_support('custom-background', apply_filters('btk_custom_background_args', array(
			'default-color' => 'ffffff',
			'default-image' => '',
		)));

		add_theme_support('woocommerce');
	}
endif; // btk_setup
add_action('after_setup_theme', 'btk_setup');

/**
 * Register widget area.
 *
 * @link http://codex.wordpress.org/Function_Reference/register_sidebar
 */
function btk_widgets_init() {
	register_sidebar(array(
		'name' => __('Sidebar', 'btk'),
		'id' => 'sidebar-1',
		'description' => '',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget' => '</aside>',
		'before_title' => '<h1 class="widget-title">',
		'after_title' => '</h1>',
	));
	register_sidebar(array(
		'name' => __('Product Foot Content', 'btk'),
		'id' => 'product-foot',
		'description' => '',
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget' => '</aside>',
		'before_title' => '<h1 class="widget-title">',
		'after_title' => '</h1>',
	));
}
add_action('widgets_init', 'btk_widgets_init');

/**
 * Enqueue scripts and styles.
 */
function btk_scripts() {
	wp_enqueue_style('btk-bower-style', get_stylesheet_directory_uri() . '/css/_bower.css');
	wp_enqueue_style('btk-style', get_stylesheet_uri());

	if (defined('WP_ENV') && defined('WP_ENV') === 'production') {
		wp_enqueue_script('btk-all', get_template_directory_uri() . '/js/_all.min.js', array(), time(), true);
	} else {
		wp_enqueue_script('btk-bower', get_template_directory_uri() . '/js/_bower.js', array(), time(), true);
		wp_enqueue_script('btk-btk', get_template_directory_uri() . '/js/_btk.js', array(), time(), true);
	}

	if (is_singular() && comments_open() && get_option('thread_comments')) {
		wp_enqueue_script('comment-reply');
	}

	wp_localize_script('btk-btk', 'btk_ajax', array('ajax_url' => admin_url('admin-ajax.php')));
}
add_action('wp_enqueue_scripts', 'btk_scripts');

/**
 * Add page slug on body class
 */
function add_slug_body_class($classes) {
	global $post;
	if (isset($post)) {
		$classes[] = $post->post_type . '-' . $post->post_name;
	}
	return $classes;
}
add_filter('body_class', 'add_slug_body_class');
add_filter('show_admin_bar', '__return_false');

add_filter('woocommerce_review_order_before_submit', 'needs_payment_now');
function needs_payment_now( $order ){
  write_log($order);
  return $order;
}
// function additional_validation($fields){
//     // bypass all error returned
//     $fields['payment_method'] = null;
//     write_log( $fields );
//     // wc_clear_notices();
//     return $fields;
// }

/**
 * Redirect if not logged in on checkout page
 */
function woo_redirect() {
  write_log( json_encode(array(
      'logged_in?'=> is_user_logged_in(),
      'is_checkout?'=> is_checkout(),
      'is_cart?='=> is_cart(),
      '!$_REQUEST[guest]'=>!$_REQUEST['guest'],
    )) 
    );
  // if( is_cart() ){
  //   if(!is_user_logged_in() && !$_REQUEST['guest'] ){
  //     wp_redirect(home_url() . '/my-account');
  //   }
  // }
  if( is_checkout() ){
    if(!is_user_logged_in() && !$_REQUEST['guest'] ){
      wp_redirect(home_url() . '/my-account');
    }
    
  }
  
  
  
//   if (!is_user_logged_in() && is_checkout() && !$_REQUEST['guest']) {
// 	  $_SESSION['redirect_to'] = 'checkout';
// 		wp_redirect(home_url() . '/my-account');
// 		exit;
// 	}else if($_REQUEST['guest']){
// 	 /// $_SESSION['redirect_to'] = null;  
// 	}
// 	if(is_user_logged_in() && is_account_page()){
// 	    $_SESSION['redirect_to'] = null;  
// 	};
// 	if( $_REQUEST['guest'] ){
// 	  $_SESSION['edb_guest_checkout']=true;
// 	}
// 	if( isset($_GET['step']) ){
// 	  $step = $_GET['step'];
// 	  $guest = $_REQUEST['guest'];
// 	  $isGuest =  $guest == 'true' ? true : false;
	  
// 	  if( $isGuest ){
// 	    if( $step == 'shipping'){
// 	      wp_redirect( home_url('/') . "checkout?guest=$guest&step=delivery");
// 	    }else if( $step == '')
// 	  }
// 	}
	
}
add_action('template_redirect', 'woo_redirect');

function add_featured_image_body_class( $classes ) {    
global $post;
    if ( isset ( $post->ID ) && get_the_post_thumbnail($post->ID)) {
          $classes[] = 'has-featured-image';
 }
          return $classes;
}
add_filter( 'body_class', 'add_featured_image_body_class' );

function btk_material_name( $number ){
  $names = array(
    '001' => 'color1',
    '002' => 'color2',
    '003' => 'color3',
    '004' => 'color4',
    '005' => 'color5',
    '006' => 'color6',
    '007' => 'color7',
    '008' => 'color8',
    '009' => 'color9',
    '010' => 'color10',
    '011' => 'color11',
    '012' => 'color12'
  );
  return $names[$number];
}

add_filter('add_to_cart_fragments', 'woocommerce_header_add_to_cart_fragment');

function woocommerce_header_add_to_cart_fragment( $fragments ) {
  global $woocommerce;

  ob_start();

  ?>
  <span id="cart-item-counter" class="semi-bold"><?php echo $woocommerce->cart->cart_contents_count; ?></span>
  <?php

  $fragments['span#cart-item-counter'] = ob_get_clean();

  return $fragments;

}

add_filter('woocommerce_update_order_review_fragments', 'btk_update_order_review_cart_items');

function btk_update_order_review_cart_items( $fragments ) {
  global $woocommerce;

  ob_start();

  ?><div class="cart-contents"><?php
  wc_get_template( 'cart/cart-delivery-contents.php' ); 
  ?></div><?php
  

  $fragments['div#delivery-pane .cart-contents'] = ob_get_clean();

  return $fragments;

}
add_filter( 'woocommerce_add_error', function( $message ) {
    
    return strip_tags($message);
});
// function btk_split_products_by_availability( $data ){
//   echo json_encode($data);
//   return $data;
  
// }
// add_filter('woocommerce_cart_shipping_packages', 'btk_split_products_by_availability');
/**
 * Overriding some checkout fields
 */
function custom_override_checkout_fields($fields) {
  
	$fields['billing']['billing_first_name']['placeholder'] = 'first name';
	$fields['billing']['billing_last_name']['placeholder'] = 'last name';
	$fields['billing']['billing_email']['placeholder'] = 'email address';
	//$fields['billing']['billing_postcode']['default'] = '';
// 	$fields['shipping']['shipping_first_name']['placeholder'] = 'first name';
// 	$fields['shipping']['shipping_last_name']['placeholder'] = 'last name';
// 	$fields['shipping']['shipping_email']['placeholder'] = 'email address';
  
 	// $fields['billing']['billing_country']['required'] = false;
 	// $fields['shipping']['shipping_country']['required'] = false;
 	//unset($fields['billing']['billing_address']);
// 	unset($fields['billing']['billing_address_2']);
// 	unset($fields['billing']['billing_email']);
// 	unset($fields['billing']['billing_phone']);
	unset($fields['order']['order_comments']);
	return $fields;
}
add_filter('woocommerce_checkout_fields', 'custom_override_checkout_fields');

function btk_split_shipping_label( $label ){
  $striped = strip_tags($label);
    $amount =  preg_replace( '/^.+\:/', "", $striped );
    $striped = preg_replace('/\\:.+$/','', $striped);
    $striped = preg_replace('/\\(.+$/','', $striped);
    if(!$amount){
      $amount = 'free';
    }
    if($amount == $label){
      $amount = 'free';
    }
    return array( 'label'=> $striped, 'value' => $amount );
}

function btk_custom_shipping_label( $label ) {
    $label = btk_split_shipping_label($label);
    return '</tr><tr><td>'.$label['label'] . '</td><td><span class="delivery-amount amount">' . $label['value'] . '</span></td>';
}

function btk_custom_shipping_total( $label, $method, $chosen ) {
    $label = btk_split_shipping_label($label);
    if($method == $chosen){
      return ''.$label['label'] . '</td><td><span class="delivery-amount amount">' . $label['value'] . '</span></td>';  
    }
}

//add_filter( 'woocommerce_cart_shipping_method_full_label' , 'btk_custom_shipping_label' );



//add_filter( 'woocommerce_cart_needs_shipping', '__return_true' );
//add_filter( 'woocommerce_ship_to_different_address_checked', '__return_true' );


/**
 * Add new register fields for WooCommerce registration.
 *
 * @return string Register fields HTML.
 */
function btk_extra_register_fields() {
	?>

	<p>
		<label for="reg_billing_first_name" class="hide"></label>
		<input type="text" class="input-text" name="billing_first_name" id="reg_billing_first_name" placeholder="<?php _e( 'first name', 'btk' ); ?>" value="<?php if ( ! empty( $_POST['billing_first_name'] ) ) esc_attr_e( $_POST['billing_first_name'] ); ?>" />
	</p>

	<p>
		<label for="reg_billing_last_name" class="hide"></label>
		<input type="text" class="input-text" name="billing_last_name" id="reg_billing_last_name" placeholder="<?php _e( 'last name', 'btk' ); ?> " value="<?php if ( ! empty( $_POST['billing_last_name'] ) ) esc_attr_e( $_POST['billing_last_name'] ); ?>" />
	</p>

	<?php
}
add_action( 'woocommerce_register_form_start', 'btk_extra_register_fields' );



/**
 * Add new register fields for WooCommerce registration.
 *
 * @return string Register fields HTML.
 */
function btk_extra_register_fields2() {
	?>

	<p>
		<label for="reg_billing_city" class="hide"></label>
		<input type="text" class="input-text" name="billing_city" id="reg_billing_city" placeholder="<?php _e( 'city', 'btk' ); ?> " value="<?php if ( ! empty( $_POST['billing_city'] ) ) esc_attr_e( $_POST['billing_city'] ); ?>" />
	</p>

	<?php
}
add_action( 'woocommerce_register_form', 'btk_extra_register_fields2' );

function btk_after_login_redirect_to_checkout(){
    if( $_SESSION['redirect_to'] == 'checkout'){
      
      
      return esc_url(home_url('/')) . 'checkout/';     
    }else{
      return esc_url(home_url('/'));
    }
}
add_filter('woocommerce_login_redirect', 'btk_after_login_redirect_to_checkout');
add_filter('woocommerce_registration_redirect', 'btk_after_login_redirect_to_checkout');

/**
 * Validate the extra register fields.
 *
 * @param  string $username          Current username.
 * @param  string $email             Current email.
 * @param  object $validation_errors WP_Error object.
 *
 * @return void
 */
function btk_validate_extra_register_fields( $username, $email, $validation_errors ) {
	if ( isset( $_POST['billing_first_name'] ) && empty( $_POST['billing_first_name'] ) ) {
		$validation_errors->add( 'billing_first_name_error', __( 'First name is required.', 'btk' ) );
	}

	if ( isset( $_POST['billing_last_name'] ) && empty( $_POST['billing_last_name'] ) ) {
		$validation_errors->add( 'billing_last_name_error', __( 'Last name is required.', 'btk' ) );
	}

	if ( isset( $_POST['billing_city'] ) && empty( $_POST['billing_city'] ) ) {
		$validation_errors->add( 'billing_city_error', __( 'City is required.', 'btk' ) );
	}
	
}
add_action( 'woocommerce_register_post', 'btk_validate_extra_register_fields', 10, 3 );



/**
 * Save the extra register fields.
 *
 * @param  int  $customer_id Current customer ID.
 *
 * @return void
 */
function btk_save_extra_register_fields( $customer_id ) {
	if ( isset( $_POST['billing_first_name'] ) ) {
		// WordPress default first name field.
		update_user_meta( $customer_id, 'first_name', sanitize_text_field( $_POST['billing_first_name'] ) );

		// WooCommerce billing first name.
		update_user_meta( $customer_id, 'billing_first_name', sanitize_text_field( $_POST['billing_first_name'] ) );
	}

	if ( isset( $_POST['billing_last_name'] ) ) {
		// WordPress default last name field.
		update_user_meta( $customer_id, 'last_name', sanitize_text_field( $_POST['billing_last_name'] ) );

		// WooCommerce billing last name.
		update_user_meta( $customer_id, 'billing_last_name', sanitize_text_field( $_POST['billing_last_name'] ) );
	}

	if ( isset( $_POST['billing_city'] ) ) {
		// WooCommerce billing city
		update_user_meta( $customer_id, 'billing_city', sanitize_text_field( $_POST['billing_city'] ) );
	}
}
add_action( 'woocommerce_created_customer', 'btk_save_extra_register_fields' );





/**
 * Settings page setup in admin
 */
function doctype_opengraph($output) {
	return $output . ' xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml"';
}
add_filter('language_attributes', 'doctype_opengraph');

function fb_opengraph() {
	global $post;
	if ( is_single() ) {
		if ( has_post_thumbnail($post->ID) ) {
			$img_src = wp_get_attachment_image_src(get_post_thumbnail_id( $post->ID ), 'medium');
			$img_src = $img_src[0];
		} else {
			$img_src = get_stylesheet_directory_uri() . '/img/collection.jpg';
		}
		if ( $excerpt = $post->post_content ) {
		$excerpt = strip_tags($post->post_content);
		$excerpt = str_replace("", "'", $excerpt);
		if (strlen($excerpt) > 100) { $excerpt = substr($excerpt, 0, 100) . '...'; }
	} else {
		$excerpt = get_bloginfo('description');
	}
	?>
	<meta property="og:title" content="<?php echo the_title(); ?>"/>
	<meta property="og:description" content="<?php echo $excerpt; ?>"/>
	<meta property="og:type" content="article"/>
	<meta property="og:url" content="<?php echo the_permalink(); ?>"/>
	<meta property="og:site_name" content="élément de base"/>
	<meta property="og:image" content="<?php echo $img_src; ?>"/>
<?php
	} else { return; }
}
add_action('wp_head', 'fb_opengraph', 5);




/**
 * Settings page setup in admin
 */
function check_color($value) {
	if ( preg_match( '/^#[a-f0-9]{6}$/i' , $value ) ) {
		return true;
	}
	return false;
}

function convert_to_rgb($value) {
	$value = str_replace('#', '', $value);
	$r = hexdec(substr($value, 0, 2));
	$g = hexdec(substr($value, 2, 2));
	$b = hexdec(substr($value, 4, 2));
	$rgb = array($r, $g, $b);
	return $rgb;
}

function btk_theme_settings() {
	if (!current_user_can('manage_options')) {
		wp_die( __('You do not have sufficient permissions to access this page.', 'btk') );
	}

	if (isset($_POST['background-color'])) {
		$bkg_color = esc_attr($_POST['background-color']);
		if ( check_color($bkg_color) ) {
			update_option('btk_background_color', $bkg_color);
			update_option('btk_text_color', $_POST['text-color']);
?>
		<div id="message" class="updated">
			<p><strong><?php _e('Settings saved', 'btk'); ?></strong></p>
		</div>
<?php
		}
		else {
?>
		<div id="message" class="error">
			<p><strong><?php _e('Background color should be a valid color', 'btk'); ?></strong></p>
		</div>
<?php
		}
	}
	$bkg_color = get_option('btk_background_color');
	$text_color = get_option('btk_text_color');
	if ( $bkg_color === '' ) { $bkg_color = '#000000'; }
	if ( $text_color === '' ) { $text_color = '#fff'; }
?>
	<div class="wrap">
		<h2><?php _e('Btk Theme Settings', 'btk'); ?></h2>
		<form method='post' action=''>
			<p>
				<label for="background-color"><?php _e('Select background color for menus:', 'btk'); ?> </label>
				<input type="color" class="color-field" name="background-color" value="<?php echo $bkg_color; ?>">
			</p>
			<p>
				<label for="text-color"><?php _e('Select text color:', 'btk'); ?> </label>
				<input type="radio" name="text-color" value="#fff" <?php if ($text_color === '#fff') echo 'checked'; ?>><?php _e('white', 'btk'); ?>
				<input type="radio" name="text-color" value="#000" <?php if ($text_color === '#000') echo 'checked'; ?>><?php _e('black', 'btk'); ?>
			</p>
			<p>
				<input type="submit" value="Save settings" class="button-primary">
			</p>
		</form>
	</div>
<?php
}

function btk_setup_theme_admin_menus() {
	add_submenu_page('themes.php', __('Btk Theme Settings', 'btk'), __('Btk Settings', 'btk'), 'manage_options', 'btk-theme-settings', 'btk_theme_settings');
}
add_action('admin_menu', 'btk_setup_theme_admin_menus');

function btk_add_color_picker() {
	wp_enqueue_style('wp-color-picker');
	wp_enqueue_script('color-picker-script', plugins_url('js/color-picker.js', __FILE__), array('wp-color-picker'), false, true);
}
add_action('admin_enqueue_scripts', 'btk_add_color_picker');

function btk_color_settings() {
	$bkg_color = get_option('btk_background_color');
	$text_color = get_option('btk_text_color');
	if ( $bkg_color === '' ) { $bkg_color = '#000000'; }
	if ( $text_color === '' ) { $text_color = '#fff'; }
	$rgb = convert_to_rgb($bkg_color);
?>
	<style type="text/css">
		#header-box.open {
			background:rgba(<?php echo $rgb[0]; ?>, <?php echo $rgb[1]; ?>, <?php echo $rgb[2]; ?>, 0.88);
		}

		#header-box.open a,
		#header-box.open p,
		#header-box.open span {
			color:<?php echo $text_color; ?>;
		}
	</style>
<?php
}
add_action('wp_head', 'btk_color_settings');



/**
 * Redirect to custom thank you page after checkout
 **/
function wc_custom_redirect_after_purchase() {
	global $wp;

	if ( is_checkout() && ! empty( $wp->query_vars['order-received'] ) ) {
		$order_id = absint( $wp->query_vars['order-received'] );
		wp_redirect( home_url('/') . 'confirmation?order=' . $order_id );
		exit;
	}
}
add_action( 'template_redirect', 'wc_custom_redirect_after_purchase' );

function wc_custom_thankyou( $content ) {
	if ( ! is_page( 'confirmation' ) ) {
		return $content;
	}

	if ( ! isset( $_GET['order'] ) ) {
		return $content;
	}

	$order = wc_get_order( intval( $_GET['order'] ) );
	ob_start();

	if ( ! $order ) {
		?><p><?php echo apply_filters( 'woocommerce_thankyou_order_received_text', __( 'Thank you. Your order has been received.', 'btk' ), null ); ?></p><?php
	} else {
		if ( $order->has_status( 'failed' ) ) {
?>
		<p><?php _e( 'Unfortunately your order cannot be processed as the originating bank/merchant has declined your transaction.', 'btk' ); ?></p>

		<p><?php
			if ( is_user_logged_in() )
				_e( 'Please attempt your purchase again or go to your account page.', 'btk' );
			else
				_e( 'Please attempt your purchase again.', 'btk' );
		?></p>

		<p>
			<a href="<?php echo esc_url( $order->get_checkout_payment_url() ); ?>" class="button pay"><?php _e( 'Pay', 'btk' ) ?></a>
			<?php if ( is_user_logged_in() ) : ?>
			<a href="<?php echo esc_url( wc_get_page_permalink( 'myaccount' ) ); ?>" class="button pay"><?php _e( 'My Account', 'btk' ); ?></a>
			<?php endif; ?>
		</p>
<?php
		} else {
?>
		<div class="woocommerce">
			<ul class="order_details">
				<li class="order">
					<?php _e( 'Order Number:', 'woocommerce' ); ?>
					<strong><?php echo $order->get_order_number(); ?></strong>
				</li>
				<li class="date">
					<?php _e( 'Date:', 'woocommerce' ); ?>
					<strong><?php echo date_i18n( get_option( 'date_format' ), strtotime( $order->order_date ) ); ?></strong>
				</li>
				<li class="total">
					<?php _e( 'Total:', 'woocommerce' ); ?>
					<strong><?php echo $order->get_formatted_order_total(); ?></strong>
				</li>
				<?php if ( $order->payment_method_title ) : ?>
				<li class="method">
					<?php _e( 'Payment Method:', 'woocommerce' ); ?>
					<strong><?php echo $order->payment_method_title; ?></strong>
				</li>
				<?php endif; ?>
				<li class="view">
					<span class="valign"><?php _e('view order', 'btk'); ?></span>
					<a href="<?php echo esc_url( home_url('/') . 'my-account/view-order/' . $order->get_order_number() ); ?>" class="buttons valign icon-arrow-lite-right-white"></a>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
<?php
		}
	}

	$content .= ob_get_contents();
	ob_end_clean();

	return $content;
}
add_filter( 'the_content', 'wc_custom_thankyou' );




/**
 * Change excerpt length for read more
 **/
function btk_custom_excerpt_length( $length ) {
	return 20;
}
add_filter( 'excerpt_length', 'btk_custom_excerpt_length', 140 );

add_action( 'woocommerce_after_cart_table', 'btk_after_cart' );
function btk_after_cart() {
    echo '<script>
    jQuery(document).ready(function($) {
        var upd_cart_btn = $(".update-cart-button").hide();
        var checkout_btn = $(".cart-checkout-button");
        checkout_btn.on("click",function( e ){
          e.preventDefault();
          upd_cart_btn.trigger("click");
        });

    });
    </script>';
}
/**
 * Link for read more
 **/
function btk_excerpt_more( $more ) {
	return '... <a class="read-more" href="' . get_permalink( get_the_ID() ) . '">' . __( 'more', 'btk' ) . '</a>';
}
add_filter( 'excerpt_more', 'btk_excerpt_more' );


/**
 * Get Lookbook Post Products Shortcode
 **/
function btk_lookbook_shortcode( $atts ) {
	$skus = preg_split('/,\s+?/', $atts['skus'], -1, PREG_SPLIT_NO_EMPTY);
  $products = array();
  foreach($skus as $sku){
    $product = btk_get_product_by_sku( $sku );
    
    if( !empty($product->post->post_parent)){
      $price = $product->get_price();
      $product = new WC_Product( $product->post->post_parent );
      $product->set_price( $price );
    }
    if( isset($product) ){
      array_push( $products, $product );
    }
  }
  $html = '<ul class="lookbook-detail">';
  foreach($products as $product){
    $name = preg_replace( '/ \- .+$/','',$product->get_title());
  
    $cats = get_the_terms( $product->id, 'product_cat' );
    $catsarray = array();
    foreach ( $cats as $cat ) {
		  array_push( $catsarray, $cat->name );
	  }
	  $catstring = implode(' / ', $catsarray );
    $price = $product->get_price();
    $href = $product->get_permalink();
    $html .= "<li><a href='$href'><span class='disp-cat'>$catstring</span><span class='disp-name'>$name</span><span class='price'>$$price</span></a></li>";
  }
	return $html."</ul>";
}
add_shortcode( 'lookbook', 'btk_lookbook_shortcode' );

function btk_get_price_html( $price ){
  // global $woocommerce;
  global $product;
  
  if($price) return $price;
  
  $vari = $product->get_available_variations();
  $vari_id = $vari[0]['variation_id'];
  $vario = new WC_Product_Variation( $vari_id );  

  return '$' . get_post_meta($vari_id, '_regular_price', true);
};
add_filter( 'woocommerce_get_price_html', 'btk_get_price_html' );


//Store the custom field
add_filter( 'woocommerce_add_cart_item_data', 'btk_add_cart_item_data', 10, 2 );
function btk_add_cart_item_data( $cart_item_meta, $product_id ) {
  global $woocommerce;
  $cart_item_meta['edb_shipping'] = null;
  return $cart_item_meta; 
}

if (!function_exists('write_log')) {
    function write_log ( $log )  {
        if ( true === WP_DEBUG ) {
            if ( is_array( $log ) || is_object( $log ) ) {
                error_log( print_r( $log, true ) );
            } else {
                error_log( $log );
            }
        }
    }
}



//Get it from the session and add it to the cart variable
function get_cart_items_from_session( $item, $values, $key ) {
    // $post_array = array();
    // parse_str( $_POST['post_data'], $post_array );
    
    if ( array_key_exists( 'edb_shipping', $values ) ){
      $item[ 'edb_shipping' ] = $values['edb_shipping'];
    }
    
    
    return $item;
}
add_filter( 'woocommerce_get_cart_item_from_session', 'get_cart_items_from_session', 1, 3 );

function bulky_woocommerce_cart_shipping_packages( $packages ) {
    // Reset the packages
    $packages = array();
    $post_array = array();
    parse_str( $_POST['post_data'], $post_array );
    
    // write_log( json_encode($post_array));
    // Bulky items
    $pickup_items   = array();
    $ready_items = array();
    $bundle_1_items = array();
    $bundle_2_items = array();
    $bundle_3_items = array();
    
    // Sort bulky from regular
    foreach ( WC()->cart->get_cart() as $item_key => $item ) {
      if( !is_null($post_array['cart'][$key]) && array_key_exists('edb_shipping', $post_array['cart'][$key] ) ){
        $item[ 'edb_shipping' ]  = $post_array['cart'][$key]['edb_shipping'];
      }
        if( $item['edb_shipping'] == 'self_pickup'){
          $pickup_items[] = $item;
        }
        else if( $item['edb_shipping'] == 'ship_ready'){
          $ready_items[] = $item;
        }
        else if( $item['edb_shipping'] == 'ship_bundle_1'){
          $bundle_1_items[] = $item;
        }
        else if( $item['edb_shipping'] == 'ship_bundle_2'){
          $bundle_2_items[] = $item;
        }
        else if( $item['edb_shipping'] == 'ship_bundle_3'){
          $bundle_3_items[] = $item;
        }
    }
    
    
    
    // Put inside packages5
    if ( count($pickup_items) > 0 ) {
        if(!WC()->cart->has_discount('selfserve')){
          WC()->cart->add_discount('selfserve');
        }
        
        $packages[] = array(
            'ship_via'        => array('local_pickup'),
            'contents'        => $pickup_items,
            'contents_cost'   => array_sum( wp_list_pluck( $pickup_items, 'line_total' ) ),
            'applied_coupons' => WC()->cart->applied_coupons,
            'destination'     => array(
                'country'   => WC()->customer->get_shipping_country(),
                'state'     => WC()->customer->get_shipping_state(),
                'postcode'  => WC()->customer->get_shipping_postcode(),
                'city'      => WC()->customer->get_shipping_city(),
                'address'   => WC()->customer->get_shipping_address(),
                'address_2' => WC()->customer->get_shipping_address_2()
            )
        );
    }else{
      WC()->cart->remove_coupon('selfserve');  
    }
    if ( count($ready_items) > 0 ) {
        $packages[] = array(
            'ship_via'       => array('edb_shipping'),
            'contents'        => $ready_items,
            'contents_cost'   => array_sum( wp_list_pluck( $ready_items, 'line_total' ) ),
            'applied_coupons' => WC()->cart->applied_coupons,
            'destination'     => array(
                'country'   => WC()->customer->get_shipping_country(),
                'state'     => WC()->customer->get_shipping_state(),
                'postcode'  => WC()->customer->get_shipping_postcode(),
                'city'      => WC()->customer->get_shipping_city(),
                'address'   => WC()->customer->get_shipping_address(),
                'address_2' => WC()->customer->get_shipping_address_2()
            )
        );
    }    
    if ( count($bundle_1_items) > 0 ) {
        $packages[] = array(
            'ship_via'       => array('edb_shipping'),
            'contents'        => $bundle_1_items,
            'contents_cost'   => array_sum( wp_list_pluck( $bundle_1_items, 'line_total' ) ),
            'applied_coupons' => WC()->cart->applied_coupons,
            'destination'     => array(
                'country'   => WC()->customer->get_shipping_country(),
                'state'     => WC()->customer->get_shipping_state(),
                'postcode'  => WC()->customer->get_shipping_postcode(),
                'city'      => WC()->customer->get_shipping_city(),
                'address'   => WC()->customer->get_shipping_address(),
                'address_2' => WC()->customer->get_shipping_address_2()
            )
        );
    } 
    if ( count($bundle_2_items) > 0 ) {
        $packages[] = array(
            'ship_via'       => array('edb_shipping'),
            'contents'        => $bundle_2_items,
            'contents_cost'   => array_sum( wp_list_pluck( $bundle_2_items, 'line_total' ) ),
            'applied_coupons' => WC()->cart->applied_coupons,
            'destination'     => array(
                'country'   => WC()->customer->get_shipping_country(),
                'state'     => WC()->customer->get_shipping_state(),
                'postcode'  => WC()->customer->get_shipping_postcode(),
                'city'      => WC()->customer->get_shipping_city(),
                'address'   => WC()->customer->get_shipping_address(),
                'address_2' => WC()->customer->get_shipping_address_2()
            )
        );
    }   
    if ( count($bundle_3_items) > 0 ) {
        $packages[] = array(
            'ship_via'       => array('edb_shipping'),
            'contents'        => $bundle_3_items,
            'contents_cost'   => array_sum( wp_list_pluck( $bundle_3_items, 'line_total' ) ),
            'applied_coupons' => WC()->cart->applied_coupons,
            'destination'     => array(
                'country'   => WC()->customer->get_shipping_country(),
                'state'     => WC()->customer->get_shipping_state(),
                'postcode'  => WC()->customer->get_shipping_postcode(),
                'city'      => WC()->customer->get_shipping_city(),
                'address'   => WC()->customer->get_shipping_address(),
                'address_2' => WC()->customer->get_shipping_address_2()
            )
        );
    } 
    
    
    
    return $packages;
}
add_filter( 'woocommerce_cart_shipping_packages', 'bulky_woocommerce_cart_shipping_packages' );


/**
 * Implement the Custom Header feature.
 */
//require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/shipping_method.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';
