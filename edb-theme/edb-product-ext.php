<?php
// // Register Custom Post Type
// function edb_setup_extended_product() {

//   $labels = array(
//     'name'                  => _x( 'See More Posts', 'Post Type General Name', 'edb' ),
//     'singular_name'         => _x( 'See More Post', 'Post Type Singular Name', 'edb' ),
//     'menu_name'             => __( 'Products Extended Description', 'edb' ),
//     'name_admin_bar'        => __( 'Products Extended Description', 'edb' ),
//     'archives'              => __( 'Item Archives', 'edb' ),
//     'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
//     'all_items'             => __( 'All Items', 'edb' ),
//     'add_new_item'          => __( 'Add New Item', 'edb' ),
//     'add_new'               => __( 'Add New', 'edb' ),
//     'new_item'              => __( 'New Item', 'edb' ),
//     'edit_item'             => __( 'Edit Item', 'edb' ),
//     'update_item'           => __( 'Update Item', 'edb' ),
//     'view_item'             => __( 'View Item', 'edb' ),
//     'search_items'          => __( 'Search Item', 'edb' ),
//     'not_found'             => __( 'Not found', 'edb' ),
//     'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
//     'featured_image'        => __( 'Featured Image', 'edb' ),
//     'set_featured_image'    => __( 'Set featured image', 'edb' ),
//     'remove_featured_image' => __( 'Remove featured image', 'edb' ),
//     'use_featured_image'    => __( 'Use as featured image', 'edb' ),
//     'insert_into_item'      => __( 'Insert into item', 'edb' ),
//     'uploaded_to_this_item' => __( 'Uploaded to this item', 'edb' ),
//     'items_list'            => __( 'Items list', 'edb' ),
//     'items_list_navigation' => __( 'Items list navigation', 'edb' ),
//     'filter_items_list'     => __( 'Filter items list', 'edb' ),
//   );
//   $args = array(
//     'label'                 => __( 'See More Post', 'edb' ),
//     'description'           => __( 'See More Posts Bound to products', 'edb' ),
//     'labels'                => $labels,
//     'supports'              => array( '' ),
//     'taxonomies'            => array( 'category', 'post_tag' ),
//     'hierarchical'          => false,
//     'public'                => true,
//     'show_ui'               => true,
//     'show_in_menu'          => true,
//     'menu_position'         => 58,
//     'show_in_admin_bar'     => true,
//     'show_in_nav_menus'     => true,
//     'can_export'            => true,
//     'has_archive'           => true,    
//     'exclude_from_search'   => false,
//     'publicly_queryable'    => true,
//     'capability_type'       => 'page',
//   );
//   register_post_type( 'edb_product_extended', $args );
//   // add_post_type_support( 'edb_product_extended', 'subtitles' );

// }
// add_action( 'init', 'edb_setup_extended_product', 0 );


add_filter( 'rwmb_meta_boxes', 'edb_product_extended_meta_boxes' );

function edb_product_extended_meta_boxes( $meta_boxes ) {
    $meta_boxes[] = array(
        'title'      => __( 'See More', 'textdomain' ),
        'post_types' => 'product',
        'context' => 'side',
        'priority' => 'low',
        'fields'     => array(
           
            array(
              'name'             => esc_html__( 'See More Images Upload', 'edb' ),
              'id'               => "edb_more_images",
              'type'             => 'image_advanced',
              'max_file_uploads' => 24,
            ),
           
        ),
    );
    
    
    $meta_boxes[] = array(
        'title'      => __( 'Anatomy Picture', 'textdomain' ),
        'post_types' => 'product',
        'context' => 'side',
        'priority' => 'low',
        'fields'     => array(
           array(
             'name'             => esc_html__( 'Anatomy Image Title', 'edb' ),
             'id'               => "edb_anatomy_image_title",
             'type'             => 'text'
           ),
            array(
              'name'             => esc_html__( 'Anatomy Image Upload', 'edb' ),
              'id'               => "edb_anatomy_image",
              'type'             => 'image_advanced',
              'max_file_uploads' => 1,
            ),
           
        ),
    );
    
    $meta_boxes[] = array(
        'title'      => __( 'Anatomy Picture (english)', 'textdomain' ),
        'post_types' => 'product',
        'context' => 'side',
        'priority' => 'low',
        'fields'     => array(
           array(
             'name'             => esc_html__( 'Anatomy Image Title (english)', 'edb' ),
             'id'               => "edb_anatomy_image_title_en",
             'type'             => 'text'
           ),
            array(
              'name'             => esc_html__( 'Anatomy Image Upload (english)', 'edb' ),
              'id'               => "edb_anatomy_image_en",
              'type'             => 'image_advanced',
              'max_file_uploads' => 1,
            ),
           
        ),
    );
    
    return $meta_boxes;
}