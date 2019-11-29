-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Nov 2019 um 16:32
-- Server-Version: 10.1.35-MariaDB
-- PHP-Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `eplaner`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE `benutzer` (
  `PK_Benutzer_ID` int(11) NOT NULL,
  `Benutzername` varchar(255) DEFAULT NULL,
  `Passwort` varchar(255) DEFAULT NULL,
  `Geburtsdatum` date DEFAULT NULL,
  `FK_Geschlecht_ID` int(11) DEFAULT NULL,
  `FK_Rechte_ID` int(11) DEFAULT NULL,
  `FK_Event_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `benutzer`
--

INSERT INTO `benutzer` (`PK_Benutzer_ID`, `Benutzername`, `Passwort`, `Geburtsdatum`, `FK_Geschlecht_ID`, `FK_Rechte_ID`, `FK_Event_ID`) VALUES
(1, 'admin', 'admin', '1990-01-01', 1, 1, 1),
(2, 'TestUser', 'test', '2019-10-02', 1, 2, 1),
(3, 'sdfvsadv', 'asfaewfa', '1278-12-12', 1, 2, NULL),
(4, 'vgbhnjm', 'gvbhnjmk', '2018-03-12', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE `events` (
  `PK_Event_ID` int(11) NOT NULL,
  `Titel` varchar(255) DEFAULT NULL,
  `Datum_Uhrzeit` datetime DEFAULT NULL,
  `Beschreibung` varchar(1500) DEFAULT NULL,
  `Bild` varchar(255) DEFAULT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `Straße` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`PK_Event_ID`, `Titel`, `Datum_Uhrzeit`, `Beschreibung`, `Bild`, `Ort`, `Straße`) VALUES
(1, 'Paintball Event', '2019-06-20 16:30:00', 'Wir gehen Paintball spielen am 20.06.2019, alle unter 16 Jährigen brauchen die Erlaubnis ihrer Eltern.', 'Images\\1.jpg', '2320 Schwechat', 'Himbergerstraße 19'),
(3, 'test', '2019-12-12 12:23:00', 'asdfawecd', 'Images/d.png', '2320 Schwechat', 'Himbergerstraße');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geschlecht`
--

CREATE TABLE `geschlecht` (
  `PK_Geschlecht_ID` int(11) NOT NULL,
  `Geschlecht` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `geschlecht`
--

INSERT INTO `geschlecht` (`PK_Geschlecht_ID`, `Geschlecht`) VALUES
(1, 'Männlich'),
(2, 'Weiblich');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechte`
--

CREATE TABLE `rechte` (
  `PK_Rechte_ID` int(11) NOT NULL,
  `Rechte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rechte`
--

INSERT INTO `rechte` (`PK_Rechte_ID`, `Rechte`) VALUES
(1, 'Darf im Backend'),
(2, 'Darf nicht im Backend');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `benutzer`
--
ALTER TABLE `benutzer`
  ADD PRIMARY KEY (`PK_Benutzer_ID`),
  ADD KEY `FK_Geschlecht_ID` (`FK_Geschlecht_ID`),
  ADD KEY `FK_Rechte_ID` (`FK_Rechte_ID`),
  ADD KEY `FK_Event_ID` (`FK_Event_ID`);

--
-- Indizes für die Tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`PK_Event_ID`);

--
-- Indizes für die Tabelle `geschlecht`
--
ALTER TABLE `geschlecht`
  ADD PRIMARY KEY (`PK_Geschlecht_ID`);

--
-- Indizes für die Tabelle `rechte`
--
ALTER TABLE `rechte`
  ADD PRIMARY KEY (`PK_Rechte_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `benutzer`
--
ALTER TABLE `benutzer`
  MODIFY `PK_Benutzer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `events`
--
ALTER TABLE `events`
  MODIFY `PK_Event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `benutzer`
--
ALTER TABLE `benutzer`
  ADD CONSTRAINT `benutzer_ibfk_1` FOREIGN KEY (`FK_Geschlecht_ID`) REFERENCES `geschlecht` (`PK_Geschlecht_ID`),
  ADD CONSTRAINT `benutzer_ibfk_2` FOREIGN KEY (`FK_Rechte_ID`) REFERENCES `rechte` (`PK_Rechte_ID`),
  ADD CONSTRAINT `benutzer_ibfk_3` FOREIGN KEY (`FK_Event_ID`) REFERENCES `events` (`PK_Event_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
