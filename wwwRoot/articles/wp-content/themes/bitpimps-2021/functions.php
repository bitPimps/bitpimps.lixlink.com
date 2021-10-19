<?php
// Load stylesheets
function load_css()
{
    /*
    No need for this since we will load bootstrap directly in the header using a CDN
    // Register bootstrap
    // args = (name, directory, list of dependencies, version, media)
    wp_register_style('bootstrap', get_template_directory_uri() . '/css/bootstrap.min.css', array(), false, 'all');
    // Enqueue bootstrap
    wp_enqueue_style('boostrap');
    */
    // Load our main styles
    wp_register_style('main', get_template_directory_uri() . '/css/main.min.css', array(), false, 'all');
    wp_enqueue_style('main');
}
add_action('wp_enqueue_scripts', 'load_css');

/*
No need for this function since we will load jquery and bootstrap directly in the footer using a CDN
Bootstrap 5 technically doesn't need jquery, but will work if it detects it
// Load javascript
function load_js()
{
    // Enqueue jquery before bootstrap
    wp_enqueue_script('jquery');
    // Register bootstrap
    // args = (name, directory, list of dependencies, version, in footer)
    wp_register_script('bootstrap', get_template_directory_uri() . '/js/bootstrap.min.js', 'jquery', false, true);
    // Enqueue bootstrap
    wp_enqueue_script('boostrap');
}
add_action('wp_enqueue_scripts', 'load_js');
*/

// Theme Options
add_theme_support('menus');

// Menus
register_nav_menus(
    array(
        'top-menu' => 'Top Menu Location',
        'mobile-menu' => 'Mobile Menu Location',
    )
);
