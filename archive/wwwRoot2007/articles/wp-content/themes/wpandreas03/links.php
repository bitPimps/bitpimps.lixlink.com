<?php
/*
Template Name: Links
*/
?>

<?php get_header(); ?>

<div id="content">
<ul>
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
</ul>
</div>	
<?php get_sidebar(); ?>
<?php get_footer(); ?>
