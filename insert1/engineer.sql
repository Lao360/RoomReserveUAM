-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Cze 2024, 17:58
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `engineer`
--
CREATE DATABASE IF NOT EXISTS `engineer` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `engineer`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `describ` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `describ` text DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `proffesor_id` int(11) NOT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `class`
--

INSERT INTO `class` (`id`, `class_name`, `describ`, `room_id`, `proffesor_id`, `starts`, `ends`) VALUES
(0, '1', '1', 0, 2, '2024-06-10 16:00:00', '2014-06-10 17:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `class_room`
--

CREATE TABLE `class_room` (
  `class_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `proffesor`
--

CREATE TABLE `proffesor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `proffesor`
--

INSERT INTO `proffesor` (`id`, `name`, `title`) VALUES
(0, '{', '{'),
(2, '132', '132'),
(123, '132', '132');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_nr` varchar(255) NOT NULL,
  `projectorc` bit(1) NOT NULL,
  `building_id` int(11) NOT NULL,
  `sits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proffesor_id` (`proffesor_id`);

--
-- Indeksy dla tabeli `class_room`
--
ALTER TABLE `class_room`
  ADD PRIMARY KEY (`class_id`,`room_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indeksy dla tabeli `proffesor`
--
ALTER TABLE `proffesor`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_id` (`building_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`proffesor_id`) REFERENCES `proffesor` (`id`);

--
-- Ograniczenia dla tabeli `class_room`
--
ALTER TABLE `class_room`
  ADD CONSTRAINT `class_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `class_room_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Ograniczenia dla tabeli `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
