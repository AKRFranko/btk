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
      $pdf = array_shift(array_values($pdf));
      
      $pdflink = $pdf->guid; 
      
      return '<a target="_blank" href="'.$pdflink.'" download="'.sanitize_file_name($fileName . '.pdf').'" class="upper pr-pdf">download PDF</a>';
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
  $src ='/wp-content/themes/btk/img/wireframe1.jpg';
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
 
function btk_cart_item_html( $cart_item_key, $cart_item, $region ){
  return;
     global $woocommerce;
     //var_dump($woocommerce->session->chosen_shipping_methods);
     $cart_item_product = apply_filters('woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
     $cart_item_product_id = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );
     $cart_item_product_name = apply_filters( 'woocommerce_cart_item_name', $cart_item_product->get_title(), $cart_item, $cart_item_key );
     $cart_item_product_categories = wp_get_post_terms( $cart_item_product->id, 'product_cat' );
     $cart_item_product_category = $cart_item_product_categories[count($cart_item_product_categories) - 1]->name;
     $cart_item_product_price = apply_filters( 'woocommerce_cart_item_price', WC()->cart->get_product_price( $cart_item_product ), $cart_item, $cart_item_key );
 
     // var_dump($cart_item_product_price_total);
     $cart_item_variation_id = $cart_item_product->get_variation_id();
     
     $cart_item_variation_image = apply_filters( 'woocommerce_cart_item_thumbnail', $cart_item_product->get_image(), $cart_item, $cart_item_key );
     $product_attributes = $cart_item_product->get_variation_attributes();
     $cart_item_edb_material_id = $product_attributes['attribute_edb_material'];
     $cart_item_edb_material_name = btk_material_name($cart_item_edb_material_id);
   
     $cart_item_product_permalink = $cart_item_product->get_permalink( $cart_item ); 
     
     $cart_item_stock_qty = get_post_meta( $cart_item_variation_id );
     $cart_item_stock_backorder_delay = get_post_meta( $cart_item_variation_id,'_stock_backorder_delay',true);
   
     
     $quantity_wanted = $cart_item['quantity'];
     
     $main_shipping_method = $woocommerce->session->chosen_shipping_methods[0];
      
     $cart_item_shipping_method = $cart_item['edb_shipping'];// ? $cart_item['edb_shipping'] : 
     if(is_null($cart_item_shipping_method)){
       $cart_item_shipping_method = $main_shipping_method == 'local_pickup' ? 'self_pickup' : 'ship_bundle_1';
     }
     
     $cart_item_product_price_total = '$' . sprintf( "%.2f", $quantity_wanted * $cart_item_product->price);
  
     $edb_earliest_availability = __('1 week', 'btk' );
     
     $product_availability_date_string = $quantity_wanted <= $cart_item_stock_qty ? $edb_earliest_availability : btk_time_elapsed( strtotime($cart_item_stock_backorder_delay) );
     
     $btk_cart_item_json_data = array(
       'item_price'    => $cart_item_product->price,
       'item_category' => $cart_item_product_category,
       'qty_in_stock'  => $cart_item_stock_qty,
       'qty_wanted'    => $quantity_wanted
     );
     $btk_cart_item_json = json_encode($btk_cart_item_json_data);
     ?>
       <div data-json="<?php echo htmlentities($btk_cart_item_json, ENT_QUOTES, 'UTF-8'); ?>" class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'btk-cart-item', $cart_item, $cart_item_key ) ); ?>">
         
         <div class="btk-cart-item-image">
           <?php 
             printf( '<a title="%s" href="%s">%s</a>', $cart_item_product_name, $cart_item_product_permalink, $cart_item_variation_image );
           ?>
         </div>
         
         <div class="btk-cart-item-meta">
           <div class="line">
           <span class="btk-cart-item-name"><?php
               printf( '<a title="%s" href="%s">%s</a>', $cart_item_product_name, $cart_item_product_permalink, $cart_item_product_name );
           ?></span>
           <span class="btk-cart-item-category"><?php
               echo $cart_item_product_category;
           ?></span>
           </div>
           <div class="line">
           <span class="btk-cart-item-quantity"><?php
                echo $quantity_wanted;
           ?> &times;</span>
           <span class="btk-cart-item-material"><?php
               echo $cart_item_edb_material_name;
           ?></span>
           </div>
           <div class="line">
           <span class="btk-cart-item-availability"><?php
               echo $product_availability_date_string;
           ?></span>
           </div>
           
         </div>
         
         <div class="btk-cart-item-options">
           <?php if($region == 'cart'){ ?>
           <div class="btk-cart-item-qty-select">
             <input type="number" class="btk-cart-item-qty-select-input qty" min="1" step="1" name="cart[<?php echo $cart_item_key; ?>][qty]" value="<?php echo $quantity_wanted; ?>">
             <span class="btk-cart-item-qty-select-price-total"><?php echo $cart_item_product_price_total; ?></span>
             <small class="btk-cart-item-qty-select-notice"></small>
           </div>
           <?php } ?>
           <?php if($region == 'delivery'){ ?>
           
           <div class="btk-cart-item-shipping">
             <label class="btk-cart-item-shipping-checkbox btk-self-pickup">
               <input type="radio" name="cart[<?php echo $cart_item_key ?>][edb_shipping]" value="self_pickup" <?php echo $cart_item_shipping_method == 'self_pickup' ? 'checked="checked"' : '' ?>>
             </label>
             <label class="btk-cart-item-shipping-checkbox btk-ship-ready">
               <input type="radio" name="cart[<?php echo $cart_item_key ?>][edb_shipping]" value="ship_ready" <?php echo $cart_item_shipping_method == 'ship_ready' ? 'checked="checked"' : '' ?>>
             </label>
             <label class="btk-cart-item-shipping-checkbox btk-ship-bundle-1">
               <input type="radio" name="cart[<?php echo $cart_item_key ?>][edb_shipping]" value="ship_bundle_1" <?php echo $cart_item_shipping_method == 'ship_bundle_1' ? 'checked="checked"' : '' ?>>
             </label>
             <label class="btk-cart-item-shipping-checkbox btk-ship-bundle-2">
               <input type="radio" name="cart[<?php echo $cart_item_key ?>][edb_shipping]" value="ship_bundle_2" <?php echo $cart_item_shipping_method == 'ship_bundle_2' ? 'checked="checked"' : '' ?>>
             </label>
             <label class="btk-cart-item-shipping-checkbox btk-ship-bundle-3">
               <input type="radio" name="cart[<?php echo $cart_item_key ?>][edb_shipping]" value="ship_bundle_3" <?php echo $cart_item_shipping_method == 'ship_bundle_2' ? 'checked="checked"' : '' ?>>
             </label>
             
           </div>
           <?php } ?>
         </div>
         
         <div class="btk-cart-item-actions">
           <div class="btk-cart-item-remove">
             <?php
               echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf( '<a href="%s" title="%s">remove&nbsp;&nbsp;&times;</a>', esc_url( WC()->cart->get_remove_url( $cart_item_key ) ), __( 'Remove this item', 'btk' ) ), $cart_item_key );
             ?>
             
           </div>
           <?php if($region != 'cart'){ ?>
           <div class="btk-cart-item-edit">
             <!--<a href="#">edit</a>-->
             <a href="<?php echo esc_url(home_url('/')); ?>cart?guest=<?php echo $_REQUEST['guest'] ?>">edit</a>
           </div>
           <?php } ?>
         </div>
         
         
     </div>
   
 <?php
}
/*function btk_cart_row( $cart_item_key, $cart_item){
  
  
  
  $_product     = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
  $product_id   = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );
  $categories = wp_get_post_terms( $_product->id, 'product_cat' );
  $category = $categories[count($categories) - 1];
  
  $variationID = $_product->get_variation_id();
  $stock_qty = get_post_meta($variationID,'_stock',true);
  // var_dump($stock_qty);
  $stock_delay = get_post_meta($variationID,'_stock_backorder_delay',true);
  $stock_wanted = $cart_item['quantity'];
  $stock_avail = $stock_wanted <= $stock_qty ? '1 week' : btk_time_elapsed( strtotime($stock_delay));
  $json_data = json_encode( array( "in_stock" => $stock_qty, "stock_wanted" => $stock_wanted, "price"=>$_product->price, "category"=>$category->slug  ));
  if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
    ?>
  
  <div data-json="<?php echo htmlentities($json_data, ENT_QUOTES, 'UTF-8'); ?>" class="<?php echo esc_attr( apply_filters( 'woocommerce_cart_item_class', 'cart_item', $cart_item, $cart_item_key ) ); ?>">

    <?php if ( ! is_checkout() ) { ?>
    <div class="product-remove alignright">
      <?php
        echo apply_filters( 'woocommerce_cart_item_remove_link', sprintf( '<a href="%s" class="remove" title="%s">&times;</a>', esc_url( WC()->cart->get_remove_url( $cart_item_key ) ), __( 'Remove this item', 'btk' ) ), $cart_item_key );
      ?>
    </div>
    <?php } ?>

    <div class="product-thumbnail">
      <?php
        $thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );
        if ( ! $_product->is_visible() )
          echo $thumbnail;
        else
          printf( '<a href="%s">%s</a>', $_product->get_permalink( $cart_item ), $thumbnail );
      ?>
    </div>

    <div class="product-name">
      <?php
        
        if ( ! $_product->is_visible() )
          echo apply_filters( 'woocommerce_cart_item_name', $_product->get_title(), $cart_item, $cart_item_key ) . '&nbsp;';
        else
          echo apply_filters( 'woocommerce_cart_item_name', sprintf( '<a href="%s">%s </a>', $_product->get_permalink( $cart_item ), $_product->get_title() ), $cart_item, $cart_item_key );
          
          
             // Backorder notification
  //           if ( $_product->backorders_require_notification() && $_product->is_on_backorder( $cart_item['quantity'] ) )
  //             echo '<p class="backorder_notification">' . __( 'Available on backorder', 'btk' ) . '</p>';
      // 
      ?>
      <span class="category">
        <?php echo $category->name; ?>
      </span>
      <br />
      <span class="material">
        <?php 
          $attributes = $_product->get_variation_attributes(); 
          $variationID = $attributes['attribute_edb_material'];
          echo btk_material_name($variationID);
        ?>
     </span>
     <br />
    
      <span class="availability">
          <?php
           
            echo  "$stock_avail";
          ?>
      </span>  
    </div>
    
    <div class="product-quantity">
      
      <?php
      //   if ( $_product->is_sold_individually() ) {
      //     $product_quantity = sprintf( '1 <input type="hidden" name="cart[%s][qty]" value="1" />', $cart_item_key );
      //   } else {
      //     $product_quantity = woocommerce_quantity_input( array(
      //       'input_name'  => "cart[{$cart_item_key}][qty]",
      //       'input_value' => $cart_item['quantity'],
      //       'max_value'   => $_product->backorders_allowed() ? '' : $_product->get_stock_quantity(),
      //       'min_value'   => '0'
      //     ), $_product, false );
      //   }
        
        //echo apply_filters( 'woocommerce_cart_item_quantity', $product_quantity, $cart_item_key );
        
      ?>
      
      <input type="number" class="qty" min="1" step="1" name="cart[<?php echo $cart_item_key; ?>][qty]" value="<?php echo $cart_item['quantity']; ?>">
    </div>
    <div class="product-price">
      <?php
        echo apply_filters( 'woocommerce_cart_item_price', WC()->cart->get_product_price( $_product ), $cart_item, $cart_item_key );
      ?>
    </div>

    

    <?php
      if ( ! empty($cart_item['variation_id']) ) {
        foreach ( $cart_item['variation'] as $name => $value ) {
          if ( '' === $value )
            continue;

          $taxonomy = wc_attribute_taxonomy_name( str_replace( 'attribute_pa_', '', urldecode( $name ) ) );

          // If this is a term slug, get the term's nice name and description
          if ( taxonomy_exists( $taxonomy ) ) {
            $term = get_term_by( 'slug', $value, $taxonomy );
            if ( ! is_wp_error( $term ) && $term && $term->name ) {
    ?>
    <div class="product-color">
      <span class="valign"><?php echo $term->name; ?></span>
      <a class="alignright" style="background-color: <?php echo $term->description; ?>">&nbsp;</a>
    </div>
    <?php
            }
          }
        }
      }
    ?>
  </div>
    <?php
  }
}

*/
/**
 * Recently viewed products
 **/
function btk_recently_viewed() {
  ?><div id="recently-viewed"><h2><?php _e('Recently viewed', 'btk'); ?></h2><?php
  echo do_shortcode('[recent_products per_page="8"]');
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

/*

Micro Templates

*/
/*
function btk_single_product_title_tag(){
  global $post, $product, $woocommerce;
  ?><h2 class="product-title upper"><?php the_title(); ?></h2><?php
}

function btk_single_product_price_tag(){
  global $post, $product, $woocommerce;
  ?><p class="product-price">_ <?php echo $product->get_price_html(); ?></p><?php
}
*/