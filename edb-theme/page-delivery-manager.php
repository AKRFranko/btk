<?php
global $user_login;
wp_get_current_user();
if(!current_user_can('publish_posts')){
  auth_redirect();
  exit(); 
}

if($_SERVER['SERVER_ADDR'] == '45.56.104.172'){
   $ck = 'ck_94fac53c2e52855c8967c6a34991bb462f0e553a';
   $cs   = 'cs_e252818ee207a1a6baa461401c64dcf772f2c0d1';  
}else{
   $ck = 'ck_dbc3f91b5f982189037625df93c50393ad99592b';
   $cs   = 'cs_9c2a41175bc6d02ef71de28ac1df33d538d8dac1';  
}

// $contents =  file_get_contents( dirname( __FILE__ ) . '/apps/delivery-manager/app/index.html');
$contents =  file_get_contents( dirname( __FILE__ ) . '/apps/delivery-manager/app/index.html');
$params = json_encode( array(
  'ajaxurl' => admin_url( 'admin-ajax.php', 'https' ),
  'consumerKey' => $ck,
  'consumerSecret' => $cs
));
if($_SERVER['HTTP_HOST'] == 'badb0x.akr.club'){
  $folder = 'edb';
}else{
  $folder = 'edb-theme';
}
$injectScript = '<script type="text/javascript">window.edb_delivery_manager_params = '.$params.';</script>';
$injectBase = '<base href="https://'.$_SERVER['HTTP_HOST'].'/wp-content/themes/'.$folder.'/apps/delivery-manager/app/">';
echo str_replace( 'WP_INJECT', "$injectBase\n$injectScript\n" , $contents );

?>