-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-06-2022 a las 19:11:50
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turno_facil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MEDICO`
--

CREATE TABLE `MEDICO` (
  `id_medico` int(11) NOT NULL,
  `id_secretaria` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `nombre_medico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OBRA_SOCIAL`
--

CREATE TABLE `OBRA_SOCIAL` (
  `nombre_corto` varchar(10) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `nombre_largo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PACIENTE`
--

CREATE TABLE `PACIENTE` (
  `dni_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `id_afiliado` int(11) DEFAULT NULL,
  `telefono` varchar(16) NOT NULL,
  `id_obra_social` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SECRETARIA`
--

CREATE TABLE `SECRETARIA` (
  `id_secretaria` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TRABAJA_CON`
--

CREATE TABLE `TRABAJA_CON` (
  `id_medico` int(11) NOT NULL,
  `id_obra_social` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TURNO`
--

CREATE TABLE `TURNO` (
  `id_turno` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `dni_paciente` int(11) DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `MEDICO`
--
ALTER TABLE `MEDICO`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `MEDICOS_AK_USERNAME` (`username`),
  ADD KEY `MEDICO_SECRETARIA` (`id_secretaria`);

--
-- Indices de la tabla `OBRA_SOCIAL`
--
ALTER TABLE `OBRA_SOCIAL`
  ADD PRIMARY KEY (`id_obra_social`);

--
-- Indices de la tabla `PACIENTE`
--
ALTER TABLE `PACIENTE`
  ADD PRIMARY KEY (`dni_paciente`),
  ADD KEY `PACIENTE_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `SECRETARIA`
--
ALTER TABLE `SECRETARIA`
  ADD PRIMARY KEY (`id_secretaria`);

--
-- Indices de la tabla `TRABAJA_CON`
--
ALTER TABLE `TRABAJA_CON`
  ADD PRIMARY KEY (`id_medico`,`id_obra_social`),
  ADD KEY `TRABAJA_CON_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `TURNO`
--
ALTER TABLE `TURNO`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `TURNO_MEDICO` (`id_medico`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `MEDICO`
--
ALTER TABLE `MEDICO`
  ADD CONSTRAINT `MEDICO_SECRETARIA` FOREIGN KEY (`id_secretaria`) REFERENCES `SECRETARIA` (`id_secretaria`);

--
-- Filtros para la tabla `PACIENTE`
--
ALTER TABLE `PACIENTE`
  ADD CONSTRAINT `PACIENTE_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `OBRA_SOCIAL` (`id_obra_social`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `TRABAJA_CON`
--
ALTER TABLE `TRABAJA_CON`
  ADD CONSTRAINT `TRABAJA_CON_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`),
  ADD CONSTRAINT `TRABAJA_CON_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `OBRA_SOCIAL` (`id_obra_social`);

--
-- Filtros para la tabla `TURNO`
--
ALTER TABLE `TURNO`
  ADD CONSTRAINT `TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
