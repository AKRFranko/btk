<?php
/**
 * Shipping Methods Display
 *
 * In 2.1 we show methods per package. This allows for multiple methods per order if so desired.
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

?>
<?php
  
  $package_contents = $package['contents'];
  
  $package_product = $package_contents[0]['data'];
  $product_name = $package_product->get_title();
  $product_attributes = $package_product->get_variation_attributes();
  $product_edb_material = $product_attributes['attribute_edb_material'];
  // $product_thumbnail_url = wp_get_attachment_url($package_product->get_image_id());
  
  $product_edb_availability =$package_contents[0]['edb_availability'];
  if(empty($product_edb_availability)){
    $product_edb_availability = '1 week';
  }
  
  $product_qty = $package_contents[0]['quantity'];
  $product_category = $package_product->get_categories();
  $total = $package_contents[0]['line_total'];
  $display_product = array(
    'name' => $product_name,
    'material'=>$product_edb_material,
    // 'image_url'=>$product_thumbnail_url,
    'availability'=>$product_edb_availability,
    'quantity'=>$product_qty,
    'package_id'=>$index,
    'total' => $total
    
  );
  
  
?>

<div class="cart_item">
  <div class="cart-item-image">
    
    <?php
        edb_package_item_image( $index, $package['contents'][0] );
    ?>
  </div>
  <div class="cart-item-info">
    <div class="cart-item-name">
      <?php
          edb_package_item_name( $index, $package['contents'][0] );
      ?>
    </div>
    <div class="cart-item-material">
      <?php
          edb_package_item_material( $index, $package['contents'][0] );
      ?>
    </div>
    <div class="cart-item-category">
      <?php
          edb_package_item_category( $index, $package['contents'][0] );
          // echo $total;
      ?>
      
    </div>
    <div class="cart-item-availability">
      <?php 
        edb_shipping_item_availability($package_contents[0]);
      // echo "$product_qty @ $product_edb_availability";
      ?>
       
    </div>
  </div>
  <div class="cart-item-options">
    
  
  <?php foreach ( $available_methods as $method_name => $method ) { ?>
     
    <div class="shipping-method-choice <?php edb_shipping_method_disabled($method_name); ?>">
    
      <label><input type="radio" name="shipping_method[<?php echo $index; ?>]" data-index="<?php echo $index; ?>" id="shipping_method_<?php echo $index; ?>_<?php echo sanitize_title( $method->id ); ?>" value="<?php echo esc_attr( $method->id ); ?>" <?php checked( $method->id, $chosen_method ); ?> class="shipping_method update_totals_on_change" /></label>
    </div>
  <?php }; ?>
    
  </div>
  
  <div class="cart-item-actions">
    <div class="cart-item-remove">
      
    </div>
    <div class="cart-item-edit">
      <a href="<?php echo WC()->cart->get_cart_url(); ?>">edit</a>
    </div>
  </div>
  

</div>


<?php if(false){
  ?>
  <tr class="shipping">
    <th>
      
     
    <?php
      
      if ( $show_package_details ) {
        
        printf( __( 'Shipping #%s', 'woocommerce' ), $product_name  );
      } else {
        _e( 'Shipping', 'woocommerce' );
      }
    ?></th>
    <td>
      
      <?php if ( ! empty( $available_methods ) ) : ?>
          
        <?php if ( 1 === count( $available_methods ) ) :
          $method = current( $available_methods );
          echo wp_kses_post( wc_cart_totals_shipping_method_label( $method ) ); ?>
          <input type="hidden" name="shipping_method[<?php echo $index; ?>]" data-index="<?php echo $index; ?>" id="shipping_method_<?php echo $index; ?>" value="<?php echo esc_attr( $method->id ); ?>" class="shipping_method" />
  
        <?php elseif ( get_option( 'woocommerce_shipping_method_format' ) === 'select' ) : ?>
  
          <select name="shipping_method[<?php echo $index; ?>]" data-index="<?php echo $index; ?>" id="shipping_method_<?php echo $index; ?>" class="shipping_method">
            <?php foreach ( $available_methods as $method ) : ?>
              
              <option value="<?php echo esc_attr( $method->id ); ?>" <?php selected( $method->id, $chosen_method ); ?>><?php echo wp_kses_post( wc_cart_totals_shipping_method_label( $method ) ); ?></option>
            <?php endforeach; ?>
          </select>
  
        <?php else : ?>
  
          <ul id="shipping_method">
            
            <?php foreach ( $available_methods as $method ) : ?>
              
              <li>
                

                <input type="radio" name="shipping_method[<?php echo $index; ?>]" data-index="<?php echo $index; ?>" id="shipping_method_<?php echo $index; ?>_<?php echo sanitize_title( $method->id ); ?>" value="<?php echo esc_attr( $method->id ); ?>" <?php checked( $method->id, $chosen_method ); ?> class="shipping_method" />
                
                <label for="shipping_method_<?php echo $index; ?>_<?php echo sanitize_title( $method->id ); ?>"><?php echo wp_kses_post( wc_cart_totals_shipping_method_label( $method ) ); ?></label>
              </li>
            <?php endforeach; ?>
          </ul>
  
        <?php endif; ?>
  
      <?php elseif ( ( WC()->countries->get_states( WC()->customer->get_shipping_country() ) && ! WC()->customer->get_shipping_state() ) || ! WC()->customer->get_shipping_postcode() ) : ?>
  
        <?php if ( is_cart() && get_option( 'woocommerce_enable_shipping_calc' ) === 'yes' ) : ?>
  
          <p><?php _e( 'Please use the shipping calculator to see available shipping methods.', 'woocommerce' ); ?></p>
  
        <?php elseif ( is_cart() ) : ?>
  
          <p><?php _e( 'Please continue to the checkout and enter your full address to see if there are any available shipping methods.', 'woocommerce' ); ?></p>
  
        <?php else : ?>
  
          <p><?php _e( 'Please fill in your details to see available shipping methods.', 'woocommerce' ); ?></p>
  
        <?php endif; ?>
  
      <?php else : ?>
  
        <?php if ( is_cart() ) : ?>
  
          <?php echo apply_filters( 'woocommerce_cart_no_shipping_available_html',
            '<p>' . __( 'There are no shipping methods available. Please double check your address, or contact us if you need any help.', 'woocommerce' ) . '</p>'
          ); ?>
  
        <?php else : ?>
  
          <?php echo apply_filters( 'woocommerce_no_shipping_available_html',
            '<p>' . __( 'There are no shipping methods available. Please double check your address, or contact us if you need any help.', 'woocommerce' ) . '</p>'
          ); ?>
  
        <?php endif; ?>
  
      <?php endif; ?>
  
      <?php if ( $show_package_details ) : ?>
      
        <?php
          foreach ( $package['contents'] as $item_id => $values ) {
            
            if ( $values['data']->needs_shipping() ) {
              $product_names[] = $values['data']->get_title() . ' &times;' . $values['quantity'];
            }
          }
  
          echo '<p class="woocommerce-shipping-contents"><small>' . __( 'Shipping', 'woocommerce' ) . ': ' . implode( ', ', $product_names ) . '</small></p>';
        ?>
        
      <?php endif; ?>
  
      <?php if ( is_cart() ) : ?>
      
        <?php woocommerce_shipping_calculator(); ?>
      <?php endif; ?>
    </td>
  </tr>
  
  <?php
} ?>
