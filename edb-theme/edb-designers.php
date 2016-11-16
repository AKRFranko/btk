<?php

// Register Custom Post Type
function create_designer_post_type() {

  $labels = array(
    'name'                  => _x( 'Designers', 'Post Type General Name', 'edb' ),
    'singular_name'         => _x( 'Designer', 'Post Type Singular Name', 'edb' ),
    'menu_name'             => __( 'Designers', 'edb' ),
    'name_admin_bar'        => __( 'Designer', 'edb' ),
    'archives'              => __( 'Designer Archives', 'edb' ),
    'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
    'all_items'             => __( 'All Designers', 'edb' ),
    'add_new_item'          => __( 'Add New Designer', 'edb' ),
    'add_new'               => __( 'Add New', 'edb' ),
    'new_item'              => __( 'New Designer', 'edb' ),
    'edit_item'             => __( 'Edit Designer', 'edb' ),
    'update_item'           => __( 'Update Designer', 'edb' ),
    'view_item'             => __( 'View Designer', 'edb' ),
    'search_items'          => __( 'Search Designer', 'edb' ),
    'not_found'             => __( 'Not found', 'edb' ),
    'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
    'featured_image'        => __( 'Featured Image', 'edb' ),
    'set_featured_image'    => __( 'Set featured image', 'edb' ),
    'remove_featured_image' => __( 'Remove featured image', 'edb' ),
    'use_featured_image'    => __( 'Use as featured image', 'edb' ),
    'insert_into_item'      => __( 'Insert into designer', 'edb' ),
    'uploaded_to_this_item' => __( 'Uploaded to this designer', 'edb' ),
    'items_list'            => __( 'Designers list', 'edb' ),
    'items_list_navigation' => __( 'Designers list navigation', 'edb' ),
    'filter_items_list'     => __( 'Filter designers list', 'edb' ),
  );
  $rewrite = array(
    'slug'                  => 'designer',
    'with_front'            => true,
    'pages'                 => false,
    'feeds'                 => false,
  );
  $args = array(
    'label'                 => __( 'Designer', 'edb' ),
    'description'           => __( 'Designer Infos', 'edb' ),
    'labels'                => $labels,
    'supports'              => array( 'title', 'editor', 'thumbnail', ),
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
  register_post_type( 'edb_designer', $args );

}
add_action( 'init', 'create_designer_post_type', 0 );