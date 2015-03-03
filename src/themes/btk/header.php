<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package buteek
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">


<?php wp_head(); ?>
</head>

<body id="top" <?php body_class(); ?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'btk' ); ?></a>


	<!-- header -->
	<div id="header-box">
		<div class="container">
			<div class="row">
				<header id="masthead" class="site-header" role="banner">

					<h1 class="site-title alignleft lower">
						<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
							<span class="title bold valign"><?php bloginfo( 'name' ); ?></span>
						</a>
					</h1>

					<div class="navigation alignright lower">
						<nav class="nav-header" role="navigation">
							<?php wp_nav_menu( array( 'menu' => 'header' ) ); ?>
							<a class="language upper" href="/">FR</a>
						</nav><!-- #site-navigation -->

						<nav class="nav-hamburger navbar valign" role="navigation">
							<div class="navbar-header">
								<a class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-hamburger">
									<span class="sr-only">Toggle navigation</span>
									<span class="fa fa-bars"></span>
								</a>
							</div>
    						<div class="collapse navbar-collapse" id="nav-hamburger">
							<?php wp_nav_menu( array( 'menu' => 'hamburger' ) ); ?>
							</div>
						</nav><!-- #site-navigation -->

						<div class='sign-in lower'>
							<p class="choices">Welcome</p>
							<a href="#" class="choices">
								Returning customers<br />Please sign in
								<span class="fa fa-angle-right valign"></span>
							</a>
							<a href="#" class="choices">
								New customers<br />Sign up for shopping<br />and exclusive offers
								<span class="fa fa-angle-right valign"></span>
							</a>
						</div>

						<p class="back-home alignright">
							<span>Back home</span>
							<a class="button fa fa-long-arrow-left"></a>
						</p>
					</div>

				</header><!-- #masthead -->
			</div>
		</div>
	</div><!-- header -->


	<!-- main content -->
	<div class="container">
		<div class="row">
			<div id="content" class="site-content">

