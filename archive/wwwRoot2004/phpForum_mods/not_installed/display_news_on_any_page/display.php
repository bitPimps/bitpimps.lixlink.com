<?

// By Kent Fällman <fuelman@northpower.nu>
// Displays all topics in your " news " forum on any page.
// It can be used in many ways
// -------------------------------------------------------------------------

// Date formatting

function format_date($input,$type)
{
	// Change to your preferred dates
	// http://se2.php.net/manual/en/function.strftime.php
	
	if($type == "long") {
		$newsdate = strftime("%A %e %B %H:%M",$input);
	}
	if ($type == "short") {
		$newsdate = strftime("%a %e %b %H:%M",$input);
	}
	
	echo $newsdate;
	// echo ucwords($newsdate);
}

// Text formatting
// Not complete, someone else maybe can fill it in ?

function format_text($input)
{
	$text_string = nl2br($input);
	$text_string = eregi_replace("\\[b\\]([^\\[]*)\\[/b\\]","<b>\\1</b>",$text_string);
    $text_string = eregi_replace("\\[i\\]([^\\[]*)\\[/i\\]","<i>\\1</i>",$text_string);
    $text_string = eregi_replace("\\[url\\]([^\\[]*)\\[/url\\]","<a href=\"\\1\" target=\"_blank\">\\1</a>",$text_string);
    $text_string = eregi_replace("\\[url=([^\\[]+)\\]([^\\[]*)\\[/url\\]","<a href=\"http://\\1\" target=\"_blank\">\\2</a>",$text_string);
}

// Main function

function mynews($prefix,$forum_id,$limit)
{
	$get_threads = mysql_query("SELECT 
	ft.*, pt.*, us.username AS POSTER 
	FROM ".$prefix."_topics ft, ".$prefix."_posts_text pt, ".$prefix."_users us 
	WHERE ft.forum_id = '$forum_id' AND  ft.topic_first_post_id = pt.post_id AND ft.topic_poster = us.user_id 
	ORDER BY ft.topic_time DESC LIMIT $limit") or die ("<h2>ERROR:</h2>" . mysql_error());

	if (mysql_num_rows($get_threads) > 0) {
		while ($th = mysql_fetch_array($get_threads)) {
			echo "<h3>".$th['topic_title']."</h3>";
			echo "<span class=\"date\">";
			echo format_date($th['topic_time'],"short");
			echo "</span> | <span class=\"poster\">".$th['POSTER']."</span><br /><br />";
			echo "<div class=\"newstext\">";
			echo format_text($th['post_text']);
			echo "</div><br />";
			// Maybe you will have to change the location of your forum files
			echo "<p align=\"right\"><a class=\"subject\" href=\"/forum/viewtopic.php?t=".$th['topic_id']."\">View comments</a></p>";
			echo "<hr /><br />";
		}
	}

}

// Call the function
// Example: default forum prefix "phpbb", forum id 8 and 15 news on the page

mynews("phpbb","8","15");
?>