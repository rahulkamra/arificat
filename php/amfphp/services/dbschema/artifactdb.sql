-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 09, 2009 at 01:35 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `artifactdb`
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
  `imgurl` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_userprofile_1` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`id`) REFER `artifactdb/user`(`id`)' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`id`, `userid`, `age`, `politicalview`, `religion`, `language`, `humour`, `country`, `school`, `job`, `favgame`, `imgurl`) VALUES
(1, 1, 23, 'Republican', 'Christianity', 'English', 'Cheeky', 'Poland', 'Gregory Hearts', 'Consultant', 'Prince of Persia', ''),
(2, 2, 25, 'Democratic', 'Jewish', 'Spanish', 'plain', 'USA', 'MIT', 'Researcher', 'World of Warcraft', ''),
(3, 3, 19, 'Neutral', 'Agnostic', 'Hindi', 'campy', 'India', 'Delhi University', 'Software Engineer', 'Maple Story', ''),
(4, 4, 22, 'Communist', 'Agnostic', 'Japanese', 'intelligent', 'Japan', 'Tokyo University', 'Game Developer', 'Defence of the Ancients', ''),
(5, 5, 27, 'Republican', 'Buddhism', 'English', 'polite', 'India', 'BHU', 'Politician', 'Halo', ''),
(6, 6, 18, 'Liberal', 'Christianity', 'English', 'Cheesy', 'Australia', 'Melbourne High', 'None', 'Counter Strike', ''),
(7, 7, 29, 'Democratic', 'Christianity', 'English', 'Campy', 'Canada', 'Toronto University', 'Manager', 'Diablo 2', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `FK_userprofile_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);
