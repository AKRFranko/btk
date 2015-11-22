<?php

$posts = array('post_type' => 'product','posts_per_page' => 200);
$query  = new WP_Query(  );

if ( $query->have_posts() ) {
  while ( $query->have_posts() ){
    $query->the_post();
    var_dump( $product );
  };
} else {
  echo __( 'No products found' );
}
wp_reset_postdata();
?>
