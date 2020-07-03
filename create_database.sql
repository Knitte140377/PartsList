-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Jul 2020 um 07:51
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `partslist`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `connection`
--

CREATE TABLE `connection` (
  `list_ID` int(11) NOT NULL,
  `part_ID` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `connection`
--

INSERT INTO `connection` (`list_ID`, `part_ID`, `number`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `list`
--

CREATE TABLE `list` (
  `ID` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `list`
--

INSERT INTO `list` (`ID`, `name`) VALUES
(1, '6YAWII'),
(2, '5YAME');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `part`
--

CREATE TABLE `part` (
  `ID` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `part`
--

INSERT INTO `part` (`ID`, `name`) VALUES
(1, 'Markus'),
(2, 'Thomas'),
(3, 'Raffi'),
(4, 'Kai'),
(5, 'Jochn'),
(6, 'Eduardo'),
(7, 'Chris'),
(8, 'Erwin'),
(9, 'Verena'),
(10, 'Sebastian');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `connection`
--
ALTER TABLE `connection`
  ADD KEY `part` (`part_ID`),
  ADD KEY `list` (`list_ID`);

--
-- Indizes für die Tabelle `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `list`
--
ALTER TABLE `list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `part`
--
ALTER TABLE `part`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `list` FOREIGN KEY (`list_ID`) REFERENCES `list` (`ID`),
  ADD CONSTRAINT `part` FOREIGN KEY (`part_ID`) REFERENCES `part` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
