-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2022 a las 00:00:53
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
-- Base de datos: `videojuegospring`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `idComprador` int(11) NOT NULL,
  `idDistribuidora` int(11) DEFAULT NULL,
  `idVideojuego` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `aPaterno` varchar(45) DEFAULT NULL,
  `aMaterno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprador`
--

INSERT INTO `comprador` (`idComprador`, `idDistribuidora`, `idVideojuego`, `nombre`, `aPaterno`, `aMaterno`, `email`, `direccion`, `telefono`, `fechaNacimiento`, `sexo`) VALUES
(8, 6, 2, 'Alejnadro', 'Arenas', 'Juarwez', 'ale@email.com', 'Valle de chaclo', 5599999999, '2022-01-05', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidora`
--

CREATE TABLE `distribuidora` (
  `idDistribuidora` int(11) NOT NULL,
  `idVideojuego` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `numSedes` int(11) DEFAULT NULL,
  `formatoDistribuidora` varchar(45) DEFAULT NULL,
  `horarioApertura` time DEFAULT NULL,
  `paginaWeb` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distribuidora`
--

INSERT INTO `distribuidora` (`idDistribuidora`, `idVideojuego`, `nombre`, `numSedes`, `formatoDistribuidora`, `horarioApertura`, `paginaWeb`, `pais`) VALUES
(4, 2, 'Gamers', 1, 'Online', '02:00:00', 'https:\\\\gamers.com', 'Mexico'),
(6, 6, 'Gamesss', 3, 'Fisica', '14:38:00', 'https:\\\\sony.com', 'Mexico'),
(7, 7, 'JuegosTotal', 0, 'Online', '15:08:00', 'https:\\\\juegostotal.com', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `locacion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `numEmpleados` int(11) DEFAULT NULL,
  `sitioWeb` varchar(45) DEFAULT NULL,
  `fundacion` date DEFAULT NULL,
  `juegosPublicados` int(11) DEFAULT NULL,
  `ceo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombre`, `locacion`, `correo`, `numEmpleados`, `sitioWeb`, `fundacion`, `juegosPublicados`, `ceo`) VALUES
(1, 'Sony', 'Estados Unidos', 'sony@sonyentretainment.com', 12000, 'https://sony.com', '1990-03-01', 34, 'Joseph Santiago'),
(3, 'Servicios Administrativos GZM S de RL', 'Mexico', 'namco@email.com', 3444, 'https://namco.jp', '2022-03-03', 23, 'Brandon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idJugador` int(11) NOT NULL,
  `idVideojuego` int(11) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `clan` varchar(45) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `victorias` int(11) DEFAULT NULL,
  `horasJugadas` time DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`idJugador`, `idVideojuego`, `alias`, `pais`, `clan`, `nivel`, `victorias`, `horasJugadas`, `telefono`, `fechaNacimiento`, `sexo`) VALUES
(2, 2, 'asdas', 'asdas', 'asdasd+manz', 333, 0, '12:03:00', 5512312312, '2022-03-08', 'Masculino'),
(3, 7, 'Letters', 'Mexico', 'Zeenz', 199, 99, '16:00:00', 5599999999, '2022-03-09', 'Masculino'),
(4, 6, 'Man', 'Cuba', 'manss', 44, 23, '16:09:00', 5512121212, '2022-03-01', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `idVideojuego` int(11) NOT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `clasificacion` char(1) DEFAULT NULL,
  `numeroJugadores` int(11) DEFAULT NULL,
  `fechaLanzamiento` date DEFAULT NULL,
  `codigoBarras` bigint(20) DEFAULT NULL,
  `formato` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `almacenamiento` int(11) DEFAULT NULL,
  `idioma` varchar(45) DEFAULT NULL,
  `plataforma` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`idVideojuego`, `idEmpresa`, `titulo`, `clasificacion`, `numeroJugadores`, `fechaLanzamiento`, `codigoBarras`, `formato`, `precio`, `almacenamiento`, `idioma`, `plataforma`) VALUES
(2, 1, 'Nier Automata', 'M', 1, '2022-03-02', 4939393866, 'Fisico', 2222, 44, 'EspaÃ±ol', 'PS4'),
(3, 1, 'PES', 'M', 2, '2022-03-02', 5998898895, 'Digital', 1000, 60, 'Multi', 'Xbox'),
(4, 1, 'PES', 'M', 2, '2022-03-03', 559988988, 'Digital', 1000, 4, 'Multi', 'Xbox'),
(5, 1, 'PES', 'M', 3, '2022-03-03', 559988988, 'Digital', 1000, 60, 'Multi', 'Xbox'),
(6, 1, 'PES', 'M', 2, '2022-03-03', 5599889889, 'Digital', 1000, 60, 'Multi', 'Xbox'),
(7, 1, 'Assassins Cred', 'T', 1, '2022-03-02', 5599889880, 'Digital', 1000, 60, 'Ingles', 'Xbox One/ Series S/X');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`idComprador`),
  ADD KEY `idDistribuidora` (`idDistribuidora`),
  ADD KEY `idVideojuego` (`idVideojuego`);

--
-- Indices de la tabla `distribuidora`
--
ALTER TABLE `distribuidora`
  ADD PRIMARY KEY (`idDistribuidora`),
  ADD KEY `idVideojuego` (`idVideojuego`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idJugador`),
  ADD KEY `idVideojuego` (`idVideojuego`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`idVideojuego`),
  ADD KEY `idEmpresa` (`idEmpresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprador`
--
ALTER TABLE `comprador`
  MODIFY `idComprador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `distribuidora`
--
ALTER TABLE `distribuidora`
  MODIFY `idDistribuidora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idJugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `idVideojuego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD CONSTRAINT `comprador_ibfk_1` FOREIGN KEY (`idDistribuidora`) REFERENCES `distribuidora` (`idDistribuidora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comprador_ibfk_2` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `distribuidora`
--
ALTER TABLE `distribuidora`
  ADD CONSTRAINT `distribuidora_ibfk_1` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
