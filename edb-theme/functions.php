<?php
/**
 * _s functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package edb
 */

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
		'name'          => esc_html__( 'Sidebar', 'edb' ),
		'id'            => 'sidebar-1',
		'description'   => '',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
    'name'          => esc_html__( 'Languages', 'edb' ),
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
	wp_enqueue_script( '_s_hammer', get_template_directory_uri() . '/js/hammer.min.js', array(), '20120208', true );

  wp_enqueue_script( '_s-navigation', get_template_directory_uri() . '/js/navigation.js', array('jquery','_s_hammer'), '20120206', true );
  wp_enqueue_script( '_s-splash', get_template_directory_uri() . '/js/splash.js', array('jquery','_s_hammer'), '20120206', true );
  wp_enqueue_script( '_s-toast', get_template_directory_uri() . '/js/toast.js', array('jquery','_s_hammer'), '20120206', true );
  
	wp_enqueue_script( '_s-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20130115', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', '_s_scripts' );

add_action( 'init', 'edb_theme_remove_wc_breadcrumbs' );
function edb_theme_remove_wc_breadcrumbs() {
    remove_action( 'woocommerce_before_main_content', 'woocommerce_breadcrumb', 20, 0 );
}
function custom_excerpt_length( $length ) {
  return 20;
}
add_filter( 'excerpt_length', 'custom_excerpt_length', 999 );


add_filter( 'the_subtitle', 'translate_subtitle' );
function translate_subtitle( $s ) {
  return  WPGlobus_Core::text_filter( $s, WPGlobus::Config()->language );
  
}
function new_excerpt_more( $more ) {
  return '... more';
}
add_filter('excerpt_more', 'new_excerpt_more');

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




function btk_edb_slider($query, $attach = null, $blankTargets = false) {
  $slider_query = new WP_Query($query);
  $data = array();
  echo "<div class='edb-slider' data-kenburns='1'>";
  echo "<div class='edb-slides'>";
  $active = ' active';
  while ($slider_query->have_posts()) {
    $slider_query->the_post();
    if (has_post_thumbnail()) {
      $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full')[0];
      ?><div class="edb-slide<?php echo $active; ?>">
        
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
      
      return '<a target="_blank" href="'.$pdflink.'" download="'.sanitize_file_name($fileName . '.pdf').'" class="upper pr-pdf">download PDF</a>';
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
    'en' => array( 'url'=>home_url(), 'label' => __('Enter', 'edb') ),
    'fr' => array( 'url'=>home_url().'/fr', 'label' => __('Entrez', 'edb') )
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
  $tests = array('is_lynx','is_gecko','is_winIE','is_macIE','is_opera','is_NS4','is_safari','is_chrome','is_iphone','is_IE','is_edge');
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
