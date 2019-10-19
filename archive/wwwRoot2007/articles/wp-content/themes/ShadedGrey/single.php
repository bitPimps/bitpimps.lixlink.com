<?php get_header(); ?>
	<div id="content">
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
	</div>
	<?php get_sidebar() ;?>
<?php get_footer(); ?>