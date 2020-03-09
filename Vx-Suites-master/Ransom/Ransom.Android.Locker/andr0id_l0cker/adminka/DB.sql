-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 10 2014 г., 22:59
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `android`
--

-- --------------------------------------------------------

--
-- Структура таблицы `rating_all`
--

CREATE TABLE IF NOT EXISTS `rating_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `used` int(1) NOT NULL,
  `imei` varchar(20) NOT NULL,
  `unlock` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Дамп данных таблицы `rating_all`
--

INSERT INTO `rating_all` (`id`, `date`, `code`, `country`, `used`, `imei`, `unlock`) VALUES
(39, '3.7.2014', '52488866633344', 'RUS', 0, '2147483647', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rating_counter`
--

CREATE TABLE IF NOT EXISTS `rating_counter` (
  `id` int(11) NOT NULL,
  `counter` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `rating_counter`
--

INSERT INTO `rating_counter` (`id`, `counter`) VALUES
(1, 0),
(2, 0),
(3, 0);
