/*************************
  Coppermine Photo Gallery
  ************************
  Copyright (c) 2003-2019 Coppermine Dev Team
  v1.0 originally written by Gregory Demar

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License version 3
  as published by the Free Software Foundation.

  ********************************************
  Coppermine version: 1.5.48
  $HeadURL: https://svn.code.sf.net/p/coppermine/code/trunk/cpg1.5.x/docs/js/help.js $
  $Revision: 8884 $

  $Date: 2018-12-21 21:21:36 +0100 (Fr, 21 Dez 2018) $
**********************************************/

$(document).ready(function()
{
	$('#toc').replaceWith('');
	$('#docheader').replaceWith('');
	$('#doc_footer').replaceWith('');
});

$(function() {
    $(".cpg_zebra tr:even").addClass("tableb");
	$(".cpg_zebra tr:odd").addClass("tableb_alternate");
});