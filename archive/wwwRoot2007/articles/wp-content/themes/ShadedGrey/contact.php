<?php
/*
Template Name: Contact
*/
?>
<?php get_header(); ?>
<div id="main">
	<div id="content"> 		   
    	<?php if (have_posts()) : ?>
			<?php while (have_posts()) : the_post(); ?>
				<div class="post">
				<?php
					//validate email adress
					function is_valid_email($email)
					{
  						return (eregi ("^([a-z0-9_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,4}$", $email));
					}
					//clean up text
					function clean($text)
					{
						return stripslashes($text);
					}
					//encode special chars (in name and subject)
					function encodeMailHeader ($string, $charset = 'UTF-8')
					{
    					return sprintf ('=?%s?B?%s?=', strtoupper ($charset),base64_encode ($string));
					}

					$ssc_name    = (!empty($_POST['ssc_name']))    ? $_POST['ssc_name']    : "";
					$ssc_email   = (!empty($_POST['ssc_email']))   ? $_POST['ssc_email']   : "";
					$ssc_url     = (!empty($_POST['ssc_url']))     ? $_POST['ssc_url']     : "";
					$ssc_message = (!empty($_POST['ssc_message'])) ? $_POST['ssc_message'] : "";
					$ssc_message = clean($ssc_message);
					$error_msg = "";
					$send = 0;
					if (!empty($_POST['submit'])) {			
						$send = 1;
						if (empty($ssc_name) || empty($ssc_email) || empty($ssc_message)) {
							$error_msg.= "<p><strong>Please fill in all required fields.</strong></p>\n";
							$send = 0;
						}
						if (!is_valid_email($ssc_email)) {
							$error_msg.= "<p><strong>Your email adress failed to validate.</strong></p>\n";
							$send = 0;
						}
					}
					if (!$send) { ?>
						<h2 class="post-title"><?php the_title(); ?></h2>
						<p class="post-info-co">
							Created by <?php the_author(); ?> on <?php the_time('d M y'); ?> <?php edit_post_link(); ?>
						</p>
						<div class="post-content">
							<?php
								the_content();
								echo $error_msg;	
							?>
							<form method="post" action="<?php echo "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']; ?>" id="contactform">
								<fieldset>
									<strong>Name</strong><br/>
									<input type="text" id="ssc_name" name="ssc_name" value="<?php echo $ssc_name ;?>" /><br/>
									<strong>Email</strong><br/>
									<input type="text" id="ssc_email" name="ssc_email" value="<?php echo $ssc_email ;?>" /><br/>
									<strong>Website</strong><br/>
									<input type="text" id="ssc_url" name="ssc_url" value="<?php echo $ssc_url ;?>" /><br/>
									<strong>Message</strong><br/>				
									<textarea id="ssc_message" name="ssc_message" value="<?php echo $ssc_message ;?>"></textarea><br/>
									<input type="submit" id="submit" name="submit" value="Send Message" />		
								</fieldset>
							</form>
						</div>
					<?php
					} else {
						$displayName_array	= explode(" ",$ssc_name);
						$displayName = htmlentities(utf8_decode($displayName_array[0]));
			
						$header  = "MIME-Version: 1.0\n";
						$header .= "Content-Type: text/plain; charset=\"utf-8\"\n";
						$header .= "From:" . encodeMailHeader($ssc_name) . "<" . $ssc_email . ">\n";
						$email_subject	= "[" . get_settings('blogname') . "] " . encodeMailHeader($ssc_name);
						$email_text		= "From......: " . $ssc_name . "\n" .
							  "Email.....: " . $ssc_email . "\n" .
							  "Url.......: " . $ssc_url . "\n\n" .
							  $ssc_message;

						if (@mail(get_settings('admin_email'), $email_subject, $email_text, $header)) {
							echo "<h2>Hey " . $displayName . ",</h2><p>thanks for your message! I'll get back to you as soon as possible.</p>";
					}
					}
					?>
				<?php endwhile; ?>
			</div>
		<?php endif; ?>
	</div>
</div>
<?php get_sidebar(); ?>
<?php get_footer(); ?>