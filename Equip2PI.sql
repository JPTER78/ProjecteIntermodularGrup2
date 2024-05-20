-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 20-05-2024 a les 10:14:14
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
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `log`
--

INSERT INTO `log` (`id`, `accion`, `fecha_hora`) VALUES
(19, 'Se ha insertado el usuario de id: 25 nombre: [value-2] apellido: [value-7] email: [value-3] contraseña: [value-4] población: [value-6] fecha nacimiento: 1999-09-09 imagen de perfil: [value-8] rol: [value-9]', '2024-05-16 12:36:44');

-- --------------------------------------------------------

--
-- Estructura de la taula `log_peli`
--

DROP TABLE IF EXISTS `log_peli`;
CREATE TABLE `log_peli` (
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `log_peli`
--

INSERT INTO `log_peli` (`accion`, `fecha_hora`, `id`) VALUES
('Se ha insertado la pelicula de  id: 2 nombre: [value-2] genero: [value-3] dirección: [value-8] imagen peli; [value-10] sinopsis: [value-9] interpretes: [value-7] fecha estreno: 6 duración: 6 nota: 6', '2024-05-15 11:51:38', 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `log_serie`
--

DROP TABLE IF EXISTS `log_serie`;
CREATE TABLE `log_serie` (
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `Durada` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `ImatgePeli` blob NOT NULL,
  `IDUsuario` int(5) NOT NULL,
  `FavoritoP` tinyint(1) DEFAULT NULL,
  `Tipus` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Peliculas`
--

INSERT INTO `Peliculas` (`IDPeli`, `NomPeli`, `Genere`, `Nota`, `Any`, `Durada`, `Interprets`, `Direccio`, `Sinopsi`, `ImatgePeli`, `IDUsuario`, `FavoritoP`, `Tipus`) VALUES
(2, '[value-2]', '[value-3]', 6, 6, 6, '[value-7]', '[value-8]', '[value-9]', 0x5b76616c75652d31305d, 0, NULL, '');

--
-- Disparadors `Peliculas`
--
DROP TRIGGER IF EXISTS `log_peli`;
DELIMITER $$
CREATE TRIGGER `log_peli` AFTER UPDATE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha actualizado el registro de la pelicula id vieja: ',old.IDPeli,' id nueva: ',new.IDPeli,' nombre viejo: ',old.NomPeli,' nombre nuevo: ',new.NomPeli,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' dirección vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' imagen peli vieja: ',old.ImatgePeli,' imagen peli nueva; ',new.ImatgePeli,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' interpretes viejos: ',old.Interprets,' interpretes nuevos: ',new.Interprets,'fecha estreno vieja: ',old.Any,' fecha estreno nueva: ',new.Any,' duración vieja: ',old.Durada,' duración nueva: ',new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_delete`;
DELIMITER $$
CREATE TRIGGER `log_peli_delete` AFTER DELETE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha eliminado la pelicula de  id: ',old.IDPeli,' nombre: ',old.NomPeli,' genero: ',old.Genere,' dirección: ',old.Direccio,' imagen peli; ',old.ImatgePeli,' sinopsis: ',old.Sinopsi,' interpretes: ',old.Interprets,' fecha estreno: ',old.Any,' duración: ',old.Durada,' nota: ',old.Nota))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_insert`;
DELIMITER $$
CREATE TRIGGER `log_peli_insert` AFTER INSERT ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha insertado la pelicula de  id: ',new.IDPeli,' nombre: ',new.NomPeli,' genero: ',new.Genere,' dirección: ',new.Direccio,' imagen peli; ',new.ImatgePeli,' sinopsis: ',new.Sinopsi,' interpretes: ',new.Interprets,' fecha estreno: ',new.Any,' duración: ',new.Durada,' nota: ',new.Nota))
$$
DELIMITER ;

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
  `Durada` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `Nota` float NOT NULL,
  `ImatgeSerie` blob NOT NULL,
  `IDUsuario` int(5) NOT NULL,
  `FavoritoS` tinyint(1) DEFAULT NULL,
  `Tipus` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadors `Series`
--
DROP TRIGGER IF EXISTS `log_serie`;
DELIMITER $$
CREATE TRIGGER `log_serie` AFTER UPDATE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha actualizado el registro de la serie id viejo: ',old.IDSerie,' id nuevo: ',new.IDSerie,' nombre viejo: ',old.NomSerie,' nombre nuevo: ',new.NomSerie,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' direccion vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' temporadas vieja: ',old.Temporades,' temporadas nueva: ',new.Temporades,'  interpretes viejos: ',old.Interprets,'  interpretes nuevos: ',new.Interprets,' fecha ultima temporada vieja: ', old.Any,' fecha ultima temporada nueva: ', new.Any,' duración vieja: ', old.Durada,' duracion nueva: ', new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota,' favorito viejo: ', old.FavoritoS,' favorito nuevo: ', new.FavoritoS,' tipus: ',old.Tipus,' tipus nuevo',new.Tipus))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_delete`;
DELIMITER $$
CREATE TRIGGER `log_serie_delete` AFTER DELETE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha eliminado el registro de la serie id: ',old.IDSerie,' nombre: ',old.NomSerie,' genero: ',old.Genere,' dirección: ',old.Direccio,' sinopsis: ',old.Sinopsi,' temporadas: ',old.Temporades,' interpretes: ',old.Interprets,' fecha ultima temporada: ',old.Any,' duracion: ', old.Durada,' imagen peli: ",old.ImatgeSerie," nota nueva: ',old.Nota))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_insert`;
DELIMITER $$
CREATE TRIGGER `log_serie_insert` AFTER INSERT ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha insertado el registro de la serie id: ',new.IDSerie,' nombre: ',new.NomSerie,' genero: ',new.Genere,' dirección: ',new.Direccio,' sinopsis: ',new.Sinopsi,' temporadas: ',new.Temporades,' interpretes: ',new.Interprets,' fecha ultima temporada: ', new.Any,' duración: ', new.Durada,' imagen serie: ',new.ImatgeSerie,' nota: ',new.Nota))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuari`
--

DROP TABLE IF EXISTS `Usuari`;
CREATE TABLE `Usuari` (
  `IDUsuari` int(10) NOT NULL,
  `Nom` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contrasenya` varchar(20) NOT NULL,
  `DataNaixement` date NOT NULL,
  `Poblacio` varchar(20) NOT NULL,
  `Cognom` varchar(30) NOT NULL,
  `ImatgePerfil` blob NOT NULL,
  `Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Usuari`
--

INSERT INTO `Usuari` (`IDUsuari`, `Nom`, `Email`, `Contrasenya`, `DataNaixement`, `Poblacio`, `Cognom`, `ImatgePerfil`, `Rol`) VALUES
(25, '[value-2]', '[value-3]', '[value-4]', '1999-09-09', '[value-6]', '[value-7]', 0x5b76616c75652d385d, '[value-9]');

--
-- Disparadors `Usuari`
--
DROP TRIGGER IF EXISTS `log_usuari`;
DELIMITER $$
CREATE TRIGGER `log_usuari` AFTER UPDATE ON `Usuari` FOR EACH ROW insert into log (accion) VALUES (concat ('Se ha actualizado el registro del alumno id viejo: ',old.IDUsuari,' id nuevo: ',new.IDUsuari,' nombre viejo: ',old.Nom,' nombre nuevo: ',new.Nom,' apellido viejo: ',old.Cognom,' apellido nuevo: ',new.Cognom,' email viejo: ',old.Email,' email nuevo: ',new.Email,' contraseña vieja: ',old.Contrasenya,' contraseña nueva: ',new.Contrasenya,'  poblacion vieja: ',old.Poblacio,'  poblacion nueva: ',new.Poblacio,' fecha nacimiento vieja: ', old.DataNaixement,' fecha nacimiento nueva: ', new.DataNaixement,' imagen de perfil vieja: ', old.ImatgePerfil,' imagen de perfil nueva: ', new.ImatgePerfil,' rol viejo: ',old.Rol,' rol nuevo: ',new.Rol))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_usuari_delete`;
DELIMITER $$
CREATE TRIGGER `log_usuari_delete` AFTER DELETE ON `Usuari` FOR EACH ROW insert into log (`accion`) VALUES (concat
('Se ha eliminado el usuario de id: ',old.IDUsuari,' nombre: ',old.Nom,' apellido: ',old.Cognom,' email: ',old.Email,' contraseña: ',old.Contrasenya,' población: ',old.Poblacio,' fecha nacimiento: ',old.DataNaixement,' imagen de perfil: ',old.ImatgePerfil,' rol: ',old.Rol))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_usuari_insert`;
DELIMITER $$
CREATE TRIGGER `log_usuari_insert` AFTER INSERT ON `Usuari` FOR EACH ROW insert into log (`accion`) VALUES (concat
('Se ha insertado el usuario de id: ',new.IDUsuari,' nombre: ',new.Nom,' apellido: ',new.Cognom,' email: ',new.Email,' contraseña: ',new.Contrasenya,' población: ',new.Poblacio,' fecha nacimiento: ',new.DataNaixement,' imagen de perfil: ',new.ImatgePerfil,' rol: ',new.Rol))
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
-- Índexs per a la taula `log_peli`
--
ALTER TABLE `log_peli`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `log_serie`
--
ALTER TABLE `log_serie`
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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la taula `log_peli`
--
ALTER TABLE `log_peli`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `log_serie`
--
ALTER TABLE `log_serie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `IDPeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `Series`
--
ALTER TABLE `Series`
  MODIFY `IDSerie` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `Usuari`
--
ALTER TABLE `Usuari`
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
