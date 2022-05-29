-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 29 2022 г., 16:45
-- Версия сервера: 8.0.11
-- Версия PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kino`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cinemas`
--

CREATE TABLE `cinemas` (
  `ID` int(200) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cinemas`
--

INSERT INTO `cinemas` (`ID`, `Name`, `address`) VALUES
(1, 'Формула', 'ул. Военная, 5, ТРЦ «Аура»'),
(2, 'Синема Парк Сан Сити', 'пл. Карла Маркса, 7, МФК «Сан Сити»'),
(3, 'КиноСити Сибирский молл', 'ул. Фрунзе, 238, ТРЦ «Сибирский Молл»'),
(4, 'Горизонт', 'ул. Бориса Богаткова, 266'),
(5, 'Голден Синема', 'ул. Курчатова, 1, ТРК «Голден Парк»');

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `ID` int(200) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`ID`, `name`) VALUES
(1, 'Я иду искать'),
(2, 'Интерстеллар'),
(3, 'Форсаж'),
(4, 'Двойной форсаж'),
(5, 'Тройной форсаж'),
(8, 'фильм');

-- --------------------------------------------------------

--
-- Структура таблицы `info`
--

CREATE TABLE `info` (
  `CinemaID` int(200) NOT NULL,
  `FilmsID` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `info`
--

INSERT INTO `info` (`CinemaID`, `FilmsID`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 4),
(3, 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `info`
--
ALTER TABLE `info`
  ADD KEY `CinemaID` (`CinemaID`),
  ADD KEY `FilmsID` (`FilmsID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `ID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `ID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `info`
--
ALTER TABLE `info`
  ADD CONSTRAINT `info_ibfk_1` FOREIGN KEY (`CinemaID`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `info_ibfk_2` FOREIGN KEY (`FilmsID`) REFERENCES `films` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
