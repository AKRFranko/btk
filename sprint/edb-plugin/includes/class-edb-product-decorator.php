<?php

/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * public-facing side of the site and the admin area.
 *
 * @link       http://akr.club
 * @since      1.0.0
 *
 * @package    Edb
 * @subpackage Edb/includes
 */

/**
 * The core plugin class.
 *
 * This is used to define internationalization, admin-specific hooks, and
 * public-facing site hooks.
 *
 * Also maintains the unique identifier of this plugin as well as the current
 * version of the plugin.
 *
 * @since      1.0.0
 * @package    Edb
 * @subpackage Edb/includes
 * @author     Franko <franko@akr.club>
 */
class Edb_Product_Decorator {
  
  public $title = '';
  public $description = '';
  // public $availability = '';
  
  public $price = 0;
  public $category = null;
  public $material = null;
  public $materials = array();
  public $videos = array();
  public $images = array();
  public $sku;
  public $url;
  
  public $variation_id = null;
  public $product_id = null;
  public $post_id = null;
  
  public $variation_object = null;
  public $product_object = null;
  public $post_object = null;
  
  public $variations = array();
  
  public $shipping_delays = null;
  
  public function __construct( $product ) {
    $factory = new WC_Product_Factory();
    
    
    
    if(!is_object($product)){
      $product = $factory->get_product( $product );
    }
    
    
    
    if( isset($product->variation_id )){
      $this->variation_id =  $product->variation_id;
    }else{
      $this->variation_id = null;
    }
    
    if( isset($product->parent) && !empty($product->parent)){
      $this->product_id = $product->parent->id;
    }else{
      $this->product_id = $product->id;
    }
    
    
    if(!empty( $this->variation_id )){
      $this->variation_object = $factory->get_product( $this->variation_id );
    }
    if(!empty( $this->product_id )){
      $this->product_object = $factory->get_product( $this->product_id );
    }
    
    
    $this->post_id =   $this->product_id;
    $this->post_object = get_post( $this->post_id );
    
    $this->title = get_the_title($this->post_id);
    $this->description =  get_post_field('post_content', $this->post_id );

    $this->variations = $this->product_object->get_children();
    // get all materials and their descriptions
    $this->init_materials();
    // organize images for slideshow and custom edb stuff
    $this->init_images();
    // get all shipping dates
    $this->init_shipping();

    if( isset($this->variation_id) && !empty($this->variation_id) ){
      $material = get_post_meta($this->variation_id, 'attribute_edb_material', true );
      $this->sku = $this->variation_object->get_sku();
      $this->material = $material;
      $this->url = $this->variation_object->get_permalink( );
    }else{
      $this->sku = $this->product_object->get_sku();
      $this->material = null;
      $this->url = $this->product_object->get_permalink( );
    }
    
    $this->price = $this->product_object->get_price();
    if(empty($this->price)){
      $variation = $factory->get_product($this->variations[0]);
      $this->price = $variation->get_price();
    }
    
   
    // end get all materials and their descriptions
    
    
    $product_cat_terms = get_the_terms( $this->post_id, 'product_cat');
    $categories = array();
    
    foreach( $product_cat_terms as $category ){
      $categories[]=$category->name;
    }
    
    $this->category = implode(', ', $categories);
    
    $this->videos = array(
      'introduction' => get_post_meta( $this->post_id, '_edb_introduction_video', true ),
      'instruction' => get_post_meta( $this->post_id, '_edb_instruction_video', true )
    );
    $this->json = $this->get_json_object();
    
    
    // write_log( $this->json );
    
    
  }
  
  private function init_shipping(){
    $shipping_delays = array();
    
    $avail_default = get_post_meta( $this->product_id, '_edb_available_delay', true);
    $backo_default = get_post_meta( $this->product_id, '_edb_backorder_delay', true);
    if(empty($avail_default)){
      $avail_default = '+7 days';
    }
    if(empty($backo_default)){
      $backo_default = '+14 days';
    }
    foreach( $this->variations as $variation_id){
      $avail = get_post_meta( $this->product_id, '_edb_variation_available_delay', true);
      $backo = get_post_meta( $this->product_id, '_edb_variation_backorder_delay', true);
      if(empty($avail)){
        $avail = $avail_default;
      }
      if(empty($backo)){
        $backo = $backo_default;
      }
      $shipping_delays[$variation_id] = array(
        'available' => $avail,
        'backorder' => $backo
      );
    }
    $this->shipping_delays = $shipping_delays;
    
  }
  
  private function init_materials( ){
    
   $product_attributes = get_post_meta( $this->post_id, '_product_attributes');
   $variation_materials = array();
   
   foreach( $product_attributes as $product_attribute ){
     foreach($product_attribute as $name=>$attribute){
       if( $name == 'edb_material'){
         
         $value = $attribute['value'];
         if(strpos( $value, '|') !== false ){
           $values = explode('|', $value);
           $value = array();
           foreach( $values as $v){
             if(!empty($v)){
               $value[] = trim($v);  
             }
           }
         }else{
           $value = array( $value );
         }
         $variation_materials = $value;
       }  
     }
   }
    
   $get_material_desc_args = array(
     'meta_key' => '_edb_material',
     'meta_value' => $variation_materials,
     'post_type' => 'edb_material_desc',
     'post_status'=> 'any',
     'posts_per_page'=> -1
   );
   
   $material_descriptions = get_posts( $get_material_desc_args );
   
   $this->materials = array();
   
   foreach( $variation_materials as $variation_material){
     
     $this->materials[$variation_material] = array( );
     $this->materials[$variation_material]['edb_material'] = $variation_material;
     $this->materials[$variation_material]['post'] = null;
     $this->materials[$variation_material]['image'] = null;
     
     $description = null;
     
     foreach($material_descriptions as $desc_post ){
       if( get_post_meta( $desc_post->ID, '_edb_material', true ) == $variation_material ){
         $this->materials[$variation_material]['post'] = $desc_post;
         $image_id = get_post_thumbnail_id( $desc_post->ID ,'full');
         $this->materials[$variation_material]['image'] = wp_get_attachment_image_src($image_id, 'full')[0];
       }
     }
     
   } 
   
  }
  
  
  private function init_images(){
    $attachment_images  = get_attached_media( 'image', $this->post_id );
    $featured_image_id  = get_post_thumbnail_id( $this->post_id );
    $technical_image_id = get_post_meta( $this->post_id, '_edb_technical_image');
    $slideshow_images   = array();
    $variation_images   = array();
    
    
    foreach( $attachment_images as $image){
      if( $image->ID == $technical_image_id ){
        $this->images['technical'] = wp_get_attachment_image_src( $image->ID, 'full')[0];
      }else if( $image->ID == $featured_image_id ){
        $this->images['featured'] = wp_get_attachment_image_src( $image->ID, 'full')[0];
      }else{
        $slideshow_images[] = wp_get_attachment_image_src( $image->ID, 'full')[0];
      }
    }
   
    if(empty($this->images['technical'])){
      $this->images['technical'] = get_bloginfo('template_directory')."/missing.png";
      
    }
    $variation_ids = $this->variations;

    foreach( $variation_ids as $variation_id ){
      
      
      
      $edb_material = get_post_meta($variation_id, 'attribute_edb_material', true );
      $image_id = get_post_thumbnail_id( $variation_id );
      $variation_images[$edb_material] = wp_get_attachment_image_src( $image_id, 'full')[0];
      if(empty($variation_images[$edb_material])){
        $variation_images[$edb_material] = $this->images['featured'];
      }
      if(isset($this->materials[$edb_material])){
        $this->materials[$edb_material]['variation_id'] = $variation_id;
      }
    }
    
    ksort($variation_images);
    array_unshift( $slideshow_images , $this->images['featured'] );
    
    $this->images['material_variations'] = $variation_images;
    $this->images['slideshow'] = $slideshow_images;
    
    
  }
  
  /*
  * Simplify the information for JSON usage.
  */
  private function get_json_object(){
    $json_attributes = array( 'sku', 'url', 'title', 'description', 'price', 'category','material', 'materials', 'images', 'post_id','product_id','variation_id', 'shipping_delays' );
    $json_result = array();
    foreach($json_attributes as $attribute ){
      $value = $this->{$attribute};
      if(!empty($value)){
        if(is_array( $value )){
          $value = json_decode( json_encode( $value ) );
        }else{
          $value = esc_attr( $value );
        }
        $json_result[$attribute] = $value;
      }
    }
    
    return $json_result;
  }
  

}
