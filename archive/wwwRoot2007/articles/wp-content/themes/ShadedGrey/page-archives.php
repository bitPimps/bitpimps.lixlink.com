<?php
/*
Template Name: Archives
*/
?>
<?php get_header(); ?>
<div id="main">
	<div id="content"> 		   
		<p class="post-title"><em><?php the_time('d M Y'); ?> <?php edit_post_link('[edit this]'); ?></em> Archives</p>
		<h2>Latest 15 Posts</h2>
		<ul><?php sg_get_recent_posts(15);?></ul>
		<h2>Search</h2>
		
		<form id="searchform" method="get" action="<?php bloginfo('siteurl') ?>/index.php">
			<input type="text" name="s" id="s" value="<?php echo wp_specialchars($s, 1); ?>" size="15" />
			<input id="btnSearch" type="submit" name="submit" value="<?php _e('Search'); ?>" />
		</form>		
		<h2>Monthly</h2>
		<ul>
			<?php wp_get_archives('type=monthly&show_post_count=1'); ?>
		</ul>
		<h2>Categories</h2>
		<ul>
			<?php wp_list_cats('sort_column=name&optioncount=1&hierarchical=0'); ?>
		</ul>		
	</div>
</div>
<?php get_sidebar(); ?>
<?php get_footer(); ?>