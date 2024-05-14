-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 14-05-2024 a les 13:02:14
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
CREATE DATABASE IF NOT EXISTS `Equip2PI` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `Equip2PI`;

-- --------------------------------------------------------

--
-- Estructura de la taula `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(5) NOT NULL,
  `accion` varchar(1000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `log`
--

INSERT INTO `log` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se ha actualizado el registro', '2024-05-14 12:26:47'),
(2, 'Se ha actualizado el registro del alumno id viejo: 1 nombre viejo: Raul apellido viejo: bertomeu email viejo: raul@gmail.com contraseña vieja: tulatula12  poblacion vieja: carca fecha nacimiento vieja: 2003-09-03 imagen de perfil vieja:  id nuevo: 1 nombre nuevo: Raul apellido nuevo: bertomeu email nuevo: raul@gmail.com contraseña nueva: tulatula12  poblacion nueva: Xativa fecha nacimiento nueva: 2003-09-03 imagen de perfil nueva: ', '2024-05-14 12:49:23'),
(3, 'Se ha actualizado el registro del alumno id viejo: 1 id nuevo: 1 nombre viejo: Raul nombre nuevo: Raul apellido viejo: bertomeu apellido nuevo: Garcia email viejo: raul@gmail.com email nuevo: raul@gmail.com contraseña vieja: tulatula12 contraseña nueva: tulatula12  poblacion vieja: Xativa  poblacion nueva: Xativa fecha nacimiento vieja: 2003-09-03 fecha nacimiento nueva: 2003-09-03 imagen de perfil vieja:  imagen de perfil nueva: ', '2024-05-14 12:55:35');

-- --------------------------------------------------------

--
-- Estructura de la taula `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
CREATE TABLE `Peliculas` (
  `IDPeli` int(5) NOT NULL,
  `NomPeli` varchar(50) NOT NULL,
  `Genere` varchar(20) NOT NULL,
  `Nota` float NOT NULL,
  `Any` int(4) NOT NULL,
  `Durada(H)` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `ImatgePeli` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `Series`
--

DROP TABLE IF EXISTS `Series`;
CREATE TABLE `Series` (
  `IDSerie` int(5) NOT NULL,
  `NomSerie` varchar(50) NOT NULL,
  `Temporades` int(2) NOT NULL,
  `Any` int(4) NOT NULL,
  `Genere` varchar(20) NOT NULL,
  `Durada(H)` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `Nota` float NOT NULL,
  `ImatgeSerie` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuari`
--

DROP TABLE IF EXISTS `Usuari`;
CREATE TABLE `Usuari` (
  `IDUsuari` int(10) NOT NULL,
  `Nom` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contrasenya` varchar(20) NOT NULL,
  `DataNaixement` date NOT NULL,
  `Poblacio` varchar(20) NOT NULL,
  `ImatgePerfil` blob NOT NULL,
  `Cognom` varchar(30) NOT NULL,
  `Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Usuari`
--

INSERT INTO `Usuari` (`IDUsuari`, `Nom`, `Email`, `Contrasenya`, `DataNaixement`, `Poblacio`, `ImatgePerfil`, `Cognom`, `Rol`) VALUES
(1, 'Raul', 'raul@gmail.com', 'tulatula12', '2003-09-03', 'Xativa', '', 'Garcia', 'usuario');

--
-- Disparadors `Usuari`
--
DROP TRIGGER IF EXISTS `log_usuari`;
DELIMITER $$
CREATE TRIGGER `log_usuari` AFTER UPDATE ON `Usuari` FOR EACH ROW insert into log (accion) VALUES (concat ('Se ha actualizado el registro del alumno id viejo: ',old.IDUsuari,' id nuevo: ',new.IDUsuari,' nombre viejo: ',old.Nom,' nombre nuevo: ',new.Nom,' apellido viejo: ',old.Cognom,' apellido nuevo: ',new.Cognom,' email viejo: ',old.Email,' email nuevo: ',new.Email,' contraseña vieja: ',old.Contrasenya,' contraseña nueva: ',new.Contrasenya,'  poblacion vieja: ',old.Poblacio,'  poblacion nueva: ',new.Poblacio,' fecha nacimiento vieja: ', old.DataNaixement,' fecha nacimiento nueva: ', new.DataNaixement,' imagen de perfil vieja: ', old.ImatgePerfil,' imagen de perfil nueva: ', new.ImatgePerfil))
$$
DELIMITER ;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  ADD PRIMARY KEY (`IDPeli`);

--
-- Índexs per a la taula `Series`
--
ALTER TABLE `Series`
  ADD PRIMARY KEY (`IDSerie`);

--
-- Índexs per a la taula `Usuari`
--
ALTER TABLE `Usuari`
  ADD PRIMARY KEY (`IDUsuari`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `log`
--
ALTER TABLE `log`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `IDPeli` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Series`
--
ALTER TABLE `Series`
  MODIFY `IDSerie` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Usuari`
--
ALTER TABLE `Usuari`
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
