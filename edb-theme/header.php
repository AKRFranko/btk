<?php
/**
 * The header for our theme.
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package edb
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
  
  <script src="//use.typekit.net/osv5fru.js"></script>
  <script>try{Typekit.load();}catch(e){}</script>
  
  <?php facebook_meta_tags(); ?>
  <?php edb_seo_meta_tags(); ?>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
<meta name="theme-color" content="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<!--<meta http-equiv="cache-control" content="max-age=0" />-->
<!--<meta http-equiv="cache-control" content="no-cache" />-->
<!--<meta http-equiv="expires" content="0" />-->
<!--<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />-->
<!--<meta http-equiv="pragma" content="no-cache" />-->
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<link rel="apple-touch-icon" href="<?php echo get_template_directory_uri();?>/img/device-icons/icon-48x48.png">
<link rel="apple-touch-icon" sizes="72x72" href="<?php echo get_template_directory_uri();?>/img/device-icons/icon-72x72.png">
<link rel="apple-touch-icon" sizes="96x96" href="<?php echo get_template_directory_uri();?>/img/device-icons/icon-96x96.png">
<link rel="apple-touch-icon" sizes="144x144" href="<?php echo get_template_directory_uri();?>/img/device-icons/icon-144x144.png">
<link rel="apple-touch-icon" sizes="192x192" href="<?php echo get_template_directory_uri();?>/img/device-icons/icon-192x192.png">

<!-- Tile icon for Windows 8 (144x144 + tile color) -->
<meta name="msapplication-TileImage" content="<?php echo get_template_directory_uri();?>/img/device-icons/icon-144x144.png">


<?php wp_head(); ?>
<script defer type="text/javascript" src="//cdn.callrail.com/companies/288406270/215e63ac1c14dcead16d/12/swap.js"></script>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>



</head>

<body <?php body_class( edb_body_classes() ); ?>>
  
<div id="page" class="site">
  <header id="masthead" itemscope itemtype="http://schema.org/LocalBusiness">
      <div class="inner">
        <h1 class="seo-title" itemprop="name" style="font-size:0px;"><?php edb_seo_heading('Élément de base'); ?></h1>
      <a id="logo" href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a>
      <p id="description">
        <?php
        $description = get_bloginfo( 'description', 'display' );
        if ( $description || is_customize_preview() ) : ?>
          <?php echo $description; /* WPCS: xss ok. */ ?>
        <?php
        endif; ?>
      </p>
      <?php if(isset($_GET['promo']) && $_GET['promo'] = '2'){ ?> 
      <div id="back-to-school-1" class="hidden">
        <h3 class="promo-title"><?php _e('BACK TO SCHOOL'); ?></h3>
        
        <p class="promo-text"><?php _e('Use coupon code <code>back15</code>, and save %15 on regular priced items.','edb'); ?></p>
        <div class="promo-timer"><?php edb_promo_ends_in_days(1475254056228); ?></div>
        
      </div>
      <?php }; ?>
      <nav id="site-nav">
        <a class="phone-number" href="tel:+18447386484" itemprop="telephone">1-844-738-6484</a>
        <?php if ( is_user_logged_in() ) : ?>
        <?php $current_user = wp_get_current_user(); ?>
        <?php _e('welcome', 'edb'); ?><a class="my-account" href="<?php echo get_permalink( get_option('woocommerce_myaccount_page_id') ); ?>"><b><?php echo $current_user->user_nicename; ?></b></a><a class="logout" href="<?php echo wp_logout_url( home_url('/') ); ?>"><?php _e('sign out', 'edb'); ?></a>
        <?php else: ?>
        <a class="login" href="<?php echo esc_url(home_url('/')); ?>login"><?php _e('sign in', 'edb'); ?></a>
        <?php endif; ?>
        <a class="cart" href="<?php echo esc_url(home_url('/')); ?>cart">
          <?php _e('cart', 'edb'); ?>
          <?php if ( WC()->cart->get_cart_contents_count() > 0 ) { echo '<span id="cart-item-counter" class="semi-bold">(' . WC()->cart->get_cart_contents_count() . ')</span>'; } ?>
        </a>
        
        <!--<select id="country-select"></select>-->
        <?php dynamic_sidebar( 'languages' ); ?>
        
        <a class="burger" href="#">#</a>
      </nav>
      <nav id="shop-nav">
        <?php 
        $menuParameters = array(
          'menu'=> 'hamburger',
          'container'       => false,
          'echo'            => false,
          'items_wrap'      => '%3$s',
          'depth'           => 0,
        );
       echo strip_tags(wp_nav_menu( $menuParameters ), '<a>' );
       ?>

      </nav>
      <nav id="cat-nav">
        <ul>
          
          
          
          
          
      <?php
        $maincats = get_terms( 'product_cat', array('get'=>'all', 'parent' => 0, 'hide_empty' => false) );
        $flatten = array('slipcovers');
        $ignore = array('benches-ottomans', 'headboards', 'storage');
        $standalone = array('accessories-rugs','accessories-ottomans');
        
        // var_dump( );
        foreach($maincats as $main){
          
          if( !in_array( $main->slug, $ignore )){
            
          
          
          if ( strtolower($main->slug) !== 'lookbook' &&  strtolower($main->slug) !== 'accessories') {
            echo "<li>";
            $subcats = get_terms( 'product_cat', array( 'parent' => $main->term_id, 'hide_empty' => false ) );
            foreach( $subcats as $sub ){
              if( in_array( $sub->slug, $standalone )  ){
                echo '<a href="' . get_term_link( $sub ) . '" title="' . sprintf( __( 'View all %s', 'edb' ), $sub->name ) . '">' . __( $sub->name, 'edb') . '</a></li><li>';
              }
            }
            if( in_array($main->slug,$flatten)){
              $subcats = array();
            }
            if( !empty($subcats)){
              echo '<a class="toggle" href="#">' . __( $main->name, 'edb') . '</a>';
              echo '<ul class="subnav">';
              $counts=0;
              foreach($subcats as $sub){
                if($sub->count > 0){
                  $counts++;
                  echo '<li><a href="' . get_term_link( $sub ) . '" title="' . sprintf( __( 'View all post filed under %s', 'edb' ), $sub->name ) . '">'.__( $sub->name , 'edb' ).'</a></li>';  
                }
                
              }
              if($counts > 0){
                echo '<li><a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all post filed under %s', 'edb' ), $main->name ) . '">'.__( 'all', 'edb' ).'</a></li>';  
              }
              echo "</ul>";
            }else{
              echo '<a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all %s', 'edb' ), $main->name ) . '">' . __( $main->name, 'edb') . '</a>';
            }
            echo "</li>";
          }else{
            if(is_wp_error($main->name)){
              write_log( 'WP_ERROR');
              write_log( 'WP_ERROR:header.php');
              write_log( $main );
            }else{
              
              if(strtolower($main->slug) === 'accessories'){
                echo '<li><a href="/product-category/ottomans/" title="' . sprintf( __( 'View all %s', 'edb' ), __('ottomans', 'edb') ) . '">' . __( 'ottomans', 'edb') . '</a></li>';
                echo '<li><a href="/product-category/accessories-rugs/" title="' . sprintf( __( 'View all %s', 'edb' ), __('rugs','edb') ) . '">' . __( 'rugs', 'edb') . '</a></li>';
                echo '<li><a href="/product-category/accessories-pillows/" title="' . sprintf( __( 'View all %s', 'edb' ), __('cushions','edb') ) . '">' . __( 'cushions', 'edb') . '</a></li>';
                echo '<li><a href="/product-category/accessories-other/" title="' . sprintf( __( 'View all %s', 'edb' ), __('accessories','edb') ) . '">' . __( 'accessories', 'edb') . '</a></li>';
                
              }  
            }
            
            
          }
          }
        }
      ?>
      <?php if(WPGlobus::Config()->language == 'en'){ ?>
      <li><a href="/shop" title="Shop Around"><?php _e('all','edb'); ?></a></li>
      <li><a style="color:#ff9999!important;" href="/shop?on_sale=1" title="On Sale"><?php _e('sale','edb'); ?></a></li>  
      <li><a style="color:#00ff33!important;" href="/shop?new=1" title="New Products"><?php _e('new','edb'); ?></a></li>  
      <?php }else{ ?>
      <li><a href="/fr/shop" title="Shop Around"><?php _e('all','edb'); ?></a></li>
      <li><a style="color:#ff9999!important;" href="/fr/shop?on_sale=1" title="On Sale"><?php _e('sale','edb'); ?></a></li
      <li><a style="color:#00ff33!important;" href="/fr/shop?new=1" title="New Products"><?php _e('new','edb'); ?></a></li>  >
      <?php }; ?>
      
      
      
    </ul></nav>
    <div id="sign-in-menu">
      <p class="welcome"><?php _e('welcome', 'edb');?></p>
      <div class='sign-in'>
        <a href="#" class="choices signin">
          <?php _e('returning customers<br />please sign in', 'edb'); ?>
          <span class="icon-chevron-lite-right-white"></span>
        </a>
        <a href="#" class="choices signup">
          <?php _e('new customers<br />sign up for shopping<br />and exclusive offers', 'edb'); ?>
          <span class="icon-chevron-lite-right-white"></span>
        </a>
      </div>

      <!-- form login -->
      <div class="login-form">
        <p><?php _e('returning customers<br />please sign in', 'edb'); ?></p>
        <form method="post" class="login" action="<?php echo esc_url(home_url('/')); ?>my-account">
          <?php do_action( 'woocommerce_login_form_start' ); ?>
          <p>
            <input id="username" name="username" type="text" class="input-text" value="" placeholder="<?php _e('email', 'edb'); ?>" />
            <label for="username"></label>
          </p>
          <p>
            <input id="password" name="password" type="password" class="input-text" value="" placeholder="<?php _e('password', 'edb'); ?>" />
            <label for="password"></label>
          </p>
          <?php do_action( 'woocommerce_login_form' ); ?>
          <p class="submit">
            <?php wp_nonce_field( 'woocommerce-login' ); ?>
            <!--<span class="valign"><?php _e('enter edb', 'edb'); ?></span>-->
            <input class="valign icon-arrow-lite-right-white" type="submit"  name="login" value="<?php _e( 'login', 'edb' ); ?>" />
            <input name="rememberme" type="checkbox" id="rememberme" value="forever" class="hide" checked="checked" />
          </p>
          <a href="<?php echo esc_url(home_url('/')); ?>my-account/lost-password" class="lost-password alignright"><?php _e('> click here to recover lost password', 'edb'); ?></a>
          <?php do_action( 'woocommerce_login_form_end' ); ?>
          <a href="#" class="back-to-choices"><?php _e('back', 'edb'); ?></a>
        </form>
      </div>

      <!-- form register -->
      <div class="register-form">
        <p><?php _e('new customers sign up for shopping<br />and exclusive offers', 'edb'); ?></p>
        <form method="post" action="<?php echo esc_url(home_url('/')); ?>my-account">
          <?php do_action( 'woocommerce_register_form_start' ); ?>
          <p>
            <label for="reg_email" class="hide"></label>
            <input type="email" class="input-text" name="email" id="reg_email" placeholder="<?php _e( 'email', 'edb' ); ?>" value="<?php if ( ! empty( $_POST['email'] ) ) echo esc_attr( $_POST['email'] ); ?>" />
          </p>
          <p>
            <label for="reg_password" class="hide"></label>
            <input type="password" class="input-text" name="password" id="reg_password" placeholder="<?php _e( 'password', 'edb' ); ?>" />
          </p>
              <p>
            <label for="reg_password2" class="hide"></label>
            <input type="password" class="input-text" name="password2" id="reg_password2" placeholder="<?php _e( 'confirm password', 'edb' ); ?>" />
          </p>
          <?php do_action( 'woocommerce_register_form' ); ?>
          <?php do_action( 'register_form' ); ?>
          <p class="submit">
            <?php wp_nonce_field( 'woocommerce-register' ); ?>
            <!--<span class="valign"><?php _e('sign up to edb', 'edb'); ?></span>-->
            <input type="submit" class="valign icon-arrow-lite-right-white" name="register" value="<?php _e( 'register', 'edb' ); ?>" />
          </p>
          <?php do_action( 'woocommerce_register_form_end' ); ?>
        </form>
        <a href="#" class="back-to-choices"><?php _e('back', 'edb'); ?></a>
      </div>

      <!-- close menu -->
      <!--<p class="back-home">-->
      <!--  <span class="valign"></span>-->
      <!--  <a class="buttons valign icon-arrow-lite-left-white"></a>-->
      <!--</p>-->
    </div>
        
      </div><!-- inner -->
  </header>

	<div id="content" class="site-content">
	  <?php if(isset($_GET['promo']) && $_GET['promo'] = '1'){ ?> 
	  <div id="back-to-school" >
      <h3 class="promo-title"><?php _e('BACK TO SCHOOL PROMO'); ?></h3>
      <div class="promo-timer"><?php edb_promo_ends_in_days(1475254056228); ?></div>
      <p class="promo-text"><?php _e('Use coupon code <code>back15</code>, and save %15 on regular priced items.','edb'); ?></p>
      <a href="#" class="promo-close"><?php _e('Ok, got it!'); ?></a>
    </div>
    <?php }; ?>
    
