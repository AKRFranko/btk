<?php
if ( ! defined( 'ABSPATH' ) ) {
 
  exit;
}
?>
<?php
  do_action( 'woocommerce_review_order_before_cart_contents' );

  foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
    $_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );

    if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_checkout_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
      ?>
      <div class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">
        <div class="cart-item-image">
          <?php
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
              // Meta data
              //echo WC()->cart->get_item_data( $cart_item );
            ?>
            <?php
              echo $cart_item['variation']['attribute_edb_material'];
            ?>
          </div>
          <div class="cart-item-category">
            <?php
              echo $_product->get_categories();
            ?>
          </div>
          <div class="cart-item-availability">
            <?php
              echo '';# $WC_Edb->get_product_availability( array('availability'=>array()), $_product )['availability'];
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

  do_action( 'woocommerce_review_order_after_cart_contents' );
?>