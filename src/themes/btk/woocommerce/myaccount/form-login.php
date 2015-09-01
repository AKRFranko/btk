<?php
/**
 * Login Form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.2.6
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

?>

<?php wc_print_notices(); ?>

<?php do_action( 'woocommerce_before_customer_login_form' ); ?>

 
 
<div class="customer-login <?php echo $_SESSION['redirect_to'] ?>">
	<h2><?php _e('Returning customers<br />please sign in', 'btk'); ?></h2>

	<form method="post" class="login">

		<?php do_action( 'woocommerce_login_form_start' ); ?>

		<p>
			<label for="username" class="hide"></label>
			<input class="input-text" type="text" name="username" id="username" placeholder="<?php _e( 'email', 'btk' ); ?>" value="<?php if ( ! empty( $_POST['username'] ) ) echo esc_attr( $_POST['username'] ); ?>" />
		</p>
		<p>
			<label for="password" class="hide"></label>
			<input class="input-text" type="password" name="password" id="password" placeholder="<?php _e( 'password', 'btk' ); ?>" />
		</p>

		<?php do_action( 'woocommerce_login_form' ); ?>

		<p class="clearfix">
			<a class="alignright" href="<?php echo esc_url( wc_lostpassword_url() ); ?>"><?php _e('> Click here to recover lost password', 'btk'); ?></a>
			<input name="rememberme" type="checkbox" id="rememberme" value="forever" class="hide" checked="checked" />
			<label for="rememberme" class="regular hide"><?php _e( 'Remember me', 'btk' ); ?></label>
		</p>
		<p class="clearfix">
			<a class="alignright toggle-register" href="#"><?php _e('> I want to signup for a new account.', 'btk'); ?></a>
		</p>
		<p class="alignright submit">
			<?php wp_nonce_field( 'woocommerce-login' ); ?>
			<span class="valign"><?php _e('login', 'btk'); ?></span>
			<input class="valign icon-arrow-lite-right-white" type="submit" name="login" value="<?php _e( 'Login', 'btk' ); ?>" />
		</p>

		<?php do_action( 'woocommerce_login_form_end' ); ?>

	</form>

</div>



<?php if ( get_option( 'woocommerce_enable_myaccount_registration' ) === 'yes' ) : ?>

<div class="customer-register off  <?php echo $_SESSION['redirect_to'] ?>">

	<h2><?php _e('New customers sign up for<br />shopping and exclusive offers', 'btk'); ?></h2>

	<form method="post" class="register">

		<?php do_action( 'woocommerce_register_form_start' ); ?>

		<?php if ( 'no' === get_option( 'woocommerce_registration_generate_username' ) ) : ?>

			<p class="form-row form-row-wide">
				<label for="reg_username"><?php _e( 'Username', 'btk' ); ?> <span class="required">*</span></label>
				<input type="text" class="input-text" name="username" id="reg_username" value="<?php if ( ! empty( $_POST['username'] ) ) echo esc_attr( $_POST['username'] ); ?>" />
			</p>

		<?php endif; ?>

		<p>
			<label for="reg_email" class="hide"></label>
			<input type="email" class="input-text" name="email" id="reg_email" placeholder="<?php _e( 'email', 'btk' ); ?>" value="<?php if ( ! empty( $_POST['email'] ) ) echo esc_attr( $_POST['email'] ); ?>" />
		</p>

		<?php if ( 'no' === get_option( 'woocommerce_registration_generate_password' ) ) : ?>

		<p>
			<label for="reg_password" class="hide"></label>
			<input type="password" class="input-text" name="password" id="reg_password" placeholder="<?php _e( 'password', 'btk' ); ?>" />
		</p>

		<?php endif; ?>

		<!-- Spam Trap -->
		<div style="<?php echo ( ( is_rtl() ) ? 'right' : 'left' ); ?>: -999em; position: absolute;"><label for="trap"><?php _e( 'Anti-spam', 'btk' ); ?></label><input type="text" name="email_2" id="trap" tabindex="-1" /></div>

		<?php do_action( 'woocommerce_register_form' ); ?>
		<?php do_action( 'register_form' ); ?>

    <p class="clearfix">
			<a class="alignright toggle-register" href="#"><?php _e('> I already have an account.', 'btk'); ?></a>
		</p>
		<p class="alignright">
			<?php wp_nonce_field( 'woocommerce-register' ); ?>
			<span class="valign"><?php _e('sign up', 'btk'); ?></span>
			<input type="submit" class="valign icon-arrow-lite-right-white" name="register" value="<?php _e( 'Register', 'btk' ); ?>" />
		</p>

		<?php do_action( 'woocommerce_register_form_end' ); ?>

	</form>
	

</div>
<?php if($_SESSION['redirect_to'] == 'checkout'){ ?>
	  <div class="checkout-as-guest">
	    <a href="<?php echo esc_url( home_url('/') ) . 'checkout/?guest=true' ?>">Checkout as guest.</a>
	  </div>
	<?php }; ?>

<?php endif; ?>

<?php do_action( 'woocommerce_after_customer_login_form' ); ?>
