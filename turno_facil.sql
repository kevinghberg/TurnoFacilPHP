-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2022 a las 06:07:37
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
(1, 1, 'medico_1', 'cabezas', 'General', 'Lucas Cipolletti'),
(2, 1, 'medico_2', '12345678', 'Cardiologo', 'Augusto Poletti'),
(3, 2, 'medico_3', '12345678', 'Covid', 'Gavarrino'),
(4, 2, 'medico_4', '12345678', 'Kinisiologo', 'Juani Tironi'),
(5, 1, 'medico_5', '12345678', 'Covid', 'Ruth Calles');

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
('OSDE', 1, 'OSDE'),
('UATRE', 2, 'UATRE');

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
(17297597, 'Gustavo Daniel', 'Sierra', '15505241', '79 335', NULL, '2262617462', NULL),
(18472306, 'Cecilia', 'Barenbaum', '15505241', '71 484', 456489146, '2262351852', 1),
(39146705, 'Gustavo', 'Sierra', '15505241', '71 484', NULL, '2262516630', NULL);

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
(1, 'secretaria_1', '12345678'),
(2, 'secretaria_2', '12345678');

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
(1, 1),
(2, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `dni_paciente` int(11) DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL,
  `confirmado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `id_medico`, `dni_paciente`, `disponible`, `fecha`, `confirmado`) VALUES
(1, 1, NULL, 1, '2022-06-30 12:00:00', 0),
(2, 1, NULL, 0, '2022-07-01 13:00:00', 1),
(3, 2, 18472306, 0, '2022-07-02 13:00:00', 1),
(4, 3, NULL, 1, '2022-07-04 06:01:47', 0),
(5, 1, NULL, 1, '2022-07-13 01:04:00', 0);

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
  ADD KEY `TURNO_MEDICO` (`id_medico`),
  ADD KEY `TURNO_PACIENTE` (`dni_paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `MEDICO_SECRETARIA` FOREIGN KEY (`id_secretaria`) REFERENCES `secretaria` (`id_secretaria`);

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
  ADD CONSTRAINT `TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `TURNO_PACIENTE` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
