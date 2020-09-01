-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Maj 2020, 02:38
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `nr` int(2) NOT NULL,
  `przeznaczenie` varchar(50) DEFAULT NULL,
  `pietro` int(1) DEFAULT NULL,
  `pojemnosc` int(3) DEFAULT NULL,
  `ilosc_lawek` int(2) DEFAULT NULL,
  `ilosc_krzesel` int(3) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciel`
--

CREATE TABLE `nauczyciel` (
  `identyfikator_Nauczyciela` varchar(4) NOT NULL,
  `klasa` int(2) DEFAULT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `przedmiot` int(2) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `nr_tel` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `ID` int(2) NOT NULL,
  `nazwa` varchar(30) DEFAULT NULL,
  `opis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzic`
--

CREATE TABLE `rodzic` (
  `identyfikator_Rodzica` varchar(4) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(20) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `nr_tel` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczen`
--

CREATE TABLE `uczen` (
  `identyfikator_Ucznia` varchar(4) NOT NULL,
  `ID_rodzica` varchar(4) DEFAULT NULL,
  `klasa` int(2) DEFAULT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `nr_tel` varchar(12) DEFAULT NULL,
  `nr_w_dzienniku` int(3) DEFAULT NULL,
  `matematyka` varchar(100) DEFAULT NULL,
  `jezyk_polski` varchar(100) DEFAULT NULL,
  `jezyk_angielski` varchar(100) DEFAULT NULL,
  `w_f` varchar(100) DEFAULT NULL,
  `przyroda` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`nr`);

--
-- Indeksy dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  ADD PRIMARY KEY (`identyfikator_Nauczyciela`),
  ADD KEY `klasa` (`klasa`,`przedmiot`),
  ADD KEY `przedmiot` (`przedmiot`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rodzic`
--
ALTER TABLE `rodzic`
  ADD PRIMARY KEY (`identyfikator_Rodzica`);

--
-- Indeksy dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD PRIMARY KEY (`identyfikator_Ucznia`),
  ADD KEY `klasa` (`klasa`,`ID_rodzica`),
  ADD KEY `ID_rodzica` (`ID_rodzica`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `nr` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD CONSTRAINT `klasa_ibfk_1` FOREIGN KEY (`nr`) REFERENCES `nauczyciel` (`klasa`);

--
-- Ograniczenia dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  ADD CONSTRAINT `nauczyciel_ibfk_1` FOREIGN KEY (`przedmiot`) REFERENCES `przedmiot` (`ID`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `nauczyciel` (`przedmiot`);

--
-- Ograniczenia dla tabeli `uczen`
--
ALTER TABLE `uczen`
  ADD CONSTRAINT `uczen_ibfk_1` FOREIGN KEY (`ID_rodzica`) REFERENCES `rodzic` (`identyfikator_Rodzica`),
  ADD CONSTRAINT `uczen_ibfk_2` FOREIGN KEY (`klasa`) REFERENCES `klasa` (`nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
