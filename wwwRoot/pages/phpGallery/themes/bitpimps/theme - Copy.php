<?php
/*************************
  Coppermine Photo Gallery
  ************************
  Copyright (c) 2003-2008 Dev Team
  v1.1 originally written by Gregory DEMAR

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License version 3
  as published by the Free Software Foundation.
  
  ********************************************
  Coppermine version: 1.4.18
  $HeadURL: https://coppermine.svn.sourceforge.net/svnroot/coppermine/trunk/cpg1.4.x/themes/classic/theme.php $
  $Revision: 4380 $
  $Author: gaugau $
  $Date: 2008-04-12 12:00:19 +0200 (Sa, 12 Apr 2008) $
**********************************************/

// ------------------------------------------------------------------------- //
// This theme has all CORE items removed                                     //
// ------------------------------------------------------------------------- //

define('THEME_HAS_RATING_GRAPHICS', 1);
define('THEME_HAS_NAVBAR_GRAPHICS', 1);
define('THEME_HAS_FILM_STRIP_GRAPHIC', 1);
define('THEME_IS_XHTML10_TRANSITIONAL',1);


// HTML template for template sys_menu spacer
$template_sys_menu_spacer ="::";

// HTML template for user admin menu
$template_user_admin_menu = <<<EOT

                <div align="center">
                <table cellpadding="0" cellspacing="1">
                        <tr>
                                <td class="admin_menu"><a href="albmgr.php" title="">{ALBMGR_LNK}</a></td>
                                <td class="admin_menu"><a href="modifyalb.php" title="">{MODIFYALB_LNK}</a></td>
                                <td class="admin_menu"><a href="profile.php?op=edit_profile" title="">{MY_PROF_LNK}</a></td>
                        </tr>
                </table>
                </div>

EOT;

?>