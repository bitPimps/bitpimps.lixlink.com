</div>
<div id="sidebar">
	<ul>
	<?php wp_list_pages('title_li=<h3>' . __('Pages') . '</h3>'); ?>

	<li><h3>Categories</h3>
		<ul>
			<?php wp_list_cats('sort_column=name&optioncount=1&hierarchical=0'); ?>
		</ul>
	</li>
			
	<li><h3>Archives</h3>
		<ul>
			<?php wp_get_archives('type=monthly'); ?>
		</ul>
	</li>

	<?php
		// List links, ordered by category, A-Z
		$link_cats = $wpdb->get_results("SELECT cat_id, cat_name FROM $wpdb->linkcategories ORDER BY cat_name ASC");
		// List links, ordered by category, Z-A
		// $link_cats = $wpdb->get_results("SELECT cat_id, cat_name FROM $wpdb->linkcategories ORDER BY cat_name DESC");
		// List links, ordered by category ID, ascending
		// $link_cats = $wpdb->get_results("SELECT cat_id, cat_name FROM $wpdb->linkcategories ORDER BY cat_id ASC");
		// List links, ordered by category ID, descending
		// $link_cats = $wpdb->get_results("SELECT cat_id, cat_name FROM $wpdb->linkcategories ORDER BY cat_id DESC");
		foreach ($link_cats as $link_cat) {
	?>
	<li><h3><?php echo $link_cat->cat_name; ?></h3>
		<ul>
			<?php wp_get_links($link_cat->cat_id); ?>
		</ul>
	</li>
	<?php } ?>
					
	<li><h3>Meta</h3>
		<ul>
			<?php wp_register(); ?>
			<li class="themeswitcher"><?php wp_loginout(); ?></li>
			<?php wp_meta(); ?>
		</ul>
	</li>
	</ul>
</div>
<div class="clear">&nbsp;</div>
</div>