<?php
// Register Custom Post Type
function create_edb_press_reviews() {

  $labels = array(
    'name'                  => _x( 'Press Reviews', 'Post Type General Name', 'edb' ),
    'singular_name'         => _x( 'Press Review', 'Post Type Singular Name', 'edb' ),
    'menu_name'             => __( 'Press Reviews', 'edb' ),
    'name_admin_bar'        => __( 'Press Reviews', 'edb' ),
    'archives'              => __( 'Press Review Archives', 'edb' ),
    'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
    'all_items'             => __( 'All Items', 'edb' ),
    'add_new_item'          => __( 'Add New Item', 'edb' ),
    'add_new'               => __( 'Add New', 'edb' ),
    'new_item'              => __( 'New Item', 'edb' ),
    'edit_item'             => __( 'Edit Item', 'edb' ),
    'update_item'           => __( 'Update Item', 'edb' ),
    'view_item'             => __( 'View Item', 'edb' ),
    'search_items'          => __( 'Search Item', 'edb' ),
    'not_found'             => __( 'Not found', 'edb' ),
    'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
    'featured_image'        => __( 'Featured Image', 'edb' ),
    'set_featured_image'    => __( 'Set featured image', 'edb' ),
    'remove_featured_image' => __( 'Remove featured image', 'edb' ),
    'use_featured_image'    => __( 'Use as featured image', 'edb' ),
    'insert_into_item'      => __( 'Insert into item', 'edb' ),
    'uploaded_to_this_item' => __( 'Uploaded to this item', 'edb' ),
    'items_list'            => __( 'Items list', 'edb' ),
    'items_list_navigation' => __( 'Items list navigation', 'edb' ),
    'filter_items_list'     => __( 'Filter items list', 'edb' ),
  );
  $args = array(
    'label'                 => __( 'Press Review', 'edb' ),
    'description'           => __( 'Press Reviews', 'edb' ),
    'labels'                => $labels,
    'supports'              => array( 'title' , 'thumbnail'),
    'hierarchical'          => false,
    'public'                => true,
    'show_ui'               => true,
    'show_in_menu'          => true,
    'menu_position'         => 25,
    'menu_icon'             => 'dashicons-format-quote',
    'show_in_admin_bar'     => true,
    'show_in_nav_menus'     => true,
    'can_export'            => true,
    'has_archive'           => true,    
    'exclude_from_search'   => true,
    'publicly_queryable'    => true,
    'capability_type'       => 'page',
  );
  register_post_type( 'edb_press_review', $args );

}
add_action( 'init', 'create_edb_press_reviews', 0 );
add_filter( 'rwmb_meta_boxes', 'edb_press_review_meta_boxes' );

function edb_press_review_meta_boxes( $meta_boxes ) {
    $meta_boxes[] = array(
        'title'      => __( 'Review Info', 'textdomain' ),
        'post_types' => 'edb_press_review',
        'priority' => 'high',
        'fields'     => array(
           
            array(
              'name'             => esc_html__( 'Press Review URL', 'edb' ),
              'id'               => "edb_press_review_link",
              'type'             => 'url'
            ),
            array(
              'name' => esc_html__('Press Review Excerpt','edb'),
              'id' => 'edb_press_review_text',
              'type'=>'textarea',
              'rows' =>4
           )
        ),
    );
    
  
    return $meta_boxes;
}

