-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 06-06-2024 a les 12:53:12
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

DELIMITER $$
--
-- Procediments
--
DROP PROCEDURE IF EXISTS `actualizar_pelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_pelicula` (IN `p_idpeli` INT(5), IN `p_idusuario` INT(5), IN `p_nompeli` VARCHAR(100), IN `p_genere` VARCHAR(50), IN `p_nota` FLOAT(3), IN `p_any` YEAR(4), IN `p_durada` FLOAT(5), IN `p_interprets` VARCHAR(500), IN `p_direccio` VARCHAR(50), IN `p_sinopsi` VARCHAR(1000), IN `p_imatge` BLOB)  DETERMINISTIC UPDATE Peliculas
    SET IDPeli = p_idpeli, IDUsuario = p_idusuario, NomPeli = p_nompeli, Genere = p_genere, Nota = p_nota, Any = p_any, Durada = p_durada, Interprets = p_interprets, Direccio = p_direccio, Sinopsi = p_sinopsi, ImatgePeli = p_imatge
    WHERE IDPeli = p_idpeli$$

DROP PROCEDURE IF EXISTS `actualizar_serie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_serie` (IN `p_idserie` INT(5), IN `p_idusuario` INT(5), IN `p_nomserie` VARCHAR(100), IN `p_temporades` INT(2), IN `p_any` YEAR(4), IN `p_genere` VARCHAR(20), IN `p_durada` FLOAT(4), IN `p_interprets` VARCHAR(50), IN `p_direccio` VARCHAR(50), IN `p_sinopsi` VARCHAR(1000), IN `p_nota` FLOAT(2), IN `p_imatge` BLOB)  DETERMINISTIC UPDATE Series
    SET IDSerie = p_idserie, IDUsuario = p_idusuario, NomSerie = p_nomserie, Temporades = p_temporades, Any = p_any, Genere = p_genere, Durada = p_durada, Interprets = p_interprets, Direccio = p_direccio, Sinopsi = p_sinopsi, Nota = p_nota, ImatgeSerie = p_imatge
    WHERE IDSerie = p_idserie$$

DROP PROCEDURE IF EXISTS `actualizar_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario` (IN `p_id` INT(5), IN `p_nombre` VARCHAR(50), IN `p_cognom` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_contrasenya` VARCHAR(100), IN `p_data` DATE, IN `p_poblacio` VARCHAR(50), IN `p_imatge` BLOB, IN `p_rol` VARCHAR(15))   UPDATE Usuari
    SET Nom = p_nombre, Cognom = p_cognom, Email = p_email, Contrasenya = SHA2(CONCAT(p_contrasenya, 12), 256), DataNaixement = p_data, Poblacio = p_poblacio, ImatgePerfil = p_imatge, Rol = p_rol
    WHERE IDUsuari = p_id$$

DROP PROCEDURE IF EXISTS `borrar_pelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_pelicula` (IN `p_idpeli` INT)  DETERMINISTIC DELETE Peliculas FROM Peliculas WHERE IDPeli = p_idpeli$$

DROP PROCEDURE IF EXISTS `borrar_serie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_serie` (IN `p_id` INT(5))   DELETE Series FROM Series WHERE IDSerie = p_id$$

DROP PROCEDURE IF EXISTS `borrar_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_usuario` (IN `p_id` INT(5))  DETERMINISTIC DELETE Usuari FROM Usuari WHERE IDUsuari = p_id$$

DROP PROCEDURE IF EXISTS `contar_peliculas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_peliculas` ()  DETERMINISTIC SELECT COUNT(*) FROM Peliculas$$

DROP PROCEDURE IF EXISTS `contar_series`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_series` ()  DETERMINISTIC SELECT COUNT(*) FROM Series$$

DROP PROCEDURE IF EXISTS `contar_usuarios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_usuarios` ()  DETERMINISTIC SELECT COUNT(*) FROM Usuari$$

DROP PROCEDURE IF EXISTS `insertar_pelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_pelicula` (IN `p_idpeli` INT(5), IN `p_idusuario` INT(5), IN `p_nompeli` VARCHAR(100), IN `p_genere` VARCHAR(50), IN `p_nota` FLOAT(3), IN `p_any` YEAR(4), IN `p_durada` FLOAT(5), IN `p_interprets` VARCHAR(500), IN `p_direccio` VARCHAR(50), IN `p_sinopsi` VARCHAR(1000), IN `p_imatge` BLOB)  DETERMINISTIC INSERT INTO Peliculas (IDPeli, IDUsuario, NomPeli, Genere, Nota, Any, Durada, Interprets, Direccio, Sinopsi, ImatgePeli) VALUES (p_idpeli, p_idusuario, p_nompeli, p_genere, p_nota, p_any, p_durada, p_interprets, p_direccio, p_sinopsi, p_imatge)$$

DROP PROCEDURE IF EXISTS `insertar_serie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_serie` (IN `p_idserie` INT(5), IN `p_idusuario` INT(5), IN `p_nomserie` VARCHAR(100), IN `p_temporades` INT(2), IN `p_any` YEAR(4), IN `p_genere` VARCHAR(20), IN `p_durada` VARCHAR(20), IN `p_interprets` VARCHAR(50), IN `p_direccio` VARCHAR(500), IN `p_sinopsi` VARCHAR(1000), IN `p_nota` FLOAT(4), IN `p_imatge` BLOB)  DETERMINISTIC INSERT INTO Series (IDSerie, IDUsuario, NomSerie, Temporades, Any, Genere, Durada, Interprets, Direccio, Sinopsi, Nota, ImatgeSerie) VALUES (p_idserie, p_idusuario, p_nomserie, p_temporades, p_any, p_genere, p_durada, p_interprets, p_direccio, p_sinopsi, p_nota, p_imatge)$$

DROP PROCEDURE IF EXISTS `insertar_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuario` (IN `IDUsuari` INT(5), IN `Nom` VARCHAR(50), IN `Cognom` VARCHAR(50), IN `Email` VARCHAR(30), IN `Contrasenya` VARCHAR(100), IN `DataNaixement` DATE, IN `Poblacio` VARCHAR(30), IN `ImatgePerfil` BLOB, IN `Rol` VARCHAR(15))  DETERMINISTIC INSERT INTO Usuari (IDUsuari, Nom, Cognom, Email, Contrasenya, DataNaixement, Poblacio, ImatgePerfil, Rol) VALUES (IDUsuari, Nom, Cognom, Email, SHA2(CONCAT(Contrasenya, 12), 256), DataNaixement, Poblacio, ImatgePerfil, Rol)$$

DELIMITER ;

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

-- --------------------------------------------------------

--
-- Estructura de la taula `log_peli`
--

DROP TABLE IF EXISTS `log_peli`;
CREATE TABLE `log_peli` (
  `id` int(5) NOT NULL,
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `log_serie`
--

DROP TABLE IF EXISTS `log_serie`;
CREATE TABLE `log_serie` (
  `id` int(5) NOT NULL,
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `log_valoracions`
--

DROP TABLE IF EXISTS `log_valoracions`;
CREATE TABLE `log_valoracions` (
  `id` int(5) NOT NULL,
  `accion` varchar(20000) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
CREATE TABLE `Peliculas` (
  `IDPeli` int(5) NOT NULL,
  `IDUsuario` int(5) NOT NULL,
  `NomPeli` varchar(50) NOT NULL,
  `Genere` varchar(20) NOT NULL,
  `Nota` float NOT NULL,
  `Any` int(4) NOT NULL,
  `Durada` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `ImatgePeli` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadors `Peliculas`
--
DROP TRIGGER IF EXISTS `log_peli`;
DELIMITER $$
CREATE TRIGGER `log_peli` AFTER UPDATE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha actualizado el registro de la pelicula id vieja: ',old.IDPeli,' id nueva: ',new.IDPeli,' nombre viejo: ',old.NomPeli,' nombre nuevo: ',new.NomPeli,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' dirección vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' interpretes viejos: ',old.Interprets,' interpretes nuevos: ',new.Interprets,'fecha estreno vieja: ',old.Any,' fecha estreno nueva: ',new.Any,' duración vieja: ',old.Durada,' duración nueva: ',new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota,' usuari viejo: ',old.IDUsuario,' usuario nuevo: ',new.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_delete`;
DELIMITER $$
CREATE TRIGGER `log_peli_delete` AFTER DELETE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha eliminado la pelicula de  id: ',old.IDPeli,' nombre: ',old.NomPeli,' genero: ',old.Genere,' dirección: ',old.Direccio,' sinopsis: ',old.Sinopsi,' interpretes: ',old.Interprets,' fecha estreno: ',old.Any,' duración: ',old.Durada,' nota: ',old.Nota,' usuari: ',old.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_insert`;
DELIMITER $$
CREATE TRIGGER `log_peli_insert` AFTER INSERT ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha insertado la pelicula de  id: ',new.IDPeli,' nombre: ',new.NomPeli,' genero: ',new.Genere,' dirección: ',new.Direccio,' sinopsis: ',new.Sinopsi,' interpretes: ',new.Interprets,' fecha estreno: ',new.Any,' duración: ',new.Durada,' nota: ',new.Nota,'usuario: ',new.IDUsuario))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `Series`
--

DROP TABLE IF EXISTS `Series`;
CREATE TABLE `Series` (
  `IDSerie` int(5) NOT NULL,
  `IDUsuario` int(5) NOT NULL,
  `NomSerie` varchar(50) NOT NULL,
  `Temporades` int(2) NOT NULL,
  `Any` int(4) NOT NULL,
  `Genere` varchar(20) NOT NULL,
  `Durada` float NOT NULL,
  `Interprets` varchar(500) NOT NULL,
  `Direccio` varchar(50) NOT NULL,
  `Sinopsi` varchar(1000) NOT NULL,
  `Nota` float NOT NULL,
  `ImatgeSerie` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadors `Series`
--
DROP TRIGGER IF EXISTS `log_serie`;
DELIMITER $$
CREATE TRIGGER `log_serie` AFTER UPDATE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha actualizado el registro de la serie id viejo: ',old.IDSerie,' id nuevo: ',new.IDSerie,' nombre viejo: ',old.NomSerie,' nombre nuevo: ',new.NomSerie,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' direccion vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' temporadas vieja: ',old.Temporades,' temporadas nueva: ',new.Temporades,'  interpretes viejos: ',old.Interprets,'  interpretes nuevos: ',new.Interprets,' fecha ultima temporada vieja: ', old.Any,' fecha ultima temporada nueva: ', new.Any,' duracion vieja: ', old.Durada,' duracion nueva: ', new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota,'asd',old.IDUsuario,'asd',new.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_delete`;
DELIMITER $$
CREATE TRIGGER `log_serie_delete` AFTER DELETE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha eliminado el registro de la serie id: ',old.IDSerie,' nombre: ',old.NomSerie,' genero: ',old.Genere,' dirección: ',old.Direccio,' sinopsis: ',old.Sinopsi,' temporadas: ',old.Temporades,' interpretes: ',old.Interprets,' fecha ultima temporada: ',old.Any,' duracion: ', old.Durada,' nota nueva: ',old.Nota,' usuario: ', old.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_insert`;
DELIMITER $$
CREATE TRIGGER `log_serie_insert` AFTER INSERT ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha insertado el registro de la serie id: ',new.IDSerie,' nombre: ',new.NomSerie,' genero: ',new.Genere,' dirección: ',new.Direccio,' sinopsis: ',new.Sinopsi,' temporadas: ',new.Temporades,' interpretes: ',new.Interprets,' fecha ultima temporada: ', new.Any,' duración: ', new.Durada,' nota: ',new.Nota,' usuario: ', new.IDUsuario))
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
  `Cognom` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contrasenya` varchar(100) NOT NULL,
  `DataNaixement` date NOT NULL,
  `Poblacio` varchar(20) NOT NULL,
  `ImatgePerfil` longblob NOT NULL,
  `Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadors `Usuari`
--
DROP TRIGGER IF EXISTS `log_usuari`;
DELIMITER $$
CREATE TRIGGER `log_usuari` AFTER UPDATE ON `Usuari` FOR EACH ROW insert into log (accion) VALUES (concat ('Se ha actualizado el registro del alumno id viejo: ',old.IDUsuari,' id nuevo: ',new.IDUsuari,' nombre viejo: ',old.Nom,' nombre nuevo: ',new.Nom,' apellido viejo: ',old.Cognom,' apellido nuevo: ',new.Cognom,' email viejo: ',old.Email,' email nuevo: ',new.Email,' contraseña vieja: ',old.Contrasenya,' contraseña nueva: ',new.Contrasenya,'  poblacion vieja: ',old.Poblacio,'  poblacion nueva: ',new.Poblacio,' fecha nacimiento vieja: ', old.DataNaixement,' fecha nacimiento nueva: ', new.DataNaixement,' rol viejo: ',old.Rol,' rol nuevo: ',new.Rol))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_usuari_delete`;
DELIMITER $$
CREATE TRIGGER `log_usuari_delete` AFTER DELETE ON `Usuari` FOR EACH ROW insert into log (accion) VALUES (concat
('Se ha eliminado el usuario de id: ',old.IDUsuari,' nombre: ',old.Nom,' apellido: ',old.Cognom,' email: ',old.Email,' contraseña: ',old.Contrasenya,' población: ',old.Poblacio,' fecha nacimiento: ',old.DataNaixement,' rol: ',old.Rol))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_usuari_insert`;
DELIMITER $$
CREATE TRIGGER `log_usuari_insert` AFTER INSERT ON `Usuari` FOR EACH ROW insert into log (accion) VALUES (concat
('Se ha insertado el usuario de id: ',new.IDUsuari,' nombre: ',new.Nom,' apellido: ',new.Cognom,' email: ',new.Email,' contraseña: ',new.Contrasenya,' población: ',new.Poblacio,' fecha nacimiento: ',new.DataNaixement,' rol: ',new.Rol))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `Valoracions`
--

DROP TABLE IF EXISTS `Valoracions`;
CREATE TABLE `Valoracions` (
  `IDValoracio` int(5) NOT NULL,
  `idElement` int(5) NOT NULL,
  `idUsuari` int(5) NOT NULL,
  `TIpusElement` varchar(8) NOT NULL,
  `Valoracio` int(2) NOT NULL,
  `Opinio` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Disparadors `Valoracions`
--
DROP TRIGGER IF EXISTS `log_valoracions`;
DELIMITER $$
CREATE TRIGGER `log_valoracions` AFTER UPDATE ON `Valoracions` FOR EACH ROW insert into log_valoracions (accion) VALUES (concat ('Se ha actualizado el registro de la valoración elemento viejo: ',old.idElement,' elemento nuevo: ',new.idElement,' usuario viejo: ',old.idUsuari,' usuario nuevo: ',new.idUsuari,' id valoración viejo: ',old.IDValoracio,' valoracion nuevo: ',new.IDValoracio,' opinion vieja: ',old.Opinio,' opinion nueva: ',new.Opinio,' tipo element viejo: ',old.TipusElement,' tipo elemento nuevo: ',new.TipusElement,' valoracion vieja: ',old.Valoracio,'  valoracion nueva: ',new.Valoracio))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_valoracions_delete`;
DELIMITER $$
CREATE TRIGGER `log_valoracions_delete` AFTER DELETE ON `Valoracions` FOR EACH ROW insert into log_valoracions (accion) VALUES (concat ('Se ha eliminado el registro de la valoración elemento: ',old.idElement,' usuario: ',old.idUsuari,' valoracion: ',old.IDValoracio,' opinion: ',old.Opinio,' tipo elemento: ',old.TipusElement,' valoracion: ',old.Valoracio))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_valoracions_insert`;
DELIMITER $$
CREATE TRIGGER `log_valoracions_insert` AFTER INSERT ON `Valoracions` FOR EACH ROW insert into log_valoracions (accion) VALUES (concat ('Se ha insertado el registro de la valoración elemento: ',new.idElement,' usuario: ',new.idUsuari,' valoracion: ',new.IDValoracio,' opinion: ',new.Opinio,' tipo elemento: ',new.TipusElement,' valoracion: ',new.Valoracio))
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
-- Índexs per a la taula `log_valoracions`
--
ALTER TABLE `log_valoracions`
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
-- Índexs per a la taula `Valoracions`
--
ALTER TABLE `Valoracions`
  ADD PRIMARY KEY (`IDValoracio`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `log`
--
ALTER TABLE `log`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT per la taula `log_peli`
--
ALTER TABLE `log_peli`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la taula `log_serie`
--
ALTER TABLE `log_serie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `log_valoracions`
--
ALTER TABLE `log_valoracions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `IDPeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la taula `Series`
--
ALTER TABLE `Series`
  MODIFY `IDSerie` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `Usuari`
--
ALTER TABLE `Usuari`
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT per la taula `Valoracions`
--
ALTER TABLE `Valoracions`
  MODIFY `IDValoracio` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
