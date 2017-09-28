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
 
 
 
 $edb_shipping_rates_table = array(
   'furniture' => array( 
     'min' => 500,
     'below'=> array(
       'zone-1'=> 65,
       'zone-2'=> 150,
       'zone-3'=> 250
       ),
     'above'=> array(
       'zone-1'=> 0,
       'zone-2'=> 85,
       'zone-3'=> 150
       )
   ),
   'small-furniture' => array( 
     'min' => 500,
     'below'=> array(
       'zone-1'=> 18,
       'zone-2'=> 25,
       'zone-3'=> 28
       ),
     'above'=> array(
       'zone-1'=> 0,
       'zone-2'=> 10,
       'zone-3'=> 15
       )
   ),
   'accessories'=> array(
     'min' => 50,
     'below'=> array(
       'zone-1'=>15,
       'zone-2'=>15,
       'zone-3'=>15
       ),
     'above'=> array(
       'zone-1'=>0,
       'zone-2'=>0,
       'zone-3'=>0
     )
   )
 );
 function edb_product_free_shipping( $product_id ){
   global $edb_shipping_rates_table;
   $product = get_product($product_id);
   $shipping_class = $product->get_shipping_class();
   $price = $product->price;
   $rates = $edb_shipping_rates_table[$shipping_class];
   $min = $rates['min'];
   
   if($price >= $min && !empty($shipping_class)){
      $text = sprintf(__("This product ships free %s (read)",'edb'),'<br/>');
      echo "<a class=\"product-free-shipping\" href=\"/about-shipping\">$text</a>";
     
   }
   
   
 }
 function edb_product_free_shipping_note( $product_id ){
   global $edb_shipping_rates_table;
   $product = get_product($product_id);
   $shipping_class = $product->get_shipping_class();
   $price = $product->price;
   $rates = $edb_shipping_rates_table[$shipping_class];
   $min = $rates['min'];
   
  // if($price >= $min){
  //     $text = __("This product ships free *",'edb');
  //     echo "<div class=\"product-free-shipping-note\">$text</div>";
     
  // }
   
   
 }
function edb_promo_ends_in_days( $timestamp ){
  $now = time(); // or your date as well
  $datediff = $now - ($timestamp / 1000);
  $days = abs(floor($datediff/(60*60*24)));
  if($days > 1){
    printf( __('offer ends in %s days','edb'), $days);
  }else{
    printf( __('offer ends today','edb'), $days);
  }
  // $now = time();
  // echo ($timestamp - $now) / 60 / 60 / 24;
}
function _s_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on _s, use a find and replace
	 * to change 'edb' to the name of your theme in all the template files.
	 */
	load_theme_textdomain( 'edb', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
// 	add_theme_support( 'automatic-feed-links' );


	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
// 	add_theme_support( 'title-tag' );

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

// function edb_variation_set_stock( $variation ){
  
//   $product = edb_decorated_product( $variation->ID );
//   $product_id = $product->product_object->ID;
//   write_log("Parent:".get_post_meta($product_id,'_edb_mirror_product_parent'));
//   write_log("Child:".get_post_meta($product_id,'_edb_mirror_product_child'));
  
// }
// add_action('woocommerce_variation_set_stock','edb_variation_set_stock');
/**
 * Enqueue scripts and styles.
 */
function _s_scripts() {
  $buster = edb_last_deploy();
	wp_enqueue_style( '_s-style', get_stylesheet_uri(), array(), edb_last_deploy() );
	wp_enqueue_style( 'swiper-style', "https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css", array(), edb_last_deploy() );

	

	
// 	wp_enqueue_script( '_s_jquery_event_move', get_template_directory_uri() . '/js/jquery.event.move.js', array('jquery'), '20120207', true );
	
// 	wp_enqueue_script( '_s_jquery_event_swipe', get_template_directory_uri() . '/js/jquery.event.swipe.js', array('jquery','_s_jquery_event_move'), '20120208', true );
	
// 	wp_enqueue_script( '_s-bugyfill', get_template_directory_uri() . '/js/viewport-units-buggyfill.js', array() , '20120206', true );


	
     wp_enqueue_script('masonry', "https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js", array('jquery'), '4.0', true );
     wp_enqueue_script( 'jspdf','https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js', array('jquery'), '20170922', true );
     
  // if($_SERVER['SERVER_ADDR'] == '45.56.104.172'){
     
     wp_enqueue_script( '_s_hammer', get_template_directory_uri() . '/js/hammer.min.js', array(), '20170607', true );
     wp_enqueue_script( '_s-navigation', get_template_directory_uri() . '/js/navigation.js', array('jquery','_s_hammer','masonry','jspdf'), '20170922', true );
     wp_enqueue_script( '_s-swiper', get_template_directory_uri() . '/js/swiper-init.js', array('jquery','swiperjs'), '20170922', true );
     wp_enqueue_script( '_s-splash', get_template_directory_uri() . '/js/splash.js', array('jquery','_s_hammer'), '20170922', true );
     wp_enqueue_script( '_s-toast', get_template_directory_uri() . '/js/toast.js', array('jquery','_s_hammer'), '20170922', true );
     wp_enqueue_script( '_s-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20170922', true );
      



     wp_enqueue_script('swiperjs','https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js',array(), '20170922', true );
     wp_localize_script('_s-toast', 'ajax_object', array( 'ajax_url' => admin_url( 'admin-ajax.php' ), 'theme_url' => get_template_directory_uri(), 'current_lang'=>WPGlobus::Config()->language ) );
     wp_enqueue_script( '_s_ga_ec', get_template_directory_uri() . '/js/ec.js', array(), '20170922', true );
     if($_SERVER['SERVER_ADDR'] == '45.56.104.172'){
       wp_enqueue_script( '_s_test', get_template_directory_uri() . '/js/test.js', array('jquery'), '20170922', true );
     }
    
  // }else{
  //   wp_enqueue_script('edb_all',get_template_directory_uri() . '/js/all.min.js', array('jquery','masonry'), '20170706', true);
  //   wp_localize_script('edb_all', 'ajax_object', array( 'ajax_url' => admin_url( 'admin-ajax.php' ) ) );  
  // }
  
  

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', '_s_scripts' );


// add_filter( 'script_loader_tag', function ( $tag, $handle ) {
//     if(is_admin()){
//       return $tag;
//     }
//   if( !in_array( $handle, array('jquery-core','jquery-migrate'))){
    
//   return str_replace( ' src', ' defer="defer" src', $tag ); 
//   }
//     return $tag;
   
    
// }, 10, 2 );
function edb_unique_user_name( $name ){
  $count = 0;
  while($user_id = username_exists( $name  )){
    $name = $name . "$count";
  }
  return $name;
   
}

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

// add_filter( 'loop_shop_per_page', create_function( '$cols', 'return 24;' ), 20 );
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
// add_filter('woocommerce_before_order_notes', 'edb_before_order_notes');

// function edb_before_order_notes( $args ){
//   write_log('edb_before_order_notes');
//   write_log($args);
//   write_log($_POST);
//   return $args;
// }



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
  $i=0;
  while ($slider_query->have_posts()) {
    $slider_query->the_post();
    $posttags = get_the_tags();
          $altClass=' ';
          if ($posttags) {
            foreach($posttags as $tag) {
              if($tag->name =='dark'){
                  $altClass .= 'dark';
              }
            }
          };
          //https://badb0x.akr.club/wp-content/uploads/2015/12/image-2.jpg
    
    if (has_post_thumbnail()) {
      $src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full')[0];
      $spid = $slider_query->post->ID;
      ?><div class="edb-slide <?php echo "slide-post-$spid"; ?> <?php echo $active; ?> <?php echo $altClass; ?> <?php echo get_post_format($slider_query->post->ID); ?>">
        
          <div class="backdrop" style="background-image:url('<?php echo esc_attr($src); ?>?noc=<?php echo time(); ?>')">
            <img crossOrigin="anonymous" alt="<?php echo esc_attr(get_the_title()); ?>, slide <?php echo $i; ?>" src="<?php echo esc_attr($src); ?>?noc=<?php echo time(); ?>">
          </div>
          
          <div class="titles">
            <a href="<?php echo get_permalink( $slider_query->post->ID );?>">
              <h2><?php the_title(); ?></h2>
              <h3><?php the_subtitle(); ?></h3>
            </a>
          </div>

          <!--<div class="badge">-->
          <!--  <span class="line-1">line 1</span>-->
          <!--  <span class="line-2">line 2</span>-->
          <!--  <span class="line-3">line 3</span>-->
          <!--</div>-->
        
      </div><?php
      $active = '';
      $i++;
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
  if(isset($_GET['secret']) && $_GET['secret'] == '1234'){
    $deviceclasses[] = 'secret-hack'   ;
  }
  if(isset($_GET['promo'])){
    if($_GET['promo'] == '1'){
    $deviceclasses[] = 'promo1'   ;  
    }else{
      $deviceclasses[] = 'promo2'   ;
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
  if($_SERVER['SERVER_ADDR'] == '45.56.104.172'){
    $mtime = filemtime('/srv/http/wordpress/edb.com/wp-content/themes/edb/index.php');
  }else{
  $mtime = filemtime('/srv/http/wordpress/production/wp-content/themes/edb-theme/index.php');  
  }
  if(!isset($mtime)){
    $mtime = time();
  }
  return $mtime;
  
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
       if($_SERVER['SERVER_ADDR'] == '45.56.104.172'){
          $_SERVER['PHP_AUTH_USER'] = 'ck_94fac53c2e52855c8967c6a34991bb462f0e553a';
          $_SERVER['PHP_AUTH_PW']   = 'cs_e252818ee207a1a6baa461401c64dcf772f2c0d1';  
       }else{
          $_SERVER['PHP_AUTH_USER'] = 'ck_dbc3f91b5f982189037625df93c50393ad99592b';
          $_SERVER['PHP_AUTH_PW']   = 'cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1';  
       }
       
       
       
     }
    
  // }
  
  // write_log($_SERVER['HTTP_AUTHORIZATION']);
  // write_log($_SERVER);
  // write_log($_SERVER['REDIRECT_HTTP_AUTHORIZATION']);
}




// // Load our function when hook is set
// add_action( 'pre_get_posts', 'edb_translate_query' );
// // Create a function to excplude some categories from the main query
// function edb_translate_query( $query ) {
//   // Check if on frontend and main query is modified
//     if ( ! is_admin() && $query->is_main_query() && $query->query_vars['attachment'] != 'register-site-seal.gif') {
//         $request_uri = $_SERVER['REQUEST_URI'];
//         $parsed = explode('/',$request_uri);
//         if($parsed[1] == 'fr'){
//           if($parsed[2] == 'categorie-produit'){
            
//             $query->set('product_cat',$parsed[count($parsed) - 2]);
            
//           }
//         }
//         write_log($query);
        
//         write_log($parsed);
//     } // end if
// }

function edb_add_seo_paging(){
  if(is_shop()){
  global $wp_query;
  $lang =WPGlobus::Config()->language;
  $base = 'https://elementdebase.com/';
  if($lang == 'fr'){
    $base .= $lang . "/";
  }
  $page = $wp_query->query_vars['paged'];
  if($page == 0 ) $page = 1;
  $previous = $page > 1 ? $page - 1 : 0;
  $next = $page + 1;
  $last = $wp_query->max_num_pages;
  
  if($previous > 0){
    echo '<link rel="prev" href="'.$base.'shop/page/'.$previous.'" />';
  }
  if( $next <= $last){
    echo '<link rel="next" href="'.$base.'shop/page/'.$next.'" />';  
  }  
  }
  
  // write_log();
  // $wprewrite = $GLOBALS['wp_rewrite'];
  // $wprules = $wprewrite['rules'];
  // $wprules['product-category/(.+?)/?$'] = 'index.php?product_cat=$matches[1]';
  // $GLOBALS['wp_rewrite']['rules'] = $wprules;
  
  
  
}
add_action('wp_head','edb_add_seo_paging');
remove_action( 'wp_head', 'feed_links_extra', 3 ); // Display the links to the extra feeds such as category feeds
remove_action( 'wp_head', 'feed_links', 2 ); // Display the links to the general feeds: Post and Comment Feed
remove_action( 'wp_head', 'rsd_link' ); // Display the link to the Really Simple Discovery service endpoint, EditURI link
remove_action( 'wp_head', 'wlwmanifest_link' ); // Display the link to the Windows Live Writer manifest file.
remove_action( 'wp_head', 'index_rel_link' ); // index link
remove_action( 'wp_head', 'parent_post_rel_link', 10, 0 ); // prev link
remove_action( 'wp_head', 'start_post_rel_link', 10, 0 ); // start link
remove_action( 'wp_head', 'adjacent_posts_rel_link', 10, 0 ); // Display relational links for the posts adjacent to the current post.
remove_action( 'wp_head', 'wp_generator' ); // Display the XHTML generator that is generated on the wp_head hook, WP version
remove_action( 'wp_head', 'wc_products_rss_feed' );


function edb_disabled_feed() {
  wp_die( __('No feed available,please visit our <a href="'. get_bloginfo('url') .'">homepage</a>!') );
}

add_action('do_feed', 'edb_disabled_feed', 1);
add_action('do_feed_rdf', 'edb_disabled_feed', 1);
add_action('do_feed_rss', 'edb_disabled_feed', 1);
add_action('do_feed_rss2', 'edb_disabled_feed', 1);
add_action('do_feed_atom', 'edb_disabled_feed', 1);
add_action('do_feed_rss2_comments', 'edb_disabled_feed', 1);
add_action('do_feed_atom_comments', 'edb_disabled_feed', 1);


function edb_set_ga_user( $user_login, $user ){
  set_transient( $user->ID, '1', 0 );
  
  // ga('set', 'userId', {{USER_ID}}); // Set the user ID using signed-in user_id.
}
add_action('wp_login','edb_set_ga_user', 10, 2);

function edb_set_ga_user_in_footer(){
  $current_user = wp_get_current_user();
  if( is_user_logged_in() && get_transient( $current_user->ID ) ){
    delete_transient( $current_user->ID );
    $id = $current_user->ID;
    echo "<script type='text/javascript'>jQuery(function(){ga('set', 'userId', '$id'); })</script>";
  }
}
add_action('wp_footer','edb_set_ga_user_in_footer');

function fix_language_page_links( $url, $post, $leavename ) {
  // write_log('GABA');
  // write_log('GABA');
  // write_log('GABA');
  if(is_admin()){
    return $url;
  }
  $parts = parse_url($url);
  $not_translated = array('/about-privacy','/about-terms', '/in-the-press');
  
  $lang =WPGlobus::Config()->language;
  if(isset($parts['path']) && in_array($parts['path'], $not_translated)){
    return $url;
  }
  if ( $post->post_type == 'post' || $post->post_type == 'page' ) {
    // write_log( "got: $url" );
    $links_to = get_post_meta( $post->ID, '_links_to', true );

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


function send_order_tool_email(){
  if ( isset($_POST) && isset($_POST['send_order_email'])) {
    $order_id = $_POST['send_order_email'];
    $mailer = WC()->mailer();
    $mails = $mailer->get_emails();
    if ( !empty( $mails ) ) {
        foreach ( $mails as $mail ) {
            if ( $mail->id == 'customer_invoice' ) {
              
              $out = $mail->trigger( $order_id );
              echo json_encode( array('sent'=>'ok', 'out' => $mail ) );              
              
            }
         }
    }
  }
  die();
}

add_action( 'wp_ajax_send_order_tool_email', 'send_order_tool_email' );


function subscribe_to_newsletter() {
 
    // The $_REQUEST contains all the data sent via ajax
    
    if ( isset($_REQUEST) ) {
        $email = $_REQUEST['email'];
        $lang = WPGlobus::Config()->language;
        if(!empty($email)){
          $mailchimp_base = "https://us13.api.mailchimp.com/3.0";
          $newsletter_list_id = '3a4f281572';
          $apiKey='95a6322f4c1d11a7c2f455f84f4b7135-us13';
          $mailchimp_list = "$mailchimp_base/lists/$newsletter_list_id/members/";
          $data = array( 
            
            'email_address' => $email, 'status' => 'subscribed', 'merge_fields' => array('MC_LANGUAGE' => $lang ),
            'ip_signup' => $_SERVER['REMOTE_ADDR'],
                'timestamp_signup' => $_SERVER['REQUEST_TIME']

            );
          
          
          $response = wp_remote_post($mailchimp_list,array(
            'method' => 'POST',
            'headers' => array(
                'Content-Type' => 'application/json',
                'Authorization' => 'apikey ' . $apiKey,
            ),
            'body'=>json_encode( $data )
          ));
          $responseBody = json_decode($response['body'], true);
          
          if(isset($response['response']) && isset($response['response']['code']) && $response['response']['code']  == 200){
            $message_fr = "Merci pour votre inscription. $email est maintenant abonné.<br/><br/>Utilisez le code promo: <code>infolettre10</code> pour obtenir 10% de rabais* sur votre prochain achat.<br/><br/><small>*valide sur les articles à prix regulier. Les articles déjà soldés ne sont pas admisibles à une escompte additionnelle.</small>";
            $message_en = "Thank you! $email has been subscribed. <br /><br/>Use promo code: <code>newsletter10</code> to obtain a 10% rebate* on your next purchase.<br/><br/>*valid on regular items, sale items do not benefit from an additional discount.";
            echo json_encode( array('message' => WPGlobus_Core::text_filter( "{:en}$message_en{:}{:fr}$message_fr{:}", WPGlobus::Config()->language ) ) );  
          }else{
            if(isset($responseBody['title']) && $responseBody['title'] == 'Member Exists'){
              $message_fr = "$email est déja abonné.<br/><br/> Utilisez le code promo : <code>infolettre10</code> pour obtenir 10% de rabais* sur votre prochain achat.<br/><br/>*valide sur les articles à prix regulier. Les articles déjà soldés ne sont pas admisibles à une escompte additionnelle.";
              $message_en = "Thank you! $email was already subscribed.<br/><br/> Use promo code: <code>newsletter10</code> to obtain a 10% rebate* on your next purchase.<br/><br/>*valid on regular items, sale items do not benefit from an additional discount.";
              echo json_encode( array('message' => WPGlobus_Core::text_filter( "{:en}$message_en{:}{:fr}$message_fr{:}", WPGlobus::Config()->language ) ) );    
            }else{
              echo json_encode( array('error' => true, 'message' => WPGlobus_Core::text_filter( "{:en}Oops! something went wrong, please try again later. {:}{:fr}Oops! Quelquechose n'a pas fonctionné. Réessayez plus tard.{:}", WPGlobus::Config()->language ) ) );  
            }
            
          }
          
          
        }
        
        
        
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
    // write_log( $result);
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


// function edb_get_coupon_overall_discount_total( $coupon ){
//   global $wpdb;
//   $wc_coupon = new WC_Coupon($coupon);
//   if(!empty($wc_coupon)){
//     $coupon = $wc_coupon->code;
//   }
//   $coupon_total_query = "SELECT SUM(pm.meta_value) FROM wp_woocommerce_order_items as p,wp_woocommerce_order_itemmeta as pm WHERE  p.order_item_type='coupon' and p.order_item_name='$coupon' AND pm.order_item_id AND pm.order_item_id=p.order_item_id AND pm.meta_key='discount_amount';";
  
//   $results = $wpdb->get_var($coupon_total_query);
//   return abs($results);
// }

function _edb_get_email_credit_coupon_code( $email ){
  // $user = get_user_by( 'email', $email );
  if(!empty($email)){
    $coupon_name_query = sprintf("SELECT post_title FROM wp_posts WHERE post_type='shop_coupon' AND post_excerpt='%s' LIMIT 1;",$email);
    $results = $wpdb->get_var($coupon_name_query);
    return $results;
  }
  return null;
}



function edb_get_coupon_credit_total( $coupon ){
  global $wpdb;
  $wc_coupon = new WC_Coupon($coupon);
  if(!empty($wc_coupon)){
    $coupon = $wc_coupon->code;
  }
  #$coupon_order_ids = "SELECT DISTINCT oi.order_id FROM wp_woocommerce_order_items AS oi LEFT  JOIN  wp_posts AS p ON p.ID=oi.order_id LEFT JOIN wp_woocommerce_order_itemmeta AS om ON om.order_item_id=oi.order_item_id WHERE oi.order_item_name='$coupon' and p.post_status IN ('wc-processing','wc-completed')";
  $results = $wpdb->get_results($coupon_order_ids, ARRAY_A );
  $orders = array();
  foreach( $results as $result ){
    $orders[]=$result['order_id'];
  }
  if(empty( $orders )) return 0;
   #$credit_query = "SELECT SUM(pm.meta_value)*0.1 FROM wp_woocommerce_order_items as p,wp_woocommerce_order_itemmeta as pm WHERE p.order_item_id = pm.order_item_id AND p.order_id IN (".implode(',',$orders).") AND pm.meta_key='_line_total' AND p.order_item_type='line_item'";
  
  $result = $wpdb->get_var($credit_query);
  return abs($result);
  
}


function edb_get_customer_personal_coupon( ){
  global $wpdb;
  $current_user = wp_get_current_user();
  if(!empty($current_user)){
    return edb_get_personal_coupon_by_email($current_user->user_email);
  }
  return null;  
}

// function test_edb_affiliates(){
//   write_log('EDB AFFILIATES');
//   write_log( edb_user_personal_coupon_info_for_email('mtlqrf@gmail.com') );
// }

// add_action('init','test_edb_affiliates');

function edb_coupon_discount_amount($discount, $discounting_amount, $cart_item, $single, $coupon){
  $deco = edb_decorated_product($cart_item['variation_id']);
  $coupon_code = $coupon->code;
  $coupon_post = get_post( $coupon->id );
  $email = $coupon_post->post_excerpt;
  if(empty($email)) return $discount;
  if(!filter_var($email,FILTER_VALIDATE_EMAIL) ) return $discount;
  
  
  
  // write_log("//////$coupon_code/////");
  
  if($deco->is_on_sale){
    // apply regular price discount on sale item 
    
    // if($coupon_code == 'edb20'){
    //   write_log('///GABA');
    //   write_log($deco->regular_price);
    //   $discount = $deco->regular_price * 0.2;
    // }else{
      return 0;  
    // }
    
  }
  return $discount;
}

add_action( 'manage_product_posts_custom_column', 'edb_product_column_name', 10, 2 );

function edb_product_column_name( $column, $postid ) {
    $deco = edb_decorated_product( $postid );
    if ( $column == 'name' ) {
        echo "(".$deco->system_name.")";
    }
}

add_filter('woocommerce_coupon_get_discount_amount', 'edb_coupon_discount_amount',10,5);

// function edb_current_user_has_personal_coupon(){
//   $personal_coupon = edb_get_customer_personal_coupon();
//   return !empty( $personal_coupon );
// }

// function edb_is_personal_coupon_code( $code ){
  
// }

// function edb_get_credits_used_for_email( $email ){
//   global $wpdb;
//   $user = get_user_by( 'email', $email );
//   if(empty($user)) return 0;
//   $info = edb_user_personal_coupon_info_for_email( $email );
//   if(empty($info)) return 0;
//   $code = $info['code'];
//   // $credits_used = get_user_meta( $user->ID, '_edb_credits_used', true  );
//   // $credits_used_query = "SELECT sum(om.meta_value) FROM wp_woocommerce_order_items AS oi INNER JOIN wp_posts as p ON p.ID=oi.order_id INNER JOIN wp_woocommerce_order_itemmeta AS om ON oi.order_item_id=om.order_item_id WHERE  oi.order_id=37086 AND oi.order_item_name='$code credit' AND om.meta_key='_line_total' AND p.post_status IN ('wc-processing','wc-completed');";
//   $credits_used = $wpdb->get_var($credits_used_query);
//   if(empty($credits_used)) return 0;
//   return abs($credits_used);
// }


// function edb_user_personal_coupon_info_for_email( $email ){
//   $code = edb_get_personal_coupon_for_email( $email );
//   if(empty($code)) return null;
//   $userId = get_user_by( 'email', $email )->ID;
//   $credits_total=edb_get_coupon_credit_total( $code );
//   $credits_used=edb_get_credits_used_for_email( $email );
//   $points_available=$credits_total-$credits_used;
//   return array(
//   'user_id'=> $userId,
//   'code'=>    $code,
//   'credits_total'=> $credits_total,
//   // credits used so far
//   'credits_used'=> $credits_used,
//   // credits total minus credits used
//   'points_available'=> $points_available
// ); 
// }

// function edb_current_user_personal_coupon_info(){
//   $current_user = wp_get_current_user();
//   if(empty($current_user)) return null;
//   return edb_user_personal_coupon_info_for_email( $current_user->user_email );
// }

add_filter('woocommerce_checkout_fields', 'edb_override_checkout_fields_order_notes');

function edb_override_checkout_fields_order_notes( $fields ){
  
  $fields['shipping']['shipping_note'] = array(
    'label'=> __('Shipping Note','edb'),
    'type'=>'textarea',
    'placeholder'=> __('Notes about your order.','edb'),
    'required'=>false,
    'class'=>array('form-row-wide'),
    'clear'=>true
  );
  return $fields;
}



// add_filter( 'pre_get_posts', 'catalog_filters' );
// function catalog_filters( $query ) {
//     if ( $query->is_main_query() && $query->post_type = 'product' ) {
//         if(isset($_GET['on_sale'])) {
//             $meta_query = array(
//                 'relation' => 'OR',
//                 array( // Simple products type
//                 'key' => '_sale_price',
//                 'value' => 0,
//                 'compare' => '>',
//                 'type' => 'numeric'
//                 ),
//                 array( // Variable products type
//                 'key' => '_min_variation_sale_price',
//                 'value' => 0,
//                 'compare' => '>',
//                 'type' => 'numeric'
//                 )
//             ); 
//             $query->set('meta_query', $meta_query); 
//         }
//         if(isset($_GET['bestsellers'])) {
//             $meta_query     = array(
//             array( 
//                 'key'           => 'total_sales',
//                 'value'         => 0,
//                 'compare'       => '>',
//                 'type'          => 'numeric'
//                 )
//             );
//         }
//     }

// return $query;
// }


// write_log('CURRENT USER COUPON: '  );
// write_log(edb_current_user_personal_coupon_info());


function get_order_ids_using_coupon_code( $code ){
  global $wpdb;
  $ids=array();
  $query =sprintf("SELECT DISTINCT items.order_id FROM wp_woocommerce_order_itemmeta as meta INNER JOIN wp_woocommerce_order_items AS items  ON meta.order_item_id = items.order_item_id WHERE items.order_item_name='%s'" ,$code);
  $results = $wpdb->get_results( $query );
  foreach( $results as $result ){
    $ids[] = $result->order_id;
  }
  return $ids;  
}

function get_points_spent_for_coupon_code( $code ){
  global $wpdb;
  $total = 0;
  $query = sprintf( "SELECT meta.meta_value FROM wp_woocommerce_order_itemmeta as meta INNER  JOIN wp_woocommerce_order_items as items  ON meta.order_item_id =items.order_item_id WHERE items.order_item_name='$code credit' AND meta.meta_key='_line_total'",$code);
  $results = $wpdb->get_results( $query );
  foreach( $results as $result ){
    $total += abs( $result->meta_value );
  }    
  return $total;
}

function get_order_creditable_total( $order_id ){
  global $wpdb;
  $total=0;
  if(is_array($order_id)){
    foreach( $order_id as $id ){
      $total+=get_order_creditable_total( $id );
    }
  }else{
  
    $query = sprintf("SELECT meta.meta_value FROM wp_woocommerce_order_itemmeta as meta INNER  JOIN wp_woocommerce_order_items as items  ON meta.order_item_id =items.order_item_id WHERE items.order_id=%d AND meta.meta_key='_line_total'",$order_id);
    $results = $wpdb->get_results( $query );
    foreach( $results as $result ){
      $total += abs( $result->meta_value );
    }    
  }

  return $total;  
}

function get_points_coupon_for_email( $email ){
  global $wpdb;
  if(!empty($email)){
  $query = sprintf("SELECT post_title FROM wp_posts WHERE post_type='shop_coupon' AND post_excerpt='%s';", $email);
    $results = $wpdb->get_var($query);
    return $results;
  }
  return null;  
}

function get_user_for_coupon_code( $code ){
    global $wpdb;
    if(!empty($code)){
    $query = sprintf("SELECT post_excerpt FROM wp_posts WHERE post_type='shop_coupon' AND post_title='%s';", $code);
      $email = $wpdb->get_var($query);
      return get_user_by('email', $email );
    }
    return null;  
}




function get_points_info_for_coupon_code( $code ){
  $ids = get_order_ids_using_coupon_code( $code );
  $info = array();
  $user = get_user_for_coupon_code( $code );
  $creditable_total = 0;
  if(count($ids) > 0){
    $creditable_total = get_order_creditable_total( $ids );
  }
  $points_accumulated = 0.1*$creditable_total;
  $points_spent = get_points_spent_for_coupon_code($code);//get_user_meta( $user->ID, '_edb_points_spent', true );
  // $credits_given = get_user_meta( $user->ID, '_edb_manual_credit', true );
  $info['coupon_code'] = $code;
  $info['creditable_user_id'] = $user->ID;
  $info['creditable_user_email'] = $user->user_email;
  $info['creditable_total'] = $creditable_total;
  $info['points_accumulated'] = $points_accumulated;
  $info['points_spent'] = empty($points_spent) ? 0 : $points_spent;
  $info['points_available'] = ($points_accumulated - $points_spent);
  return $info;
}


function export_material_data(){
  // if($_SERVER['REQUEST_URI'] !== '/'){
  //   return;
  // }
  global $wpdb;
  $material_posts = 'SELECT pm.post_id,pm.meta_key,pm.meta_value FROM wp_postmeta AS pm WHERE pm.meta_key LIKE "%edb_material"';
  $results = $wpdb->get_results( $material_posts , ARRAY_A );
  $materialized = array();
  foreach($results as $result ){
    $material_no = $result['meta_value'];
    
    $type = ( $result['meta_key'] == 'attribute_edb_material' ? 'product' : 'description' );
    
    if(!isset($materialized[$material_no])){
      $materialized[$material_no] = array();
    }
    $materialized[$material_no]['material_no'] = $material_no;
    if(!isset($materialized[$material_no]['products'])){
      $materialized[$material_no]['products'] = array();  
    }
    if($type == 'product'){
      $materialized[$material_no]['products'][] = $result['post_id'];
      
    }else{
      $description = array();
      $thumb_id = get_post_thumbnail_id($result['post_id']);
      $thumb_url_array = wp_get_attachment_image_src($thumb_id, 'full', true);
      $thumb_url = $thumb_url_array[0];
      $post = get_post($result['post_id']);
      
      if(!empty($post)){
        $description['title'] = $post->post_title;
        $description['subtitle'] = get_post_meta($result['post_id'], '_subtitle', true );
      
        $description['body'] = $post->post_excerpt;
        $description['image'] = $thumb_url;
        $description['material_no'] = $material_no;
        
      }
      $materialized[$material_no]['description'] = $description;  
      
    }
    
  }
  $JSON = json_encode($materialized);
  file_put_contents(get_stylesheet_directory().'/material_data.raw.json', $JSON);
  
  // echo get_stylesheet_directory().'/material_data.raw.json';
  // die();
  
}
// export_material_data();
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


// add_filter( 'manage_users_columns', 'edb_add_user_custom_column' );
// add_filter( 'manage_users_sortable_columns', 'edb_add_user_custom_column' );
 
// function edb_add_user_custom_column( $columns ) {
//     $new_columns = $columns + array( 'affiliate_coupon' => 'Credit Coupon' );
//     return $new_columns;
// }

// add_action( 'manage_users_custom_column', 'edb_show_user_custom_column_content', 10, 3);
 
// function edb_show_user_custom_column_content( $value, $column_name, $user_id ) {
//   if ( 'affiliate_coupon' == $column_name ){
//     $user = get_user_by('id', $user_id );
//     $info = edb_user_personal_coupon_info_for_email( $user->user_email );
//     if(empty($info)) return $value;
//     $code = $info['code'];
//       $gain = $info['credits_total'];
//       $used = $info['credits_used'];
//       $avail = $info['points_available'];
//     return "code: <b>$code:</b>\n gain: <b>$$gain</b>\n used: <b>$$used</b>\n left: <b>$$avail</b>";
    
     
//   }

//   return $value;
// }

function create_inspiration_posttype() {
  register_post_type( 'inspiration',
    array(
      'labels' => array(
        'name' => __( 'Inspirations', 'edb' ),
        'singular_name' => __( 'Inspiration', 'edb' )
      ),
      'public' => true,
      'has_archive' => false,
      
      'menu_position' => 20,
      'menu_icon' => 'dashicons-admin-page',
      'supports' => array( 'title', 'excerpt', 'thumbnail','editor' )
      
    )
  );
}
add_action( 'init', 'create_inspiration_posttype' );




function edb_check_cart_updated(){
  write_log('CART UPDATED');
}
add_action('woocommerce_cart_updated', 'edb_check_cart_updated');

add_action( 'init', 'set_php_auth_header'  );
add_action( 'admin_init', 'set_php_auth_header'  );

// add_action('init', 'nocache_headers');
// require get_template_directory() . '/edb_slideshow.php';
/**
 * */
 require get_template_directory() . '/seo.php';
 
 /**
 * */
 require get_template_directory() . '/trkpxl.php';
 
 /**
 * */
 require get_template_directory() . '/cron.php';
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


add_filter('post_gallery', 'my_post_gallery', 10, 2);
function my_post_gallery($output, $attr) {
    global $post;

    if (isset($attr['orderby'])) {
        $attr['orderby'] = sanitize_sql_orderby($attr['orderby']);
        if (!$attr['orderby'])
            unset($attr['orderby']);
    }

    extract(shortcode_atts(array(
        'order' => 'ASC',
        'orderby' => 'menu_order ID',
        'id' => $post->ID,
        'itemtag' => 'dl',
        'icontag' => 'dt',
        'captiontag' => 'dd',
        'columns' => 3,
        'size' => 'thumbnail',
        'include' => '',
        'exclude' => ''
    ), $attr));

    $id = intval($id);
    if ('RAND' == $order) $orderby = 'none';

    if (!empty($include)) {
        $include = preg_replace('/[^0-9,]+/', '', $include);
        $_attachments = get_posts(array('include' => $include, 'post_status' => 'inherit', 'post_type' => 'attachment', 'post_mime_type' => 'image', 'order' => $order, 'orderby' => $orderby));

        $attachments = array();
        foreach ($_attachments as $key => $val) {
            $attachments[$val->ID] = $_attachments[$key];
        }
    }

    if (empty($attachments)) return '';

    // Here's your actual output, you may customize it to your need
    $output = "<div class=\"gallery\">\n";
    
    

    // Now you loop through each attachment
    foreach ($attachments as $id => $attachment) {
        // Fetch the thumbnail (or full image, it's up to you)
//      $img = wp_get_attachment_image_src($id, 'medium');
//      $img = wp_get_attachment_image_src($id, 'my-custom-image-size');
        $img = wp_get_attachment_image_src($id, 'full');
        $caption = mysql2date('m - j - Y', $post->post_date);
        $output .= "<div class='gallery-item bleh' style='background-image:url(\"".$img[0]."\"');''>\n";
        $output .= "<img src=\"{$img[0]}\" width=\"{$img[1]}\" height=\"{$img[2]}\" alt=\"$caption\" />\n";
        $output  .= "<p class='gallery-item-caption'>$caption</p>";
        $output .= "</div>\n";
    }


    $output .= "</div>\n";

    return $output;
}

add_action( 'admin_menu', 'edb_delivery_manager_register' );

function edb_delivery_manager_register()
{
    add_menu_page(
        'Delivery Manager',     // page title
        'Delivery Manager',     // menu title
        'manage_options',   // capability
        'delivery-manager',     // menu slug
        'edb_delivery_manager_render', // callback function
        null,
        59
    );
}



function edb_delivery_manager_render()
{
    // global $title;

    // print '<div class="wrap">';
    // print "<h1>$title</h1>";

    $file = plugin_dir_path( __FILE__ ) . "delivery-admin.php";

    if ( file_exists( $file ) ){
      require $file;
    }else{
      echo $file;
    }
    
    // print "<p class='description'>Included from <code>$file</code></p>";
    // print '</div>';
    
}

// function edb_create_current_order(){
//   global $woocommerce;
//   $user = get_current_user_id();
//   write_log($woocommerce);
// }

// add_action('woocommerce_checkout_process', 'edb_handle_partial_payment_form');

function edb_handle_partial_payment_form($checkout) {
    /**
    * At this point, $_GET/$_POST variable are available
    *
    * We can do our normal processing here
    */
    
    
    
    // do_action('woocommerce_init');
    // $return_to = $_SERVER['HTTP_REFERER'];
    // $email = isset( $_POST['email'] ) && !empty($_POST['email']) ? $_POST['email'] : null;
    // $phone = isset( $_POST['phone'] ) && !empty($_POST['phone']) ? $_POST['phone'] : null;
    

    // var_dump(WC()->cart);
    // exit;
    // // edb_create_current_order();
    // // echo "<pre>";
    // // var_dump(WC()->order_factory->get_order());
    // // echo "</pre>";
    // // $order_id = isset( $_POST['order_id'] ) ? $_POST['order_id'] : null;
    // if( !empty($email) && !empty($phone) && !empty($order_id)){
    //   // $order = new WC_Order($order_id);
    //   // $order->update_status('pending', 'partial payment requested on '.date('l jS \of F Y h:i:s A'));
    //   // wp_safe_redirect( $return_to."&complete=1" );
      
    // }else{
    //   wp_safe_redirect( $return_to ) ;
    // }
    
    // die();

    // Sanitize the POST field
    // Generate email content
    // Send to appropriate email
}

// add_action( 'admin_post_nopriv_partial_payment', 'edb_handle_partial_payment_form' );
// add_action( 'admin_post_partial_payment', 'edb_handle_partial_payment_form' );



function edb_delivery_manager_scripts( $hook ){
  
  if($hook = 'toplevel_page_delivery-manager'){
    wp_register_style( 'edb_delivery_manager_css', get_template_directory_uri() . '/edb-delivery-manager.css', false, '1.0.0' );
    wp_enqueue_style('edb_delivery_manager_css');
    wp_enqueue_script( 'edb_delivery_manager', get_template_directory_uri() . '/js/edb-delivery-manager.js', array('jquery') );
  }
  
}

function cc_mime_types($mimes) {
  $mimes['svg'] = 'image/svg+xml';
  return $mimes;
}

add_filter('upload_mimes', 'cc_mime_types');

function fix_svg() {
   echo '<style type="text/css">
         .attachment-266x266, .thumbnail img { 
              width: 100% !important; 
              height: auto !important; 
         }
         </style>';
}






add_action('admin_head', 'fix_svg');

add_action('admin_enqueue_scripts', 'edb_delivery_manager_scripts');


function edb_remove_covers_from_search( $query ) {

   if (!is_admin() && $query->is_main_query() && $query->is_search()) {

       $query->set( 'post_type', array( 'product' ) );


       $tax_query = array(

           array(

               // likely what you are after

               'taxonomy' => 'product_cat',

               'field'   => 'slug',

               'terms'   => array('slipcovers','slipcovers-2-seater','slipcovers-3-seater','slipcovers-sofa-beds','slipcovers-left-facing'),

               'operator' => 'NOT IN',

           ),

       );

       $query->set( 'tax_query', $tax_query );

  }

}

add_action( 'pre_get_posts', 'edb_remove_covers_from_search' );



require get_template_directory() . '/edb-product-ext.php';
require get_template_directory() . '/edb-designers.php';
require get_template_directory() . '/edb-reviews.php';
require get_template_directory() . '/edb-press-reviews.php';
require get_template_directory() . '/edb-blog.php';
require get_template_directory() . '/edb-faq.php';


// require get_template_directory() . '/material-manager.php';

// function test_fee_edb(){
//   $order = new WC_Order( 37174 );
//   foreach( $order->get_fees() as $fee){
//     if($fee['name'] == 'credit'){
      
//     }
//   }
// }
// add_action('init','test_fee_edb');

//SELECT SQL_CALC_FOUND_ROWS `order_item_id`, `order_item_name`, `order_item_type`, `order_id` FROM wp_woocommerce_order_items WHERE order_item_type='coupon' AND order_item_name='franko15';
//2200  37045
//SELECT SQL_CALC_FOUND_ROWS `meta_id`, `order_item_id`, `meta_key`, `meta_value` FROM wp_woocommerce_order_itemmeta WHERE order_item_id="2200";
