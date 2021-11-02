-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-11-2021 a las 04:27:50
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectov0.01`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admintechsupport`
--

CREATE TABLE `admintechsupport` (
  `ID_Admin` int(255) NOT NULL,
  `Matricula_Profesor` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Matricula` int(255) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido1` varchar(100) NOT NULL,
  `Apellido2` varchar(100) NOT NULL,
  `Telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras`
--

CREATE TABLE `computadoras` (
  `ID_Computadora` int(255) NOT NULL,
  `Marca` text NOT NULL,
  `Modelo` text NOT NULL,
  `Procesador` text NOT NULL,
  `Memoria_RAM` text NOT NULL,
  `HDD` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cubiculo`
--

CREATE TABLE `cubiculo` (
  `Matricula_Profesor` int(255) NOT NULL,
  `Num_Edificio` varchar(100) NOT NULL,
  `ID_PC` int(255) NOT NULL,
  `Num_Cubiculo` int(255) NOT NULL,
  `Informacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

CREATE TABLE `edificio` (
  `Num_Edificio` varchar(100) NOT NULL,
  `Facultad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

CREATE TABLE `formato` (
  `ID_Formato` int(255) NOT NULL,
  `Nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `Matricula` int(255) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido1` varchar(100) NOT NULL,
  `Apellido2` varchar(100) NOT NULL,
  `Telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `Num_Edificio` varchar(100) NOT NULL,
  `Num_Salon` int(255) NOT NULL,
  `ID_PC` int(255) NOT NULL,
  `Numero` int(255) NOT NULL,
  `Informacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `techsupport`
--

CREATE TABLE `techsupport` (
  `ID_TechSuport` int(255) NOT NULL,
  `Matricula_Alumno` int(255) NOT NULL,
  `ID_Admin` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admintechsupport`
--
ALTER TABLE `admintechsupport`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD KEY `FK_MatriculaProfesor` (`Matricula_Profesor`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Matricula`);

--
-- Indices de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD PRIMARY KEY (`ID_Computadora`);

--
-- Indices de la tabla `cubiculo`
--
ALTER TABLE `cubiculo`
  ADD KEY `Matricula_Profesor` (`Matricula_Profesor`),
  ADD KEY `Num_Edificio` (`Num_Edificio`),
  ADD KEY `ID_PC` (`ID_PC`);

--
-- Indices de la tabla `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`Num_Edificio`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`Matricula`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD KEY `FK_PC` (`ID_PC`),
  ADD KEY `FK_Edificio` (`Num_Edificio`);

--
-- Indices de la tabla `techsupport`
--
ALTER TABLE `techsupport`
  ADD PRIMARY KEY (`ID_TechSuport`),
  ADD KEY `FK_Matricula` (`Matricula_Alumno`),
  ADD KEY `FK_Admin` (`ID_Admin`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admintechsupport`
--
ALTER TABLE `admintechsupport`
  ADD CONSTRAINT `admintechsupport_ibfk_1` FOREIGN KEY (`Matricula_Profesor`) REFERENCES `maestro` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD CONSTRAINT `computadoras_ibfk_1` FOREIGN KEY (`ID_Computadora`) REFERENCES `cubiculo` (`ID_PC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cubiculo`
--
ALTER TABLE `cubiculo`
  ADD CONSTRAINT `cubiculo_ibfk_1` FOREIGN KEY (`Matricula_Profesor`) REFERENCES `maestro` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cubiculo_ibfk_2` FOREIGN KEY (`Num_Edificio`) REFERENCES `edificio` (`Num_Edificio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salon`
--
ALTER TABLE `salon`
  ADD CONSTRAINT `salon_ibfk_1` FOREIGN KEY (`Num_Edificio`) REFERENCES `edificio` (`Num_Edificio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salon_ibfk_2` FOREIGN KEY (`ID_PC`) REFERENCES `computadoras` (`ID_Computadora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `techsupport`
--
ALTER TABLE `techsupport`
  ADD CONSTRAINT `techsupport_ibfk_1` FOREIGN KEY (`Matricula_Alumno`) REFERENCES `alumno` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `techsupport_ibfk_2` FOREIGN KEY (`ID_Admin`) REFERENCES `admintechsupport` (`ID_Admin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
