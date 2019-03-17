-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2019 at 08:39 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiktactoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `board` text COLLATE utf8_unicode_ci,
  `won` tinytext COLLATE utf8_unicode_ci,
  `wonLine` tinytext COLLATE utf8_unicode_ci,
  `draw` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `turn` text COLLATE utf8_unicode_ci NOT NULL,
  `log` text COLLATE utf8_unicode_ci,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `board`, `won`, `wonLine`, `draw`, `turn`, `log`, `datetime`) VALUES
('0.25398740284133', '[[\"Player Two (X)\",\"\",\"Player One (O)\"],[\"Player Two (X)\",\"Player One (O)\",\"\"],[\"Player One (O)\",\"\",\"\"]]', 'Player One (O)', 'rightSlant', '0', 'Player One (O)', NULL, '2019-03-17 19:36:34'),
('0.28394988764697', '[[\"Player Two (X)\",\"Player Two (X)\",\"\"],[\"Player One (O)\",\"Player One (O)\",\"Player One (O)\"],[\"\",\"\",\"\"]]', 'Player One (O)', 'row1', '0', 'Player One (O)', NULL, '2019-03-17 19:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `game_action_log`
--

CREATE TABLE `game_action_log` (
  `game_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `game_action_log`
--

INSERT INTO `game_action_log` (`game_id`, `action`) VALUES
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"0\",\"position\":0}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"2\",\"position\":2}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"0\",\"position\":2}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"2\",\"position\":0}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":1}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"1\",\"position\":0}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":2}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"0\",\"position\":1}'),
('0.6565981470169', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"2\",\"position\":1}'),
('0.28394988764697', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":1}'),
('0.28394988764697', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"0\",\"position\":0}'),
('0.28394988764697', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":0}'),
('0.28394988764697', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"0\",\"position\":1}'),
('0.28394988764697', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":2}'),
('0.25398740284133', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"2\",\"position\":0}'),
('0.25398740284133', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"1\",\"position\":0}'),
('0.25398740284133', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"1\",\"position\":1}'),
('0.25398740284133', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player Two (X)\",\"row\":\"0\",\"position\":0}'),
('0.25398740284133', '{\"type\":\"ADD_SYMBOL\",\"symbol\":\"Player One (O)\",\"row\":\"0\",\"position\":2}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
