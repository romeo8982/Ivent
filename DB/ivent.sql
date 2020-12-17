-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Gru 2020, 11:17
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ivent`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `booked_performance`
--

CREATE TABLE `booked_performance` (
  `id` int(11) NOT NULL,
  `idIlusionist` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `performanceDate` date NOT NULL,
  `idPerformance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `performance`
--

CREATE TABLE `performance` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `publicationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `requisite`
--

CREATE TABLE `requisite` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `picturePath` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `requisite_list`
--

CREATE TABLE `requisite_list` (
  `id` int(11) NOT NULL,
  `idRequisite` int(11) NOT NULL,
  `idTrick` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trick`
--

CREATE TABLE `trick` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trick_list`
--

CREATE TABLE `trick_list` (
  `id` int(11) NOT NULL,
  `idTrick` int(11) NOT NULL,
  `idPerformance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `surname` text COLLATE utf8_polish_ci NOT NULL,
  `name` text COLLATE utf8_polish_ci NOT NULL,
  `mail` text COLLATE utf8_polish_ci NOT NULL,
  `password` text COLLATE utf8_polish_ci NOT NULL,
  `companyName` text COLLATE utf8_polish_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `surname`, `name`, `mail`, `password`, `companyName`, `admin`) VALUES
(1, 'Kaktus', '', '', '', NULL, NULL),
(3, 'to ja', '', '', '', NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `booked_performance`
--
ALTER TABLE `booked_performance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forgeinIlusionist` (`idIlusionist`),
  ADD KEY `forgeinCompany` (`idCompany`),
  ADD KEY `forgeinPerformace` (`idPerformance`);

--
-- Indeksy dla tabeli `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `requisite`
--
ALTER TABLE `requisite`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `requisite_list`
--
ALTER TABLE `requisite_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forgeinReqisite` (`idRequisite`),
  ADD KEY `forgeinTrick` (`idTrick`);

--
-- Indeksy dla tabeli `trick`
--
ALTER TABLE `trick`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `trick_list`
--
ALTER TABLE `trick_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forgeinTrick` (`idTrick`),
  ADD KEY `forgeinShow` (`idPerformance`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `booked_performance`
--
ALTER TABLE `booked_performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `performance`
--
ALTER TABLE `performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `requisite`
--
ALTER TABLE `requisite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `requisite_list`
--
ALTER TABLE `requisite_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `trick`
--
ALTER TABLE `trick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `trick_list`
--
ALTER TABLE `trick_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `booked_performance`
--
ALTER TABLE `booked_performance`
  ADD CONSTRAINT `booked_performance_ibfk_1` FOREIGN KEY (`idIlusionist`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booked_performance_ibfk_2` FOREIGN KEY (`idCompany`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booked_performance_ibfk_3` FOREIGN KEY (`idPerformance`) REFERENCES `performance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `requisite_list`
--
ALTER TABLE `requisite_list`
  ADD CONSTRAINT `requisite_list_ibfk_1` FOREIGN KEY (`idRequisite`) REFERENCES `requisite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requisite_list_ibfk_2` FOREIGN KEY (`idTrick`) REFERENCES `trick` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `trick_list`
--
ALTER TABLE `trick_list`
  ADD CONSTRAINT `trick_list_ibfk_1` FOREIGN KEY (`idTrick`) REFERENCES `trick` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trick_list_ibfk_2` FOREIGN KEY (`idPerformance`) REFERENCES `performance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
