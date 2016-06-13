<?php
/**
 * _s functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package edb
 */
 
$preview = get_stylesheet_directory() . '/woocommerce/emails/woo-preview-emails.php';
 
if(file_exists($preview)) {
     require $preview;
}

if ( ! function_exists( '_s_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function _s_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on _s, use a find and replace
	 * to change 'edb' to the name of your theme in all the template files.
	 */
	load_theme_textdomain( 'edb', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
	 */
	add_theme_support( 'post-thumbnails' );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => esc_html__( 'Primary', 'edb' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form',
		'comment-form',
		'comment-list',
		'gallery',
		'caption',
	) );

	/*
	 * Enable support for Post Formats.
	 * See https://developer.wordpress.org/themes/functionality/post-formats/
	 */
	add_theme_support( 'post-formats', array(
		'aside',
		'image',
		'video',
		'quote',
		'link',
	) );

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( '_s_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );
}
endif;
add_action( 'after_setup_theme', '_s_setup' );

add_action( 'after_setup_theme', 'woocommerce_support' );
function woocommerce_support() {
    add_theme_support( 'woocommerce' );
}
/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function _s_content_width() {
	$GLOBALS['content_width'] = apply_filters( '_s_content_width', 640 );
}
add_action( 'after_setup_theme', '_s_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function _s_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'sidebar', 'edb' ),
		'id'            => 'sidebar-1',
		'description'   => '',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
    'name'          => esc_html__( 'languages', 'edb' ),
    'id'            => 'languages',
    'description'   => '',
    'before_widget' => '',
    'after_widget'  => '',
    'before_title'  => '',
    'after_title'   => '',
  ) );
}
add_action( 'widgets_init', '_s_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function _s_scripts() {
	wp_enqueue_style( '_s-style', get_stylesheet_uri() );

	
	
// 	wp_enqueue_script( '_s_jquery_event_move', get_template_directory_uri() . '/js/jquery.event.move.js', array('jquery'), '20120207', true );
	
// 	wp_enqueue_script( '_s_jquery_event_swipe', get_template_directory_uri() . '/js/jquery.event.swipe.js', array('jquery','_s_jquery_event_move'), '20120208', true );
	
// 	wp_enqueue_script( '_s-bugyfill', get_template_directory_uri() . '/js/viewport-units-buggyfill.js', array() , '20120206', true );
	wp_enqueue_script( '_s_hammer', get_template_directory_uri() . '/js/hammer.min.js', array(), '20160404', true );

  wp_enqueue_script( '_s-navigation', get_template_directory_uri() . '/js/navigation.js', array('jquery','_s_hammer'), '20160404', true );
  wp_enqueue_script( '_s-splash', get_template_directory_uri() . '/js/splash.js', array('jquery','_s_hammer'), '20160404', true );
  wp_enqueue_script( '_s-toast', get_template_directory_uri() . '/js/toast.js', array('jquery','_s_hammer'), '20160404', true );
  // wp_enqueue_script( '_s-tubes', get_template_directory_uri() . '/js/tubes.js', array('jquery','wpglobus'), '20160404', true );
  
  wp_localize_script('_s-ajax_object', 'ajax_object', array( 'ajax_url' => admin_url( 'admin-ajax.php' ) ) );
	wp_enqueue_script( '_s-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20160404', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', '_s_scripts' );

add_action( 'init', 'edb_theme_remove_wc_breadcrumbs' );
add_action('init', 'edb_menu_strings_init');
function edb_menu_strings_init( ){
  __("products", 'edb');
  __("order samples", 'edb');
  __("shipping", 'edb');
  __("about", 'edb');
  __("contact us", 'edb');
  __("lookbook", 'edb');
  __("contact us", 'edb');
  __("shipping", 'edb');
  __("return & exchange", 'edb');
  __("my account", 'edb');
  __("about", 'edb');
  __("FAQ", 'edb');
  __("trade & designers", 'edb');
  __("large orders", 'edb');
  __("lookbook", 'edb');
  __("privacy policy", 'edb');
  __("terms of use", 'edb');
}
function edb_theme_remove_wc_breadcrumbs() {
    remove_action( 'woocommerce_before_main_content', 'woocommerce_breadcrumb', 20, 0 );
}

add_filter( 'loop_shop_per_page', create_function( '$cols', 'return 24;' ), 20 );



add_filter( 'the_subtitle', 'translate_subtitle' );
function translate_subtitle( $s ) {
  return  WPGlobus_Core::text_filter( $s, WPGlobus::Config()->language );
  
}

function edb_translate_string( $s ){
  return WPGlobus_Core::text_filter( $s, WPGlobus::Config()->language );
}

function custom_excerpt_length( $length ) {
  return 20;
}
add_filter( 'excerpt_length', 'custom_excerpt_length', 999 );

function edb_excerpt_more( $more ) {
  return '... '.edb_translate_string("{:en}more{:}{:fr}{:}");
}
add_filter('excerpt_more', 'edb_excerpt_more');



// // remove speciific woocommerce stylsheets...
// add_filter( 'woocommerce_enqueue_styles', 'edb_dequeue_woocommerce_styles' );
// function edb_dequeue_woocommerce_styles( $enqueue_styles ) {
//   // unset( $enqueue_styles['woocommerce-general'] );  // Remove the gloss
//   unset( $enqueue_styles['woocommerce-layout'] );    // Remove the layout
//   unset( $enqueue_styles['woocommerce-smallscreen'] );  // Remove the smallscreen optimisation
//   return $enqueue_styles;
// }
// Or just remove them all in one line
add_filter( 'woocommerce_enqueue_styles', '__return_false' );

add_filter('woocommerce_update_order_review_fragments', 'edb_add_checkout_tabs_and_summary_fragments');

function edb_add_checkout_tabs_and_summary_fragments( $fragments ){
  
  
  
  ob_start();
  do_action('woocommerce_checkout_billing');
  $fragments['.woocommerce-billing-fields'] = ob_get_clean();
  
  ob_start();
  do_action('woocommerce_checkout_shipping');
  $fragments['.woocommerce-shipping-fields'] = ob_get_clean();
  
  
  
  ob_start();
  get_template_part('woocommerce/checkout/form', 'summaries');
  $fragments['.checkout-tabs-and-summaries'] = ob_get_clean();
  return $fragments;
}


function remove_wc_password_meter() {
    wp_dequeue_script( 'wc-password-strength-meter' );
}
add_action( 'wp_print_scripts', 'remove_wc_password_meter', 100 );

function btk_edb_slider($query, $attach = null, $blankTargets = false) {
  $slider_query = new WP_Query($query);
  $data = array();
  echo "<div class='edb-slider' data-autocycle='1'>";
  echo "<div class='edb-slides'>";
  $active = ' active';
  while ($slider_query->have_posts()) {
    $slider_query->the_post();
    if (has_post_thumbnail()) {
      $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full')[0];
      ?><div class="edb-slide<?php echo $active; ?> <?php echo get_post_format($slider_query->post->ID); ?>">
        
          <div class="backdrop" style="background-image:url('<?php echo esc_attr($src); ?>')">
            <img src="<?php echo esc_attr($src); ?>">
          </div>
          
          <div class="titles">
            <a href="<?php echo get_permalink( $slider_query->post->ID );?>">
              <h2><?php the_title(); ?></h2>
              <h3><?php the_subtitle(); ?></h3>
            </a>
          </div>

          <div class="badge">
            <span class="line-1">line 1</span>
            <span class="line-2">line 2</span>
            <span class="line-3">line 3</span>
          </div>
        
      </div><?php
      $active = '';
    }
  }
  echo "</div>";
  echo "<div class='controls'>";
  ?>
  <a class="prev" href="#">&lt;</a>
  <span class="indicator current">1</span>
  <span class="separator"></span>
  <span class="indicator last"><?php echo $slider_query->post_count;?></span>
  <a class="next" href="#">&gt;</a>
  <?php
  echo "</div>";
  echo "</div>";
 
  
}

function btk_edb_lookbook_slider(){
  $query = array( 'post_type' => 'post', 'post_per_page' => '5', 'category_name' => 'lookbook' );
  btk_edb_slider( $query, null, true );
}

function btk_product_pdf_link( $productID, $fileName){
    $pdf = get_attached_media('application/pdf',$productID);
    if(!empty($pdf)){
      $pdf = array_shift(array_values($pdf));
      
      $pdflink = $pdf->guid; 
      
      return '<a target="_blank" href="'.$pdflink.'" download="'.sanitize_file_name($fileName . '.pdf').'" class="upper pr-pdf">'.__('download PDF', 'edb').'</a>';
    }
    return '';
}

function get_ID_by_page_name($page_name) {
   global $wpdb;
   $page_name_id = $wpdb->get_var("SELECT ID FROM $wpdb->posts WHERE post_name = '".$page_name."' AND post_type = 'page'");
   return $page_name_id;
}

function edb_splash_page(){
  $the_slug = 'splash-page';
  $args = array(
    'name'        => $the_slug,
    'post_type'   => 'page',
    'post_status' => 'private',
    'numberposts' => 1
  );
  $links = array(
    'en' => array( 'url'=>home_url()."?splashed", 'label' => __('enter', 'edb') ),
    'fr' => array( 'url'=>str_replace('/fr','',home_url()).'/fr'."?splashed", 'label' => __('entrez', 'edb') )
   );
  foreach($links as $lang => $link){
    echo "<a class=\"language-selection\" href=\"".$link['url']."\">".$link['label']."</a>";
  }
   $found_posts = get_posts($args);
   if(!empty($found_posts)){
     $splash_post = $found_posts[0];
     $images = get_post_gallery_images($splash_post);
     if(!empty($images)){
       echo "<div class='edb-slider' data-autocycle=\"on\">";
       echo "<div class='edb-slides'>";
       $active = ' active';
      // write_log($images);
       foreach( $images as $index => $image ){
         echo "<div class='edb-slide$active'>";
         if($index > 0) $active = '';
         ?><div class="backdrop" style="background-image:url('<?php echo esc_attr($image); ?>')">
           <img src="<?php echo esc_attr($image); ?>">
         </div>
         <?php
         echo "</div>";
       }
       echo "</div>";
       echo "</div>";
     }
   }
   
   
}

function edb_body_classes(){
  $tests = array('is_lynx','is_gecko','is_winIE','is_macIE','is_opera','is_NS4','is_safari','is_chrome','is_iphone','is_IE');
  $deviceclasses = array();
  foreach( $tests as $t ){
    if($GLOBALS[$t]){
      $deviceclasses[]= str_replace('_', '-' , $t);
    }
  }
  return $deviceclasses;
}
add_filter( 'woocommerce_billing_fields', 'woo_filter_state_billing', 10, 1 );
add_filter( 'woocommerce_shipping_fields', 'woo_filter_state_shipping', 10, 1 );

function woo_filter_state_billing( $address_fields ) {
  $address_fields['billing_state']['required'] = true;
  return $address_fields;
}

function woo_filter_state_shipping( $address_fields ) {
  $address_fields['shipping_state']['required'] = true;
  return $address_fields;
}

add_filter( 'wp_nav_menu_items', 'edb_translate_menu', 10, 2 );
function edb_translate_menu( $items, $menu ) {
  
  $doc = new DOMDocument();
  $doc->loadHTML($items);
  $links = $doc->getElementsByTagName('a');
  $strings = array();
  foreach( $links as $link ){
    array_push( $strings, $link->nodeValue );
    $link->nodeValue = htmlspecialchars(__( $link->nodeValue, 'edb' ));
    

  }
  
  // write_log( json_encode( $strings));
  return $doc->saveHTML();

}

function edb_last_deploy(){
  return filemtime('/srv/http/wordpress/production/wp-content/themes/edb-theme/index.php');
  
}
function bustpagecache() {
  echo "<div style='display:none'>".edb_last_deploy()."</div>";
}

function set_php_auth_header(){
  // write_log('SET_PHP_AUTH_HEADER');
  // write_log($_SERVER);
  // if(!isset($_SERVER['PHP_AUTH_USER'])){
  //   $httpauth = $_SERVER['HTTP_AUTHORIZATION'] || $_SERVER['REDIRECT_HTTP_AUTHORIZATION'];
  //   list($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']) = explode(':' , base64_decode(substr($httpauth, 6)));  
  // }
  // if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] == 'https://badb0x.akr.club/wp-content/themes/edb/js/order-tool-lib/index.html'){
  //   write_log($_SERVER);
  
     if(current_user_can('publish_posts')){
       $_SERVER['PHP_AUTH_USER'] = 'ck_dbc3f91b5f982189037625df93c50393ad99592b';
       $_SERVER['PHP_AUTH_PW'] = 'cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1';
     }
    
  // }
  
  // write_log($_SERVER['HTTP_AUTHORIZATION']);
  // write_log($_SERVER);
  // write_log($_SERVER['REDIRECT_HTTP_AUTHORIZATION']);
}

function fix_language_page_links( $url, $post, $leavename ) {
  if ( $post->post_type == 'post' || $post->post_type == 'page' ) {
    // write_log( "got: $url" );
    $links_to = get_post_meta( $post->ID, '_links_to', true );
    $lang =WPGlobus::Config()->language;
    $parts = parse_url($url);
    
    if(!empty($parts['host']) && !preg_match('/elementdebase/', $parts['host']) ){
      return $url;
    }
    if(!empty($links_to) && $lang == 'fr'){
      $links_to = parse_url($links_to);
      if(substr( $parts['path'], 0, 4 ) !== "/fr/" && $lang == 'fr'){
        $url= '/fr'.$parts['path']. ( !empty($parts['query']) ? '?'.$parts['query'] : '');
      }  
    }else{
      // write_log("REWRITE URL: $url" );
      // if(substr( $parts['path'], 0, 4 ) !== "/fr/" && $lang == 'fr'){
      //   $url= '/fr'.$parts['path']. ( !empty($parts['query']) ? '?'.$parts['query'] : '');
      // }  
    }
    return $url;
    // write_log( "gave: $url" );  
  }
  return $url;
}
add_filter( 'post_link', 'fix_language_page_links', 100, 3 );



function change_menu($items){
  $lang =WPGlobus::Config()->language;
  foreach( $items as $item ){
    $url = $item->url;
    $parts = parse_url($url);
    if(empty($parts['host']) || preg_match('/elementdebase/', $parts['host']) ){
      if(substr( $parts['path'], 0, 4 ) !== "/fr/" && $lang == 'fr'){
        $url= '/fr'.$parts['path']. ( !empty($parts['query']) ? '?'.$parts['query'] : '');
      } 
    }
    $item->url = $url;
  }

  return $items;

}

add_filter('wp_nav_menu_objects', 'change_menu');



function subscribe_to_newsletter() {
 
    // The $_REQUEST contains all the data sent via ajax
    if ( isset($_REQUEST) ) {
        $email = $_REQUEST['email'];
        $mlpost = get_post( 1890 );
        $list = $mlpost->post_content;
        $lang = WPGlobus::Config()->language;
        $list .= "\n$email ($lang)";
        $update = array('ID' => 1890, 'post_title' => $mlpost->post_title, 'post_content'=>$list );
        wp_update_post( $update );
        echo json_encode( array('message' => WPGlobus_Core::text_filter( "{:en}Thank you! $email has been subscribed! {:}{:fr}Merci! $email est mainteant abboné{:}", WPGlobus::Config()->language ) ) );
    }
    // Always die in functions echoing ajax content
   die();
}


add_filter( 'wpcf7_validate_email*', 'custom_email_confirmation_validation_filter', 20, 2 );
 
function custom_email_confirmation_validation_filter( $result, $tag ) {
    $tag = new WPCF7_Shortcode( $tag );
 
    if ( 'your-email-confirm' == $tag->name ) {
        $your_email = isset( $_POST['your-email'] ) ? trim( $_POST['your-email'] ) : '';
        $your_email_confirm = isset( $_POST['your-email-confirm'] ) ? trim( $_POST['your-email-confirm'] ) : '';
 
        if ( $your_email != $your_email_confirm ) {
            $result->invalidate( $tag, "Are you sure this is the correct address?" );
        }
    }
    write_log( $result);
    return $result;
}

add_action('wpcf7_posted_data', 'custom_form_posted_data' );

function custom_form_posted_data($posted_data){
  foreach( $posted_data as $k => $v){
    if($k == 'province' && !empty($v) && $v == 'Quebec'){
      $v = 'Québec';
    }
    if($k == 'postal-code' && !empty($v)){
      $v = wordwrap( strtoupper($v), 3, ' ', true );
    }
    $posted_data[$k] = $v;
  }
  return $posted_data;
}
 
add_action( 'wp_ajax_subscribe_to_newsletter', 'subscribe_to_newsletter' );
add_action( 'wp_ajax_nopriv_subscribe_to_newsletter', 'subscribe_to_newsletter' );




// Hook in
add_filter( 'woocommerce_checkout_fields' , 'edb_override_checkout_fields' );

// Our hooked in function - $fields is passed via the filter!
function edb_override_checkout_fields( $fields ) {
    
     $fields['shipping']['shipping_phone'] = $fields['billing']['billing_phone'];
     $fields['shipping']['shipping_phone']['class'] = array('form-row-first');
     $order = array( 'shipping_first_name','shipping_last_name', 'shipping_company',  'shipping_phone','shipping_country', 'shipping_address_1','shipping_address_2','shipping_city','shipping_state','shipping_postcode');
     $reordered = array();
     foreach( $order as $field ){
       $reordered[$field] = $fields['shipping'][$field];
     }
     $fields['shipping']=$reordered;
      
     return $fields;
}

// function test_edb_json(){
//   edb_to_essential_json(36110);  
// }

// function edb_to_essential_json( $product_id ){
//   $product = get_product($product_id);
//   $attributes = $product->get_attributes();
//   $materials = array();
//   if($attributes['edb_material']){
//     $materials = explode('|',$attributes['edb_material']['value']);
//   }
//   $json = array();
//   $json['title'] = $product->post->post_title;
//   $json['subtitle'] = $product->post->subtitle;
//   $json['description'] = $product->post->post_content;
//   $json['name'] = $product->post->post_name;
//   $json['url'] = $product->post->guid;
//   $json['type'] = $product->post->post_type;
//   $json['is_variable'] = $product->product_type == 'variable';
//   $json['material_numbers'] = $materials;
//   $json['featured_image'] = get_post_thumbnail_id( $product_id );
  
//   write_log( $json );
// }

add_action( 'init', 'set_php_auth_header'  );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

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
