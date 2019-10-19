<?php
/*
Template Name: Single Column Page
*/
?>
<?php get_header(); ?>

<div id="wrapper">
	<div id="container" class="widecolumn">
		<div id="content">
 
<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

			<div id="post-<?php the_ID(); ?>" class="post">
				<h2 class="post-title"><a href="<?php the_permalink() ?>" title="Permalink to <?php the_title(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
				<div class="post-entry">
					<?php the_content('<span class="more">(Continued)</span>'); ?>
					<?php link_pages('<p style="font-weight:bold;">Pages: ', '</p>', 'number'); ?>
					<?php edit_post_link('Edit this page.', '<p>', '</p>'); ?>
				</div><!-- END POST-ENTRY -->
			</div><!-- END POST -->

<?php endwhile; endif; ?>

		</div><!-- END CONTENT -->
	</div><!-- END CONTAINER -->
</div><!-- END WRAPPER -->

<?php get_footer(); ?>