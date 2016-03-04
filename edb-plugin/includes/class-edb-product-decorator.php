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
  public $subtitle = '';
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
  public $stocks = array();
  public $variations = array();
  
  public $shipping_delays = null;
  
  public function __construct( $product ) {
    $factory = new WC_Product_Factory();
    
    if(empty($product)) return;
    
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
    
    $this->title = apply_filters('the_title', $this->post_object->post_title );
    $this->subtitle = apply_filters('the_title', $this->product_object->subtitle );
    
    $this->description =  apply_filters('the_content',get_post_field('post_content', $this->post_id ));

    $this->variations = $this->product_object->get_children( $visible_only = true );
    $this->stocks = array();
    $this->available_variations=array();
    foreach( $this->variations as $vid){
      $this->stocks[$vid] = get_post_meta($vid, '_stock', true);
      array_push( $this->available_variations,get_post_meta($vid, 'attribute_edb_material', true));
    }
    
    // get all materials and their descriptions
    $this->init_materials();
    // organize images for slideshow and custom edb stuff
    $this->init_images();
    // organize images for slideshow and custom edb stuff
    $this->init_videos();
    // get all shipping dates
    $this->init_shipping();
    
    $args = array( 'post_mime_type' => 'application/pdf', 'post_type' => 'attachment', 'numberposts' => -1, 'post_status' => null, 'post_parent' => $this->post_id );
    $attachments = get_posts($args);
    if(!empty($attachments)){
      $pdf = $attachments[0]->guid;
      $this->pdf_url = $pdf;
    }else{
      $this->pdf_url = null;
    }
    if ($attachments) {
      foreach ( $attachments as $attachment ) {
        echo apply_filters( 'the_title' , $attachment->post_title );
        the_attachment_link( $attachment->ID , false );
      }
    }

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
    // write_log($product_cat_terms);
    foreach( $product_cat_terms as $category ){
      $categories[]=$category->name;
    }
    
    // write_log( $categories );
    $this->category = implode(', ', $categories);
    $this->category_slug = $product_cat_terms[0]->slug;
    // $this->category_slug = $categories[0]
    // $this->videos = array(
    //   'introduction' => get_post_meta( $this->post_id, '_edb_introduction_video', true ),
    //   'instruction' => get_post_meta( $this->post_id, '_edb_instruction_video', true )
    // );
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
  // write_log( $this->variations );
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
   #write_log($variation_materials);
    
   $get_material_desc_args = array(
     'meta_key' => '_edb_material',
    // 'meta_value' => $variation_materials,
     'post_type' => 'edb_material_desc',
     'post_status'=> 'any',
     'posts_per_page'=> -1
   );

   $material_descriptions = get_posts( $get_material_desc_args );
  // write_log($material_descriptions);
   $this->materials = array();
   
   foreach( $variation_materials as $variation_material){
     if(in_array($variation_material, $this->available_variations)){
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
   
  }
  
  private function init_videos(){
   $intro_id = get_post_meta( $this->post_id, '_edb_introduction_video', true );
   $instu_id = get_post_meta( $this->post_id, '_edb_instruction_video', true );
   // $other_ids = get_post_meta( $this->post_id, '_edb_other_video', true );
   $missing = get_bloginfo('template_directory')."/vmissing.png";
   $this->videos = array(
     'introduction'=>array('youtube_id' => null, 'video_link' => '#', 'image_src'=> $missing),
     'instruction'=>array('youtube_id' => null, 'video_link' => '#', 'image_src'=> $missing)
    );
   if(!empty($intro_id)){
     $src = 'http://img.youtube.com/vi/'.$intro_id.'/maxresdefault.jpg';
     $link = 'http://www.youtube.com/watch?v='.$intro_id;
     $this->videos['introduction'] = array( 'youtube_id' => $intro_id, 'image_src' => $src, 'video_link' => $link );
   }
   if(!empty($instu_id)){
     $src = 'http://img.youtube.com/vi/'.$instu_id.'/maxresdefault.jpg';
     $link = 'http://www.youtube.com/watch?v='.$instu_id;
     $this->videos['instruction'] = array( 'youtube_id' => $instu_id, 'image_src' => $src, 'video_link' => $link );
   }
   
   
  }
  
  private function init_images(){
    
    $gallery_images = get_post_meta( $this->post_id, '_product_image_gallery', true);
    $featured_image_id  = get_post_thumbnail_id( $this->post_id );
    $technical_image_id = get_post_meta( $this->post_id, '_edb_technical_image', true );
    $slideshow_images   = array();
    $variation_images   = array();
    
    if(!empty($gallery_images)){
      $ids = explode(',',$gallery_images);
      $attachment_images = get_posts(
          array(
              'include' => $ids, 
              'post_status' => 'inherit', 
              'post_type' => 'attachment', 
              'post_mime_type' => 'image', 
              'order' => 'menu_order ID', 
              'orderby' => 'post__in', //required to order results based on order specified the "include" param
          )
      );
    }else{
      $attachment_images  = get_attached_media( 'image', $this->post_id );  
    }
    foreach( $attachment_images as $image){
      
      if( $image->ID == $technical_image_id ){
        $this->images['technical'] = wp_get_attachment_image_src( $image->ID, 'full')[0];
      }else if( $image->ID == $featured_image_id ){
        $this->images['featured'] = wp_get_attachment_image_src( $image->ID, 'full')[0];
        $slideshow_images[] = $this->images['featured'];
      }else{
        $slideshow_images[] = wp_get_attachment_image_src( $image->ID, 'full')[0];
      }
    }
    if(empty($this->images['featured'])){
      $this->images['featured'] = wp_get_attachment_image_src( $featured_image_id, 'full')[0];
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
    
    // array_unshift( $slideshow_images , $this->images['featured'] );  
    
    
    // array_unshift( $slideshow_images , $this->images['technical'] );  
    
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
