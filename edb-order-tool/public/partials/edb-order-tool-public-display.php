<?php

/**
 * Provide a public-facing view for the plugin
 *
 * This file is used to markup the public-facing aspects of the plugin.
 *
 * @link       https://elementdebase.com
 * @since      1.0.0
 *
 * @package    Edb_Order_Tool
 * @subpackage Edb_Order_Tool/public/partials
 */
 global $user_login;
  get_currentuserinfo();
  if(!current_user_can('publish_posts')){
    auth_redirect();
    exit(); 
  }
  $contents =  file_get_contents( dirname( __FILE__ ) . '/../edb-poly/app/index.html');
  $params = json_encode( array(
    'ajaxurl' => admin_url( 'admin-ajax.php', 'https' )
  ));
  echo str_replace( 'WP_INJECT', '<script type="text/javascript">var edb_order_tool_params = '.$params.';</script>', $contents );
  
  // wp_head(); 
?>
<!-- This file should primarily consist of HTML with a little bit of PHP. -->


