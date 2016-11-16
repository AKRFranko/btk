<?php

// add_action( 'admin_menu', 'edb_material_admin_menu' );

// function edb_material_admin_menu() {
//   add_menu_page( 'Material Manager', 'Material Manager', 'manage_options', 'material-manager.php', 'edb_material_manager', 'dashicons-tickets', 6  );
// }

// function edb_alert($txt){
//   $txt = json_encode($txt);
//   echo "<script>console.log($txt)</script>";
// }
// function edb_get_desc_for_material( $material ){
  
//   global $wpdb;
//   $results = $wpdb->get_results( "SELECT post_id from wp_postmeta where meta_key = '_edb_material' and meta_value = '$material'", ARRAY_A );
//   $pid = $results[0]['post_id'];
//   $post = get_post($pid);
//   $subtitle = get_post_meta($pid, '_subtitle', true);
  
//   return $post;
// }
// function edb_material_manager(){
//   if($_SERVER['REQUEST_METHOD'] == 'POST'){
//     if(isset($_POST['post_id'])){
//       wp_update_post($_POST['post_id'], array( 'post_excerpt'=> $_POST['post_excerpt']));
//     }
//   }
//   global $wpdb;
//   $numbers = array();
//   $n=1;
//   while($n < 999){
//     $numbers[] = sprintf('%03d', $n );
//     $n++;
//     // edb_alert(edb_get_desc_for_material($n));
//   }
//   ?>
  
//   <script>
//   (function($){
    
    
//     var updateMaterial = function( $row ){
//       // console.log('update material post');
//       var material_no = $row.find('td:first').text();
//       var post_id = $row.data('post-id');
//       var post_title = $row.find('.name-input').val();
//       var meta_subtitle = "{:en}"+$row.find('.color-name-input-en').val()+"{:}{:fr}"+$row.find('.color-name-input-fr').val()+"{:}";
//       var post_excerpt = "{:en}"+$row.find('.comp-input-en').val()+"{:}{:fr}"+$row.find('.comp-input-fr').val()+"{:}";
//       $('#material-updater').find('.post_id').val(post_id);
//       $('#material-updater').find('.post_title').val(post_title);
//       $('#material-updater').find('.meta_subtitle').val(meta_subtitle);
//       $('#material-updater').find('.post_excerpt').val(post_excerpt);
//       $('#material-updater').attr('action',window.location.href);
//       $('#material-updater').submit();
//       // console.log(title,subtitle, comp)
//     }
    
//     $(document).on('click', '.save-material', function(){
//       var $button = $(this);
//       var $row = $(this).closest('tr');
//       var postid = $row.data('post-id');
//       if(!!postid){
//         updateMaterial( $row );
//       }else{
//         console.log('create material post')  ;
//       }
      
//     });
//   })(jQuery)
//   </script>
//   <?php
//   echo "<table id=\"material-manager\" style=\"width:600px;max-width:600px;\">";
//   echo "<tr><td>No.</td><td>Name</td><td>Color Name (En)</td><td>Color Name (Fr)</td><td>Composition (En)</td><td>Composition (Fr)</td><td colspan=\"2\">Image</td></tr>";
//   foreach($numbers as $n){
//     $desc = edb_get_desc_for_material( $n );
//     $name = $desc->post_title;
//     $sub = get_post_meta($desc->ID, '_subtitle', true );
//     $sub_en = WPGlobus_Core::text_filter( $sub, 'en');
//     $sub_fr = WPGlobus_Core::text_filter( $sub, 'fr');
//     $comp = $desc->post_excerpt;
//     $comp_en = WPGlobus_Core::text_filter( $comp, 'en');
//     $comp_fr = WPGlobus_Core::text_filter( $comp, 'fr');
//     $thumb_id = get_post_thumbnail_id($desc->ID);
//     $thumb_url_array = wp_get_attachment_image_src($thumb_id, 'full', true);
//     $image = $thumb_url_array[0];
    
//     ?>
//       <tr data-post-id="<?php echo $desc->ID; ?>">
//         <td><?php echo $n; ?></td>
//         <td><input class="name-input" style="width:6em" type="text" value="<?php echo $name; ?>"></td>
//         <td><input class="color-name-input-en" style="width:8em" type="text" value="<?php echo $sub_en; ?>"></td>
//         <td><input class="color-name-input-fr" style="width:8em" type="text" value="<?php echo $sub_fr; ?>"></td>
//         <td><input class="comp-input-en" style="width:17em" type="text" value="<?php echo $comp_en; ?>"></td>
//         <td><input class="comp-input-fr" style="width:17em" type="text" value="<?php echo $comp_fr; ?>"></td>
//         <td><img width="50" height="50" src="<?php echo $image; ?>"></td>
//         <td><button type="button" class="save-material">save</button></td>
//       </tr>  
//     <?php
//   }
//   echo "</table>";
  
//   ?>
//   <form id="material-updater" method="post">
//     <input type="hidden" class="post_id" name="post_id" value="">
//     <input type="hidden" class="post_title" name="post_title" value="">
//     <input type="hidden" class="meta_subtitle" name="meta_subtitle" value="">
//     <input type="hidden" class="post_excerpt" name="post_excerpt" value="">
//   </form>
//   <!--<div class="wrap">-->
//   <!--  <h2>Welcome To My Plugin</h2>-->
//   <!--</div>-->
//   <?php
// }