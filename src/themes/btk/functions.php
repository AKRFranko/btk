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

/**
 * This theme supports woocommerce (and voila! one less anoying admin notification box!)
 */
function woocommerce_support() {
    add_theme_support( 'woocommerce' );
}
add_action( 'after_setup_theme', 'woocommerce_support' );

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
				array_push($response, wp_get_attachment_image_src($image->ID, 'full')[0]);
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

/**
 * Redirect if not logged in on checkout page
 */
function woo_redirect() {
	if (!is_user_logged_in() && is_checkout()) {
		wp_redirect(home_url() . '/my-account');
		exit;
	}
}
add_action('template_redirect', 'woo_redirect');

/**
 * Overriding some checkout fields
 */
function custom_override_checkout_fields($fields) {
	$fields['billing']['billing_first_name']['placeholder'] = 'first name';
	$fields['billing']['billing_last_name']['placeholder'] = 'last name';
	$fields['billing']['billing_email']['placeholder'] = 'email address';
	unset($fields['billing']['billing_company']);
	unset($fields['billing']['billing_address_2']);
	unset($fields['billing']['billing_email']);
	unset($fields['billing']['billing_phone']);
	unset($fields['order']['order_comments']);
	return $fields;
}
add_filter('woocommerce_checkout_fields', 'custom_override_checkout_fields');


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
 * Change excerpt length for read more
 **/
function btk_custom_excerpt_length( $length ) {
	return 20;
}
add_filter( 'excerpt_length', 'btk_custom_excerpt_length', 140 );

/**
 * Link for read more
 **/
function btk_excerpt_more( $more ) {
	return '... <a class="read-more" href="' . get_permalink( get_the_ID() ) . '">' . __( 'more', 'btk' ) . '</a>';
}
add_filter( 'excerpt_more', 'btk_excerpt_more' );

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
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';
