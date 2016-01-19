<?php 

function edb_availability_date(  ){
    echo "edb_availability_date";
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
  echo '<img src="'. $decorated->images['material_variations'][$decorated->material]. '">';
}
function edb_package_item_name( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->title;
}
function edb_package_item_material( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->material;
}
function edb_package_item_category( $package_item_key, $package_item ){
  $variation_id = $package_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->category;
}

function edb_cart_item_image( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo '<img src="'. $decorated->images['material_variations'][$decorated->material]. '">';
}
function edb_cart_item_name( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->title;
}
function edb_cart_item_material( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->material;
}
function edb_cart_item_category( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  echo $decorated->category;
}
function edb_cart_item_availability( $cart_item_key, $cart_item ){
  $product_id = $cart_item['product_id'];
  $variation_id = $cart_item['variation_id'];
  $decorated = edb_decorated_product( $variation_id );
  $delays = $decorated->shipping_delays[$variation_id];
  $min = $delays['available'];
  $max = $delays['backorder'];
  echo "$min ~ $max";
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


function edb_product_slideshow( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $slide_images = $decorated->images['slideshow'];
  $variation_images = $decorated->images['material_variations'];
  echo '<div class="edb-slideshow">';
  echo '<div class="edb-slideshow-images">';
  foreach($slide_images as $index => $src){
    echo '<div class="edb-slideshow-image-container'.($index == 0 ? ' active-slide' : '').'" style="background-image:url('.esc_attr($src).');">';
    echo '<img class="edb-slideshow-image" src="'.$src.'">';
    echo '</div>';
  }
  echo '</div>';
  echo '<div class="edb-slideshow-buttons"><a href="#" class="edb-slideshow-prev">&lt; prev</a><span class="edb-slideshow-separator">|</span><a href="#" class="edb-slideshow-next">next &gt;</a></div>';
  foreach($variation_images as $material => $src ){
    echo "<div data-material=\"$material\" class=\"edb-material-variation-image\" style=\"background-image:url('".$src."');\"></div>";
  }
  echo '</div>';
  
}

function edb_product_material_picker( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $materials = $decorated->materials;
  echo '<div class="edb-material-picker">';
  echo '<div class="label">select a color</div>';
  echo '<div class="edb-material-choices">';
  
  foreach($materials as $edb_material => $data ){
    
    echo "<label for=\"edb-material-choice-$edb_material\">";
    echo "<div class=\"edb-material-choice-square\" style=\"background-image:url('".$data['image']."');\">";
    echo "<input type='radio' id=\"edb-material-choice-$edb_material\" name=\"_edb_material_choice\" data-variation-id=\"".$data['variation_id']."\" value=\"$edb_material\">";
    echo "</div>";
    echo "</label>";
  }
  echo '</div>';
  
  echo '</div>';
  
}

function edb_product_tech_image( $product_id ){
  $decorated = edb_decorated_product( $product_id );
  $image = $decorated->images['technical'];
  echo '<img src="'.$image.'">';
}

function edb_checkout_billing_address_summary(){
  $first_name = WC()->session->get('billing_first_name');
  $last_name = WC()->session->get('billing_last_name');
  $name = "$first_name";
  if(!empty($last_name)){
    $name .= " $lastname";
  }
  $customer = WC()->customer;
  $lines = array_filter(array(
    $name,
    array_filter( array( $customer->address_1, $customer->address_2 ) ),
    array_filter( array( $customer->city, $customer->state ) ),
    $customer->postcode
  ));
  foreach($lines as $line){
    if(is_array($line)){
      $line = implode($line, ', ');
    }
    echo "<div class='summary-data-line'>$line</div>";
  }
}
function edb_checkout_shipping_address_summary(){
  $customer = WC()->customer;
  $lines = array_filter(array(
    array_filter( array( $customer->shipping_address_1, $customer->shipping_address_2 ) ),
    array_filter( array( $customer->shipping_city, $customer->shipping_state ) ),
    $customer->shipping_postcode
  ));
  foreach($lines as $line){
    if(is_array($line)){
      $line = implode($line, ', ');
    }
    echo "<div class='summary-data-line'>$line</div>";
  }
}

function edb_checkout_payment_summary(){
  $ccNum = WC()->session->get('edb_payment_info_card_number');
  $ccExpiry = WC()->session->get('edb_payment_info_card_expiry');
  ?>
  <div class="summay-data-line">
    <span class="label"><?php _e('Credit Card'); ?></span>
    <span class="value cc-number"><?php echo $ccNum; ?></span>
  </div>
  <div class="summay-data-line">
    <span class="label"><?php _e('Expiry'); ?></span>
    <span class="value cc-expiry"><?php echo $ccExpiry; ?></span>
  </div>
  <?php
}

function edb_add_to_cart_button( $product_id, $qty=1 ){
  // echo "<form class='edb-add-to-cart' method='post'>";
  echo '<div class="product-selected-material"><span class="label">color</span><span class="value"></span></div>';
  ?>
    <div class="product-quantity-input quantity">
      <label><?php _e('Quantity', 'edb'); ?></label>
      <span class="value">
        <span class="qty-widget">
          <a href="#" class="qty-minus">-</a><span class="qty-val">1</span><a href="#" class="qty-plus">+</a>
          <input type="number" style="display:none" step="1" min="1" max="1000" name="quantity" value="<?php echo $qty ?>" />
        </span>
        
      </span>
    </div>
  <?php  
  echo '<div class="product-selected-availability"><span class="label">availability</span><span class="value">1 week</span></div>';
  
  echo "<input type='hidden' name='add-to-cart' value='$product_id'>";
  echo "<input type='hidden' name='variation_id' value=''>";
  echo "<input type='hidden' name='attribute_edb_material' value=''>";
  echo "<input type='hidden' name='product_id' value='$product_id'>";
  echo '<div class="product-add-to-cart">';
  echo "<button id='add-to-cart' type='submit'>ADD TO CART</button>";
  echo '</div>';
  // echo "</form>";
}

?>