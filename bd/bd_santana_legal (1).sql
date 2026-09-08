-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-09-2026 a las 13:35:27
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
-- Base de datos: `bd_santana_legal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `tipo_derecho` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `problema` text NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_usuario`, `id_servicio`, `tipo_derecho`, `fecha`, `hora`, `problema`, `estado`) VALUES
(1, 2, 6, 'Derecho laboral', '2026-08-08', '12:30:00', 'no me quieren pagar', 'pendiente'),
(2, 2, 20, 'Derecho familiar', '2007-07-08', '00:12:00', 'ghfjhgjhg', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Consulta familiar', 'Asesoría sobre asuntos relacionados con el derecho familiar.', 80000.00),
(2, 'Divorcio', 'Asesoría jurídica relacionada con procesos de divorcio.', 800000.00),
(3, 'Custodia de hijos', 'Asesoría en procesos relacionados con la custodia de menores.', 500000.00),
(4, 'Alimentos', 'Asesoría relacionada con obligaciones alimentarias.', 400000.00),
(5, 'Consulta laboral', 'Orientación sobre derechos y obligaciones laborales.', 80000.00),
(6, 'Liquidación laboral', 'Revisión y cálculo de una liquidación laboral.', 120000.00),
(7, 'Despido injustificado', 'Asesoría relacionada con posibles despidos injustificados.', 500000.00),
(8, 'Revisión de contrato', 'Revisión jurídica de contratos laborales.', 150000.00),
(9, 'Consulta civil', 'Asesoría sobre situaciones relacionadas con el derecho civil.', 80000.00),
(10, 'Elaboración de contrato', 'Elaboración y revisión de contratos civiles.', 200000.00),
(11, 'Incumplimiento de contrato', 'Asesoría frente al incumplimiento de obligaciones contractuales.', 500000.00),
(12, 'Responsabilidad civil', 'Asesoría en procesos relacionados con responsabilidad civil.', 600000.00),
(13, 'Consulta comercial', 'Asesoría sobre asuntos comerciales y empresariales.', 100000.00),
(14, 'Contrato comercial', 'Elaboración y revisión de contratos comerciales.', 250000.00),
(15, 'Asesoría para empresas', 'Orientación jurídica para empresas y negocios.', 300000.00),
(16, 'Constitución de empresa', 'Asesoría para la creación y constitución de una empresa.', 400000.00),
(17, 'Consulta penal', 'Orientación inicial sobre situaciones relacionadas con derecho penal.', 100000.00),
(18, 'Asesoría en proceso penal', 'Asesoría jurídica durante un proceso penal.', 500000.00),
(19, 'Defensa penal', 'Servicio de defensa y acompañamiento jurídico.', 1000000.00),
(20, 'Acompañamiento jurídico', 'Acompañamiento durante diferentes actuaciones jurídicas.', 300000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha_solicitud` datetime NOT NULL DEFAULT current_timestamp(),
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','administrador') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `correo`, `telefono`, `password`, `rol`) VALUES
(1, 'Administrador', 'Santana', 'admin@santanalegal.com', '3000000000', '123456', 'administrador'),
(2, 'juan', 'cala', 'juansantana@gmail.com', '3212178690', '$2y$10$Z8WacALJZmr9iDslEtnD/u1XMPpWjxgcQ47o2XtjHwY5Fovd7N3qC', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `fk_cita_usuario` (`id_usuario`),
  ADD KEY `fk_cita_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `fk_solicitud_usuario` (`id_usuario`),
  ADD KEY `fk_solicitud_servicio` (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_cita_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `fk_cita_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk_solicitud_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `fk_solicitud_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
