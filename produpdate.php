<?php

class PseudoCrypt {

    /* Key: Next prime greater than 62 ^ n / 1.618033988749894848 */
    /* Value: modular multiplicative inverse */
    private static $golden_primes = array(
        '1'                  => '1',
        '41'                 => '59',
        '2377'               => '1677',
        '147299'             => '187507',
        '9132313'            => '5952585',
        '566201239'          => '643566407',
        '35104476161'        => '22071637057',
        '2176477521929'      => '294289236153',
        '134941606358731'    => '88879354792675',
        '8366379594239857'   => '7275288500431249',
        '518715534842869223' => '280042546585394647'
    );

    /* Ascii :                    0  9,         A  Z,         a  z     */
    /* $chars = array_merge(range(48,57), range(65,90), range(97,122)) */
    private static $chars62 = array(
        0=>48,1=>49,2=>50,3=>51,4=>52,5=>53,6=>54,7=>55,8=>56,9=>57,10=>65,
        11=>66,12=>67,13=>68,14=>69,15=>70,16=>71,17=>72,18=>73,19=>74,20=>75,
        21=>76,22=>77,23=>78,24=>79,25=>80,26=>81,27=>82,28=>83,29=>84,30=>85,
        31=>86,32=>87,33=>88,34=>89,35=>90,36=>97,37=>98,38=>99,39=>100,40=>101,
        41=>102,42=>103,43=>104,44=>105,45=>106,46=>107,47=>108,48=>109,49=>110,
        50=>111,51=>112,52=>113,53=>114,54=>115,55=>116,56=>117,57=>118,58=>119,
        59=>120,60=>121,61=>122
    );

    public static function base62($int) {
        $key = "";
        while(bccomp($int, 0) > 0) {
            $mod = bcmod($int, 62);
            $key .= chr(self::$chars62[$mod]);
            $int = bcdiv($int, 62);
        }
        return strrev($key);
    }

    public static function hash($num, $len = 5) {
        $ceil = bcpow(62, $len);
        $primes = array_keys(self::$golden_primes);
        $prime = $primes[$len];
        $dec = bcmod(bcmul($num, $prime), $ceil);
        $hash = self::base62($dec);
        return str_pad($hash, $len, "0", STR_PAD_LEFT);
    }

    public static function unbase62($key) {
        $int = 0;
        foreach(str_split(strrev($key)) as $i => $char) {
            $dec = array_search(ord($char), self::$chars62);
            $int = bcadd(bcmul($dec, bcpow(62, $i)), $int);
        }
        return $int;
    }

    public static function unhash($hash) {
        $len = strlen($hash);
        $ceil = bcpow(62, $len);
        $mmiprimes = array_values(self::$golden_primes);
        $mmi = $mmiprimes[$len];
        $num = self::unbase62($hash);
        $dec = bcmod(bcmul($num, $mmi), $ceil);
        return $dec;
    }

}
$categories = array(
 'sofas',
 'sofa-beds',
 'sectionals',
 'coffee-tables',
 'armchairs',
 'benches-ottomans',
 'headboards',
 'storage',
 'accessories',
);

$sub_categories = array(
  'sofas'=> array( '2-seater', '3-seater'),
  'sectionals' => array('left-facing','right-facing'),
  'accessories' => array('pillows','rugs', 'other'),
);

$shipping_classes = array(
  'sofas' => 'furniture',
  'sofa-beds'=> 'furniture',
  'sectionals'=> 'furniture',
  'coffee-tables'=> 'furniture',
  'armchairs'=> 'furniture',
  'benches-ottomans'=> 'furniture',
  'headboards'=> 'furniture',
  'storage'=> 'accessories',
  'accessories'=> 'accessories',
);

$category_materials = array(
  'sofas' => array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'sofa-beds'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'sectionals'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'coffee-tables'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'armchairs'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'benches-ottomans'=> array('001','002','003','004','005','006','007','008','009','010','011','012'),
  'headboards'=> array('001','002','003','004','005','006'),
  'storage'=> array('001','002'),
  'accessories'=> array('001','002','003','004','005','006'),
);


function get_sku( $cat, $material='000', $id ){
  $sku_cats = array(
    'sofas' => 'SOF-ZZZ',
    'sofa-beds' => 'SOB-ZZZ',
    'sectionals' => 'SEC-ZZZ',
    'armchairs' => 'ARM-ZZZ',
    'coffee-tables' => 'COF-ZZZ',
    'benches-ottomans' => 'BNO-ZZZ',
    'headboards' => 'HED-ZZZ',
    'storage' => 'STR-ZZZ',
    'accessories' => 'ACC-ZZZ',
    'sofas-2-seater' => 'SOF-2ST',
    'sofas-3-seater'=> 'SOF-3ST',
    'sectionals-left-facing'=> 'SEC-LFT',
    'sectionals-right-facing'=> 'SEC-RGT',
    'accessories-pillows' =>'ACC-PIL',
    'accessories-rugs'=>'ACC-RUG',
    'accessories-other'=>'ACC-OTH',
  );
  $hashid = PseudoCrypt::hash($id, 4); 
  return $sku_cats[$cat[0]->slug] . "-$material-".strtoupper( $hashid );
}



$posts = array('post_type' => array('product','product_variation'),'posts_per_page' => -1);
$query  = new WP_Query( $posts );

if ( $query->have_posts() ) {
    $facto = new WC_Product_Factory( );
  $used = array();
  while ( $query->have_posts() ){
    $query->the_post();
    $the_id = get_the_ID();
    $product = $facto->get_product( $the_id );
    $type = $product->product_type;
    $category = wp_get_post_terms( $the_id, 'product_cat' );
    
    
//     $price = $product->price;
//     if($price == 'visible' || empty($price)){
// $price = 350.00;
//     }
    if( $type == 'variation' || $type == 'variable'){
      
        
      
      if( $type == 'variable'){
        $materials = get_post_meta($the_id, '_product_attributes' );
        $materials = explode( '|' ,$materials[0]['edb_material']['value']);
        $avail = $product->get_available_variations();
        
          
        
        update_post_meta( $the_id, '_sku', get_sku($category, '000', $the_id )  );

                     
        foreach($avail as $vari ){
          $set = $vari['attributes']['attribute_edb_material'];
          // if(empty($set)){
          //   $set = array_shift($materials);
          update_post_meta( $vari['variation_id'], '_sku', get_sku($category, $set, $vari['variation_id'] ) );
          
#            update_post_meta( $vari['variation_id'], '_visibility', 'visible' );
            // update_post_meta( $vari['variation_id'], '_price', $price );
            // update_post_meta( $vari['variation_id'], '_regular_price', $price );
            #update_post_meta( $vari['variation_id'], '_price', $product->price );
            
          // }
          
          
        }
        // $avail = $product->get_available_variations();
        // if(count($avail) == 0 ){
        //   $category = explode('-', $category[0]->slug )[0];
        //   $materials = $category_materials[$category];
        //   $shipping_class = $shipping_classes[$category];
        //   update_post_meta( $the_id, '_product_attributes',  array( 'edb_material' => array( 'name' => 'edb_material', 'value' => implode('|', $materials ), 'is_visible' => 1, 'is_variation' => 1, 'taxonomy'=>1 ) )  );
        //   wp_set_object_terms( $the_id, $shipping_class, 'product_shipping_class');
        //   wp_set_object_terms( $the_id, 'variable', 'product_type');
        //   // var_dump("Change to: $shipping_class");
        //   foreach($materials as $material){
        //     $vari = array(
        //       'post_title' => get_the_title( $the_id ),
        //       'post_content'=> get_the_content( $the_id ),
        //       'post_status'=>'publish',
        //       'post_type'=>'product_variation',
        //       'post_parent'=>$the_id,
        //       'post_name'=>$product->post->post_name."-$material"
        //     );
        //     $post_id = wp_insert_post( $vari );
        //     update_post_meta( $post_id, 'visible', '_visibility');
        //     update_post_meta( $post_id, $material, 'attribute_edb_material');
        //     update_post_meta( $post_id, 2, '_stock');
        //     update_post_meta( $post_id, 'instock', '_stock_status');
        //     update_post_meta( $post_id, 'yes', '_manage_stock');
        //     update_post_meta( $post_id, 'yes', '_backorders');
            // var_dump("Add: ".json_encode($vari));
          // }
          // var_dump();
        // }
      }else{
        
        
        // update_post_meta( $the_id,  '_stock', 2);
        // update_post_meta( $the_id, '_stock_status', 'instock');
        // update_post_meta( $the_id, '_manage_stock', 'yes');
        // update_post_meta( $the_id,'_backorders', 'yes');
      }
      //var_dump( "post $the_id is ok.");
    }else{
      var_dump( "post $the_id is type: $type.");
      
    }
    
    // var_dump($product);
  };
} else {
  echo __( 'No products found' );
}
#wp_reset_postdata();
?>
