<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package buteek
 */
?><!DOCTYPE html>
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

<?php wp_head();?>

<?php if ( is_user_logged_in() ) { ?>
<style type="text/css">
	@media screen and (max-width: 767px) {
		html { margin-top:0px !important; }
		* html body { margin-top:0px !important; }
	}
</style>
<?php } ?>

<noscript><link href="/wp-content/themes/btk/icons/icons.fallback.css" rel="stylesheet"></noscript>

</head>

<body id="top" <?php body_class();?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php _e('Skip to content', 'btk');?></a>


	<!-- header -->
	<div id="header-box">
		<div class="container">
			<div class="row">
				<header id="masthead" class="site-header" role="banner">

					<!-- logo -->
					<h2 class="long-title alignleft lower">
						<a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
							<span class="title semi-bold valign">element<br />de<br />base</span>
						</a>
					</h2>

					<!-- navigation -->
					<div class="navigation alignright lower">
						<!-- menu header -->
						<?php if (!is_page('confirmation')) { ?>
						<nav class="nav-header" role="navigation">

							<?php //wp_nav_menu(array('menu' => 'header')); ?>


							<div class="menu-header-container">
								<ul id="menu-header">
									<?php if ( is_user_logged_in() ) : ?>
									<li class="logout"><a href="<?php echo esc_url(home_url('/')); ?>my-account/customer-logout">Sign out</a></li>
									<?php else: ?>
									<li class="login"><a href="<?php echo esc_url(home_url('/')); ?>sign-in">Sign in</a></li>
									<?php endif; ?>
									<li><a href="<?php echo esc_url(home_url('/')); ?>cart">Cart</a></li>
								</ul>
							</div>
							<?php if ( WC()->cart->get_cart_contents_count() > 0 ) { echo '<span class="semi-bold">' . WC()->cart->get_cart_contents_count() . '</span>'; } ?>
							<a class="language" href="<?php echo esc_url(home_url('/')); ?>">fr</a>
						</nav>
						<?php } ?>

						<!-- menu hamburger -->
						<nav class="nav-hamburger navbar valign" role="navigation">
							<div class="navbar-header">
								<a class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-hamburger">
									<span class="sr-only">Toggle navigation</span>
									<span class="fa fa-bars"></span>
								</a>
							</div>

    						<div class="collapse navbar-collapse" id="nav-hamburger">
							<?php wp_nav_menu(array('menu' => 'hamburger')); ?>
							</div>

							<div class="woo-categories">
								<ul>
								<?php
									$args = array(
										'exclude' => '38'  // id of lookbook cat
									);
									$product_categories = get_terms('product_cat', $args);
									foreach ($product_categories as $cat) {
								?>
									<li><a href="<?php echo esc_url(home_url('/')); ?>product-category/<?php echo $cat->slug; ?>/"><?php echo $cat->name; ?></a></li>
								<?php } ?>
								</ul>
							</div>
						</nav>


						<!-- menu login -->
						<div class="sign-in-menu">
							<p class="welcome">Welcome</p>
							<div class='sign-in'>
								<a href="#" class="choices signin">
									Returning customers<br />Please sign in
									<span class="icon-chevron-lite-right-white"></span>
								</a>
								<a href="#" class="choices signup">
									New customers<br />Sign up for shopping<br />and exclusive offers
									<span class="icon-chevron-lite-right-white"></span>
								</a>
							</div>

							<!-- form login -->
							<div class="login-form">
								<p>Returning customers<br />Please sign in</p>
								<form method="post" class="login" action="<?php echo esc_url(home_url('/')); ?>my-account">
									<?php do_action( 'woocommerce_login_form_start' ); ?>
									<p>
										<input id="username" name="username" type="text" class="input-text" value="" placeholder="<?php _e('email'); ?>" />
										<label for="username"></label>
									</p>
									<p>
										<input id="password" name="password" type="password" class="input-text" value="" placeholder="<?php _e('password'); ?>" />
										<label for="password"></label>
									</p>
									<?php do_action( 'woocommerce_login_form' ); ?>
									<p class="submit">
										<?php wp_nonce_field( 'woocommerce-login' ); ?>
										<span class="valign">enter edb</span>
										<input class="valign icon-arrow-lite-right-white" type="submit"  name="login" value="<?php _e( 'Login', 'woocommerce' ); ?>" />
										<input name="rememberme" type="checkbox" id="rememberme" value="forever" class="hide" checked="checked" />
									</p>
									<a href="<?php echo esc_url(home_url('/')); ?>my-account/lost-password" class="lost-password alignright">> Click here to recover lost password</a>
									<?php do_action( 'woocommerce_login_form_end' ); ?>
								</form>
							</div>

							<!-- form register -->
							<div class="register-form">
								<p>New customers sign up for shopping<br />and exclusive offers</p>
								<form method="post" action="<?php echo esc_url(home_url('/')); ?>my-account">
									<?php do_action( 'woocommerce_register_form_start' ); ?>
									<p>
										<label for="reg_email" class="hide"></label>
										<input type="email" class="input-text" name="email" id="reg_email" placeholder="<?php _e( 'email', 'woocommerce' ); ?>" value="<?php if ( ! empty( $_POST['email'] ) ) echo esc_attr( $_POST['email'] ); ?>" />
									</p>
									<p>
										<label for="reg_password" class="hide"></label>
										<input type="password" class="input-text" name="password" id="reg_password" placeholder="<?php _e( 'password', 'woocommerce' ); ?>" />
									</p>
									<?php do_action( 'woocommerce_register_form' ); ?>
									<?php do_action( 'register_form' ); ?>
									<p class="submit">
										<?php wp_nonce_field( 'woocommerce-register' ); ?>
										<span class="valign">enter edb</span>
										<input type="submit" class="valign icon-arrow-lite-right-white" name="register" value="<?php _e( 'Register', 'woocommerce' ); ?>" />
									</p>
									<?php do_action( 'woocommerce_register_form_end' ); ?>
								</form>
							</div>

							<!-- close menu -->
							<p class="back-home">
								<span class="valign">Back home</span>
								<a class="buttons valign icon-arrow-lite-left-white"></a>
							</p>
						</div>
					</div>

					<!-- logo -->
					<h1 class="site-title alignleft lower">
						<a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
							<span class="title bold valign"><?php bloginfo('name'); ?></span>
						</a>
					</h1>

					<!-- page confirmation -->
					<?php if (is_page('confirmation')) { ?>
					<div class="confirmation lower">
					<?php
						while (have_posts()):the_post();
							get_template_part('content', 'page');
						endwhile;
					?>
						<p class="confirmation-back-home">
							<span class="valign">Back home</span>
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

