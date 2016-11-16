<?php

add_action('load-post.php', 'edb_init_slideshow_metabox' );
add_action('load-post-new.php', 'edb_init_slideshow_metabox' );

function edb_init_slideshow_metabox(){
    
    add_action( 'add_meta_boxes', 'edb_slideshow_add_metabox'        );
    add_action( 'save_post',      'edb_slideshow_save_metabox', 10, 2 );
}

function edb_slideshow_add_metabox(){
    add_meta_box(
        'Slide Info',
        __('Slide Info', 'edb'),
        'edb_slideshow_render_metabox'
    );
}

function edb_slideshow_render_metabox( $post ){
    // Add nonce for security and authentication.
    wp_nonce_field( 'slideshow_nonce_action', 'slideshow_nonce' );
    $slide_outside_title_en = '';
    $slide_outside_title_fr = '';
    // Form fields.
    echo '<style>.slide_outside_title_field(width:100%)</style>';
            echo '<table class="form-table">';
    
            echo '    <tr>';
            echo '        <th><label for="slide_outside_title_en" class="slide_outside_title_en_label">' . __( 'Outside Title (en)', 'edb' ) . '</label></th>';
            echo '        <td>';
            echo '            <input type="text" id="slide_outside_title_en" name="slide_outside_title_en" class="slide_outside_title_field" placeholder="' . esc_attr__( '', 'edb' ) . '" value="' . esc_attr__( $slide_outside_title_en ) . '">';
            echo '        </td>';
            echo '    </tr>';
            
            echo '    <tr>';
            echo '        <th><label for="slide_outside_title_fr" class="slide_outside_title_fr_label">' . __( 'Outside Title (fr)', 'edb' ) . '</label></th>';
            echo '        <td>';
            echo '            <input type="text" id="slide_outside_title_fr" name="slide_outside_title_fr" class="slide_outside_title_field" placeholder="' . esc_attr__( '', 'edb' ) . '" value="' . esc_attr__( $slide_outside_title_fr ) . '">';
            echo '        </td>';
            echo '    </tr>';
            echo '<tr><td colspan="2"><hr/></td></tr>';
    echo '</table>';
}
// <?php
// class Car_Info_Meta_Box {

    

//     public function render_metabox( $post ) {

//         // Add nonce for security and authentication.
//         wp_nonce_field( 'car_nonce_action', 'car_nonce' );

//         // Retrieve an existing value from the database.
//         $car_year = get_post_meta( $post->ID, 'car_year', true );
//         $car_mileage = get_post_meta( $post->ID, 'car_mileage', true );
//         $car_cruise_control = get_post_meta( $post->ID, 'car_cruise_control', true );
//         $car_power_windows = get_post_meta( $post->ID, 'car_power_windows', true );
//         $car_sunroof = get_post_meta( $post->ID, 'car_sunroof', true );

//         // Set default values.
//         if( empty( $car_year ) ) $car_year = '';
//         if( empty( $car_mileage ) ) $car_mileage = '';
//         if( empty( $car_cruise_control ) ) $car_cruise_control = '';
//         if( empty( $car_power_windows ) ) $car_power_windows = '';
//         if( empty( $car_sunroof ) ) $car_sunroof = '';

//         // Form fields.
//         echo '<table class="form-table">';

//         echo '    <tr>';
//         echo '        <th><label for="car_year" class="car_year_label">' . __( 'Year', 'text_domain' ) . '</label></th>';
//         echo '        <td>';
//         echo '            <input type="text" id="car_year" name="car_year" class="car_year_field" placeholder="' . esc_attr__( '', 'text_domain' ) . '" value="' . esc_attr__( $car_year ) . '">';
//         echo '        </td>';
//         echo '    </tr>';

//         echo '    <tr>';
//         echo '        <th><label for="car_mileage" class="car_mileage_label">' . __( 'Mileage', 'text_domain' ) . '</label></th>';
//         echo '        <td>';
//         echo '            <input type="number" id="car_mileage" name="car_mileage" class="car_mileage_field" placeholder="' . esc_attr__( '', 'text_domain' ) . '" value="' . esc_attr__( $car_mileage ) . '">';
//         echo '        </td>';
//         echo '    </tr>';

//         echo '    <tr>';
//         echo '        <th><label for="car_cruise_control" class="car_cruise_control_label">' . __( 'Cruise Control', 'text_domain' ) . '</label></th>';
//         echo '        <td>';
//         echo '            <input type="checkbox" id="car_cruise_control" name="car_cruise_control" class="car_cruise_control_field" value="' . $car_cruise_control . '" ' . checked( $car_cruise_control, 'checked', false ) . '> ' . __( '', 'text_domain' );
//         echo '            <span class="description">' . __( 'Car has cruise control.', 'text_domain' ) . '</span>';
//         echo '        </td>';
//         echo '    </tr>';

//         echo '    <tr>';
//         echo '        <th><label for="car_power_windows" class="car_power_windows_label">' . __( 'Power Windows', 'text_domain' ) . '</label></th>';
//         echo '        <td>';
//         echo '            <input type="checkbox" id="car_power_windows" name="car_power_windows" class="car_power_windows_field" value="' . $car_power_windows . '" ' . checked( $car_power_windows, 'checked', false ) . '> ' . __( '', 'text_domain' );
//         echo '            <span class="description">' . __( 'Car has power windows.', 'text_domain' ) . '</span>';
//         echo '        </td>';
//         echo '    </tr>';

//         echo '    <tr>';
//         echo '        <th><label for="car_sunroof" class="car_sunroof_label">' . __( 'Sunroof', 'text_domain' ) . '</label></th>';
//         echo '        <td>';
//         echo '            <input type="checkbox" id="car_sunroof" name="car_sunroof" class="car_sunroof_field" value="' . $car_sunroof . '" ' . checked( $car_sunroof, 'checked', false ) . '> ' . __( '', 'text_domain' );
//         echo '            <span class="description">' . __( 'Car has sunroof.', 'text_domain' ) . '</span>';
//         echo '        </td>';
//         echo '    </tr>';

//         echo '</table>';

//     }

//     public function save_metabox( $post_id, $post ) {

//         // Add nonce for security and authentication.
//         $nonce_name   = $_POST['car_nonce'];
//         $nonce_action = 'car_nonce_action';

//         // Check if a nonce is set.
//         if ( ! isset( $nonce_name ) )
//             return;

//         // Check if a nonce is valid.
//         if ( ! wp_verify_nonce( $nonce_name, $nonce_action ) )
//             return;

//         // Check if the user has permissions to save data.
//         if ( ! current_user_can( 'edit_post', $post_id ) )
//             return;

//         // Check if it's not an autosave.
//         if ( wp_is_post_autosave( $post_id ) )
//             return;

//         // Check if it's not a revision.
//         if ( wp_is_post_revision( $post_id ) )
//             return;

//         // Sanitize user input.
//         $car_new_year = isset( $_POST[ 'car_year' ] ) ? sanitize_text_field( $_POST[ 'car_year' ] ) : '';
//         $car_new_mileage = isset( $_POST[ 'car_mileage' ] ) ? sanitize_text_field( $_POST[ 'car_mileage' ] ) : '';
//         $car_new_cruise_control = isset( $_POST[ 'car_cruise_control' ] ) ? 'checked' : '';
//         $car_new_power_windows = isset( $_POST[ 'car_power_windows' ] ) ? 'checked' : '';
//         $car_new_sunroof = isset( $_POST[ 'car_sunroof' ] ) ? 'checked' : '';

//         // Update the meta field in the database.
//         update_post_meta( $post_id, 'car_year', $car_new_year );
//         update_post_meta( $post_id, 'car_mileage', $car_new_mileage );
//         update_post_meta( $post_id, 'car_cruise_control', $car_new_cruise_control );
//         update_post_meta( $post_id, 'car_power_windows', $car_new_power_windows );
//         update_post_meta( $post_id, 'car_sunroof', $car_new_sunroof );

//     }

// Register Custom Post Type
function edb_setup_slideshow() {

    $labels = array(
        'name'                  => _x( 'Slides', 'Post Type General Name', 'edb' ),
        'singular_name'         => _x( 'Slide', 'Post Type Singular Name', 'edb' ),
        'menu_name'             => __( 'Slideshow', 'edb' ),
        'name_admin_bar'        => __( 'Slideshow', 'edb' ),
        'archives'              => __( 'Slideshow Archives', 'edb' ),
        'parent_item_colon'     => __( 'Parent slideshow', 'edb' ),
        'all_items'             => __( 'All slides', 'edb' ),
        'add_new_item'          => __( 'Add new slide', 'edb' ),
        'add_new'               => __( 'Add New', 'edb' ),
        'new_item'              => __( 'New Slide', 'edb' ),
        'edit_item'             => __( 'Edit Slide', 'edb' ),
        'update_item'           => __( 'Update Slide', 'edb' ),
        'view_item'             => __( 'View Slide', 'edb' ),
        'search_items'          => __( 'Search Slide', 'edb' ),
        'not_found'             => __( 'Not found', 'edb' ),
        'not_found_in_trash'    => __( 'Not found in Trash', 'edb' ),
        'featured_image'        => __( 'Featured Image', 'edb' ),
        'set_featured_image'    => __( 'Set featured image', 'edb' ),
        'remove_featured_image' => __( 'Remove featured image', 'edb' ),
        'use_featured_image'    => __( 'Use as featured image', 'edb' ),
        'insert_into_item'      => __( 'Insert into slide', 'edb' ),
        'uploaded_to_this_item' => __( 'Uploaded to this slide', 'edb' ),
        'items_list'            => __( 'Slides list', 'edb' ),
        'items_list_navigation' => __( 'Slides list navigation', 'edb' ),
        'filter_items_list'     => __( 'Filter slides list', 'edb' ),
    );
    $args = array(
        'label'                 => __( 'Slide', 'edb' ),
        'description'           => __( 'Home Page Slide Show', 'edb' ),
        'labels'                => $labels,
        'supports'              => array( 'thumbnail', 'post-formats', ),//'title', 'editor', 'excerpt',
        'taxonomies'            => array( 'post_tag' ),
        'hierarchical'          => false,
        'public'                => true,
        'show_ui'               => true,
        'show_in_menu'          => true,
        'menu_position'         => 5,
        'menu_icon'             => 'dashicons-images-alt2',
        'show_in_admin_bar'     => true,
        'show_in_nav_menus'     => true,
        'can_export'            => true,
        'has_archive'           => true,        
        'exclude_from_search'   => false,
        'publicly_queryable'    => true,
        'capability_type'       => 'post',
    );
    register_post_type( 'edb_slideshow', $args );

}
add_action( 'init', 'edb_setup_slideshow', 0 );