-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 15-05-2024 a les 08:48:21
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
(7, 'Se ha actualizado el registro del alumno id viejo: 1 id nuevo: 1 nombre viejo: Jorge nombre nuevo: Jorge apellido viejo: Gosa apellido nuevo: Gosa email viejo: pito@gmail.com email nuevo: pito@gmail.com contraseña vieja: holahola contraseña nueva: holahola  poblacion vieja: Carcaixent  poblacion nueva: Alzira fecha nacimiento vieja: 1999-03-12 fecha nacimiento nueva: 1999-03-12 imagen de perfil vieja:  imagen de perfil nueva: ', '2024-05-15 08:19:09'),
(8, 'hola', '2024-05-15 08:21:27'),
(9, 'Se ha insertado el usuario de id: 23 nombre: [value-2] apellido: [value-8] email: [value-3] contraseña: [value-4] población: [value-6] fecha nacimiento: 1999-02-02 imagen de perfil: [value-7] rol: [value-9]', '2024-05-15 08:38:01'),
(10, 'Se ha actualizado el registro del alumno id viejo: 23 id nuevo: 23 nombre viejo: [value-2] nombre nuevo: [value-2] apellido viejo: [value-8] apellido nuevo: [value-8] email viejo: [value-3] email nuevo: [value-3] contraseña vieja: [value-4] contraseña nueva: [value-4]  poblacion vieja: [value-6]  poblacion nueva: DIas fecha nacimiento vieja: 1999-02-02 fecha nacimiento nueva: 1999-02-02 imagen de perfil vieja: [value-7] imagen de perfil nueva: [value-7] rol viejo: [value-9] rol nuevo: [value-9]', '2024-05-15 08:38:37'),
(11, 'Se ha actualizado el registro del alumno id viejo: 1 id nuevo: 1 nombre viejo: Jorge nombre nuevo: Jorge apellido viejo: Gosa apellido nuevo: Gosa email viejo: pito@gmail.com email nuevo: pito@gmail.com contraseña vieja: holahola contraseña nueva: holahola  poblacion vieja: Alzira  poblacion nueva: Alziraasd fecha nacimiento vieja: 1999-03-12 fecha nacimiento nueva: 1999-03-12 imagen de perfil vieja:  imagen de perfil nueva:  rol viejo: usuari rol nuevo: usuari', '2024-05-15 08:38:48'),
(12, 'Se ha actualizado el registro del alumno id viejo: 1 id nuevo: 1 nombre viejo: Jorge nombre nuevo: Jorge apellido viejo: Gosa apellido nuevo: Gosa email viejo: pito@gmail.com email nuevo: pito@gmail.com contraseña vieja: holahola contraseña nueva: holahola  poblacion vieja: Alziraasd  poblacion nueva: Alziraasd fecha nacimiento vieja: 1999-03-12 fecha nacimiento nueva: 1999-03-24 imagen de perfil vieja:  imagen de perfil nueva:  rol viejo: usuari rol nuevo: usuari', '2024-05-15 08:42:39'),
(13, 'Se ha insertado el usuario de id: 24 nombre: [value-2] apellido: [value7] email: [value-3] contraseña: [value-4] población: [value-6] fecha nacimiento: 2000-01-01 imagen de perfil: [value-8] rol: [value-9]', '2024-05-15 08:43:24'),
(14, 'Se ha eliminado el usuario de id: 22 nombre: [value-2] apellido: [value-8] email: [value-3] contraseña: [value-4] población: [value-6] fecha nacimiento: 2003-09-01 imagen de perfil:  rol: [value-9]', '2024-05-15 08:47:29'),
(15, 'Se ha eliminado el usuario de id: 1 nombre: Jorge apellido: Gosa email: pito@gmail.com contraseña: holahola población: Alziraasd fecha nacimiento: 1999-03-24 imagen de perfil:  rol: usuari', '2024-05-15 08:47:50');

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
(21, '[value-2]', '[value-3]', '[value-4]', '1999-09-09', 'Valencia', '[value-8]', '', '[value-9]'),
(23, '[value-2]', '[value-3]', '[value-4]', '1999-02-02', 'DIas', '[value-8]', '', '[value-9]'),
(24, '[value-2]', '[value-3]', '[value-4]', '2000-01-01', '[value-6]', '[value7]', 0x5b76616c75652d385d, '[value-9]');

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
