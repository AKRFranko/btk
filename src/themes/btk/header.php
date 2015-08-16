<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package buteek
 */

$bkg_color = get_option('btk_background_color');
$text_color = get_option('btk_text_color');
if ( $bkg_color === '' ) { $bkg_color = '#000000'; }
if ( $text_color === '' ) { $text_color = '#fff'; }
?>

<!DOCTYPE html>
<html <?php language_attributes();?>>
<head>
<meta charset="<?php bloginfo('charset');?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo('pingback_url');?>">

<link rel="apple-touch-icon" sizes="57x57" href="/wp-content/themes/btk/img/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/wp-content/themes/btk/img/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/wp-content/themes/btk/img/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/wp-content/themes/btk/img/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/wp-content/themes/btk/img/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/wp-content/themes/btk/img/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/wp-content/themes/btk/img/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/wp-content/themes/btk/img/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/wp-content/themes/btk/img/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/wp-content/themes/btk/img/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/wp-content/themes/btk/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/wp-content/themes/btk/img/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/wp-content/themes/btk/img/favicon-16x16.png">


<?php wp_head();
global $current_user;
      get_currentuserinfo();
      
?>

<script src="//use.typekit.net/osv5fru.js"></script>
<script>try{Typekit.load();}catch(e){}</script>

<noscript><link href="/wp-content/themes/btk/icons/icons.fallback.css" rel="stylesheet"></noscript>

</head>

<body id="top" <?php body_class();?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php _e('Skip to content', 'btk'); ?></a>


	<!-- header -->
	<div id="header-box">
		<div class="container">
			<div class="row">
				<header id="masthead" class="site-header" role="banner">

					<!-- logo -->
					<h2 class="long-title alignleft lower">
						<a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
							<span class="title valign">élément<br />de<br />base</span>
						</a>
					</h2>

					<!-- navigation -->
					<div class="navigation alignright lower">
						<!-- menu header -->
						<?php if (!is_page('confirmation')) { ?>
						<nav class="nav-header" role="navigation">

							<div class="menu-header-container">
								<ul id="menu-header">
									<?php if ( is_user_logged_in() ) : ?>
									<li class="logout"><a href="<?php echo wp_logout_url( home_url('/') ); ?>">Welcome <b><?php echo $current_user->user_nicename; ?></b>, <?php _e('sign out', 'btk'); ?></a></li>
									<?php else: ?>
									<li class="login"><a href="<?php echo esc_url(home_url('/')); ?>sign-in"><?php _e('Sign in', 'btk'); ?></a></li>
									<?php endif; ?>
									<li><a href="<?php echo esc_url(home_url('/')); ?>cart"><?php _e('Cart', 'btk'); ?></a></li>
								</ul>
							</div>
							<?php if ( WC()->cart->get_cart_contents_count() > 0 ) { echo '<span class="semi-bold">' . WC()->cart->get_cart_contents_count() . '</span>'; } ?>
							<a class="language" href="<?php echo esc_url(home_url('/')); ?>">fr</a>
						</nav>
						<?php } ?>

						<!-- menu hamburger -->
						<nav class="nav-hamburger navbar valign" role="navigation">
							<div class="navbar-header">
								<a class="navbar-toggle collapsed loading" data-toggle="collapse" data-target="#nav-hamburger">
									<span class="sr-only"><?php _e('Toggle navigation', 'btk'); ?></span>
									<span class="fa fa-bars"></span>
								</a>
							</div>

							<div>
	    						<div class="collapse navbar-collapse" id="nav-hamburger">
								<?php wp_nav_menu(array('menu' => 'hamburger')); ?>
								</div>

								<div class="woo-categories">
									<ul>
									<?php
										$maincats = get_terms( 'product_cat', array('get'=>'all', 'parent' => 0, 'hide_empty' => false) );
										foreach($maincats as $main){
											if ( strtolower($main->name) !== 'lookbook' ) {
												echo "<li>";
												$subcats = get_terms( 'product_cat', array( 'parent' => $main->term_id, 'hide_empty' => false ) );
												if( !empty($subcats)){
													echo '<a class="toggle" href="#">' . __( $main->name, 'btk') . '</a>';
													echo '<ul class="subnav">';
													foreach($subcats as $sub){
														echo '<li><a href="' . get_term_link( $sub ) . '" title="' . sprintf( __( 'View all post filed under %s', 'btk' ), $sub->name ) . '">'.__( $sub->name , 'btk' ).'</a></li>';
													}
													echo '<li><a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all post filed under %s', 'btk' ), $main->name ) . '">'.__( 'all', 'btk' ).'</a></li>';
													echo "</ul>";
												}else{
													echo '<a href="' . get_term_link( $main ) . '" title="' . sprintf( __( 'View all %s', 'btk' ), $main->name ) . '">' . __( $main->name, 'btk') . '</a>';
												}
												echo "</li>";
											}
										}
									?>
									</ul>
								</div>
							</div>
						</nav>


						<!-- menu login -->
						<div class="sign-in-menu">
							<p class="welcome"><?php _e('Welcome', 'btk');?></p>
							<div class='sign-in'>
								<a href="#" class="choices signin">
									<?php _e('Returning customers<br />Please sign in', 'btk'); ?>
									<span class="icon-chevron-lite-right-white"></span>
								</a>
								<a href="#" class="choices signup">
									<?php _e('New customers<br />Sign up for shopping<br />and exclusive offers', 'btk'); ?>
									<span class="icon-chevron-lite-right-white"></span>
								</a>
							</div>

							<!-- form login -->
							<div class="login-form">
								<p><?php _e('Returning customers<br />Please sign in', 'btk'); ?></p>
								<form method="post" class="login" action="<?php echo esc_url(home_url('/')); ?>my-account">
									<?php do_action( 'woocommerce_login_form_start' ); ?>
									<p>
										<input id="username" name="username" type="text" class="input-text" value="" placeholder="<?php _e('email', 'btk'); ?>" />
										<label for="username"></label>
									</p>
									<p>
										<input id="password" name="password" type="password" class="input-text" value="" placeholder="<?php _e('password', 'btk'); ?>" />
										<label for="password"></label>
									</p>
									<?php do_action( 'woocommerce_login_form' ); ?>
									<p class="submit">
										<?php wp_nonce_field( 'woocommerce-login' ); ?>
										<span class="valign"><?php _e('enter edb', 'btk'); ?></span>
										<input class="valign icon-arrow-lite-right-white" type="submit"  name="login" value="<?php _e( 'Login', 'btk' ); ?>" />
										<input name="rememberme" type="checkbox" id="rememberme" value="forever" class="hide" checked="checked" />
									</p>
									<a href="<?php echo esc_url(home_url('/')); ?>my-account/lost-password" class="lost-password alignright"><?php _e('> Click here to recover lost password', 'btk'); ?></a>
									<?php do_action( 'woocommerce_login_form_end' ); ?>
								</form>
							</div>

							<!-- form register -->
							<div class="register-form">
								<p><?php _e('New customers sign up for shopping<br />and exclusive offers', 'btk'); ?></p>
								<form method="post" action="<?php echo esc_url(home_url('/')); ?>my-account">
									<?php do_action( 'woocommerce_register_form_start' ); ?>
									<p>
										<label for="reg_email" class="hide"></label>
										<input type="email" class="input-text" name="email" id="reg_email" placeholder="<?php _e( 'email', 'btk' ); ?>" value="<?php if ( ! empty( $_POST['email'] ) ) echo esc_attr( $_POST['email'] ); ?>" />
									</p>
									<p>
										<label for="reg_password" class="hide"></label>
										<input type="password" class="input-text" name="password" id="reg_password" placeholder="<?php _e( 'password', 'btk' ); ?>" />
									</p>
									<?php do_action( 'woocommerce_register_form' ); ?>
									<?php do_action( 'register_form' ); ?>
									<p class="submit">
										<?php wp_nonce_field( 'woocommerce-register' ); ?>
										<span class="valign"><?php _e('signup to edb', 'btk'); ?></span>
										<input type="submit" class="valign icon-arrow-lite-right-white" name="register" value="<?php _e( 'Register', 'btk' ); ?>" />
									</p>
									<?php do_action( 'woocommerce_register_form_end' ); ?>
								</form>
							</div>

							<!-- close menu -->
							<p class="back-home">
								<span class="valign"><?php _e('Back home', 'btk'); ?></span>
								<a class="buttons valign icon-arrow-lite-left-white"></a>
							</p>
						</div>
					</div>

					<!-- logo -->
					<div class="site-title alignleft lower">
						<a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
							<span class="title bold valign"><?php bloginfo('name'); ?></span>
						</a>
					</div>

					<!-- page confirmation -->
					<?php if (is_page('confirmation')) { ?>
					<div class="confirmation lower">
					<?php
						while (have_posts()):the_post();
							get_template_part('content', 'page');
						endwhile;
					?>
						<p class="confirmation-back-home">
							<span class="valign"><?php _e('Back home', 'btk'); ?></span>
							<a href="<?php echo esc_url(home_url('/')); ?>" class="buttons valign icon-arrow-lite-left-white"></a>
						</p>
					</div>
					<?php } ?>

				</header>
			</div>
		</div>
	</div>


	<!-- main content -->
	<div class="container">
		<div class="row">
			<div id="content" class="site-content">

