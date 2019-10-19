SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lixlink2`;
USE `lixlink2`;

DROP TABLE IF EXISTS `metainformation`;
CREATE TABLE `metainformation` (
  `title` longtext,
  `keywords` longtext,
  `description` longtext,
  `copyright` longtext
) TYPE=MyISAM;
INSERT INTO `metainformation` (`title`,`keywords`,`description`,`copyright`) VALUES ('bitPimps Custom Modifications :: Doin\\\' It To Your Momma\\\'s Chassis!','bitpimps custom modifications micro rc radio remote control hobby car tomy bit char-g hobbico microsizer radioshack zipzap xmod kyosho mini-z overland i-waver tomica nikko miniature digi q indoor upgrade tutorial information photo image video race news forum gallery pullback paint body chassis gear motor suspension mosfet fet dual cell','bitPimps.com offers the best entertainment, tutorials, modifications, information, etc. on all things related to Bit-Char G and similar R/C hobbies.','Copyright &copy; 2002 - 2006 | All rights resereved by penalty of: death, cappin\\\', blastin\\\', sprayin\\\', etc.');

DROP TABLE IF EXISTS `Links`;
CREATE TABLE `Links` (
  `id` int(11) NOT NULL auto_increment,
  `orderId` int(11) NOT NULL default '0',
  `url` text NOT NULL,
  `name` text NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;
INSERT INTO `Links` (`id`,`orderId`,`url`,`name`,`description`) VALUES (1,4,'http://www.bitmod.de','Bitmod.de','A German site with good tips and alternative techniques. Use a translation service like <a href=\"http://babelfish.altavista.com\" target=\"_blank\">Babel Fish</a> to translate.'),(2,7,'http://www.rcmod.com','RCMod','A US based micro R/C community with a family friendly appeal.'),(3,1,'http://www.ripper7racing.com/','Ripper7Racing','A new, up-coming, US based forum concentrating mainly on larger scale R/C.'),(4,6,'http://www.minizracer.com/','Mini-ZRacer','A US based site with a community of information and is a great resource site as well as having forums for all Mini-Z R/C models.'),(8,9,'http://www.cjshobbies.net/','CJ\\\'s Hobbies.net','One of our long standing members has created his own site. Bringing you the latest info about Xmods with a FAQ and an online shop with Xmods GPM alloy parts.'),(7,2,'http://www.ausmicro.com/','ausmicro.com','A rather large Australian based site with a great community and quite a bit of information.'),(9,8,'http://tinyrc.com/lincoln/Worlds/MicroRC/LincMicroWrld.htm','Lincoln\'s Micro RC World','It\'s got news, it\'s got pictures and video, and it\'s got more links than your little tired finger can click on.');
INSERT INTO `Links` (`id`,`orderId`,`url`,`name`,`description`) VALUES (10,3,'http://549.rapidforum.com','Bit-Racer.de','A German site with some good tips and great imagery. Use a translation service like <a href=\\\"http://babelfish.altavista.com\\\" target=\\\"_blank\\\">Babel Fish</a> to translate.'),(11,10,'http://www.honda.co.jp/HondaToyTown/game/bitcharg/','Honda Bit Char-G Racing','Japanesse site with a Honda Bit Char-G racing game to play. Good luck grasshoppa!'),(12,5,'http://www.bit-racing-world.de/','Bit-Racing-World','Another German forum, full of information, pictures, and videos.');
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
