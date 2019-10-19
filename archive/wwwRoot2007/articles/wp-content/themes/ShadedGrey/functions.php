<?php
/* 
Gets the number of posts and comments so we can display it in the sidebar
*/
$numposts = $wpdb->get_var("SELECT COUNT(*) FROM $wpdb->posts WHERE post_status = 'publish'");
if (0 < $numposts) $numposts = number_format($numposts); 

$numcmnts = $wpdb->get_var("SELECT COUNT(*) FROM $wpdb->comments WHERE comment_approved = '1'");
if (0 < $numcmnts) $numcmnts = number_format($numcmnts);

/*
Description: Returns a list of the most recent posts.
Created by Sadish for his ShadedGrey Theme
*/

function sg_get_recent_posts($no_posts = 5, $before = '<li>', $after = '</li>', $show_pass_post = false) {
    global $wpdb, $tableposts;
	$time_difference = get_settings('gmt_offset');
	$now = gmdate("Y-m-d H:i:s",(time()+($time_difference*3600)));
    $request = "SELECT ID, post_title, post_excerpt FROM $tableposts WHERE post_status = 'publish' ";
	if(!$show_pass_post) $request .= "AND post_password ='' ";
	$request .= "AND post_date < '$now' ORDER BY post_date DESC LIMIT 0, $no_posts";
    $posts = $wpdb->get_results($request);
	$output = '';
    foreach ($posts as $post) {
        $post_title = stripslashes($post->post_title);
        $permalink = get_permalink($post->ID);
        $output .= $before . '<a href="' . $permalink . '" rel="bookmark" title="Permanent Link: ' . $post_title . '">' . $post_title . '</a>';
		$output .= $after;
    }
    echo $output;
}
/*
Description: Returns a list of the most recent comments.
Created by Sadish for his ShadedGrey Theme
*/
function sg_get_recent_comments($no_comments = 5, $comment_num_of_words = 4, $before = '<li>', $after = '</li>') 
{
        global $wpdb, $tablecomments, $tableposts;
        
        $request = "SELECT ID, comment_ID, comment_content, comment_author FROM $tableposts, $tablecomments WHERE $tableposts.ID=$tablecomments.comment_post_ID AND post_status = 'publish' ";
        $request .= "AND comment_approved = '1' ORDER BY $tablecomments.comment_date DESC LIMIT $no_comments";
        $comments = $wpdb->get_results($request);
        
       	$output = '';
       	if($comments) {
        foreach ($comments as $comment) 
        {
                $comment_author = stripslashes($comment->comment_author);
                $comment_content = strip_tags($comment->comment_content);
                $comment_content = stripslashes($comment_content);
                $words=split(" ",$comment_content);
                $comment_excerpt = join(" ",array_slice($words,0,$comment_num_of_words));
                $permalink = get_permalink($comment->ID)."#comment-".$comment->comment_ID;
                $output .= $before . '<strong>' . $comment_author . '</strong>: <a href="' . $permalink;
                $output .= '" title="'.__('Comment by','c4m').' ' . $comment_author.'">' . $comment_excerpt . '...</a>' . $after;
        }
        }
        echo $output;
       	echo '<br/>'."\n";		
}






?>