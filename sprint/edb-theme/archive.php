<?php
/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package _s
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

		<?php
		if ( have_posts() ) : ?>

			<!--<header class="page-header">
				<?php
					the_archive_title( '<h1 class="page-title">', '</h1>' );
					the_archive_description( '<div class="taxonomy-description">', '</div>' );
				?>
			</header>-->

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
				<article class="article">
				  
            <a class="article-link" href="<?php echo get_permalink();?>">
              <span class="article-image">
              <?php if (has_post_thumbnail()): ?>
                <?php
                  $hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                  $lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                  echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '" alt="' . get_the_title() . '">';
                ?>
              <?php ;endif;?>
              </span>
              <span class="article-info">
              <h2 class="article-title">
                <?php the_title();?>
              </h2>
              <?php $subtitle = the_subtitle( '', '', false ); ?>
              <?php if(!empty($subtitle)){ ?>
                <p class="article-subtitle">
                  <?php the_subtitle();?>
                </p>  
              <?php }; ?>
              
              <span class="article-body">
                <?php the_excerpt(); ?>
              </span>
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
