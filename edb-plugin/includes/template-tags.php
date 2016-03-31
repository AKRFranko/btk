<?php 


function edb_availability_date(  ){
    echo "edb_availability_date";
}


function facebook_meta_tags(){
  global $post;
  
  $path=$_SERVER['REQUEST_URI'];
  $uri='https://elementdebase.com'.$path;
  $meta_url = rtrim($uri, '/');
  $meta_title = 'élément de base';
  $meta_image = 'https://elementdebase.com/wp-content/uploads/2016/02/images_sections_0000_contact.jpg';
  $meta_description='when we created élément de base, we set out to launch asustainable company that inspires creative interiors throughits offer of stylish, renewable, locally designed furniture at prices to suit any budget...';
  if(is_product()){
    $decorated = edb_decorated_product($post->ID);
    if(!empty($decorated->subtitle)){
      $meta_title = $decorated->title . "_" . $decorated->subtitle;
    }else{
      $meta_title = $decorated->title;
    }
    $meta_description = strip_tags($decorated->description . " " . wc_price( $decorated->price ));
    $image_id = get_post_thumbnail_id( $post->ID);
    $meta_image=wp_get_attachment_image_src($image_id, 'full')[0];
    $meta_url = get_permalink();
  }
  echo "<meta property='og:url' content='$meta_url'/><meta property='og:title' content='$meta_title'/><meta property='og:image' content='$meta_image'/><meta property='og:site_name' content='élément de base'/><meta property='og:description' content='$meta_description'/>";
}

function woocommerce_wp_image_select( $field ) { 
    global $thepostid, $post; 
    $thepostid = empty( $thepostid ) ? $post->ID : $thepostid; 
    $field['class'] = isset( $field['class'] ) ? $field['class'] : 'select short'; 
    $field['style'] = isset( $field['style'] ) ? $field['style'] : ''; 
    $field['wrapper_class'] = isset( $field['wrapper_class'] ) ? $field['wrapper_class'] : ''; 
    $field['value'] = isset( $field['value'] ) ? $field['value'] : get_post_meta( $thepostid, $field['id'], true ); 
    $field['name'] = isset( $field['name'] ) ? $field['name'] : $field['id']; 
    
 
    echo '<fieldset class="form-field ' . esc_attr( $field['id'] ) . '_field ' . esc_attr( $field['wrapper_class'] ) . '"><legend>' . wp_kses_post( $field['label'] ) . '</legend><ul class="wc-image-radios">'; 
 
    foreach ( $field['options'] as $key => $value ) { 
        echo '<li><label><input 
                name="' . esc_attr( $field['name'] ) . '" 
                value="' . esc_attr( $key ) . '" 
                type="radio" 
                class="' . esc_attr( $field['class'] ) . '" 
                style="' . esc_attr( $field['style'] ) . '" 
                ' . checked( esc_attr( $field['value'] ), esc_attr( $key ), false ) . ' 
                /> <img src="' .  $value[0] . '" style="max-width:100%;"/></label> 
        </li>'; 
    } 
    echo '</ul>'; 
 
    if ( ! empty( $field['description'] ) ) { 
 
        if ( isset( $field['desc_tip'] ) && false !== $field['desc_tip'] ) { 
            echo '<img class="help_tip" data-tip="' . esc_attr( $field['description'] ) . '" src="' . esc_url( WC()->plugin_url() ) . '/assets/images/help.png" height="16" width="16" />'; 
        } else { 
            echo '<span class="description">' . wp_kses_post( $field['description'] ) . '</span>'; 
        } 
    } 
 
    echo '</fieldset>'; 
} 

function edb_product_pdf( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  if(!empty($decorated->pdf_url)){
    $filename = urlencode($decorated->title).'.pdf';
    echo '<a id="product-pdf-download" class="button pdf-download-button" href="'.$decorated->pdf_url.'" target="_pdf" download="'.$filename.'">'.__('download pdf', 'edb').'</a>';  
  }
  

}
$edb_deco_cache = array();


function edb_decorated_product( $product_id ){
  if(!isset($edb_deco_cache[$product_id])){
    $edb_deco_cache[$product_id] = new Edb_Product_Decorator( $product_id );
  }
  
  return $edb_deco_cache[$product_id];
}

function edb_package_item_image( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  $image_id = get_post_thumbnail_id( $variation_id);
  
  // $this->materials[$variation_material]['image'] = wp_get_attachment_image_src($image_id, 'thumb')[0];
  echo '<img src="'. wp_get_attachment_image_src($image_id, 'thumbnail')[0]. '">';
}
function edb_package_item_name( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  if(!empty($decorated->subtitle)){
    $name = $decorated->title . "_" . $decorated->subtitle;
  }else{
    $name = $decorated->title;
  }
  echo $name;
  
}
function edb_package_item_material( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo edb_get_material_name($decorated->material);
}
function edb_package_item_material_thumb( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo edb_get_material_thumb($decorated->material);
}

function edb_package_item_category( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  // write_log($decorated->category);
  echo $decorated->category;
}

// function edb_split_order_items_into_shipments( $order ){
//   $split = array();
//   $order_items = $order->get_items();
//   foreach( $order_items as $item_id => $item ){
//     foreach( $item['edb_shipments'] as $shipping_method => $qty ){
//       if(empty($split[$shipping_method])){
//         $split[$shipping_method] = array();
//       }
//       $split[$shipping_method][]=array(
//           'item_id' => $item_id,
//           'item' =>$item,
//           'qty' => $qty
//       );
//     }
//   }
//   foreach( $split as $shipping_method => $items ){
//     foreach( $items as $copy ){
//       $product = $order->get_product_from_item( $copy['item'] );
//       $item = $copy['item'];
//       $line_total = $item['line_total'];
//       $line_qty = $item['item_meta']['_qty'][0];
//       write_log($item);
      
//       //$pre_item_cost = $item_line_total / $item_line_qty;
//       // $copy['item']['edb_shipping'] = $shipping_method;
//       // $copy['item']['qty'] = $copy['quantity'];
//       // $copy['item']['line_total']
//     }
//   }
// }

function edb_cart_item_image( $cart_item_key, $cart_item ){
  edb_package_item_image($cart_item_key, $cart_item  );
  // $product_id = $cart_item['product_id'];
  // $variation_id = $cart_item['variation_id'];
  // $decorated = edb_decorated_product( $variation_id );
  // echo '<img src="'. $decorated->images['material_variations'][$decorated->material]. '">';
}
function edb_cart_item_name( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  if(!empty($decorated->subtitle)){
    $name = $decorated->title . "_" . $decorated->subtitle;
  }else{
    $name = $decorated->title;
  }
  echo $name;
}
function edb_cart_item_material( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo edb_get_material_name($decorated->material);
}
function edb_cart_item_material_thumb( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo edb_get_material_thumb($decorated->material);
}
function edb_cart_item_category( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->category;
}

function edb_get_material_thumb( $material_no ){
  $get_material_desc_args = array(
    'meta_key' => '_edb_material',
    'meta_value' => $material_no,
    'post_type' => 'edb_material_desc',
    'post_status'=> 'any',
    'posts_per_page'=> 1
  );
  $dpost = get_posts($get_material_desc_args)[0];
  $image_id = get_post_thumbnail_id( $dpost->ID ,'thumbnail');
  echo "<img class=\"material-thumb\" src=\"".wp_get_attachment_image_src($image_id, 'full')[0]."\">";
}
function edb_get_material_name( $material_no ){
  $get_material_desc_args = array(
    'meta_key' => '_edb_material',
    'meta_value' => $material_no,
    'post_type' => 'edb_material_desc',
    'post_status'=> 'any',
    'posts_per_page'=> 1
  );
  $dpost = get_posts($get_material_desc_args);
  $name = apply_filters('the_title', $dpost[0]->post_title);
  $subtitle = apply_filters('the_title', get_the_subtitle($dpost[0]->ID));
  if(empty($subtitle)){
    return $name;
  }
  return "$name $subtitle $material_no";
}
function edb_checkout_item_material( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo edb_get_material_name($decorated->material);
  // return $decorated->material;
}
function edb_checkout_item_availability( $cart_item_key, $cart_item  ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  $delays = $decorated->shipping_delays[$variation_id];
  
  $now = strtotime(date(DATE_ATOM));
  
  $min = trim(time_elapsed(strtotime( $delays['available'], $now )));
  $max = trim(time_elapsed(strtotime( $delays['backorder'], $now )));
  $available_stock = $decorated->variation_object->get_total_stock();
  $wanted_stock = abs($cart_item['quantity']);
  if($available_stock <= 0 ){
    echo "$wanted_stock &lt; $max";
  }else if($wanted_stock <= $available_stock ){
    echo "$wanted_stock &lt; $min";
  }else{
    $backorder_stock = $wanted_stock - $available_stock;
    echo "$available_stock &lt; $min, $backorder_stock &lt; $max";  
  }
  
  
}

function edb_order_item_availability( $item, $order ){
  $product_id = $item['product_id'];
  $variation_id = $item['variation_id'];
  $shipping = $item['edb_shipping'];
  
  $availability = $item['edb_availabilities'][$shipping];
  $order_date = strtotime($order->order_date);
  
  $display =  strtotime( $availability, $order_date );
  // write_log( $availability );
  // write_log( $order_date );
  // write_log( $display );
  echo sprintf( __('ships: %s', 'edb') ,date_i18n('j F Y', $display) );
  
}

function edb_latest_availability( $cart ){
  $latest = 0;
  foreach( $cart->cart_contents as $cart_item_key => $cart_item ){
    $product_id = $cart_item['product_id'];
    $variation_id = $cart_item['variation_id'];
    $decorated = edb_decorated_product( $variation_id );
    $delays = $decorated->shipping_delays[$variation_id];
    $now = strtotime(date(DATE_ATOM));
    $min = strtotime( $delays['available'], $now );
    $max = strtotime( $delays['backorder'], $now );
    $available_stock = $decorated->variation_object->get_total_stock();
    $wanted_stock = abs($cart_item['quantity']);
    if($available_stock <= 0 ){
      if($latest < $max ){
        $latest = $max;
      }
    }else if($wanted_stock <= $available_stock ){
      if($latest < $min ){
        $latest = $min;
      }
    }
  }
  echo time_elapsed($latest);
}
function edb_shipping_item_availability( $package ){
  

  $product_id = $package['product_id'];
  $variation_id = $package['variation_id'];
  edb_checkout_item_availability( $package, $package );
  // $decorated = edb_decorated_product( $variation_id );
  // $delays = $decorated->shipping_delays[$variation_id];
  // $availability = $package['edb_availability'];
  // $now = strtotime(date(DATE_ATOM));
  // write_log( $availability );
  // write_log( $now );
  // write_log( $max );
  // $max = trim(time_elapsed(strtotime( $availability, $now )));
  // $available_stock = $decorated->variation_object->get_total_stock();
  // echo $package['quantity'] . " < $availability"; 
  
}

function edb_cart_item_availability( $cart_item_key, $cart_item ){
  return edb_checkout_item_availability( $cart_item_key, $cart_item );
}

function edb_get_category_url( $category ){
  $prod_cat_args = array(
    'taxonomy'     => 'product_cat', //woocommerce
    'orderby'      => 'name',
    'empty'        => 0
  );
  $woo_categories = get_categories( $prod_cat_args );
  foreach($woo_categories as $woocat){
    
    if($woocat->name == $category ){
      return get_term_link( (int)$woocat->term_id, 'product_cat' );
    }
  }
  return null;
}

function edb_get_user_wants_guest_checkout(){
  $stored = WC()->session->get('edb_user_checkout_as_guest');
  if(empty($stored) || $stored == false){
    return false;
  }
  if(isset($_REQUEST) && empty($_REQUEST['guest'] ) ){
    return false;
  }
  return true;
}

function edb_panel_active( $panelId ){
  $active = WC()->session->get('edb_active_panel');
  $posted = null;
  if(!empty($_POST) && isset( $_POST['post_data'] ) ){
    $parsed = array();
    if(!empty($parsed['current_panel'])){
      $posted = $parsed['current_panel'];
    }
  }
  if(empty($active) &&!empty($posted)){
   $active = $posted;
  }else if(!empty($active) &&!empty($posted) && $posted !== $active){
      $active = $posted;
  }
  if(empty($active)){
    $active = '#address-info-panel';
  }
  WC()->session->set('edb_active_panel', $active );
  
    if( $active == $panelId ){
      echo ' active';
    }else{
      echo '';
    }
  
}
function edb_shipping_method_disabled( $method_name ){
  $packages = WC()->shipping->get_packages();
  $package_ids = array_keys($packages);
  $package_count = count($package_ids);
  $bundle_methods = array('edb_ship_ready','edb_ship_bundle_2','edb_ship_bundle_3');
  
  $disabled = '';
  if( $package_count < 3 && in_array($method_name, $bundle_methods ) ){
    $disabled = ' disabled';
  }; 
  $do_not_ship = WC()->session->get('do_not_ship');
  if(!empty($do_not_ship) && $do_not_ship == true && $method_name !== 'edb_self_pickup'){
    $disabled = ' disabled';
  }
  echo $disabled;
}

function edb_product_video_link( $product_id, $type ){
  $decorated = edb_decorated_product( $product_id );
  $videos = $decorated->videos;
  
  $data = null;
  if(!empty($videos)){
    foreach($videos as $key => $video ){
      if( $key == $type){
        $data = $video;
      }
    }
  }
  
  if(!empty($data)){
    $link = $data['video_link'];
    $src = $data['image_src'];
    echo "<a class=\"youtube_video_link\" href=\"$link\" target=\"youtube\"><img src=\"$src\"></a>";
  }

}

function edb_product_slideshow( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $slide_images = $decorated->images['slideshow'];
  $variation_images = $decorated->images['material_variations'];
  $html = '<div class="edb-slider">';
  $html .= '<div class="edb-slides">';
  foreach($slide_images as $index => $src){
    $active = $index == 0 ? ' active' : '';
    $style = "background-image:url('".esc_attr($src)."');";
    $img = "<img src='$src'>";
    $html .= '<div class="edb-slide'.$active.'">';
    $html .= '<div class="backdrop" style="'.$style.'">'.$img.'</div>';
    $html .= '</div>';
  }
  $html .= '</div>';
  $html .='<div class="controls">';
  $html .= '<a href="#" class="prev">&lt;</a>';
  $html .= '<span class="indicator current">1</span>';
  $html .= '<span class="separator"></span>';
  $html .= '<span class="indicator last">'.count($slide_images).'</span>';
  $html .= '<a href="#" class="next">&gt;</a>';
  $html .= '</div>';
  $html .= '</div>';
  echo $html;
  // echo '<div class="edb-slideshow">';
  // echo '<div class="edb-slideshow-images">';
  // foreach($slide_images as $index => $src){
  //   echo '<div class="edb-slideshow-image-container'.($index == 0 ? ' active-slide' : '').'" style="background-image:url('.esc_attr($src).');">';
  //   echo '<img class="edb-slideshow-image" src="'.$src.'">';
  //   echo '</div>';
  // }
  // echo '</div>';
  // echo '<div class="edb-slideshow-buttons"><a href="#" class="edb-slideshow-prev">&lt; prev</a><span class="edb-slideshow-separator">|</span><a href="#" class="edb-slideshow-next">next &gt;</a></div>';
  // foreach($variation_images as $material => $src ){
  //   echo "<div data-material=\"$material\" class=\"edb-material-variation-image\" style=\"background-image:url('".$src."');\"></div>";
  // }
  // echo '</div>';
  
}

function edb_material_toasts(){
    
    $args= array(
      'post_type' => 'edb_material_desc',
      'post_status'=> 'publish',
      'posts_per_page'=> -1
    );
    $posts = get_posts( $args );
    $lang = WPGlobus::Config()->language;
    $rules = '.material-description{ display:none }';
    echo '<div id="material-toast" class="toast vertical top">';
    echo '<a href="#" class="close">close</a>';
    foreach( $posts as $post){
      
      $material = get_post_meta( $post->ID, '_edb_material' , true);
      
      $thumbid = get_post_thumbnail_id( $post->ID );
      // $small= wp_get_attachment_image_src( $thumbid, 'thumbnail', true )[0];
      $large = wp_get_attachment_image_src( $thumbid, 'full' )[0];
      $title = apply_filters('the_title', $post->post_title );
      $subtitle = apply_filters('the_title', get_the_subtitle($post->ID));
      $excerpt = apply_filters('the_title', $post->post_excerpt );
      $content = apply_filters('the_content',$post->post_content );
      $composition = explode("|",$excerpt);
      $rules .= "\n#material-toast.material-$material #material-$material.material-description{ display:block; }";
      ?>
      
        <div id="material-<?php echo $material; ?>" class="material-description boxes">
          <div class="material-image box half" style="background-image:url('<?php echo $large; ?>')">
            <img src="<?php echo $large; ?>">
          </div>
          <div class="material-info box half">
            <h1 class="name"><?php echo "$title" ?></h1>
            <h2 class="color"><?php echo "$subtitle $material" ?></h2>
            <p class="description"><?php echo $content; ?></p>
            
            <ul class="composition">
              <li>composition</li>
            <?php if(!empty($composition)){ foreach($composition as $line ){ ?>
              <li><?php echo trim($line) ?></li>
            <?php }; }; ?>
            </ul>
          </div>
          <a id="order-samples-btn" class="button" href="<?php echo get_permalink( get_page_by_path( 'order-samples' ) ); ?>" target="_blank"><?php _e('order samples', 'edb')?></a>
        </div>
      
      <?php
      // write_log($material);
      // write_log($small);
      // write_log($large);
    }
    echo "</div>";
    echo "<style type='text/css'>$rules</style>";
}

function edb_product_material_picker( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $materials = $decorated->materials;
  echo '<div class="edb-material-picker">';
  echo '<div class="label">';
  _e('select a color', 'edb');
  echo '</div>';
  echo '<div class="edb-material-choices">';
  
  foreach($materials as $edb_material => $data ){
    $stock_qty = $decorated->stocks[$data['variation_id']];
    
    if($stock_qty > 0){
      $stock_status = __('in stock', 'edb');
      $stock_class='in-stock';
      
    }else{
      $stock_status = __('backorder', 'edb');
      $stock_class='backorder';
      
    }
    
    $delays = $decorated->shipping_delays[ ''.$data['variation_id'] ];
    
    $now = strtotime(date(DATE_ATOM));
    $min = trim(time_elapsed(strtotime( $delays['available'], $now )));
    $max = trim(time_elapsed(strtotime( $delays['backorder'], $now )));
    // write_log($data);
    $name =edb_get_material_name($edb_material);// esc_attr( apply_filters('the_title',$data['post']->post_title) . "  <b>".apply_filters('the_title', get_the_subtitle($data['post']->ID))."</b>");
    $availability_date  = esc_attr(json_encode( array( 'stock' => $stock_qty, 'min' => $min, 'max' => $max ) ));
    $preview = $decorated->images['material_variations'][$edb_material];
    echo "<label for=\"edb-material-choice-$edb_material\">";
    
    echo "<div class=\"edb-material-choice-square $stock_class\" style=\"background-image:url('".$data['image']."');\">";
    echo "<input type='radio' id=\"edb-material-choice-$edb_material\" name=\"_edb_material_choice\" data-shipping-delay=\"$availability_date\" data-variation-id=\"".$data['variation_id']."\" data-name=\"".$name."\" data-preview=\"$preview\" value=\"$edb_material\">";
    echo "</div>";
    echo "</label>";
  }
  echo '</div>';
  
  echo '</div>';
  
}



function tmp_has_tech_image( $deco ){
 $data = array("atrium_armchairs",
              "maritime_armchairs",
              "nautique_accessories-pillows",
              "stripes_sofas-3-seater",
              "stripes_sofas-2-seater",
              "atrium_sofas-3-seater",
              "atrium_sofas-2-seater",
              "maritime-natural_sofas-3-seater",
              "panorama_sectionals-left-facing",
              "swivel_armchairs",
              "capsule_sofa-beds",
              "maritime-walnut_sofas-3-seater",
              "maritime-walnut_sofas-2-seater",
              "panorama_sectionals-right-facing",
              "tamtam_side-tables",
              "capsule_sofas",
              "mixmix-corner_modular",
              "perplexe_side-tables",
              "perplexe-azure_side-tables",
              "perplexe-pink_side-tables",
              "perplexe-smoke_side-tables",
              "taxi_armchairs",
              "duo_sofa-beds",
              "mixmix-ottrec_modular",
              "ping_armchairs",
              "taxi_sofas-3-seater",
              "taxi_sofas-2-seater",
              "duo_sofas",
              "mixmix_sectionals-left-facing",
              "pique_sectionals-left-facing",
              "teatime_sofa-beds",
              "flex_sectionals-left-facing",
              "mixmix_sectionals-right-facing",
              "pique_sectionals-right-facing",
              "teatime_sofas",
              "flex_sectionals-right-facing",
              "mixmix-single_modular",
              "slope_armchairs",
              "t-table_side-tables",
              "majuscule_accessories-pillows",
              "mutation_accessories-pillows",
              "slope_sofas-3-seater",
              'pique-small_sectionals-right-facing',
              'pique-small_sectionals-left-facing',
              "vintage_side-tables");

 $name = $deco->title;
  
 
 $cat = $deco->category_slug;
 if($cat == 'modular'){
   if( $deco->product_id == 285){
     
     $name = 'mixmix-corner';
   }
   if( $deco->product_id == 214){
     
     $name = 'mixmix-ottrec';
   }
   if( $deco->product_id == 249){
     
     $name = 'mixmix-single';
   }
 }
 if( $cat == 'sofas-3-seater'){
   if($deco->product_id == 1150){
     $name = 'maritime-walnut';
   }
   if($deco->product_id == 1111){
     $name = 'maritime-natural';
   }
 }
 if( $cat == 'sectionals-left-facing' || $cat == 'sectionals-right-facing'){
   if($deco->product_id == 1750 || $deco->product_id == 1775){
     $name = 'pique-small';
   }
 }
 
 
 if( $cat == 'sofas-2-seater'){
 if($deco->product_id == 1667){
   $name = 'maritime-walnut';
 }}
 
 $k = "$name"."_"."$cat";
 write_log( "\n\n\n$k\n\n\n");
 
 if(in_array( $k, $data)){
  return true;
 }
 return false;
}

function tmp_get_tech_image( $deco ){
 $name = $deco->title;
 $cat = $deco->category_slug;
 
 if($cat == 'modular'){
   if( $deco->product_id == 285){
     
     $name = 'mixmix-corner';
   }
   if( $deco->product_id == 214){
     
     $name = 'mixmix-ottrec';
   }
   if( $deco->product_id == 249){
     
     $name = 'mixmix-single';
   }
 }
 if( $cat == 'sofas-3-seater'){
   if($deco->product_id == 1150){
     $name = 'maritime-walnut';
   }
   if($deco->product_id == 1111){
     $name = 'maritime-natural';
   }
 }
 if( $cat == 'sectionals-left-facing' || $cat == 'sectionals-right-facing'){
   if($deco->product_id == 1750 || $deco->product_id == 1775){
     $name = 'pique-small';
   }
 }
 if( $cat == 'sofas-2-seater'){
   if($deco->product_id ==  1667){
     $name = 'maritime-walnut';
   }
 }
 $k = "$name"."_"."$cat";
 write_log('https://elementdebase.com/wp-content/edb-svg/'.$k.'.svg');
 return 'https://elementdebase.com/wp-content/edb-svg/'.$k.'.svg';
}

function edb_has_tech_image( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  return tmp_has_tech_image( $decorated );
}

function edb_has_introduction_video( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $video = $decorated->videos['introduction'];
  return !is_null($video['youtube_id']);
}

function edb_has_instruction_video( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $video = $decorated->videos['instruction'];
  return !is_null($video['youtube_id']);
}

function edb_has_dimensions( $product_id ){
  // TODO
  return false;
}
function edb_has_sidekick($product_id ){
  // TODO
  return false;
}
function edb_has_designer( $product_id ){
  // TODO
  return false;
}
function edb_has_review( $product_id ){
  // TODO
  return false;
}

function edb_product_tech_image( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $image = tmp_get_tech_image( $decorated );
  #$image = $decorated->images['technical'];
  echo '<img src="'.$image.'">';
}

function edb_checkout_billing_address_summary(){
  
  
  $customer = WC()->session->customer;
  $first_name = $customer['billing_first_name'];
  $last_name = $customer['billing_last_name'];
  
  $name = "$first_name";
  if(!empty($last_name)){
    $name .= " $last_name";
  }
  $lines = array_filter(array(
    $name,
    array_filter( array( $customer['billing_address_1'], $customer['billing_address_2'] ) ),
    array_filter( array( $customer['billing_city'], $customer['billing_state'] ) ),
    $customer['billing_postcode']
  ));
  foreach($lines as $line){
    if(is_array($line)){
      $line = implode($line, ', ');
    }
    echo "<div class='summary-data-line'>$line</div>";
  }
}
function edb_checkout_shipping_address_summary(){
  $customer = WC()->session->customer;
  $first_name = $customer['shipping_first_name'];
  $last_name = $customer['shipping_last_name'];
  
  $name = "$first_name";
  if(!empty($last_name)){
    $name .= " $last_name";
  }
  $lines = array_filter(array(
    $name,
    array_filter( array( $customer['shipping_address_1'], $customer['shipping_address_2'] ) ),
    array_filter( array( $customer['shipping_city'], $customer['shipping_state'] ) ),
    $customer['shipping_postcode']
  ));
  foreach($lines as $line){
    if(is_array($line)){
      $line = implode($line, ', ');
    }
    echo "<div class='summary-data-line'>$line</div>";
  }
}
function edb_get_shipping_method_name( $label ){
  $names = array(
    'edb_self_pickup'=> __('self pickup', 'edb'),
    'edb_ship_ready'=> __('ship when ready','edb'),
    'edb_ship_bundle_1'=> __('ship as bundle 1','edb'),
    'edb_ship_bundle_2'=> __('ship as bundle 2','edb'),
    'edb_ship_bundle_3'=> __('ship as bundle 3','edb'),
  );
  if(array_key_exists($label, $names )){
    return $names[$label];
  }
  return $label;
}

function edb_cart_shipping_total(){
  $ship_total = WC()->cart->get_cart_shipping_total();
  if($ship_total == 'Free!'){
    $ship_total = '$0.00';
  }
  echo $ship_total;
}

function edb_order_shipping_total( $order ){
  $ship_total = $order->get_total_shipping();
  if($ship_total == 'Free!'){
    $ship_total = '$0.00';
  }
  echo $ship_total;
}
function edb_checkout_delivery_fees_summary(){
  $shipping_rates = WC()->session->get('_edb_cart_current_shipping_rates'); 
  if(!empty($shipping_rates)){
    foreach($shipping_rates as $name => $rate){
      if($name !== 'edb_self_pickup' && !empty($rate['item_count']) && $rate['item_count'] > 0 && !empty(WC()->customer->get_shipping_postcode()) ){
      ?>
      <div class="summary-data-line">
        
        <span class="label"><?php echo edb_get_shipping_method_name($rate['label']); ?></span>
        <span class="value"><?php echo wc_price($rate['cost']); ?></span>
      </div>
      <?php  
      }
    }
    
    if(array_key_exists('edb_self_pickup',$shipping_rates)){
      $rate = $shipping_rates['edb_self_pickup'];
      if(!empty($rate['item_count']) && $rate['item_count'] > 0){
        $fees = WC()->cart->get_fees();
        foreach( $fees as $fee){
          if($fee->id == 'self-pickup-discount'){
            ?>
            <div class="summary-data-line">
              
              <span class="label"><?php _e('self pickup discount', 'edb'); ?></span>
              <span class="value"><?php echo wc_price($fee->amount); ?></span>
            </div>
            <?php
          }
        }
      }
    
    }
  }
}

function edb_checkout_payment_summary(){
  $ccNum = WC()->session->get('edb_payment_info_card_number');
  $ccExpiry = WC()->session->get('edb_payment_info_card_expiry');
  ?>
  <div class="summay-data-line">
    <span class="label"><?php _e('credit card','edb'); ?></span>
    <span class="value cc-number"><?php echo $ccNum; ?></span>
  </div>
  <div class="summay-data-line">
    <span class="label"><?php _e('expiry','edb'); ?></span>
    <span class="value cc-expiry"><?php echo $ccExpiry; ?></span>
  </div>
  <?php
}

function edb_add_to_cart_button( $product_id, $qty=1 ){
  // echo "<form class='edb-add-to-cart' method='post'>";
  
  echo '<div class="product-selected-material"><span class="label">'.__('no color selected', 'edb').'</span><a href="#" id="show-material-toast" class="ifo-btn"><abbr title="info">i</abbr></a><span class="value"></span></div>';
  ?>
    <div class="product-quantity-input quantity">
      <label><?php _e('quantity', 'edb'); ?></label>
      <span class="value">
        <span class="qty-widget">
          <a href="#" class="qty-minus">-</a><span class="qty-val">1</span><a href="#" class="qty-plus">+</a>
          <input type="number" style="display:none" step="1" min="1" max="1000" name="quantity" value="<?php echo $qty ?>" />
        </span>
        
      </span>
    </div>
  <?php  
  echo '<div class="product-selected-availability"><span class="label">'.__('availability', 'edb').'</span><span class="value">--</span></div>';
  
  echo "<input type='hidden' name='add-to-cart' value='$product_id'>";
  echo "<input type='hidden' name='variation_id' value=''>";
  echo "<input type='hidden' name='attribute_edb_material' value=''>";
  echo "<input type='hidden' name='product_id' value='$product_id'>";
  echo '<div class="product-add-to-cart">';
  echo "<button id='add-to-cart' type='submit'>".__('ADD TO CART', 'edb')."</button>";
  echo '</div>';
  // echo "</form>";
}

?>