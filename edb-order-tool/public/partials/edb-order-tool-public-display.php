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
 if('franko' !== $user_login){
   exit('No can haz.');
 }

  echo file_get_contents( dirname( __FILE__ ) . '/../eot-poly/app/index.html');
  // wp_head(); 
?>
<!-- This file should primarily consist of HTML with a little bit of PHP. -->


