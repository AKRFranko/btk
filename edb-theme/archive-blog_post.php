<?php
/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package edb
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
    
		<?php
		if ( have_posts() ) : ?>


      <!-- <header class="entry-header image-header">
				
					<h1 class="page-title"><?php _e('Blog','edb'); ?></h1>
					<img src="<?php header_image(); ?>" height="<?php echo get_custom_header()->height; ?>" width="<?php echo get_custom_header()->width; ?>" alt="" />
				
			</header> -->
			<header class="entry-header image-header  ">
        <div class="post-image" style="background-image:url('<?php header_image();?>');">
          <img width="<?php echo get_custom_header()->width; ?>" height="<?php echo get_custom_header()->height; ?>" src="<?php header_image(); ?>" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="">
          </div>
        <div class="titles">
          <h2 class="entry-title"><a href="/blog" rel="bookmark"><?php _e('Blog','edb'); ?></a></h2>
        </div>
      </header>

			<?php
			/* Start the Loop */
			while ( have_posts() ) : the_post();
        
				/*
				 * Include the Post-Format-specific template for the content.
				 * If you want to override this in a child theme, then include a file
				 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
				 */
				// // if($post->post_type == 'lookbook'){
				// //   get_template_part( 'template-parts/content', 'lookbook' );  
				// // }else{
				  //get_template_part( 'template-parts/content', get_post_format() );  
				// // }
				
				?>

				<article class="article <?php echo "article-".$post->post_type; ?>">
            <a class="article-link" href="<?php echo get_permalink();?>">
              
              <div class="listing-blog-post-title">
                <h3><?php echo the_title(); ?></h3>
              </div>
              <div class="listing-blog-post-body">
                <?php
                // strip tags to avoid breaking any html
                $string = strip_tags(get_the_content());
                $maxchars = 420;
                if (strlen($string) > $maxchars) {
                
                    // truncate string
                    $stringCut = substr($string, 0, $maxchars);
                
                    // make sure it ends in a word so assassinate doesn't become ass...
                    $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'&hellip; <b>Read More</b>'; 
                }
                echo "<p>$string</p>";
                ?>
                
                
              </div>
             
             
            </a>
				</article>
				<?php

			endwhile;

			the_posts_navigation();

		else :

			get_template_part( 'template-parts/content', 'none' );

		endif; ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar();
get_footer();
