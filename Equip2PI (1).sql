-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 13-05-2024 a les 10:23:00
-- Versió del servidor: 10.4.28-MariaDB
-- Versió de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `Equip2PI`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Peliculas`
--

CREATE TABLE `Peliculas` (
  `IDPeli` int(5) NOT NULL,
  `NomPeli` varchar(50) NOT NULL,
  `Genere` varchar(20) NOT NULL,
  `Nota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuari`
--

CREATE TABLE `Usuari` (
  `IDUsuari` int(10) NOT NULL,
  `Nom` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contrasenya` varchar(20) NOT NULL,
  `DataNaixement` date NOT NULL,
  `Poblacio` varchar(20) NOT NULL,
  `ImatgePerfil` blob NOT NULL,
  `Cognom` varchar(30) NOT NULL,
  `Rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  ADD PRIMARY KEY (`IDPeli`);

--
-- Índexs per a la taula `Usuari`
--
ALTER TABLE `Usuari`
  ADD PRIMARY KEY (`IDUsuari`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `IDPeli` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Usuari`
--
ALTER TABLE `Usuari`
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
