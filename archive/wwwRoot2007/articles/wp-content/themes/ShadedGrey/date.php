<?php get_header(); ?>
	<div id="content">
			<div class="post">
			<?php if ($posts) { ?>	
				<?php $post = $posts[0]; /* Hack. Set $post so that the_date() works. */ ?>
				<?php if (is_day()) { ?>
					<p class="post-title"><em>Daily Archive</em><?php the_time('l, F jS, Y'); ?></p>										
				<?php } elseif (is_month()) { ?>
					<p class="post-title"><em>Monthly Archive</em><?php the_time('F Y'); ?></p>										
				<?php } elseif (is_year()) { ?>
					<p class="post-title"><em>Yearly Archive</em><?php the_time('Y'); ?></p>					
				<?php } ?>								
			<?php } ?>	
			<br/><br/>
			</div>
			<?php if ($posts) : foreach ($posts as $post) : start_wp(); ?>
			<div class="post">
				<p class="post-title"><em><?php the_category(' &amp;');?> <?php edit_post_link('[edit this]'); ?></em><?php the_time('d M Y h:i a'); ?></p>
				<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title(); ?>"><?php the_title(); ?></a></h2>
				<div class="post-content">
				<?php the_content("<br/> Continue Reading &#187;"); ?>
				<p class="post-info-co">
					<?php wp_link_pages(); ?>											
				</p>
				<!--
					<?php trackback_rdf(); ?>
				-->
				</div>
				<p class="post-footer"><?php comments_popup_link(__('No Comments Yet'), __('Comments (1)'), __('Comments (%)')); ?></p>
				<?php comments_template(); // Get wp-comments.php template ?>
			</div>
			<?php endforeach; else: ?>
			<p><?php _e('Sorry, no posts matched your criteria.'); ?></p>
			<?php endif; ?>
		<p align="center"><?php posts_nav_link() ?></p>		
	</div>
	<?php get_sidebar() ;?>
<?php get_footer(); ?>