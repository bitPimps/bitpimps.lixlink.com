# phpMyAdmin MySQL-Dump
# version 2.2.4
# http://phpwizard.net/phpMyAdmin/
# http://phpmyadmin.sourceforge.net/ (download page)
#
# Host: localhost
# Generation Time: Jul 25, 2004 at 03:26 PM
# Server version: 3.23.37
# PHP Version: 4.3.6
# Database : `lixlink3`
# --------------------------------------------------------

#
# Table structure for table `phpbb_search_results`
#

DROP TABLE IF EXISTS phpbb_search_results;
CREATE TABLE phpbb_search_results (
  search_id int(11) unsigned NOT NULL default '0',
  session_id varchar(32) NOT NULL default '',
  search_array text NOT NULL,
  PRIMARY KEY  (search_id),
  KEY session_id (session_id)
) TYPE=MyISAM;

#
# Dumping data for table `phpbb_search_results`
#

INSERT INTO phpbb_search_results VALUES (1157817552, '5fdb50c4b086d85a3d2f4e97f58ba71a', 'a:7:{s:14:"search_results";s:52:"3517, 3981, 3982, 4127, 4232, 4233, 4267, 4268, 4269";s:17:"total_match_count";i:9;s:12:"split_search";N;s:7:"sort_by";i:0;s:8:"sort_dir";s:4:"DESC";s:12:"show_results";s:6:"topics";s:12:"return_chars";i:200;}');

