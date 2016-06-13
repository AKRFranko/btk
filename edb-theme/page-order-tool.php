<?php
global $user_login;
wp_get_current_user();
if(!current_user_can('publish_posts')){
  auth_redirect();
  exit(); 
}


$contents =  file_get_contents( dirname( __FILE__ ) . '/apps/order-tool/dist/index.html');
$params = json_encode( array(
  'ajaxurl' => admin_url( 'admin-ajax.php', 'https' )
));
if($_SERVER['HTTP_HOST'] == 'badb0x.akr.club'){
  $folder = 'edb';
}else{
  $folder = 'edb-theme';
}
$injectScript = '<script type="text/javascript">var edb_order_tool_params = '.$params.';</script>';
$injectBase = '<base href="https://'.$_SERVER['HTTP_HOST'].'/wp-content/themes/'.$folder.'/apps/order-tool/dist/">';
echo str_replace( 'WP_INJECT', "$injectBase\n$injectScript\n" , $contents );

?>