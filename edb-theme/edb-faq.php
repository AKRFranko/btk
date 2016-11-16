<?php
// Register Custom Post Type
function edb_create_faq_post_type() {



  $labels = array(
    'name'                  => _x( 'FAQs', 'Post Type General Name', 'edb' ),
    'singular_name'         => _x( 'FAQ', 'Post Type Singular Name', 'edb' ),
    'menu_name'             => __( 'FAQ', 'edb' ),
    'name_admin_bar'        => __( 'FAQ', 'edb' ),
    'archives'              => __( 'FAQ Archives', 'edb' ),
    'parent_item_colon'     => __( 'Parent Item:', 'edb' ),
    'all_items'             => __( 'All Questions', 'edb' ),
    'add_new_item'          => __( 'Add New Question', 'edb' ),
    'add_new'               => __( 'Add New Question', 'edb' ),
    'new_item'              => __( 'New Question', 'edb' ),
    'edit_item'             => __( 'Edit Question', 'edb' ),
    'update_item'           => __( 'Update Question', 'edb' ),
    'view_item'             => __( 'View Question', 'edb' ),
    'search_items'          => __( 'Search Question', 'edb' ),
    'not_found'             => __( 'Not found', 'edb' ),
    'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
    'featured_image'        => __( 'Image', 'edb' ),
    'set_featured_image'    => __( 'Set image', 'edb' ),
    'remove_featured_image' => __( 'Remove image', 'edb' ),
    'use_featured_image'    => __( 'Use as image', 'edb' ),
    'insert_into_item'      => __( 'Insert into question', 'edb' ),
    'uploaded_to_this_item' => __( 'Uploaded to this question', 'edb' ),
    'items_list'            => __( 'Questions list', 'edb' ),
    'items_list_navigation' => __( 'Question list navigation', 'edb' ),
    'filter_items_list'     => __( 'Filter questions list', 'edb' ),
  );
  $args = array(
    'label'                 => __( 'FAQ', 'edb' ),
    'description'           => __( 'FAQ Q&A\'s', 'edb' ),
    'labels'                => $labels,
    'supports'              => array( 'title', 'excerpt', ),
    'hierarchical'          => false,
    'public'                => true,
    'show_ui'               => true,
    'show_in_menu'          => true,
    'menu_position'         => 60,
    'menu_icon'             => 'dashicons-testimonial',
    'show_in_admin_bar'     => true,
    'show_in_nav_menus'     => false,
    'can_export'            => true,
    'has_archive'           => false,    
    'exclude_from_search'   => true,
    'publicly_queryable'    => true,
    'capability_type'       => 'page',
  );
  register_post_type( 'edb_faq', $args );
  wp_enqueue_script( 'edb_faq', get_template_directory_uri() . '/js/faq.js', array('jquery','masonry'), '20170101', true );  

}
add_action( 'init', 'edb_create_faq_post_type', 0 );

add_filter( 'rwmb_meta_boxes', 'edb_create_faq_post_type_meta_boxes' );
function edb_create_faq_post_type_meta_boxes( $meta_boxes ) {
    $meta_boxes[] = array(
        'title'      => __( 'Style', 'edb' ),
        'post_types' => 'edb_faq',
        'priority' => 'low',
        'fields'     => array(
            array(
                'id'   => 'background_color',
                'name' => __( 'Background Color', 'edb' ),
                'type' => 'color',
                'std'=>'#ffffff'
            ),
            array(
                'id'      => 'background_image',
                'name'    => __( 'Background Image', 'edb' ),
                'type'    => 'image_advanced'
            ),
            array(
                'id'      => 'text_color',
                'name'    => __( 'Text Color', 'edb' ),
                'type'    => 'color',
                'std'=>'#000000'
            ),
            
        ),
    );
    return $meta_boxes;
}

