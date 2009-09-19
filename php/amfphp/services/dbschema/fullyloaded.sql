-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2009 at 05:58 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `artifactdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifactinfo`
--

CREATE TABLE IF NOT EXISTS `artifactinfo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `desc` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `artifactinfo`
--

INSERT INTO `artifactinfo` (`id`, `name`, `desc`, `isactive`) VALUES
(1, 'Divine Rapier', 'The Divine Rapier was granted by God himself ', 1),
(2, 'Demon Edge', 'A sword of a fallen general of a Demon Army, imbued with unholy strength ', 1),
(3, 'Monkey King Bar', 'A powerful staff used by a martial arts master. Grants +80 damage, 15% increased attack speed, True Strike (causes your attacks to never miss) and a 35% chance to deal 100 bonus damage on every attack', 1),
(4, 'The Butterfly', 'The Butterfly is a blade that was magically created for use in the War of the Magi, but never used. Only recently recovered from the Avalan vault, it grants its bearer +30 Agility, +30 damage, +30% in', 1),
(5, 'Eye of Skadi', 'Extremely rare artifact, guarded by the azure dragons of Northrend. Adds 25 to all stats, 200 life, 150 mana and grants Frost Attack.', 1),
(6, 'Helm of the Dominator', 'The powerful headpiece of a dead necromancer. Gives +5 armor, +20 damage, 15% life steal, and the ability to Dominate creeps.', 1),
(7, 'Stygian Desolator', 'A wicked weapon, used in torturing political criminals. It hungers for blood. Adds +60 damage and reduces the armor of enemies you attack by 6.', 1),
(8, 'Shiva''s Guard', 'Said to have belonged to a goddess, this magical piece of armor was forged by divine wisps in the deeps of Winterspring and even today it retains much of its former power. Grants +15 Armor, +30 Intell', 1),
(9, 'Flying Courier', 'Creates a small very fast flying unit that can carry items to and from your base. If it dies the items will fall to the ground. Has magic immunity, hitpoints and armor. Cannot carry Gem. Can cast Burs', 1),
(10, 'Planeswalker''s Cloak', 'A cloak made of a magic material that works to dispel any magic cast on it ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currentsearchparty`
--

CREATE TABLE IF NOT EXISTS `currentsearchparty` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `artifactid` int(10) unsigned NOT NULL default '0',
  `artifactlvl` int(10) unsigned NOT NULL default '0',
  `progress` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_currentsearchparty_1` (`userid`),
  KEY `FK_currentsearchparty_2` (`artifactid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `currentsearchparty`
--

INSERT INTO `currentsearchparty` (`id`, `userid`, `artifactid`, `artifactlvl`, `progress`) VALUES
(1, 4, 1, 1, 35),
(2, 2, 1, 1, 0),
(3, 4, 2, 1, 0),
(4, 4, 3, 1, 0),
(5, 4, 4, 1, 0),
(6, 4, 5, 1, 0),
(7, 4, 6, 1, 0),
(8, 4, 7, 1, 0),
(9, 4, 8, 1, 0),
(10, 4, 9, 1, 0),
(11, 4, 10, 1, 0),
(12, 1, 1, 1, 0),
(13, 1, 2, 1, 0),
(14, 1, 3, 1, 0),
(15, 1, 4, 1, 0),
(16, 1, 5, 1, 0),
(17, 1, 6, 1, 0),
(18, 1, 7, 1, 0),
(19, 1, 8, 1, 0),
(20, 1, 9, 1, 0),
(21, 1, 10, 1, 0),
(22, 2, 2, 1, 0),
(23, 2, 3, 1, 0),
(24, 2, 4, 1, 0),
(25, 2, 5, 1, 0),
(26, 2, 6, 1, 0),
(27, 2, 7, 1, 0),
(28, 2, 8, 1, 0),
(29, 2, 9, 1, 0),
(30, 2, 10, 1, 0),
(31, 3, 1, 1, 0),
(32, 3, 2, 1, 0),
(33, 3, 3, 1, 0),
(34, 3, 4, 1, 0),
(35, 3, 5, 1, 0),
(36, 3, 6, 1, 0),
(37, 3, 7, 1, 0),
(38, 3, 8, 1, 0),
(39, 3, 9, 1, 0),
(40, 3, 10, 1, 0),
(41, 5, 1, 1, 0),
(42, 5, 2, 1, 0),
(43, 5, 3, 1, 0),
(44, 5, 4, 1, 0),
(45, 5, 5, 1, 0),
(46, 5, 6, 1, 0),
(47, 5, 7, 1, 0),
(48, 5, 8, 1, 0),
(49, 5, 9, 1, 0),
(50, 5, 10, 1, 0),
(51, 6, 1, 1, 0),
(52, 6, 2, 1, 0),
(53, 7, 1, 1, 0),
(54, 6, 3, 1, 0),
(55, 7, 2, 1, 0),
(56, 6, 4, 1, 0),
(57, 6, 5, 1, 0),
(58, 6, 6, 1, 0),
(59, 7, 3, 1, 0),
(60, 6, 7, 1, 0),
(61, 6, 8, 1, 0),
(62, 7, 4, 1, 0),
(63, 6, 9, 1, 0),
(64, 6, 10, 1, 0),
(65, 7, 5, 1, 0),
(66, 7, 6, 1, 0),
(67, 7, 7, 1, 0),
(68, 7, 8, 1, 0),
(69, 7, 9, 1, 0),
(70, 7, 10, 1, 0),
(71, 8, 1, 1, 0),
(72, 8, 2, 1, 0),
(73, 8, 3, 1, 0),
(74, 8, 4, 1, 0),
(75, 8, 5, 1, 0),
(76, 8, 6, 1, 0),
(77, 8, 7, 1, 0),
(78, 8, 8, 1, 0),
(79, 8, 9, 1, 0),
(80, 8, 10, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `globallevel` int(3) NOT NULL auto_increment,
  `exp` int(10) NOT NULL,
  PRIMARY KEY  (`globallevel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`globallevel`, `exp`) VALUES
(1, 0),
(2, 100),
(3, 500),
(4, 1500),
(5, 2300),
(6, 3500),
(7, 4000),
(8, 4700),
(9, 5000),
(10, 6300),
(11, 7500),
(12, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `friendmapping`
--

CREATE TABLE IF NOT EXISTS `friendmapping` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `friendid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_friendmapping_1` (`userid`),
  KEY `FK_friendmapping_2` (`friendid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `friendmapping`
--


-- --------------------------------------------------------

--
-- Table structure for table `gameprofile`
--

CREATE TABLE IF NOT EXISTS `gameprofile` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `gold` int(10) unsigned NOT NULL default '0',
  `exp` int(10) unsigned NOT NULL default '0',
  `globallvl` int(10) unsigned NOT NULL default '1',
  `spylvl` int(10) unsigned NOT NULL default '1',
  `scoutlvl` int(10) unsigned NOT NULL default '0',
  `sharelvl` int(10) unsigned NOT NULL default '0',
  `buylvl` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_gameprofile_1` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `gameprofile`
--

INSERT INTO `gameprofile` (`id`, `userid`, `gold`, `exp`, `globallvl`, `spylvl`, `scoutlvl`, `sharelvl`, `buylvl`) VALUES
(1, 1, 0, 0, 1, 1, 0, 0, 0),
(2, 2, 0, 0, 1, 1, 0, 0, 0),
(3, 3, 0, 0, 1, 1, 0, 0, 0),
(4, 4, 0, 0, 1, 1, 0, 0, 0),
(5, 5, 0, 0, 1, 1, 0, 0, 0),
(6, 6, 0, 0, 1, 1, 0, 0, 0),
(7, 7, 0, 0, 1, 1, 0, 0, 0),
(8, 8, 0, 0, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gameprogress`
--

CREATE TABLE IF NOT EXISTS `gameprogress` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cspid` int(10) unsigned NOT NULL default '0',
  `friendid` int(10) unsigned default '0',
  `progresstypeid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_gameprogress_1` (`friendid`),
  KEY `FK_gameprogress_2` (`cspid`),
  KEY `FK_gameprogress_3` (`progresstypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gameprogress`
--


-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `artifactlevel` int(10) unsigned NOT NULL default '0',
  `artifactid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `artifactid` (`artifactid`),
  UNIQUE KEY `artifactid_2` (`artifactid`),
  UNIQUE KEY `artifactid_3` (`artifactid`),
  UNIQUE KEY `artifactid_4` (`artifactid`),
  UNIQUE KEY `artifactid_5` (`artifactid`),
  KEY `FK_inventory_1` (`userid`),
  KEY `FK_inventory_2` (`artifactid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `progresstype`
--

CREATE TABLE IF NOT EXISTS `progresstype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `progresstype` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `progresstype`
--

INSERT INTO `progresstype` (`id`, `progresstype`) VALUES
(1, 'Spy'),
(2, 'Scout'),
(3, 'Buy'),
(4, 'Share');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`) VALUES
(1, 'Steve'),
(2, 'John'),
(3, 'Manav'),
(4, 'Vikas'),
(5, 'Snaky'),
(6, 'Kerr'),
(7, 'Karan'),
(8, 'Aman');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE IF NOT EXISTS `userprofile` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `age` int(10) unsigned NOT NULL default '0',
  `politicalview` varchar(45) NOT NULL default '',
  `religion` varchar(45) NOT NULL default '',
  `language` varchar(45) NOT NULL default '',
  `humour` varchar(45) NOT NULL default '',
  `country` varchar(45) NOT NULL default '',
  `school` varchar(45) NOT NULL default '',
  `job` varchar(45) NOT NULL default '',
  `favgame` varchar(45) NOT NULL default '',
  `imgurl` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_userprofile_1` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`id`) REFER `artifactdb/user`(`id`)' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`id`, `userid`, `age`, `politicalview`, `religion`, `language`, `humour`, `country`, `school`, `job`, `favgame`, `imgurl`) VALUES
(1, 1, 23, 'Republican', 'Christianity', 'English', 'Cheeky', 'Poland', 'Gregory Hearts', 'Consultant', 'Prince of Persia', 'com/artifact/resources/images/avatar/Albert-Einstein.jpg'),
(2, 2, 25, 'Democratic', 'Jewish', 'Spanish', 'plain', 'USA', 'MIT', 'Researcher', 'World of Warcraft', 'com/artifact/resources/images/avatar/Angry-PC-User.gif'),
(3, 3, 19, 'Neutral', 'Agnostic', 'Hindi', 'campy', 'India', 'Delhi University', 'Software Engineer', 'Maple Story', 'com/artifact/resources/images/avatar/Badass-Cat.jpg'),
(4, 4, 22, 'Communist', 'Agnostic', 'Japanese', 'intelligent', 'Japan', 'Tokyo University', 'Game Developer', 'Defence of the Ancients', 'com/artifact/resources/images/avatar/cathelmet.jpg'),
(5, 5, 27, 'Republican', 'Buddhism', 'English', 'polite', 'India', 'BHU', 'Politician', 'Halo', 'com/artifact/resources/images/avatar/ba-na-na.gif'),
(6, 6, 18, 'Liberal', 'Christianity', 'English', 'Cheesy', 'Australia', 'Melbourne High', 'None', 'Counter Strike', 'com/artifact/resources/images/avatar/disappointed000.gif'),
(7, 7, 29, 'Democratic', 'Christianity', 'English', 'Campy', 'Canada', 'Toronto University', 'Manager', 'Diablo 2', 'com/artifact/resources/images/avatar/yoda-dance.gif'),
(8, 8, 24, 'Socialist', 'Hindu', 'French', 'Goofy', 'Spain', 'DPS', 'C.A.', 'GTA ', 'com/artifact/resources/images/avatar/uchiha_itachi.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `currentsearchparty`
--
ALTER TABLE `currentsearchparty`
  ADD CONSTRAINT `FK_currentsearchparty_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_currentsearchparty_2` FOREIGN KEY (`artifactid`) REFERENCES `artifactinfo` (`id`);

--
-- Constraints for table `friendmapping`
--
ALTER TABLE `friendmapping`
  ADD CONSTRAINT `FK_friendmapping_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_friendmapping_2` FOREIGN KEY (`friendid`) REFERENCES `user` (`id`);

--
-- Constraints for table `gameprofile`
--
ALTER TABLE `gameprofile`
  ADD CONSTRAINT `FK_gameprofile_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `gameprogress`
--
ALTER TABLE `gameprogress`
  ADD CONSTRAINT `FK_gameprogress_1` FOREIGN KEY (`friendid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_gameprogress_2` FOREIGN KEY (`cspid`) REFERENCES `currentsearchparty` (`id`),
  ADD CONSTRAINT `FK_gameprogress_3` FOREIGN KEY (`progresstypeid`) REFERENCES `progresstype` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK_inventory_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_inventory_2` FOREIGN KEY (`artifactid`) REFERENCES `artifactinfo` (`id`);

--
-- Constraints for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `FK_userprofile_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);