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
  <!--<script src="//cdn.jsdelivr.net/fingerprintjs2/1.1.0/fingerprint2.min.js"></script>-->
  <script src="//use.typekit.net/osv5fru.js"></script>
  <script>try{Typekit.load();}catch(e){}</script>
  
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
<meta name="theme-color" content="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
  
<div id="page" class="site">
  <header id="masthead">
      <div class="inner">
      <a id="logo" href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a>
      <p id="description">
        <?php
        $description = get_bloginfo( 'description', 'display' );
        if ( $description || is_customize_preview() ) : ?>
          <?php echo $description; /* WPCS: xss ok. */ ?>
        <?php
        endif; ?>
      </p>
      <nav id="site-nav">
        <?php if ( is_user_logged_in() ) : ?>
        <?php $current_user = wp_get_current_user(); ?>
        <a class="logout" href="<?php echo wp_logout_url( home_url('/') ); ?>">Welcome <b><?php echo $current_user->user_nicename; ?></b>, <?php _e('sign out', 'edb'); ?></a>
        <?php else: ?>
        <a class="login" href="<?php echo esc_url(home_url('/')); ?>sign-in"><?php _e('Sign in', 'edb'); ?></a>
        <?php endif; ?>
        <a class="cart" href="<?php echo esc_url(home_url('/')); ?>cart">
          <?php _e('Cart', 'edb'); ?>
          <?php if ( WC()->cart->get_cart_contents_count() > 0 ) { echo '<span id="cart-item-counter" class="semi-bold">' . WC()->cart->get_cart_contents_count() . '</span>'; } ?>
        </a>
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
        foreach($maincats as $main){
          if ( strtolower($main->name) !== 'lookbook' ) {
            echo "<li>";
            $subcats = get_terms( 'product_cat', array( 'parent' => $main->term_id, 'hide_empty' => false ) );
            if( !empty($subcats)){
              echo '<a class="toggle" href="#">' . __( $main->name, 'edb') . '</a>';
              echo '<ul class="subnav">';
              foreach($subcats as $sub){
                echo '<li><a href="' . get_term_link( $sub ) . '" title="' . sprintf( __( 'View all post filed under %s', 'edb' ), $sub->name ) . '">'.__( $sub->name , 'edb' ).'</a></li>';
              }
              echo '<li><a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all post filed under %s', 'edb' ), $main->name ) . '">'.__( 'all', 'edb' ).'</a></li>';
              echo "</ul>";
            }else{
              echo '<a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all %s', 'edb' ), $main->name ) . '">' . __( $main->name, 'edb') . '</a>';
            }
            echo "</li>";
          }
        }
      ?>
      <li><a href="/shop" title="Shop Around">all</a></li>
    </ul></nav>
    <div id="sign-in-menu">
      <p class="welcome"><?php _e('Welcome', 'edb');?></p>
      <div class='sign-in'>
        <a href="#" class="choices signin">
          <?php _e('Returning customers<br />Please sign in', 'edb'); ?>
          <span class="icon-chevron-lite-right-white"></span>
        </a>
        <a href="#" class="choices signup">
          <?php _e('New customers<br />Sign up for shopping<br />and exclusive offers', 'edb'); ?>
          <span class="icon-chevron-lite-right-white"></span>
        </a>
      </div>

      <!-- form login -->
      <div class="login-form">
        <p><?php _e('Returning customers<br />Please sign in', 'edb'); ?></p>
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
            <span class="valign"><?php _e('enter edb', 'edb'); ?></span>
            <input class="valign icon-arrow-lite-right-white" type="submit"  name="login" value="<?php _e( 'Login', 'edb' ); ?>" />
            <input name="rememberme" type="checkbox" id="rememberme" value="forever" class="hide" checked="checked" />
          </p>
          <a href="<?php echo esc_url(home_url('/')); ?>my-account/lost-password" class="lost-password alignright"><?php _e('> Click here to recover lost password', 'edb'); ?></a>
          <?php do_action( 'woocommerce_login_form_end' ); ?>
        </form>
      </div>

      <!-- form register -->
      <div class="register-form">
        <p><?php _e('New customers sign up for shopping<br />and exclusive offers', 'edb'); ?></p>
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
            <span class="valign"><?php _e('sign up to edb', 'edb'); ?></span>
            <input type="submit" class="valign icon-arrow-lite-right-white" name="register" value="<?php _e( 'Register', 'edb' ); ?>" />
          </p>
          <?php do_action( 'woocommerce_register_form_end' ); ?>
        </form>
      </div>

      <!-- close menu -->
      <p class="back-home">
        <span class="valign"><?php _e('Back', 'edb'); ?></span>
        <a class="buttons valign icon-arrow-lite-left-white"></a>
      </p>
    </div>
        
      </div><!-- inner -->
  </header>
  <!--
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'edb' ); ?></a>

-->
	<div id="content" class="site-content">
