<?php get_header(); ?>

	<div id="content">

		<?php if (have_posts()) : ?>

		 <?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
<?php /* If this is a category archive */ if (is_category()) { ?>				
		<h3 class="headerstyle">Archive for the '<?php echo single_cat_title(); ?>' Category</h3>
		
 	  <?php /* If this is a daily archive */ } elseif (is_day()) { ?>
		<h3 class="headerstyle">Archive for <?php the_time('F jS, Y'); ?></h3>
		
	 <?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
		<h3 class="headerstyle">Archive for <?php the_time('F, Y'); ?></h3>

		<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
		<h3 class="headerstyle">Archive for <?php the_time('Y'); ?></h3>
		
	  <?php /* If this is a search */ } elseif (is_search()) { ?>
		<h3 class="headerstyle">Search Results</h3>
		
	  <?php /* If this is an author archive */ } elseif (is_author()) { ?>
		<h3 class="headerstyle">Author Archive</h3>

		<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
		<h3 class="headerstyle">Blog Archives</h3>

		<?php } ?>


		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Next Entries &raquo;') ?></div>
		</div>

		<?php while (have_posts()) : the_post(); ?>
			<div class="post" id="post-<?php the_ID(); ?>">
				<h3 class="headerstyle"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h3>
				<p class="dateline">
					<?php the_time('F jS, Y') ?> <!-- by <?php the_author() ?> --></p>
					<?php if (function_exists("the_bunny_tags")) {
						the_bunny_tags();
						}
					?>
				<div class="entry">
					<?php the_excerpt(); ?>
					<!--
						<?php trackback_rdf(); ?>
					-->
				</div>
				<p class="postmetadata">Posted in <?php the_category(', ') ?> <strong>|</strong> <?php edit_post_link('Edit','','<strong>|</strong>'); ?>  <?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;'); ?></p>
				<p class="internallink">[ <a href="#top">Back to top</a> ]</p>
			</div>
	
		<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Next Entries &raquo;') ?></div>
		</div>
	
	<?php else : ?>

		<h2 class="center">Not Found</h2>
		<?php include (TEMPLATEPATH . '/searchform.php'); ?>

	<?php endif; ?>
		
	</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>