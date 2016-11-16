<?php
if ( ! defined( 'ABSPATH' ) ) {
 
  exit;
}
?>
<?php
  // do_action( 'woocommerce_review_order_before_cart_contents' );
  
  foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
    // write_log("CART ITEM");
    // write_log($cart_item);
    $_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
    // $deco = edb_decorated_product( $_product->ID );
    if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_checkout_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
      
      $deco = edb_decorated_product($_product);
      $ga_product = json_encode(array(
        'id'=>$_product->post->ID,
        'name'=>$deco->full_name,
        'category'=> $deco->main_category,
        'variant'=> $deco->material,
        'price'=> $deco->price,
        'quantity'=> $cart_item['quantity'] ));
      ?>
      
      <div data-product="<?php echo esc_attr($ga_product); ?>" class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">
        <div class="cart-item-image">
          <?php
            global $Edb_Shipping_Method;
            
            $shipments = $Edb_Shipping_Method->cart_item_shipments[$cart_item_key];  
            $shipment_texts = array();
            foreach($shipments as $sm){
              if($sm=='edb_self_pickup'){
                array_push( $shipment_texts, 'pickup');
              }else{
                array_push( $shipment_texts, 'ship');
              }
            }
            
            $thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );

            if ( ! $_product->is_visible() ) {
              echo $thumbnail;
            } else {
              printf( '<a href="%s">%s</a>', esc_url( $_product->get_permalink( $cart_item ) ), $thumbnail );
            }
          ?>
        </div>
        <div class="cart-item-info">
          <div class="cart-item-name">
            <?php echo apply_filters( 'woocommerce_cart_item_name', $_product->get_title(), $cart_item, $cart_item_key ) . '&nbsp;'; ?>
          </div>  
          <div class="cart-item-material">
            <?php
              edb_checkout_item_material( $cart_item_key, $cart_item );
              
            ?>
          </div>
          <div class="cart-item-category">
            <?php
              echo strip_tags($_product->get_categories());
            ?>
          </div>
          <div class="cart-item-availability">
            <?php
              edb_checkout_item_availability( $cart_item_key, $cart_item );
              
              echo "<p>".$shipment_texts[0];
              if(!empty($shipment_texts[1])){
                echo " + " . $shipment_texts[1];
              }
              echo "</p>";
              // echo implode(',',$shipments);# $WC_Edb->get_product_availability( array('availability'=>array()), $_product )['availability'];
            ?>
          </div>
          
        </div>
        <div class="cart-item-actions">
          <div class="cart-item-remove">
            
          </div>
          <div class="cart-item-edit">
            <a href="<?php echo WC()->cart->get_cart_url(); ?>">edit</a>
          </div>
        </div>
        
          
      </div>
      <?php
    }
  }

  // do_action( 'woocommerce_review_order_after_cart_contents' );
?>