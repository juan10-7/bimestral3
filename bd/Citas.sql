-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-09-2026 a las 15:24:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centro_medico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Citas`
--

CREATE TABLE `Citas` (
  `id_cita` int(11) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `estado_cita` enum('Asignado','Atendido') NOT NULL,
  `observaciones_cita` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Citas`
--
ALTER TABLE `Citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_consultorio` (`id_consultorio`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Citas`
--
ALTER TABLE `Citas`
  ADD CONSTRAINT `Citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Citas_ibfk_3` FOREIGN KEY (`id_consultorio`) REFERENCES `Consultorios` (`id_consultorio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
