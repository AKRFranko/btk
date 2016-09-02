<?php 
/**
 * This should be in its own separate file.
 */
class WC_Product_Mirror extends WC_Product_Variable {

  public function __construct( $product ) {

    $this->product_type = 'mirror';

    parent::__construct( $product );

  }
  
  

}
?>