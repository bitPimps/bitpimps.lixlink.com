##############################################################
## MOD Title:		Registration Auth Code (RAC)
## MOD Author: 		Marshalrusty < marshalrusty@phpbb.com > (Yuriy Rusko) http://www.phpbb.com/community/viewtopic.php?f=1&t=427852
## MOD Description:	This MOD is based on the "VIP Code MOD" by Martin Aignesberger. A number of improvements have been made to 
##               	the aforementioned MOD including:
##               	1) Proper usage of language variables
##               	2) Proper usage of the phpBB MOD Template
##               	3) The removal of 2 unnecessary steps
##               	4) More detailed instructions
##
##               	This MOD will require users to enter an auth code during registration, which is defined by the administrator.
##               	Alternatively, the administrator may wish to ask a question, which the code would be the answer to
##               	Here are two examples of possible setups:
##               	
##               	http://www.marshalrusty.com/phpBB/spam/description.gif
##               	http://www.marshalrusty.com/phpBB/spam/question.gif
##
## MOD Version: 	0.0.1
## Installation Level:	Easy
## Installation Time:	~3 Minutes
## Files To Edit: 	includes/usercp_register.php
##               	language/lang_english/lang_main.php
##               	templates/subSilver/profile_add_body.tpl
## Included Files:	N/A
##
## License: http://opensource.org/licenses/gpl-license.php GNU General Public License v2
##############################################################
## For security purposes, please check: http://www.phpbb.com/mods/
## for the latest version of this MOD. Although MODs are checked
## before being allowed in the MODs Database there is no guarantee
## that there are no security problems within the MOD. No support
## will be given for MODs not found within the MODs Database which
## can be found at http://www.phpbb.com/mods/
############################################################## 
## Author Notes:
## 
##
## Support for this MOD can be obtained here: 
## http://www.phpbb.com/community/viewtopic.php?f=16&t=552845
##
## Before installing this MOD, please visit the URI above to make sure that you are installing the latest version.
##
##
##############################################################
## MOD History:
##   2007-01-01 - Version 0.0.1
##############################################################
## Before Adding This MOD To Your Forum, You Should Back Up All Files Related To This MOD
##############################################################

# 
#-----[ DIY ]------------------------------------------
# 	
This MOD requires that you choose an auth code that users will have to enter during registration.
This code should be a string of numbers, letters and/or symbols. Valid examples would be:
'y5i4b3m', '1739575', 'eyrmoskd', '!@#$%^&', '1a!2b@', etc.

Remember that you will have to display this code somewhere for users to find and be able to 
explain where it is located on the registration page. Instead of using a random string, you can 
use "The first two words in the description of the first forum on the index page" or "The first 
two words in this board's description (under the title in the header)" or something similar.
Here is an example: http://www.marshalrusty.com/phpBB/spam/description.gif

If you wish to make it even simpler, you may change the $lang['rac_location'] (below) to a question,
such as "How many fingers do people have?" or "What color is the sky?" and make the RAC code the answer.
Here is an example of how this would look: http://www.marshalrusty.com/phpBB/spam/question.gif

If after some time you notice an increase in the number of spam registrations, bots may have been 
adapted to the system. Simple change the auth code and/or its location to throw them off again.

Please note the messages after the word "Hint:" in the instructions below; they contain further
instructions.

# 
#-----[ OPEN ]------------------------------------------
# 	
includes/usercp_register.php

#
#-----[ FIND ]------------------------------------------
# 
	else if ( $mode == 'register' )
	{

# 
#-----[ AFTER, ADD ]------------------------------------------
# Hint: Change the 'qwerty12345' to the auth code that you have chosen
#
        if ($HTTP_POST_VARS['RAC'] != 'qwerty12345')
        {
			message_die(GENERAL_ERROR, $lang['rac_incorrect']);
        }

#
#-----[ FIND ]------------------------------------------
#
		'L_CONFIRM_CODE_EXPLAIN'	=> $lang['Confirm_code_explain'], 

# 
#-----[ AFTER, ADD ]------------------------------------------
#
		'L_RAC_CODE' 		=> $lang['rac_code'],
		'L_RAC_LOCATION'	=> $lang['rac_location'], 

# 
#-----[ OPEN ]------------------------------------------
#
language/lang_english/lang_main.php

#
#-----[ FIND ]------------------------------------------
#
//
// That's all, Folks!
// -------------------------------------------------

# 
#-----[ BEFORE, ADD ]------------------------------------------
# Hint: Change the third definition to say where the code will be displayed. The link is 
#	there as a guidelines; you don't necessarily need to use it.
#	You may also change $lang['rac_location'] to a question, to which the code is the answer.
#	Examples: http://www.marshalrusty.com/phpBB/spam/description.gif and http://www.marshalrusty.com/phpBB/spam/question.gif
#
// RAC Code MOD
$lang['rac_incorrect'] = 'The authorization code you have entered is incorrect. The location of the code should be stated on the registration page. Please try again.';
$lang['rac_code'] = 'Authorization Code';
$lang['rac_location'] = 'You can find the auth code on the following page: <a href="http://wwww.yoursite.com">Location Title</a>';

# 
#-----[ OPEN ]------------------------------------------
#
templates/subSilver/profile_add_body.tpl

#
#-----[ FIND ]------------------------------------------
#
	<tr> 
	  <td class="row1"><span class="gen">{L_CONFIRM_PASSWORD}: * </span><br />
		<span class="gensmall">{L_PASSWORD_CONFIRM_IF_CHANGED}</span></td>
	  <td class="row2"> 
		<input type="password" class="post" style="width: 200px" name="password_confirm" size="25" maxlength="32" value="{PASSWORD_CONFIRM}" />
	  </td>
	</tr>

# 
#-----[ AFTER, ADD ]------------------------------------------
#
	<!-- BEGIN switch_user_logged_out -->
	<tr> 
	  <td class="row1"><span class="gen">{L_RAC_CODE}: * </span><br />
		<span class="gensmall">{L_RAC_LOCATION}</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 200px" name="RAC" size="25" maxlength="32" />
	  </td>
	</tr>
	<!-- END switch_user_logged_out -->

#
#-----[ SAVE/CLOSE ALL FILES ]------------------------------------------
#
# EoM
