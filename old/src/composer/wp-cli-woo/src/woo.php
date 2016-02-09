<?php
/**
 * Implements example command.
 */
class Woocommerce_Command extends WP_CLI_Command {

	/**
	 * Runs the "install woocommerce pages"
	 *
	 * ## OPTIONS
	 *
	 *
	 * ## EXAMPLES
	 *
	 *     wp woocommerce install
	 *
	 * @synopsis
	 */
	function install($args, $assoc_args) {
		if (!is_plugin_active('woocommerce/woocommerce.php')) {
			WP_CLI::error('Woocommerce is not installed');
		}

		if (get_option('_wc_needs_pages')) {

			require_once WP_PLUGIN_DIR . '/woocommerce/admin/woocommerce-admin-install.php';
			woocommerce_create_pages();

			delete_option('_wc_needs_pages');
			delete_transient('_wc_activation_redirect');

			WP_CLI::success("Installed woocommerce");
		} else {
			WP_CLI::warning('Woocommerce already seems to be installed');
		}
	}
}

class Woo_Command extends WP_CLI_Command {

	/**
	 * Runs the "install woocommerce pages"
	 *
	 * ## OPTIONS
	 *
	 *
	 * ## EXAMPLES
	 *
	 *     wp woo install_pages
	 *
	 * @synopsis
	 */
	function install_pages($args, $assoc_args) {
		if (!is_plugin_active('woocommerce/woocommerce.php')) {
			WP_CLI::error('Woocommerce is not installed');
		}

		if (get_option('_wc_needs_pages')) {

			require_once WP_PLUGIN_DIR . '/woocommerce/admin/woocommerce-admin-install.php';
			woocommerce_create_pages();

			delete_option('_wc_needs_pages');
			delete_transient('_wc_activation_redirect');

			WP_CLI::success("Installed woocommerce");
		} else {
			WP_CLI::warning('Woocommerce already seems to be installed');
		}
	}
	/**
	 * Imports a product
	 *
	 * ## OPTIONS
	 *
	 *
	 * ## EXAMPLES
	 *
	 *     wp woo add_product
	 *
	 * @synopsis
	 */
	function add_product($args, $assoc_args) {
		$post_id = null;
		if (!empty($args)) {
			$post_id = $args[0];
		}
		$post = $assoc_args;
		if ($post_id) {
			$post['ID'] = $post_id;
			wp_update_post($post, $wp_error);
		} else {
			//Create post
			$post_id = wp_insert_post($post, $wp_error);
		}
		if ($post_id) {
			$attach_id = get_post_meta($product->parent_id, "_thumbnail_id", true);
			add_post_meta($post_id, '_thumbnail_id', $attach_id);
		}
		wp_set_object_terms($post_id, 'Races', 'product_cat');
		wp_set_object_terms($post_id, 'simple', 'product_type');

		update_post_meta($post_id, '_visibility', 'visible');
		update_post_meta($post_id, '_stock_status', 'instock');
		update_post_meta($post_id, 'total_sales', '0');
		update_post_meta($post_id, '_downloadable', 'yes');
		update_post_meta($post_id, '_virtual', 'yes');
		update_post_meta($post_id, '_regular_price', "1");
		update_post_meta($post_id, '_sale_price', "1");
		update_post_meta($post_id, '_purchase_note', "");
		update_post_meta($post_id, '_featured', "no");
		update_post_meta($post_id, '_weight', "");
		update_post_meta($post_id, '_length', "");
		update_post_meta($post_id, '_width', "");
		update_post_meta($post_id, '_height', "");
		update_post_meta($post_id, '_sku', "");
		update_post_meta($post_id, '_product_attributes', array());
		update_post_meta($post_id, '_sale_price_dates_from', "");
		update_post_meta($post_id, '_sale_price_dates_to', "");
		update_post_meta($post_id, '_price', "1");
		update_post_meta($post_id, '_sold_individually', "");
		update_post_meta($post_id, '_manage_stock', "no");
		update_post_meta($post_id, '_backorders', "no");
		update_post_meta($post_id, '_stock', "");

		// file paths will be stored in an array keyed off md5(file path)
		$downdloadArray = array('name' => "Test", 'file' => $uploadDIR['baseurl'] . "/video/" . $video);

		$file_path = md5($uploadDIR['baseurl'] . "/video/" . $video);

		$_file_paths[$file_path] = $downdloadArray;
		// grant permission to any newly added files on any existing orders for this product
		//do_action( 'woocommerce_process_product_file_download_paths', $post_id, 0, $downdloadArray );
		update_post_meta($post_id, '_downloadable_files ', $_file_paths);
		update_post_meta($post_id, '_download_limit', '');
		update_post_meta($post_id, '_download_expiry', '');
		update_post_meta($post_id, '_download_type', '');
		update_post_meta($post_id, '_product_image_gallery', '');
	}
}

WP_CLI::add_command('woocommerce', 'Woocommerce_Command');
