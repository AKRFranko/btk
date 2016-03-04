<?php

/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              http://akr.club
 * @since             1.0.0
 * @package           Edb
 *
 * @wordpress-plugin
 * Plugin Name:       edb
 * Plugin URI:        http://akr.club
 * Description:       This is a short description of what the plugin does. It's displayed in the WordPress admin area.
 * Version:           1.0.0
 * Author:            Franko
 * Author URI:        http://akr.club
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       edb
 * Domain Path:       /languages
 */

// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
	die;
}

if (!function_exists('write_log')) {
    function write_log ( $log='' )  {
        if ( true === WP_DEBUG ) {
            if ( is_array( $log ) || is_object( $log ) ) {
                error_log( print_r( $log, true ) );
            } else {
                error_log( $log );
            }
        }
    }
}

/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-edb-activator.php
 */
function activate_edb() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-edb-activator.php';
	Edb_Activator::activate();
}

/**
 * The code that runs during plugin deactivation.
 * This action is documented in includes/class-edb-deactivator.php
 */
function deactivate_edb() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-edb-deactivator.php';
	Edb_Deactivator::deactivate();
}

register_activation_hook( __FILE__, 'activate_edb' );
register_deactivation_hook( __FILE__, 'deactivate_edb' );

/**
 * The core plugin class that is used to define internationalization,
 * admin-specific hooks, and public-facing site hooks.
 */
require plugin_dir_path( __FILE__ ) . 'includes/class-edb.php';

/**
 * Begins execution of the plugin.
 *
 * Since everything within the plugin is registered via hooks,
 * then kicking off the plugin from this point in the file does
 * not affect the page life cycle.
 *
 * @since    1.0.0
 */
function run_edb() {
	$plugin = new Edb();
	$plugin->run();
	
}

run_edb();

require plugin_dir_path( __FILE__ ) . 'includes/template-tags.php';