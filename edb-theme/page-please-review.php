
<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package edb
 */

get_header(); ?>
<!-- Google: 

YP: http://www.yellowpages.ca/bus/Quebec/Montreal/Element-de-Base/101091599.html#ypgReviewsHeader
<a class="revus" style="float:right;text-decoration:none;font-size:2em;" href="http://www.yellowpages.ca/bus/Quebec/Montreal/Element-de-Base/101091599.html#ypgReviewsHeader">
Yelp: 
-->

<h1>Did you like your EDB experience?</h1>

<p>At EDB blah blah etc... Please provide a review on your preffered service listed below or all of them if you wish...</p>

<h2>Review us on:</h2>
<style>
.revus{
  display:inline-block;width:31%;float:left;border:1px solid #eee;padding:1em;margin:1%;height:96px;
  text-decoration:none;
  text-align:center;
  font-size:24px;
  line-height:96px;
}
.revus img{
  float:left;
}
  .revus:hover{
    background:#f0f0f0;
  }
</style>
  <a class="revus" target="google_review" href="https://goo.gl/72URzw"><img  width="64" height="64" src="http://blogsbucket.com/wp-content/uploads/2015/09/google-dk-flat.png">Google</p>
  <a class="revus" target="yp_reviews" href="http://www.yellowpages.ca/bus/Quebec/Montreal/Element-de-Base/101091599.html#ypgReviewsHeader" ><img src="http://diylogodesigns.com/blog/wp-content/uploads/2016/02/YP-Yellow-Pages-Canada-png-logo-design.png" width="64" height="64"/>YellowPages</a>
  <a class="revus" target="yelp_reviews" href="https://www.yelp.ca/writeareview/biz/BbACSBcHWa5eOQpGMkO8hQ"><img src="http://www.brandsoftheworld.com/sites/default/files/styles/logo-thumbnail/public/082011/yelpr-converted.png?itok=quRDD0Oa" width="64" height="64">Yelp</a>

<?php
get_sidebar();
get_footer();



