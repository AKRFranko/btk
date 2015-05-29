<?php
/**
 * Review Comments Template
 *
 * Closing li is left out on purpose!
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     2.1.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

$rating = intval( get_comment_meta( $comment->comment_ID, 'rating', true ) );

?>
<li itemprop="review" itemscope itemtype="http://schema.org/Review" <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>">

	<div id="comment-<?php comment_ID(); ?>" class="comment_container">

		<?php //echo get_avatar( $comment, apply_filters( 'woocommerce_review_gravatar_size', '60' ), '', get_comment_author_email( $comment->comment_ID ) ); ?>

		<div class="comment-text">

			<?php if ( $rating && get_option( 'woocommerce_enable_review_rating' ) == 'yes' ) : ?>

				<div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" class="star-ratings" title="<?php echo sprintf( __( 'Rated %d out of 5', 'btk' ), $rating ) ?>">
				<?php
					for ($i = 1; $i <= 5; $i++) {
						if ( $i <= $rating ) {
				?>
					<span class="fa fa-star"></span>
				<?php } else { ?>
					<span class="fa fa-star-o"></span>
				<?php } } ?>
				</div>

			<?php endif; ?>

			<?php if ( $comment->comment_approved == '0' ) : ?>

				<p class="meta"><em><?php _e( 'Your comment is awaiting approval', 'btk' ); ?></em></p>

			<?php else : ?>

				<p class="meta">
					<span itemprop="author"><?php comment_author(); ?></span>
					<?php

						if ( get_option( 'woocommerce_review_rating_verification_label' ) === 'yes' )
							if ( wc_customer_bought_product( $comment->comment_author_email, $comment->user_id, $comment->comment_post_ID ) )
								echo '<em class="verified">(' . __( 'verified owner', 'btk' ) . ')</em> ';

					?>
					<span itemprop="datePublished" datetime="<?php echo get_comment_date( 'c' ); ?>"><?php echo get_comment_date( 'd.m.Y' ); ?></span>
				</p>

			<?php endif; ?>

			<div itemprop="description" class="description"><?php comment_text(); ?></div>
		</div>
	</div>
