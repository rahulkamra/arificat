-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2009 at 08:44 PM
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
  `desc` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `artifactinfo`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `currentsearchparty`
--


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
  `gold` int(10) unsigned zerofill NOT NULL default '0000000000',
  `exp` int(10) unsigned zerofill NOT NULL default '0000000000',
  `globallvl` int(10) unsigned NOT NULL default '1',
  `spylvl` int(10) unsigned NOT NULL default '1',
  `scoutlvl` int(10) unsigned NOT NULL default '0',
  `sharelvl` int(10) unsigned NOT NULL default '0',
  `buylvl` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `FK_gameprofile_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gameprofile`
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
  KEY `FK_inventory_1` (`userid`),
  KEY `FK_inventory_2` (`artifactid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user`
--


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
  PRIMARY KEY  (`id`),
  KEY `FK_userprofile_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`id`) REFER `artifactdb/user`(`id`)' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `userprofile`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `currentsearchparty`
--
ALTER TABLE `currentsearchparty`
  ADD CONSTRAINT `FK_currentsearchparty_2` FOREIGN KEY (`artifactid`) REFERENCES `artifactinfo` (`id`),
  ADD CONSTRAINT `FK_currentsearchparty_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `friendmapping`
--
ALTER TABLE `friendmapping`
  ADD CONSTRAINT `FK_friendmapping_2` FOREIGN KEY (`friendid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_friendmapping_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `gameprofile`
--
ALTER TABLE `gameprofile`
  ADD CONSTRAINT `FK_gameprofile_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK_inventory_2` FOREIGN KEY (`artifactid`) REFERENCES `artifactinfo` (`id`),
  ADD CONSTRAINT `FK_inventory_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `FK_userprofile_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);
