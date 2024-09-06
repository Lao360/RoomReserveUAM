-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Wrz 2024, 19:55
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

--
-- Zrzut danych tabeli `building`
--

INSERT INTO `building` (`id`, `adress`, `designation`, `describ`) VALUES
(1, 'Pila', 'null', 'null');

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
(1, '31311', '1313', 0, 2, '2024-06-10 13:00:00', '2024-06-10 18:00:00'),
(2, 'test', 'dawed', 0, 2, '2024-09-12 23:44:00', '2024-09-12 23:46:00'),
(3, 'tes2t', 'dawed', 0, 2, '2024-09-12 23:44:00', '2024-09-12 23:46:00'),
(4, '12', '1313', 0, 2, '2024-08-07 15:46:00', '2024-08-21 15:46:00'),
(5, '111', '23131313', 0, 2, '2024-10-04 19:52:00', '2024-10-05 19:52:00');

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
  `Multimedia` varchar(255) NOT NULL,
  `building_id` int(11) NOT NULL,
  `sits` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `room`
--

INSERT INTO `room` (`id`, `room_nr`, `Multimedia`, `building_id`, `sits`, `type`) VALUES
(1, '1', 'rzutnik, ekran, mikrofo bezprzewodowy, wizualizer, nagrywarka DVD, komputer', 1, 260, 'aula'),
(2, '2', 'rzutnik, ekran, mikrofo bezprzewodowy, wizualizer, nagrywarka DVD, komputer', 1, 150, 'aula'),
(3, '3', 'rzutnik', 1, 30, 'sala wykladowa'),
(4, '4', 'rzutnik', 1, 30, 'sala wykladowa'),
(5, '5', 'rzutnik', 1, 30, 'sala wykladowa'),
(6, '6', 'rzutnik', 1, 30, 'sala wykladowa'),
(7, '7', 'rzutnik', 1, 30, 'sala wykladowa'),
(8, '8', 'rzutnik', 1, 30, 'sala wykladowa'),
(9, '9', 'rzutnik', 1, 30, 'sala wykladowa'),
(10, '10', 'rzutnik', 1, 30, 'sala wykladowa'),
(11, '11', 'rzutnik, mikrofo bezprzewodowy, wizualizer, nagrywarka DVD, komputer', 1, 70, 'sala wykladowa'),
(12, '12', 'rzutnik, mikrofo bezprzewodowy, wizualizer, nagrywarka DVD, komputer', 1, 70, 'sala wykladowa'),
(13, '13', 'stolik audytorkis', 1, 25, 'sala wykladowa'),
(14, '14', 'komputer x21, rzutnik, tablice', 1, 21, 'komputerowa'),
(15, '15', 'komputer x16, rzutnik, tablice', 1, 16, 'sala komputerowa'),
(16, '16', 'komputer x16, rzutnik, tablice', 1, 16, 'sala komputerowa'),
(17, '17', 'komputer x16, rzutnik, tablice', 1, 16, 'sala komputerowa'),
(18, '18', 'komputer x16, rzutnik, tablice', 1, 16, 'sala komputerowa'),
(19, '19', 'null', 1, 20, 'labolatorium geologiczne'),
(20, '20', 'null', 1, 20, 'labolatorium geologiczne'),
(21, '21', 'null', 1, 20, 'labolatorium jezykowe'),
(22, '22', 'null', 1, 20, 'labolatorium jezykowe'),
(23, '23', '2x dygestoria, stoły kwasoodporne, umywalki, prysznic,2 zaplecza', 1, 20, 'labolatorium chemiczne'),
(24, '24', 'stoły kwasoodporne, umywalki, zaplecze', 1, 24, 'labolatorium biologiczno-zoologiczne'),
(25, '25', 'stoły kwasoodporne, umywalki, zaplecze', 1, 20, 'labolatorium hydrologii');

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
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`proffesor_id`) REFERENCES `proffesor` (`id`);

--
-- Ograniczenia dla tabeli `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
