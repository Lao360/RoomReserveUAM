-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 24, 2024 at 09:42 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universityevents`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bookingrequests`
--

CREATE TABLE `bookingrequests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `request_description` text DEFAULT NULL,
  `number_of_participants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookingrequests`
--

INSERT INTO `bookingrequests` (`request_id`, `user_id`, `event_id`, `request_description`, `number_of_participants`) VALUES
(1, 1, 1, 'Rezerwacja sali na warsztaty programowania.', 25),
(2, 2, 2, 'Rezerwacja sali na konferencję naukową.', 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `displays`
--

CREATE TABLE `displays` (
  `display_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `presenter` varchar(100) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `next_event` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `displays`
--

INSERT INTO `displays` (`display_id`, `event_id`, `presenter`, `start_time`, `end_time`, `short_description`, `next_event`) VALUES
(1, 1, 'Katarzyna Wójcik', '2024-10-01 09:00:00', '2024-10-01 10:00:00', 'Wprowadzenie do warsztatów programowania.', 'Kolejna sesja o 13:00.'),
(2, 2, 'Marek Szymczak', '2024-10-10 10:00:00', '2024-10-10 11:00:00', 'Otwarcie konferencji naukowej.', 'Prezentacja badań o 11:00.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `equipment_type` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `room_id`, `equipment_type`, `quantity`) VALUES
(1, 1, 'Rzutnik', 1),
(2, 1, 'Tablica interaktywna', 1),
(3, 2, 'Komputer', 30),
(4, 3, 'Flipchart', 5),
(5, 3, 'Mikrofon', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `eventphotos`
--

CREATE TABLE `eventphotos` (
  `photo_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventphotos`
--

INSERT INTO `eventphotos` (`photo_id`, `event_id`, `photo_url`) VALUES
(1, 1, 'http://example.com/photos/warsztaty1.jpg'),
(2, 2, 'http://example.com/photos/konferencja1.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `number_of_places` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `description`, `start_date`, `end_date`, `location_id`, `number_of_places`) VALUES
(1, 'Warsztaty programowania', 'Warsztaty dotyczące programowania w Pythonie.', '2024-10-01 09:00:00', '2024-10-01 17:00:00', 1, 50),
(2, 'Konferencja naukowa', 'Konferencja poświęcona badaniom w dziedzinie informatyki.', '2024-10-10 10:00:00', '2024-10-10 18:00:00', 3, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `freerooms`
--

CREATE TABLE `freerooms` (
  `free_room_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `min_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `freerooms`
--

INSERT INTO `freerooms` (`free_room_id`, `date_time`, `room_id`, `additional_info`, `min_capacity`) VALUES
(1, '2024-10-01 09:00:00', 2, 'Wolna na wydarzenia', 10),
(2, '2024-10-10 09:00:00', 3, 'Duża sala dostępna', 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `additional_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `first_name`, `last_name`, `email`, `room_id`, `additional_info`) VALUES
(1, 'Katarzyna', 'Wójcik', 'k.wójcik@uam.edu.pl', 1, 'Specjalista w zakresie informatyki'),
(2, 'Marek', 'Szymczak', 'm.szymczak@uam.edu.pl', 2, 'Ekspert w zarządzaniu projektami');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roombookings`
--

CREATE TABLE `roombookings` (
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `number_of_places` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roombookings`
--

INSERT INTO `roombookings` (`booking_id`, `room_id`, `event_id`, `booking_date`, `number_of_places`) VALUES
(1, 1, 1, '2024-10-01 09:00:00', 50),
(2, 3, 2, '2024-10-10 10:00:00', 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `room_caretaker` int(11) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `room_description` text DEFAULT NULL,
  `equipment_details` text DEFAULT NULL,
  `features` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `capacity`, `room_caretaker`, `additional_info`, `room_description`, `equipment_details`, `features`) VALUES
(1, 'Sala 101', 50, NULL, 'W sali dostępny rzutnik i tablica interaktywna', 'Sala wykładowa z dostępem do internetu', 'Rzutnik, Tablica interaktywna', 'Klimatyzacja, Wi-Fi'),
(2, 'Sala 102', 30, NULL, 'Sala do ćwiczeń z komputerami', 'Sala komputerowa z 30 stanowiskami', 'Komputery, Wi-Fi', 'Klimatyzacja'),
(3, 'Sala 201', 100, NULL, 'Duża sala konferencyjna', 'Idealna do dużych spotkań', 'Rzutnik, Mikrofony, Flipcharty', 'Wi-Fi, Nagłośnienie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `segments`
--

CREATE TABLE `segments` (
  `segment_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `segment_time` datetime DEFAULT NULL,
  `segment_room` varchar(100) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `number_of_places` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`segment_id`, `event_id`, `segment_time`, `segment_room`, `leader_id`, `short_description`, `number_of_places`) VALUES
(1, 1, '2024-10-01 10:00:00', 'Sala 101', 1, 'Wprowadzenie do Pythona', 30),
(2, 1, '2024-10-01 13:00:00', 'Sala 101', 1, 'Zastosowania Pythona w danych', 20),
(3, 2, '2024-10-10 11:00:00', 'Sala 201', 2, 'Prezentacja badań', 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  `year_of_study` int(11) DEFAULT NULL,
  `user_type` enum('student','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `direction`, `year_of_study`, `user_type`) VALUES
(1, 'Jan', 'Kowalski', 'Informatyka', 2, 'student'),
(2, 'Anna', 'Nowak', 'Zarządzanie', 3, 'student'),
(3, 'Piotr', 'Zielinski', NULL, NULL, 'admin');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bookingrequests`
--
ALTER TABLE `bookingrequests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeksy dla tabeli `displays`
--
ALTER TABLE `displays`
  ADD PRIMARY KEY (`display_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeksy dla tabeli `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indeksy dla tabeli `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeksy dla tabeli `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indeksy dla tabeli `freerooms`
--
ALTER TABLE `freerooms`
  ADD PRIMARY KEY (`free_room_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indeksy dla tabeli `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indeksy dla tabeli `roombookings`
--
ALTER TABLE `roombookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeksy dla tabeli `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_caretaker` (`room_caretaker`);

--
-- Indeksy dla tabeli `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`segment_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingrequests`
--
ALTER TABLE `bookingrequests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `displays`
--
ALTER TABLE `displays`
  MODIFY `display_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eventphotos`
--
ALTER TABLE `eventphotos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freerooms`
--
ALTER TABLE `freerooms`
  MODIFY `free_room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roombookings`
--
ALTER TABLE `roombookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `segment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookingrequests`
--
ALTER TABLE `bookingrequests`
  ADD CONSTRAINT `bookingrequests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookingrequests_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Constraints for table `displays`
--
ALTER TABLE `displays`
  ADD CONSTRAINT `displays_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD CONSTRAINT `eventphotos_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `freerooms`
--
ALTER TABLE `freerooms`
  ADD CONSTRAINT `freerooms_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL;

--
-- Constraints for table `roombookings`
--
ALTER TABLE `roombookings`
  ADD CONSTRAINT `roombookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `roombookings_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_caretaker`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `segments`
--
ALTER TABLE `segments`
  ADD CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `segments_ibfk_2` FOREIGN KEY (`leader_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
