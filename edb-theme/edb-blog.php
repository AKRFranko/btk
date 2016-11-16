<?php
// Register Custom Post Type
function create_blog_post_type() {

  $labels = array(
    'name'                  => _x( 'Blog Posts', 'Post Type General Name', 'edb' ),
    'singular_name'         => _x( 'Blog Post', 'Post Type Singular Name', 'edb' ),
    'menu_name'             => __( 'Blog Posts', 'edb' ),
    'name_admin_bar'        => __( 'Blog Post', 'edb' ),
    'archives'              => __( 'Blog Post Archives', 'edb' ),
    'parent_item_colon'     => __( 'Parent Post:', 'edb' ),
    'all_items'             => __( 'All Posts', 'edb' ),
    'add_new_item'          => __( 'Add New Post', 'edb' ),
    'add_new'               => __( 'Add New', 'edb' ),
    'new_item'              => __( 'New Post', 'edb' ),
    'edit_item'             => __( 'Edit Post', 'edb' ),
    'update_item'           => __( 'Update Post', 'edb' ),
    'view_item'             => __( 'View Post', 'edb' ),
    'search_items'          => __( 'Search Post', 'edb' ),
    'not_found'             => __( 'Not found', 'edb' ),
    'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
    'featured_image'        => __( 'Featured Image', 'edb' ),
    'set_featured_image'    => __( 'Set featured image', 'edb' ),
    'remove_featured_image' => __( 'Remove featured image', 'edb' ),
    'use_featured_image'    => __( 'Use as featured image', 'edb' ),
    'insert_into_item'      => __( 'Insert into post', 'edb' ),
    'uploaded_to_this_item' => __( 'Uploaded to this post', 'edb' ),
    'items_list'            => __( 'Posts list', 'edb' ),
    'items_list_navigation' => __( 'Posts list navigation', 'edb' ),
    'filter_items_list'     => __( 'Filter posts list', 'edb' ),
  );
  $rewrite = array(
    'slug'                  => 'blog',
    'with_front'            => true,
    'pages'                 => true,
    'feeds'                 => true,
  );
  $args = array(
    'label'                 => __( 'Blog Post', 'edb' ),
    'description'           => __( 'Posts For The Blog', 'edb' ),
    'labels'                => $labels,
    'supports'              => array( 'title', 'editor', 'thumbnail', 'post-formats', ),
    'taxonomies'            => array( 'category', 'post_tag' ),
    'hierarchical'          => false,
    'public'                => true,
    'show_ui'               => true,
    'show_in_menu'          => true,
    'menu_position'         => 5,
    'show_in_admin_bar'     => true,
    'show_in_nav_menus'     => true,
    'can_export'            => true,
    'has_archive'           => 'blog',
    'exclude_from_search'   => false,
    'publicly_queryable'    => true,
    'rewrite'               => $rewrite,
    'capability_type'       => 'page',
  );
  register_post_type( 'blog_post', $args );
  
}



add_action( 'init', 'create_blog_post_type', 0 );


