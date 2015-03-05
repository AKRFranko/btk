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

					<!-- logo -->
					<h1 class="site-title alignleft lower">
						<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
							<span class="title bold valign"><?php bloginfo( 'name' ); ?></span>
						</a>
					</h1>

					<!-- navigation -->
					<div class="navigation alignright lower">
						<!-- menu header -->
						<nav class="nav-header" role="navigation">
							<?php wp_nav_menu( array( 'menu' => 'header' ) ); ?>
							<a class="language" href="/">fr</a>
						</nav>

						<!-- menu hamburger -->
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
						</nav>

						<!-- menu login -->
						<div class="sign-in-menu">
							<p class="welcome">Welcome</p>
							<div class='sign-in'>
								<a href="#" class="choices signin">
									Returning customers<br />Please sign in
									<span class="fa fa-angle-right valign"></span>
								</a>
								<a href="#" class="choices signup">
									New customers<br />Sign up for shopping<br />and exclusive offers
									<span class="fa fa-angle-right valign"></span>
								</a>
							</div>

							<!-- form login -->
							<div class="login">
								<p>Returning customers<br />Please sign in</p>
								<form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
									<p>
										<input name="login_name" type="text" class="login-field" value="" placeholder="email" id="login-name" />
										<label class="login-field-icon fui-user" for="login-name"></label>
									</p>
									<p>
										<input name="login_password" type="password" class="login-field" value="" placeholder="password" id="login-pass" />
										<label class="login-field-icon fui-lock" for="login-pass"></label>
									</p>
									<p class="submit">
										<span>enter edb</span>
										<input class="button fa fa-long-arrow-right" type="submit"  name="dlf_submit" value="&#xf178;" />
									</p>
									<a href="#" class="lost-password alignright">> Click here to recover lost password</a>
								</form>
							</div>

							<!-- form register -->
							<div class="register">
								<p>New customers<br />Sign up for shopping<br />and exclusive offers</p>
								<form method="post" action="<?php echo esc_url($_SERVER['REQUEST_URI']); ?>">
									<p>
										<label for="reg-name"></label>
										<input name="reg_name" type="text" class="login-field" value="<?php echo(isset($_POST['reg_name']) ? $_POST['reg_name'] : null); ?>" placeholder="name" id="reg-name" required />
									</p>
									<p>
										<label for="reg-email"></label>
										<input name="reg_email" type="email" class="login-field" value="<?php echo(isset($_POST['reg_email']) ? $_POST['reg_email'] : null); ?>" placeholder="email" id="reg-email" required />
									</p>
									<p>
										<label for="reg-pass"></label>
										<input name="reg_password" type="password" class="login-field" value="<?php echo(isset($_POST['reg_password']) ? $_POST['reg_password'] : null); ?>" placeholder="password" id="reg-pass" required />
									</p>
									<p>
										<label for="reg-repass"></label>
										<input name="reg_repassword" type="password" class="login-field" value="<?php echo(isset($_POST['reg_repassword']) ? $_POST['reg_repassword'] : null); ?>" placeholder="re-enter password" id="reg-repass" required />
									</p>
									<p>
										<label for="reg-city"></label>
										<input name="reg_city" type="text" class="login-field" value="<?php echo(isset($_POST['reg_city']) ? $_POST['reg_city'] : null); ?>" placeholder="city" id="reg-city" required />
									</p>
									<p class="submit">
										<span>enter edb</span>
										<input class="button fa fa-long-arrow-right" type="submit"  name="reg_submit" value="&#xf178;" />
									</p>
								</form>
							</div>

							<!-- close menu -->
							<p class="back-home">
								<span>Back home</span>
								<a class="button fa fa-long-arrow-left"></a>
							</p>
						</div>
					</div>

				</header>
			</div>
		</div>
	</div>


	<!-- main content -->
	<div class="container">
		<div class="row">
			<div id="content" class="site-content">

