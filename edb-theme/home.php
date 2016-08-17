<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package buteek
 */

get_header();?>

  <div id="primary" class="content-area">
    
    <!-- main slider -->
    <div class="home-slider">
      <?php btk_edb_slider('category_name=carousel&posts_per_page=6');?>
      
    </div>
    <main id="main" class="site-main lower" role="main">

      




    <?php
$paged = (get_query_var('page')) ? get_query_var('page') : 1;
$my_query = new WP_Query(array(
  "paged" => $paged,
  "category_name" => "news",
  "posts_per_page" => 12,
));

// $alts = array('tall','small','small','tall','tall','small','small','tall','small','tall','small','small','tall','tall','small','small','tall','tall');

?>
    <?php if ($my_query->have_posts()): ?>
    <?php /* Start the Loop */?>
  
      <?php while ($my_query->have_posts()): $my_query->the_post();?>
      <?php $posttags = get_the_tags();
            $altClass=' ';
            if ($posttags) {
              foreach($posttags as $tag) {
                if($tag->name =='tall'){
                    $altClass .= 'tall';
                }
              }
            };
            //https://badb0x.akr.club/wp-content/uploads/2015/12/image-2.jpg
      ?>
      <article class="article <?php echo $altClass; ?>">    
      
          <a class="article-link" href="<?php echo get_permalink();?>">
            <?php if (has_post_thumbnail()): ?>
              <?php
                $hires = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                $lores = wp_get_attachment_image_src(get_post_thumbnail_id(), 'full');
                
              ?>
            <?php ;endif;?>
            <span class="article-image" style="background-image:url('<?php echo $hires[0]; ?>');">
              <?php echo '<img src="' . $lores[0] . '" data-hires-image="' . $hires[0] . '" alt="' . get_the_title() . '">'; ?>
            </span>
            <span class="article-info">
            <h2 class="article-title">
              <?php the_title();?>
            </h2>
            <p class="article-subtitle">
              <?php the_subtitle();?>
            </p>
            <span class="article-body">
              <?php if(preg_match("/product-category/", get_permalink())){ 
                the_content();
               }else{ 
                the_excerpt();
              } ?>
              
            </span>
          </a>
      </article>  
      <?php endwhile;?>
      
      <?php //the_posts_navigation();?>
    <?php else: ?>
      <?php get_template_part('content', 'none');?>
    <?php endif;?>
    </main><!-- #main -->
  </div><!-- #primary -->

<?php get_footer();?>
