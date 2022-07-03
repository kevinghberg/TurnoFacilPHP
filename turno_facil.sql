-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2022 a las 01:40:45
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

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
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `id_secretaria` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `nombre_medico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `id_secretaria`, `username`, `password`, `especialidad`, `nombre_medico`) VALUES
(1, 1, 'medico1', '1234', 'especialidad1', 'medico 1'),
(2, 1, 'medico2', '1234', 'especialidad2', 'medico 2'),
(3, 1, 'medico3', '1234', 'especialidad1', 'medico 3'),
(4, 2, 'medico4', '1234', 'especialidad1', 'medico 4'),
(5, 3, 'medico5', '1234', 'especialidad4', 'medico 5'),
(6, 4, 'medico6', '1234', 'especialidad2', 'medico 6'),
(7, 2, 'medico7', '1234', 'especialidad1', 'medico 7'),
(8, 3, 'medico8', '1234', 'especialidad4', 'medico 8'),
(9, 4, 'medico9', '1234', 'especialidad2', 'medico 9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_turnos`
--

CREATE TABLE `medico_turnos` (
  `id_medico` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico_turnos`
--

INSERT INTO `medico_turnos` (`id_medico`, `id_turno`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_social`
--

CREATE TABLE `obra_social` (
  `nombre_corto` varchar(10) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `nombre_largo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `obra_social`
--

INSERT INTO `obra_social` (`nombre_corto`, `id_obra_social`, `nombre_largo`) VALUES
('o1', 1, 'obra_1'),
('02', 2, 'obra_2'),
('o3', 3, 'obra_3'),
('04', 4, 'obra_4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `dni_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `id_afiliado` int(11) DEFAULT NULL,
  `telefono` varchar(16) NOT NULL,
  `id_obra_social` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`dni_paciente`, `nombre_paciente`, `apellido`, `password`, `direccion`, `id_afiliado`, `telefono`, `id_obra_social`) VALUES
(1, 'paciente', '1', '1234', '1', 213, '123123', 1),
(2, 'paciente', '2', '1234', 'fasd', 12345, '123421412', 1),
(3, 'paciente', '3', '1234', 'fas', 12, '22222', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id_secretaria` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id_secretaria`, `username`, `password`) VALUES
(1, 'secretaria1', '1234'),
(2, 'secretaria2', '1234'),
(3, 'secretaria3', '1234'),
(4, 'secretaria4', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabaja_con`
--

CREATE TABLE `trabaja_con` (
  `id_medico` int(11) NOT NULL,
  `id_obra_social` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabaja_con`
--

INSERT INTO `trabaja_con` (`id_medico`, `id_obra_social`) VALUES
(1, 2),
(2, 1),
(3, 2),
(4, 3),
(5, 1),
(6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `dni_paciente` int(11) DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL,
  `confirmado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `id_medico`, `dni_paciente`, `disponible`, `fecha`, `confirmado`) VALUES
(1, 1, 1, 0, '2022-08-18 14:42:59', 1),
(2, 1, 1, 0, '2022-07-11 03:42:59', 1),
(3, 2, 3, 0, '2022-07-14 11:47:59', 1),
(4, 3, 3, 0, '2022-07-29 05:42:59', 1),
(5, 3, NULL, 1, '2022-07-30 09:04:59', 0),
(6, 4, NULL, 1, '2022-07-02 03:42:59', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `MEDICOS_AK_USERNAME` (`username`),
  ADD KEY `MEDICO_SECRETARIA` (`id_secretaria`);

--
-- Indices de la tabla `medico_turnos`
--
ALTER TABLE `medico_turnos`
  ADD PRIMARY KEY (`id_medico`,`id_turno`),
  ADD KEY `medico_turnos_turno` (`id_turno`);

--
-- Indices de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  ADD PRIMARY KEY (`id_obra_social`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`dni_paciente`),
  ADD KEY `PACIENTE_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id_secretaria`);

--
-- Indices de la tabla `trabaja_con`
--
ALTER TABLE `trabaja_con`
  ADD PRIMARY KEY (`id_medico`,`id_obra_social`),
  ADD KEY `TRABAJA_CON_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `TURNO_MEDICO` (`id_medico`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `MEDICO_SECRETARIA` FOREIGN KEY (`id_secretaria`) REFERENCES `secretaria` (`id_secretaria`);

--
-- Filtros para la tabla `medico_turnos`
--
ALTER TABLE `medico_turnos`
  ADD CONSTRAINT `medico_turnos_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `medico_turnos_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `PACIENTE_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `trabaja_con`
--
ALTER TABLE `trabaja_con`
  ADD CONSTRAINT `TRABAJA_CON_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `TRABAJA_CON_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
