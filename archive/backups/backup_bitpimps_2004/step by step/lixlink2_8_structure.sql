# phpMyAdmin MySQL-Dump
# version 2.2.4
# http://phpwizard.net/phpMyAdmin/
# http://phpmyadmin.sourceforge.net/ (download page)
#
# Host: localhost
# Generation Time: Jul 25, 2004 at 03:49 PM
# Server version: 3.23.37
# PHP Version: 4.3.6
# Database : `lixlink2`
# --------------------------------------------------------

#
# Table structure for table `phpbb_search_wordmatch`
#

DROP TABLE IF EXISTS phpbb_search_wordmatch;
CREATE TABLE phpbb_search_wordmatch (
  post_id mediumint(8) unsigned NOT NULL default '0',
  word_id mediumint(8) unsigned NOT NULL default '0',
  title_match tinyint(1) NOT NULL default '0',
  KEY word_id (word_id)
) TYPE=MyISAM;

