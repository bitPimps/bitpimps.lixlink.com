<?php
get_header();
/*
If you want header-secondary.php
get_header('secondary');
*/
?>

<section class="page-wrap">

<div class="container">

    <h1><?php the_title(); ?></h1>

    <?php get_template_part('inc/section', 'content'); ?>

</div>

</section>

<?php
get_footer();
