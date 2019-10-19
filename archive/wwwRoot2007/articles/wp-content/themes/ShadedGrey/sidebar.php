<div id="sidebar">
	<h2><?php _e('About'); ?></h2>
		<ul><li id="about"><?php bloginfo('description'); ?><p>There are <?php global $numposts; echo $numposts ;?> posts and <?php global $numcmnts; echo $numcmnts ;?> comments so far.</p></li></ul>
	<?php if (!is_home()) {?>
		<h2><?php _e('Recent Posts'); ?></h2>
		<ul><?php sg_get_recent_posts(6);?></ul>
	<?php }?>
	<h2><?php _e('Pages'); ?></h2>
	<ul><?php wp_list_pages('title_li='); ?></ul>			
	
	<h2><?php _e('Categories'); ?></h2>
		<ul>
			<?php list_cats(0, '', 'name', 'ASC', '/', true, 0, 1);    ?>
		</ul>
	<h2><label for="s"><?php _e('Search'); ?></label></h2>
		<form id="searchform" method="get" action="<?php bloginfo('siteurl') ?>/index.php">
			<input type="text" name="s" id="s" value="<?php echo wp_specialchars($s, 1); ?>" size="15" /><br />
			<input type="submit" name="submit" value="<?php _e('Search'); ?>" />
		</form>
	<h2><?php _e('Archives'); ?></h2>
		<ul>
			<?php wp_get_archives('type=monthly&show_post_count=true'); ?>
		</ul>
	<?php if(is_home()) {?>
		<h2>Recent Comments</h2>
		<ul>
			
			<?php sg_get_recent_comments(6,5); //shows 6 recent comments, each with first 5 words ?>
		</ul>			              
		<h2>Links</h2>
		<ul><?php get_links_list('name'); ?> </ul>			
		<h2><?php _e('Meta'); ?></h2>
		<ul>
			<li><?php wp_register(); ?></li>
			<li><?php wp_loginout(); ?></li>
			<li><a href="<?php bloginfo('rss2_url'); ?>" title="<?php _e('Syndicate this site using RSS'); ?>"><?php _e('<abbr title="Really Simple Syndication">RSS</abbr>'); ?></a></li>
			<li><a href="<?php bloginfo('comments_rss2_url'); ?>" title="<?php _e('The latest comments to all posts in RSS'); ?>"><?php _e('Comments <abbr title="Really Simple Syndication">RSS</abbr>'); ?></a></li>
			<li><a href="http://validator.w3.org/check/referer" title="<?php _e('This page validates as XHTML 1.0 Transitional'); ?>"><?php _e('Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr>'); ?></a></li>
			<?php wp_meta(); ?>
		</ul>
	<?php }?>
	</div>