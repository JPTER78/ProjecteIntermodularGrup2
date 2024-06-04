-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 04-06-2024 a les 14:09:49
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

--
-- Bolcament de dades per a la taula `log`
--

INSERT INTO `log` (`id`, `accion`, `fecha_hora`) VALUES
(33, 'Se ha insertado el usuario de id: 11 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: asdasdasd población: asdasd fecha nacimiento: 2024-05-03 imagen de perfil: /opt/lampp/temp/phpKi0a5O rol: User', '2024-05-28 13:02:22'),
(34, 'Se ha insertado el usuario de id: 12 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: asdasd población: asdasd fecha nacimiento: 2024-05-17 imagen de perfil: /opt/lampp/temp/phpthMwO5 rol: Admin', '2024-05-28 13:03:00'),
(35, 'Se ha insertado el usuario de id: 13 nombre: asda apellido: asdasdasdas email: asdasda@gmail.com contraseña: sdfsdf población: asdasd fecha nacimiento: 2024-05-02 imagen de perfil: /opt/lampp/temp/phpFxmiCA rol: User', '2024-05-28 14:23:02'),
(36, 'Se ha insertado el usuario de id: 14 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: asd población: asdasd fecha nacimiento: 2024-05-01 imagen de perfil: /opt/lampp/temp/phpzwc1ON rol: User', '2024-05-28 14:23:52'),
(37, 'Se ha actualizado el registro del alumno id viejo: 11 id nuevo: 11 nombre viejo: asdas nombre nuevo: Javi apellido viejo: asdasd apellido nuevo: Garcia email viejo: ragarbedam@gmail.com email nuevo: javi@gmail.com contraseña vieja: asdasdasd contraseña nueva: asdasder  poblacion vieja: asdasd  poblacion nueva: Carca fecha nacimiento vieja: 2024-05-03 fecha nacimiento nueva: 2024-05-10 imagen de perfil vieja: /opt/lampp/temp/phpKi0a5O imagen de perfil nueva: /opt/lampp/temp/phpa6qrVV rol viejo: User rol nuevo: User', '2024-05-29 08:38:15'),
(38, 'Se ha actualizado el registro del alumno id viejo: 12 id nuevo: 12 nombre viejo: asdas nombre nuevo: Pau apellido viejo: asdasd apellido nuevo: Garcia email viejo: ragarbedam@gmail.com email nuevo: javi@gmail.com contraseña vieja: asdasd contraseña nueva: asdaser  poblacion vieja: asdasd  poblacion nueva: Carca fecha nacimiento vieja: 2024-05-17 fecha nacimiento nueva: 2024-05-03 imagen de perfil vieja: /opt/lampp/temp/phpthMwO5 imagen de perfil nueva: /opt/lampp/temp/php0LrHys rol viejo: Admin rol nuevo: Admin', '2024-05-29 08:42:42'),
(39, 'Se ha insertado el usuario de id: 15 nombre: asdas apellido: asdasd email: holahola@gmail.com contraseña: $2y$10$0dHTvKbZ77k4Ti80KYtil.2deSjyajXOFZwliZpqmpP20WdAitjPy población: asdasd fecha nacimiento: 2024-05-03 imagen de perfil: /opt/lampp/temp/phpSNmDIG rol: User', '2024-05-29 09:21:52'),
(40, 'Se ha actualizado el registro del alumno id viejo: 13 id nuevo: 13 nombre viejo: asda nombre nuevo: asd apellido viejo: asdasdasdas apellido nuevo: Garcia email viejo: asdasda@gmail.com email nuevo: javiasd@gmail.com contraseña vieja: sdfsdf contraseña nueva: $2y$10$edoGft.S8F3yLyaWob0hSeImFZHOU1nMf8kW4h6h2nzQFH9baUhSG  poblacion vieja: asdasd  poblacion nueva: Carca fecha nacimiento vieja: 2024-05-02 fecha nacimiento nueva: 2024-05-10 imagen de perfil vieja: /opt/lampp/temp/phpFxmiCA imagen de perfil nueva:  rol viejo: User rol nuevo: Admin', '2024-05-29 09:24:43'),
(41, 'Se ha actualizado el registro del alumno id viejo: 12 id nuevo: 12 nombre viejo: Pau nombre nuevo: Javi apellido viejo: Garcia apellido nuevo: sss email viejo: javi@gmail.com email nuevo: javi@gmail.com contraseña vieja: asdaser contraseña nueva: $2y$10$fyHHxUT9U26iBD5z6jiiuuCoL1c2ekZA1QbPzTx.IjoIM6br5Qloe  poblacion vieja: Carca  poblacion nueva: Carca fecha nacimiento vieja: 2024-05-03 fecha nacimiento nueva: 2024-05-10 imagen de perfil vieja: /opt/lampp/temp/php0LrHys imagen de perfil nueva: /opt/lampp/temp/phpUKdgut rol viejo: Admin rol nuevo: User', '2024-05-29 09:25:41'),
(42, 'Se ha eliminado el usuario de id: 12 nombre: Javi apellido: sss email: javi@gmail.com contraseña: $2y$10$fyHHxUT9U26iBD5z6jiiuuCoL1c2ekZA1QbPzTx.IjoIM6br5Qloe población: Carca fecha nacimiento: 2024-05-10 imagen de perfil: /opt/lampp/temp/phpUKdgut rol: User', '2024-05-29 09:30:23'),
(43, 'Se ha insertado el usuario de id: 16 nombre: ffff apellido: ffff email: asdasda@gmail.com contraseña: $2y$10$o/FvFzJ/1yj0uEvpmQfuD./tNTAWse/cqSInymtOINqpZtYVezOM6 población: asdasd fecha nacimiento: 2024-05-17 imagen de perfil: /opt/lampp/temp/phph1J79G rol: Admin', '2024-05-29 09:49:09'),
(44, 'Se ha insertado el usuario de id: 17 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: $2y$10$fNLaNdC.CahUqMgJlPe6yeW8TH1FXZ1TOF5.joodqoeJf477kPIR. población: asdasd fecha nacimiento: 2024-05-10 imagen de perfil: /opt/lampp/temp/phpX63hwM rol: User', '2024-05-29 11:39:33'),
(45, 'Se ha actualizado el registro del alumno id viejo: 11 id nuevo: 11 nombre viejo: Javi nombre nuevo: Pau apellido viejo: Garcia apellido nuevo: sss email viejo: javi@gmail.com email nuevo: javi@gmail.com contraseña vieja: asdasder contraseña nueva: $2y$10$AmzHorCCfvsuouQIMDjbB.N74QuZCX9/XbPDXm4zgRJE1JskPLciu  poblacion vieja: Carca  poblacion nueva: Carca fecha nacimiento vieja: 2024-05-10 fecha nacimiento nueva: 2024-05-09 imagen de perfil vieja: /opt/lampp/temp/phpa6qrVV imagen de perfil nueva: /opt/lampp/temp/phphqwmKL rol viejo: User rol nuevo: User', '2024-05-29 11:49:12'),
(46, 'Se ha eliminado el usuario de id: 17 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: $2y$10$fNLaNdC.CahUqMgJlPe6yeW8TH1FXZ1TOF5.joodqoeJf477kPIR. población: asdasd fecha nacimiento: 2024-05-10 imagen de perfil: /opt/lampp/temp/phpX63hwM rol: User', '2024-05-29 13:17:04'),
(47, 'Se ha insertado el usuario de id: 18 nombre: [value-2] apellido: [value-3] email: [value-4] contraseña: [value-5] población: [value-7] fecha nacimiento: 1999-09-09 imagen de perfil: [value-8] rol: [value-9]', '2024-05-30 08:17:09'),
(48, 'Se ha eliminado el usuario de id: 18 nombre: [value-2] apellido: [value-3] email: [value-4] contraseña: [value-5] población: [value-7] fecha nacimiento: 1999-09-09 imagen de perfil: [value-8] rol: [value-9]', '2024-05-30 08:26:45'),
(49, 'Se ha eliminado el usuario de id: 16 nombre: ffff apellido: ffff email: asdasda@gmail.com contraseña: $2y$10$o/FvFzJ/1yj0uEvpmQfuD./tNTAWse/cqSInymtOINqpZtYVezOM6 población: asdasd fecha nacimiento: 2024-05-17 imagen de perfil: /opt/lampp/temp/phph1J79G rol: Admin', '2024-05-30 13:09:09'),
(50, 'Se ha eliminado el usuario de id: 15 nombre: asdas apellido: asdasd email: holahola@gmail.com contraseña: $2y$10$0dHTvKbZ77k4Ti80KYtil.2deSjyajXOFZwliZpqmpP20WdAitjPy población: asdasd fecha nacimiento: 2024-05-03 imagen de perfil: /opt/lampp/temp/phpSNmDIG rol: User', '2024-05-31 08:47:54'),
(51, 'Se ha eliminado el usuario de id: 14 nombre: asdas apellido: asdasd email: ragarbedam@gmail.com contraseña: asd población: asdasd fecha nacimiento: 2024-05-01 imagen de perfil: /opt/lampp/temp/phpzwc1ON rol: User', '2024-05-31 09:29:39'),
(52, 'Se ha eliminado el usuario de id: 13 nombre: asd apellido: Garcia email: javiasd@gmail.com contraseña: $2y$10$edoGft.S8F3yLyaWob0hSeImFZHOU1nMf8kW4h6h2nzQFH9baUhSG población: Carca fecha nacimiento: 2024-05-10 imagen de perfil:  rol: Admin', '2024-06-03 09:23:37'),
(53, 'Se ha eliminado el usuario de id: 11 nombre: Pau apellido: sss email: javi@gmail.com contraseña: $2y$10$AmzHorCCfvsuouQIMDjbB.N74QuZCX9/XbPDXm4zgRJE1JskPLciu población: Carca fecha nacimiento: 2024-05-09 imagen de perfil: /opt/lampp/temp/phphqwmKL rol: User', '2024-06-03 11:27:06'),
(54, 'Se ha insertado el usuario de id: 19 nombre: Javi apellido: Garcia email: javi@gmail.com contraseña: $2y$10$2A86A7Z.po6ylLtyAp9SruPhwvzS9MZwVd./OIsLaCldxtN8k9yz6 población: Carca fecha nacimiento: 2024-06-01 imagen de perfil: /opt/lampp/temp/phpxak8ow rol: User', '2024-06-03 11:49:15'),
(55, 'Se ha insertado el usuario de id: 1 nombre: gggg apellido: asd email: ragarbe@gmail.com contraseña: asdasd población: asdasd fecha nacimiento: 1999-02-02 imagen de perfil:  rol: aa', '2024-06-03 12:43:19'),
(56, 'Se ha eliminado el usuario de id: 19 nombre: Javi apellido: Garcia email: javi@gmail.com contraseña: $2y$10$2A86A7Z.po6ylLtyAp9SruPhwvzS9MZwVd./OIsLaCldxtN8k9yz6 población: Carca fecha nacimiento: 2024-06-01 imagen de perfil: /opt/lampp/temp/phpxak8ow rol: User', '2024-06-03 13:04:02'),
(57, 'Se ha insertado el usuario de id: 2 nombre: gggg apellido: Garica email: ragarbe@gmail.com contraseña: 0e06642b9457a216628bae8170eeba6953b88a0cf98e9abf30c73f4fcb172b85 población: asdasd fecha nacimiento: 1999-02-02 imagen de perfil: fffff rol: aa', '2024-06-03 13:12:18'),
(58, 'Se ha actualizado el registro del alumno id viejo: 1 id nuevo: 1 nombre viejo: gggg nombre nuevo: ddd apellido viejo: asd apellido nuevo: aaa email viejo: ragarbe@gmail.com email nuevo: sss@gmail.com contraseña vieja: asdasd contraseña nueva: 0fe66afb0a1612d87bb0ebbb9aec28b1a7634ffbf741f9fef0fb8180823650f5  poblacion vieja: asdasd  poblacion nueva: asd fecha nacimiento vieja: 1999-02-02 fecha nacimiento nueva: 1999-02-02 imagen de perfil vieja:  imagen de perfil nueva: asd rol viejo: aa rol nuevo: asd', '2024-06-03 13:42:16'),
(59, 'Se ha eliminado el usuario de id: 1 nombre: ddd apellido: aaa email: sss@gmail.com contraseña: 0fe66afb0a1612d87bb0ebbb9aec28b1a7634ffbf741f9fef0fb8180823650f5 población: asd fecha nacimiento: 1999-02-02 imagen de perfil: asd rol: asd', '2024-06-03 14:06:28'),
(60, 'Se ha insertado el usuario de id: 20 nombre: Jorgej apellido: ssss email: jorge@gmail.com contraseña: $2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO población: Carcaixent fecha nacimiento: 2024-06-16 imagen de perfil: /opt/lampp/temp/phprvrel6 rol: Admin', '2024-06-04 08:26:08'),
(61, 'Se ha actualizado el registro del alumno id viejo: 20 id nuevo: 20 nombre viejo: Jorgej nombre nuevo: Jorgej apellido viejo: ssss apellido nuevo: ssss email viejo: jorge@gmail.com email nuevo: jorge@gmail.com contraseña vieja: $2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO contraseña nueva: $2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO  poblacion vieja: Carcaixent  poblacion nueva: Carcaixent fecha nacimiento vieja: 2024-06-16 fecha nacimiento nueva: 2024-06-16 imagen de perfil vieja: /opt/lampp/temp/phprvrel6 imagen de perfil nueva: /opt/lampp/temp/phprvrel6 rol viejo: Admin rol nuevo: Adminddd', '2024-06-04 08:37:27'),
(62, 'Se ha actualizado el registro del alumno id viejo: 20 id nuevo: 20 nombre viejo: Jorgej nombre nuevo: Jorgej apellido viejo: ssss apellido nuevo: ssss email viejo: jorge@gmail.com email nuevo: jorge@gmail.com contraseña vieja: $2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO contraseña nueva: $2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO  poblacion vieja: Carcaixent  poblacion nueva: Carcaixent fecha nacimiento vieja: 2024-06-16 fecha nacimiento nueva: 2024-06-16 imagen de perfil vieja: /opt/lampp/temp/phprvrel6 imagen de perfil nueva: /opt/lampp/temp/phprvrel6 rol viejo: Adminddd rol nuevo: Admin', '2024-06-04 08:37:47');

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

--
-- Bolcament de dades per a la taula `log_peli`
--

INSERT INTO `log_peli` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se ha insertado la pelicula de  id: 1 nombre: Nueva Película genero: Acción dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5usuario: 1', '2024-05-28 11:32:00'),
(2, 'Se ha insertado la pelicula de  id: 2 nombre: Nueva Película genero: Acción dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5usuario: 1', '2024-05-28 11:34:51'),
(3, 'Se ha insertado la pelicula de  id: 3 nombre: Nueva Película genero: Acción dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5usuario: 1', '2024-05-28 11:54:47'),
(4, 'Se ha actualizado el registro de la pelicula id vieja: 1 id nueva: 1 nombre viejo: Nueva Película nombre nuevo: Película Actualizada genero viejo: Acción genero nuevo: Drama dirección vieja: Director1 dirección nueva: Director1 imagen peli vieja:  imagen peli nueva;  sinopsis vieja: Sinopsis de la nueva película sinopsis nueva: Sinopsis de la nueva película interpretes viejos: Actor1, Actor2 interpretes nuevos: Actor1, Actor2fecha estreno vieja: 2024 fecha estreno nueva: 2024 duración vieja: 120.5 duración nueva: 120.5 nota vieja: 8.5 nota nueva: 8.5 usuari viejo: 1 usuario nuevo: 1', '2024-05-28 11:55:01'),
(5, 'Se ha eliminado la pelicula de  id: 1 nombre: Película Actualizada genero: Drama dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5 usuari: 1', '2024-05-28 11:55:06'),
(6, 'Se ha insertado la pelicula de  id: 4 nombre: Nueva Película genero: Acción dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5usuario: 1', '2024-05-28 11:56:29'),
(7, 'Se ha insertado la pelicula de  id: 5 nombre: Poker genero: Accion dirección: asdasd imagen peli;  sinopsis: asdasd interpretes: asdasd fecha estreno: 1900 duración: 1 nota: 0.1usuario: 1', '2024-05-28 12:08:01'),
(8, 'Se ha insertado la pelicula de  id: 6 nombre: Angle genero: Accion dirección: asdasd imagen peli;  sinopsis: asdasd interpretes: asdasd fecha estreno: 1900 duración: 1 nota: 0.1usuario: 1', '2024-05-28 12:09:28'),
(9, 'Se ha insertado la pelicula de  id: 7 nombre: asdasd genero: Accion dirección: asdasd imagen peli;  sinopsis: asdasdasd interpretes: asdasd fecha estreno: 1904 duración: 17 nota: 0.3usuario: 1', '2024-05-28 12:13:57'),
(10, 'Se ha insertado la pelicula de  id: 8 nombre: Pokerasdad genero: ddddd dirección: asdasd imagen peli; /opt/lampp/temp/phpdPVcu1 sinopsis: asdasd interpretes: asdasd fecha estreno: 1900 duración: 1 nota: 0.1usuario: 1', '2024-05-28 12:14:46'),
(11, 'Se ha insertado la pelicula de  id: 9 nombre: Poker genero: Accion dirección: asdasd imagen peli; /opt/lampp/temp/phpjPhChg sinopsis: fdfffffffffffffffffff interpretes: asdasd fecha estreno: 1900 duración: 1 nota: 0.2usuario: 1', '2024-05-28 12:17:18'),
(12, 'Se ha actualizado el registro de la pelicula id vieja: 2 id nueva: 2 nombre viejo: Nueva Película nombre nuevo: sssss genero viejo: Acción genero nuevo: ddddd dirección vieja: Director1 dirección nueva: asdasd imagen peli vieja:  imagen peli nueva; sdss sinopsis vieja: Sinopsis de la nueva película sinopsis nueva: asdasdasdadadadasdasd interpretes viejos: Actor1, Actor2 interpretes nuevos: asdasdfecha estreno vieja: 2024 fecha estreno nueva: 2004 duración vieja: 120.5 duración nueva: 123 nota vieja: 8.5 nota nueva: 4.78 usuari viejo: 1 usuario nuevo: 1', '2024-06-04 08:13:22'),
(13, 'Se ha eliminado la pelicula de  id: 3 nombre: Nueva Película genero: Acción dirección: Director1 imagen peli;  sinopsis: Sinopsis de la nueva película interpretes: Actor1, Actor2 fecha estreno: 2024 duración: 120.5 nota: 8.5 usuari: 1', '2024-06-04 08:15:33');

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

--
-- Bolcament de dades per a la taula `log_serie`
--

INSERT INTO `log_serie` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se ha insertado el registro de la serie id: 1 nombre: [value-3] genero: [value-6] dirección: [value-9] sinopsis: [value-10] temporadas: 8 interpretes: [value-8] fecha ultima temporada: 1999 duración: 7 imagen serie: [value-12] nota: 6 usuario: 2', '2024-05-29 12:33:30'),
(2, 'Se ha actualizado el registro de la serie id viejo: 1 id nuevo: 1 nombre viejo: [value-3] nombre nuevo: asd genero viejo: [value-6] genero nuevo: asdasd direccion vieja: [value-9] dirección nueva: asdasd sinopsis vieja: [value-10] sinopsis nueva: asdasdasdadadadasdasd temporadas vieja: 8 temporadas nueva: 2  interpretes viejos: [value-8]  interpretes nuevos: asdasd fecha ultima temporada vieja: 1999 fecha ultima temporada nueva: 2004 duracion vieja: 7 duracion nueva: 123 nota vieja: 6 nota nueva: 3.23asd2asd3', '2024-06-03 14:29:42'),
(3, 'Se ha eliminado el registro de la serie id: 1 nombre: asd genero: asdasd dirección: asdasd sinopsis: asdasdasdadadadasdasd temporadas: 2 interpretes: asdasd fecha ultima temporada: 2004 duracion: 123 imagen peli: \",old.ImatgeSerie,\" nota nueva: 3.23 usuario: 3', '2024-06-03 14:32:02'),
(4, 'Se ha insertado el registro de la serie id: 1 nombre: asd genero: asdasd dirección: asdasd sinopsis: asdasdasdadadadasdasd temporadas: 2 interpretes: asdasd fecha ultima temporada: 2004 duración: 123 imagen serie: asd nota: 3.23 usuario: 3', '2024-06-03 14:35:43');

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
  `ImatgePeli` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Peliculas`
--

INSERT INTO `Peliculas` (`IDPeli`, `IDUsuario`, `NomPeli`, `Genere`, `Nota`, `Any`, `Durada`, `Interprets`, `Direccio`, `Sinopsi`, `ImatgePeli`) VALUES
(2, 1, 'sssss', 'ddddd', 4.78, 2004, 123, 'asdasd', 'asdasd', 'asdasdasdadadadasdasd', 0x73647373),
(4, 1, 'Nueva Película', 'Acción', 8.5, 2024, 120.5, 'Actor1, Actor2', 'Director1', 'Sinopsis de la nueva película', ''),
(5, 1, 'Poker', 'Accion', 0.1, 1900, 1, 'asdasd', 'asdasd', 'asdasd', ''),
(6, 1, 'Angle', 'Accion', 0.1, 1900, 1, 'asdasd', 'asdasd', 'asdasd', ''),
(7, 1, 'asdasd', 'Accion', 0.3, 1904, 17, 'asdasd', 'asdasd', 'asdasdasd', ''),
(8, 1, 'Pokerasdad', 'ddddd', 0.1, 1900, 1, 'asdasd', 'asdasd', 'asdasd', 0x2f6f70742f6c616d70702f74656d702f706870645056637531),
(9, 1, 'Poker', 'Accion', 0.2, 1900, 1, 'asdasd', 'asdasd', 'fdfffffffffffffffffff', 0x2f6f70742f6c616d70702f74656d702f7068706a5068436867);

--
-- Disparadors `Peliculas`
--
DROP TRIGGER IF EXISTS `log_peli`;
DELIMITER $$
CREATE TRIGGER `log_peli` AFTER UPDATE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha actualizado el registro de la pelicula id vieja: ',old.IDPeli,' id nueva: ',new.IDPeli,' nombre viejo: ',old.NomPeli,' nombre nuevo: ',new.NomPeli,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' dirección vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' imagen peli vieja: ',old.ImatgePeli,' imagen peli nueva; ',new.ImatgePeli,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' interpretes viejos: ',old.Interprets,' interpretes nuevos: ',new.Interprets,'fecha estreno vieja: ',old.Any,' fecha estreno nueva: ',new.Any,' duración vieja: ',old.Durada,' duración nueva: ',new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota,' usuari viejo: ',old.IDUsuario,' usuario nuevo: ',new.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_delete`;
DELIMITER $$
CREATE TRIGGER `log_peli_delete` AFTER DELETE ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha eliminado la pelicula de  id: ',old.IDPeli,' nombre: ',old.NomPeli,' genero: ',old.Genere,' dirección: ',old.Direccio,' imagen peli; ',old.ImatgePeli,' sinopsis: ',old.Sinopsi,' interpretes: ',old.Interprets,' fecha estreno: ',old.Any,' duración: ',old.Durada,' nota: ',old.Nota,' usuari: ',old.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_peli_insert`;
DELIMITER $$
CREATE TRIGGER `log_peli_insert` AFTER INSERT ON `Peliculas` FOR EACH ROW insert into log_peli (accion) VALUES (concat('Se ha insertado la pelicula de  id: ',new.IDPeli,' nombre: ',new.NomPeli,' genero: ',new.Genere,' dirección: ',new.Direccio,' imagen peli; ',new.ImatgePeli,' sinopsis: ',new.Sinopsi,' interpretes: ',new.Interprets,' fecha estreno: ',new.Any,' duración: ',new.Durada,' nota: ',new.Nota,'usuario: ',new.IDUsuario))
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
  `ImatgeSerie` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Series`
--

INSERT INTO `Series` (`IDSerie`, `IDUsuario`, `NomSerie`, `Temporades`, `Any`, `Genere`, `Durada`, `Interprets`, `Direccio`, `Sinopsi`, `Nota`, `ImatgeSerie`) VALUES
(1, 3, 'asd', 2, 2004, 'asdasd', 123, 'asdasd', 'asdasd', 'asdasdasdadadadasdasd', 3.23, 0x617364);

--
-- Disparadors `Series`
--
DROP TRIGGER IF EXISTS `log_serie`;
DELIMITER $$
CREATE TRIGGER `log_serie` AFTER UPDATE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha actualizado el registro de la serie id viejo: ',old.IDSerie,' id nuevo: ',new.IDSerie,' nombre viejo: ',old.NomSerie,' nombre nuevo: ',new.NomSerie,' genero viejo: ',old.Genere,' genero nuevo: ',new.Genere,' direccion vieja: ',old.Direccio,' dirección nueva: ',new.Direccio,' sinopsis vieja: ',old.Sinopsi,' sinopsis nueva: ',new.Sinopsi,' temporadas vieja: ',old.Temporades,' temporadas nueva: ',new.Temporades,'  interpretes viejos: ',old.Interprets,'  interpretes nuevos: ',new.Interprets,' fecha ultima temporada vieja: ', old.Any,' fecha ultima temporada nueva: ', new.Any,' duracion vieja: ', old.Durada,' duracion nueva: ', new.Durada,' nota vieja: ',old.Nota,' nota nueva: ',new.Nota,'asd', old.IDUsuario,'asd',new.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_delete`;
DELIMITER $$
CREATE TRIGGER `log_serie_delete` AFTER DELETE ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha eliminado el registro de la serie id: ',old.IDSerie,' nombre: ',old.NomSerie,' genero: ',old.Genere,' dirección: ',old.Direccio,' sinopsis: ',old.Sinopsi,' temporadas: ',old.Temporades,' interpretes: ',old.Interprets,' fecha ultima temporada: ',old.Any,' duracion: ', old.Durada,' imagen peli: ",old.ImatgeSerie," nota nueva: ',old.Nota,' usuario: ', old.IDUsuario))
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `log_serie_insert`;
DELIMITER $$
CREATE TRIGGER `log_serie_insert` AFTER INSERT ON `Series` FOR EACH ROW insert into log_serie (accion) VALUES (concat('Se ha insertado el registro de la serie id: ',new.IDSerie,' nombre: ',new.NomSerie,' genero: ',new.Genere,' dirección: ',new.Direccio,' sinopsis: ',new.Sinopsi,' temporadas: ',new.Temporades,' interpretes: ',new.Interprets,' fecha ultima temporada: ', new.Any,' duración: ', new.Durada,' imagen serie: ',new.ImatgeSerie,' nota: ',new.Nota,' usuario: ', new.IDUsuario))
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
  `ImatgePerfil` blob NOT NULL,
  `Rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Bolcament de dades per a la taula `Usuari`
--

INSERT INTO `Usuari` (`IDUsuari`, `Nom`, `Cognom`, `Email`, `Contrasenya`, `DataNaixement`, `Poblacio`, `ImatgePerfil`, `Rol`) VALUES
(2, 'gggg', 'Garica', 'ragarbe@gmail.com', '0e06642b9457a216628bae8170eeba6953b88a0cf98e9abf30c73f4fcb172b85', '1999-02-02', 'asdasd', 0x6666666666, 'aa'),
(20, 'Jorgej', 'ssss', 'jorge@gmail.com', '$2y$10$ynC4PMaAD03b7rFL1FqWUuWOT4lloICyGV7FRwewceh.nD7lgoyDO', '2024-06-16', 'Carcaixent', 0x2f6f70742f6c616d70702f74656d702f706870727672656c36, 'Admin');

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT per la taula `log_peli`
--
ALTER TABLE `log_peli`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la taula `log_serie`
--
ALTER TABLE `log_serie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `log_valoracions`
--
ALTER TABLE `log_valoracions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `IDPeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la taula `Series`
--
ALTER TABLE `Series`
  MODIFY `IDSerie` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `Usuari`
--
ALTER TABLE `Usuari`
  MODIFY `IDUsuari` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la taula `Valoracions`
--
ALTER TABLE `Valoracions`
  MODIFY `IDValoracio` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
