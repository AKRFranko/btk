<?php

// Register Custom Post Type
function create_review_post_type() {

  $labels = array(
    'name'                  => _x( 'Reviews', 'Post Type General Name', 'edb' ),
    'singular_name'         => _x( 'Review', 'Post Type Singular Name', 'edb' ),
    'menu_name'             => __( 'Product Reviews', 'edb' ),
    'name_admin_bar'        => __( 'Product Review', 'edb' ),
    'archives'              => __( 'Review Archives', 'edb' ),
    'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
    'all_items'             => __( 'All Reviews', 'edb' ),
    'add_new_item'          => __( 'Add New Review', 'edb' ),
    'add_new'               => __( 'Add New', 'edb' ),
    'new_item'              => __( 'New Review', 'edb' ),
    'edit_item'             => __( 'Edit Review', 'edb' ),
    'update_item'           => __( 'Update Review', 'edb' ),
    'view_item'             => __( 'View Review', 'edb' ),
    'search_items'          => __( 'Search Review', 'edb' ),
    'not_found'             => __( 'Not found', 'edb' ),
    'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
    'featured_image'        => __( 'Featured Image', 'edb' ),
    'set_featured_image'    => __( 'Set featured image', 'edb' ),
    'remove_featured_image' => __( 'Remove featured image', 'edb' ),
    'use_featured_image'    => __( 'Use as featured image', 'edb' ),
    'insert_into_item'      => __( 'Insert into review', 'edb' ),
    'uploaded_to_this_item' => __( 'Uploaded to this review', 'edb' ),
    'items_list'            => __( 'Reviews list', 'edb' ),
    'items_list_navigation' => __( 'Reviews list navigation', 'edb' ),
    'filter_items_list'     => __( 'Filter reviews list', 'edb' ),
  );
  $rewrite = array(
    'slug'                  => 'review',
    'with_front'            => true,
    'pages'                 => false,
    'feeds'                 => false,
  );
  $args = array(
    'label'                 => __( 'Product Review', 'edb' ),
    'description'           => __( 'Review Infos', 'edb' ),
    'labels'                => $labels,
    'supports'              => array( 'title', 'editor' ),
    'hierarchical'          => false,
    'public'                => true,
    'show_ui'               => true,
    'show_in_menu'          => true,
    'menu_position'         => 70,
    'menu_icon'             => 'dashicons-id',
    'show_in_admin_bar'     => true,
    'show_in_nav_menus'     => false,
    'can_export'            => true,
    'has_archive'           => false,    
    'exclude_from_search'   => true,
    'publicly_queryable'    => true,
    'rewrite'               => $rewrite,
    'capability_type'       => 'page',
  );
  register_post_type( 'edb_reviews', $args );

}
add_action( 'init', 'create_review_post_type', 0 );