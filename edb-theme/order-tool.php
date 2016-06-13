<?php
global $user_login;
wp_get_current_user();
if(!current_user_can('publish_posts')){
  auth_redirect();
  exit(); 
}
$contents =  file_get_contents( dirname( __FILE__ ) . '/../edb-poly/app/index.html');
$params = json_encode( array(
  'ajaxurl' => admin_url( 'admin-ajax.php', 'https' )
));
echo str_replace( 'WP_INJECT', '<script type="text/javascript">var edb_order_tool_params = '.$params.';</script>', $contents );

?>