<?php
/**
 * Custom template tags for this theme.
 *
 * Eventually, some of the functionality here could be replaced by core features.
 *
 * @package buteek
 */

if (!function_exists('the_posts_navigation')):
/**
 * Display navigation to next/previous set of posts when applicable.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 */
	function the_posts_navigation() {
		// Don't print empty markup if there's only one page.
		if ($GLOBALS['wp_query']->max_num_pages < 2) {
			return;
		}
		?>
																					<nav class="navigation posts-navigation" role="navigation">
																						<h2 class="screen-reader-text"><?php _e('Posts navigation', 'btk');?></h2>
																						<div class="nav-links">

																							<?php if (get_next_posts_link()): ?>
																							<div class="nav-previous"><?php next_posts_link(__('Older posts', 'btk'));?></div>
																							<?php endif;?>

			<?php if (get_previous_posts_link()): ?>
			<div class="nav-next"><?php previous_posts_link(__('Newer posts', 'btk'));?></div>
			<?php endif;?>

		</div><!-- .nav-links -->
	</nav><!-- .navigation -->
	<?php
}
endif;



if (!function_exists('the_post_navigation')):
/**
 * Display navigation to next/previous post when applicable.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 */
	function the_post_navigation() {
		// Don't print empty markup if there's nowhere to navigate.
		$previous = (is_attachment()) ? get_post(get_post()->post_parent) : get_adjacent_post(false, '', true);
		$next = get_adjacent_post(false, '', false);

		if (!$next && !$previous) {
			return;
		}
		?>
																					<nav class="navigation post-navigation" role="navigation">
																						<h2 class="screen-reader-text"><?php _e('Post navigation', 'btk');?></h2>
																						<div class="nav-links">
																							<?php
	previous_post_link('<div class="nav-previous">%link</div>', '%title');
		next_post_link('<div class="nav-next">%link</div>', '%title');
		?>
																						</div><!-- .nav-links -->
																					</nav><!-- .navigation -->
																					<?php
	}
endif;

function btk_log( $thing ){
  $out = var_export( $thing, true );
  echo "<script type=\"text/javascript\">console.log(\"".htmlspecialchars($out)."\")</script>";
}

if (!function_exists('btk_posted_on')):
/**
 * Prints HTML with meta information for the current post-date/time and author.
 */
	function btk_posted_on() {
		$time_string = '<time class="entry-date published updated" datetime="%1$s">%2$s</time>';
		if (get_the_time('U') !== get_the_modified_time('U')) {
			$time_string = '<time class="entry-date published" datetime="%1$s">%2$s</time><time class="updated" datetime="%3$s">%4$s</time>';
		}

		$time_string = sprintf($time_string,
			esc_attr(get_the_date('c')),
			esc_html(get_the_date()),
			esc_attr(get_the_modified_date('c')),
			esc_html(get_the_modified_date())
		);

		$posted_on = sprintf(
			_x('%s', 'post date', 'btk'),
			'<a href="' . esc_url(get_permalink()) . '" rel="bookmark">' . $time_string . '</a>'
		);

		$byline = sprintf(
			_x('by %s', 'post author', 'btk'),
			'<span class="author vcard"><a class="url fn n" href="' . esc_url(get_author_posts_url(get_the_author_meta('ID'))) . '">' . esc_html(get_the_author()) . '</a></span>'
		);

		echo '<p><span class="posted-on">' . $posted_on . '</span><span class="byline"> ' . $byline . '</span></p>';

	}
endif;

if (!function_exists('btk_home_entry_categories')):
	function btk_home_entry_categories() {
		// Hide category and tag text for pages.
		if ('post' == get_post_type()) {
			/* translators: used between list items, there is a space after the comma */
			$categories_list = '';
			foreach ((get_the_category()) as $category) {
				if ($category->slug == 'carousel') {
					continue;
				}

				$category_id = get_cat_ID($category->cat_name);
				$category_link = get_category_link($category_id);
				$categories_list .= '<a href="' . $category_link . '">' . $category->cat_name . '</a> ';
			}

			if ($categories_list && btk_categorized_blog()) {
				printf('<span class="cat-links">' . __('%1$s', 'btk') . '</span>', $categories_list);
			}
		}
	}

endif;

if (!function_exists('btk_home_entry_tags')):
	function btk_home_entry_tags() {
		// Hide category and tag text for pages.
		if ('post' == get_post_type()) {
			/* translators: used between list items, there is a space after the comma */
			$tags_list = get_the_tag_list('', __(' ', 'btk'));
			if ($tags_list) {
				printf('<span class="tags-links">' . __('%1$s', 'btk') . '</span>', $tags_list);
			}
		}
	}

endif;

if (!function_exists('btk_entry_footer')):
/**
 * Prints HTML with meta information for the categories, tags and comments.
 */
	function btk_entry_footer() {
		// Hide category and tag text for pages.
		if ('post' == get_post_type()) {
			/* translators: used between list items, there is a space after the comma */
			$categories_list = '';
			foreach ((get_the_category()) as $category) {
				if ($category->slug == 'carousel') {
					continue;
				}

				$category_id = get_cat_ID($category->cat_name);
				$category_link = get_category_link($category_id);
				$categories_list .= '<a href="' . $category_link . '">' . $category->cat_name . '</a> ';
			}

			if ($categories_list && btk_categorized_blog()) {
				printf('<p><span class="cat-links">' . __('%1$s', 'btk') . '</span></p>', $categories_list);
			}

			/* translators: used between list items, there is a space after the comma */
			$tags_list = get_the_tag_list('', __(' ', 'btk'));
			if ($tags_list) {
				printf('<span class="tags-links">' . __('%1$s', 'btk') . '</span>', $tags_list);
			}
		}
/*
if ( ! is_single() && ! post_password_required() && ( comments_open() || get_comments_number() ) ) {
echo '<span class="comments-link">';
comments_popup_link( __( 'Leave a comment', 'btk' ), __( '1 Comment', 'btk' ), __( '% Comments', 'btk' ) );
echo '</span>';
}
 */
		edit_post_link(__('Edit', 'btk'), '<p><span class="edit-link">', '</span></p>');
	}
endif;

if (!function_exists('the_archive_title')):
/**
 * Shim for `the_archive_title()`.
 *
 * Display the archive title based on the queried object.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 *
 * @param string $before Optional. Content to prepend to the title. Default empty.
 * @param string $after  Optional. Content to append to the title. Default empty.
 */
	function the_archive_title($before = '', $after = '') {
		if (is_category()) {
			$title = sprintf(__('Category: %s', 'btk'), single_cat_title('', false));
		} elseif (is_tag()) {
		$title = sprintf(__('Tag: %s', 'btk'), single_tag_title('', false));
	} elseif (is_author()) {
		$title = sprintf(__('Author: %s', 'btk'), '<span class="vcard">' . get_the_author() . '</span>');
	} elseif (is_year()) {
		$title = sprintf(__('Year: %s', 'btk'), get_the_date(_x('Y', 'yearly archives date format', 'btk')));
	} elseif (is_month()) {
		$title = sprintf(__('Month: %s', 'btk'), get_the_date(_x('F Y', 'monthly archives date format', 'btk')));
	} elseif (is_day()) {
		$title = sprintf(__('Day: %s', 'btk'), get_the_date(_x('F j, Y', 'daily archives date format', 'btk')));
	} elseif (is_tax('post_format')) {
		if (is_tax('post_format', 'post-format-aside')) {
			$title = _x('Asides', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-gallery')) {
			$title = _x('Galleries', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-image')) {
			$title = _x('Images', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-video')) {
			$title = _x('Videos', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-quote')) {
			$title = _x('Quotes', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-link')) {
			$title = _x('Links', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-status')) {
			$title = _x('Statuses', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-audio')) {
			$title = _x('Audio', 'post format archive title', 'btk');
		} elseif (is_tax('post_format', 'post-format-chat')) {
			$title = _x('Chats', 'post format archive title', 'btk');
		}
	} elseif (is_post_type_archive()) {
		$title = sprintf(__('Archives: %s', 'btk'), post_type_archive_title('', false));
	} elseif (is_tax()) {
		$tax = get_taxonomy(get_queried_object()->taxonomy);
		/* translators: 1: Taxonomy singular name, 2: Current taxonomy term */
		$title = sprintf(__('%1$s: %2$s', 'btk'), $tax->labels->singular_name, single_term_title('', false));
	} else {
		$title = __('Archives', 'btk');
	}

	/**
	 * Filter the archive title.
	 *
	 * @param string $title Archive title to be displayed.
	 */
	$title = apply_filters('get_the_archive_title', $title);

	if (!empty($title)) {
		echo $before . $title . $after;
	}
}
endif;

if (!function_exists('the_archive_description')):
/**
 * Shim for `the_archive_description()`.
 *
 * Display category, tag, or term description.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 *
 * @param string $before Optional. Content to prepend to the description. Default empty.
 * @param string $after  Optional. Content to append to the description. Default empty.
 */
	function the_archive_description($before = '', $after = '') {
		$description = apply_filters('get_the_archive_description', term_description());

		if (!empty($description)) {
			/**
			 * Filter the archive description.
			 *
			 * @see term_description()
			 *
			 * @param string $description Archive description to be displayed.
			 */
			echo $before . $description . $after;
		}
	}
endif;

/**
 * Returns true if a blog has more than 1 category.
 *
 * @return bool
 */
function btk_categorized_blog() {
	if (false === ($all_the_cool_cats = get_transient('btk_categories'))) {
		// Create an array of all the categories that are attached to posts.
		$all_the_cool_cats = get_categories(array(
			'fields' => 'ids',
			'hide_empty' => 1,

			// We only need to know if there is more than one category.
			'number' => 2,
		));

		// Count the number of categories that are attached to the posts.
		$all_the_cool_cats = count($all_the_cool_cats);

		set_transient('btk_categories', $all_the_cool_cats);
	}

	if ($all_the_cool_cats > 1) {
		// This blog has more than 1 category so btk_categorized_blog should return true.
		return true;
	} else {
		// This blog has only 1 category so btk_categorized_blog should return false.
		return false;
	}
}


function btk_edb_slider($query, $attach = null, $blankTargets = false) {
	$slider_query = new WP_Query($query);
	$data = array();
	while ($slider_query->have_posts()) {
		$slider_query->the_post();
		if (has_post_thumbnail()) {
			$src = wp_get_attachment_image_src(get_post_thumbnail_id(), 'large');
			$title = get_the_title();
			$shopnow = get_post_meta($slider_query->post->ID, '_subtitle');
			$content = apply_filters( 'the_content', get_the_content() );
			$href = get_permalink( $slider_query->post->ID );
			array_push($data, array("src" => $src[0], "text" => $title, "shopnow" => $shopnow, "url" => $href, "html" => $content, "_blank" => $blankTargets  ));
		}
	}
	if ($attach) {
		foreach ( $attach as $attachment_id ) {
			$src   = wp_get_attachment_image_src( $attachment_id, 'large');
			$title = esc_attr( get_the_title( $attachment_id ) );
			$href  = get_permalink();
			array_push($data, array("src" => $src[0], "text" => $title, "url" => $href, "_blank" => $blankTargets ));
		}
	}
	?><script type="application/json"><?php echo json_encode($data);?></script><?php
}

function btk_edb_lookbook_slider(){
  $query = array( 'post_type' => 'post', 'post_per_page' => '5', 'category_name' => 'lookbook' );
  btk_edb_slider( $query, null, true );
}

function btk_product_pdf_link( $productID, $fileName){
    $pdf = get_attached_media('application/pdf',$productID);
    if(!empty($pdf)){
      $pdflink = $pdf[0]['guid']; 
      return '<a target="_blank" href="'.$pdflink.'" download="'.$fileName.'.pdf" class="upper pr-pdf">download PDF</a>';
    }
  	return '';
}
function btk_edb_single_product_slider() {
	$data = array();
	$images =  get_posts(array(
		'post_parent' => get_the_ID(),
		'post_type' => 'attachment',
		'numberposts' => -1,
		'orderby'        => 'title',
		'order'           => 'ASC',
		'post_mime_type' => 'image'
		));
	foreach ($images as $image) {
		$src = wp_get_attachment_image_src($image->ID, 'large');
		$title = get_the_title();
		$href = get_permalink();
		array_push($data, array("src" => $src[0], "text" => $title, "url" => $href));
	}
	?><script type="application/json"><?php echo json_encode($data);?></script><?php
}

function btk_product_technical_drawing(){
  $imageID = get_post_meta( get_the_ID(), '_product_technical_drawing', true );
  $src = wp_get_attachment_image_src($imageID, 'large')[0];
  $title = get_the_title();
  if( !empty($src)){
    return "<img alt=\"$title technical drawing\" src=\"$src\" />";  
  }else{
    return '';
  }
  
}

/**
 * Category CSS classes
 * 
 **/
function btk_get_category_classes(){
    $categories = (array) get_the_category();
    $thelist = '';
    foreach($categories as $category) {    // concate
        $thelist .= ' cat-' . $category->slug;
    }
    
    return $thelist;

}
 


/**
 * Recently viewed products
 **/
function btk_recently_viewed() {
  ?><div id="recently-viewed"><?php
  echo do_shortcode('[recent_products per_page="3"]');
  ?></div><?php
// 	global $woocommerce;

//     $viewed_products = !empty( $_COOKIE['woocommerce_recently_viewed'] ) ? (array) explode( '|', $_COOKIE['woocommerce_recently_viewed'] ) : array();
//     $viewed_products = array_filter( array_map( 'absint', $viewed_products ) );
//     $skus = array();
//     foreach( $viewed_products as $viewed){
//       var_dump($viewed);
//       $product = new WC_Product( $viewed );
      
//       array_push( $skus, $product->get_sku() );
//     }
//     var_dump($skus);
    //echo do_shortcode('[products skus="'.implode(',',$skus).'"]')
//     $query = array(
//     	'post_type' => 'product',
//     	'post_status' => 'publish',
//     	'post__in' => $viewed_products,
//     	'order_by' => 'rand'
//     );
//     $skus = array();
    
//     $viewed_query = new WP_Query($query);
	
// 	while ($viewed_query->have_posts()) {
// 		$viewed_query->the_post();
// 		get_sku();
// 	}

//     echo do_shortcode('[products skus="'.implode(',',$skus).'"]')
//     // btk_edb_slider($query);
}



/**
 * Flush out the transients used in btk_categorized_blog.
 */
function btk_category_transient_flusher() {
	if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
		return;
	}
	// Like, beat it. Dig?
	delete_transient('btk_categories');
}
add_action('edit_category', 'btk_category_transient_flusher');
add_action('save_post', 'btk_category_transient_flusher');

