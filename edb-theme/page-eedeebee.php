<?php


wp_get_current_user();
if(!current_user_can('publish_posts')){
  auth_redirect();
  exit(); 
}



$contents =  file_get_contents( dirname( __FILE__ ) . '/apps/eedeebee/app/index.html');

$params = json_encode( array(
  'ajaxurl' => admin_url( 'admin-ajax.php', 'https' )
));
if($_SERVER['HTTP_HOST'] == 'badb0x.akr.club'){
  $folder = 'edb';
}else{
  $folder = 'edb-theme';
}
$injectBase = '<base href="https://'.$_SERVER['HTTP_HOST'].'/wp-content/themes/'.$folder.'/apps/eedeebee/app/">';
echo str_replace( 'WP_INJECT', "$injectBase" , $contents );

?>