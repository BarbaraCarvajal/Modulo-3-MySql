-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-03-2023 a las 22:44:52
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `capacitacionesEmpresa`
USE capemp2;
--
/*1. Genere un set de consultas que permitan crear las tablas indicadas en el modelo. 
Tenga en consideración las llaves primarias, los tipos de dato indicados y las condiciones de nulidad.
*//*2. Desarrolle consultas que permitan crear las llaves foráneas antes indicadas, respetando el
sentido lógico de su creación.*/
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Accidente`
--

CREATE TABLE `Accidente` (
  `idAccidente` int(9) NOT NULL,
  `Dia` date NOT NULL,
  `Hora` time NOT NULL,
  `Lugar` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Origen` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Consecuencias` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Cliente_rutCliente` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


UPDATE `accidente` SET `Dia` = STR_TO_DATE(`Dia`, '%d/%m/%Y');
ALTER TABLE `accidente` MODIFY `Dia` DATE;

ALTER TABLE `capemp2`.`accidente` 
CHANGE COLUMN `Hora` `Hora` TIME NOT NULL ;

ALTER TABLE `capemp2`.`accidente` 
CHANGE COLUMN `Hora` `Hora` DATE NOT NULL ;

 -- (Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

CREATE TABLE `asistentes` (
  `idAsistentes` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `capacitacion_idCapacitacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `asistentes`
--

INSERT INTO `asistentes` (`idAsistentes`, `nombres`, `edad`, `capacitacion_idCapacitacion`) VALUES
(1, 'Consuelo Magana', 30, 1),
(2, 'Barbara Carvajal', 29, 2),
(3, 'Ana Espinoza', 31, 3),
(4, 'Rodrigo Soto', 29, 4),
(5, 'Manuel Rodriguez', 28, 5),
(6, 'Maria de la Rosa ', 39, 5),
(7, 'Camilo Monsalves', 45, 7),
(8, 'Camila Cid', 20, 3),
(9, 'Vicente Poblete', 40, 3),
(10, 'Romina Cornejo', 45, 3),
(11, 'Maria Jose Quintanilla', 28, 1),
(12, 'Karen Paola', 32, 3),
(13, 'Marciake', 25, 4),
(14, 'Profesor Rosa', 58, 2),
(15, 'Cat-Dog', 66, 1),
(16, 'camila ignacia', 23, 2),
(17, 'hugo boss', 18, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion`
--

CREATE TABLE `capacitacion` (
  `idCapacitacion` int(11) NOT NULL,
  `rutCliente` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dia` varchar(25) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `hora` varchar(5) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `lugar` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `duracion` int(11) NOT NULL,
  `cantAsistentes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `capacitacion`
--

INSERT INTO `capacitacion` (`idCapacitacion`, `rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantAsistentes`) VALUES
(1, '17.355.848-1', 'lunes', '15:00', 'Unab', 60, 15),
(2, '20.067.238-0', 'martes', '16:00', 'UPLA', 45, 20),
(3, '24.361.222-5', 'miercoles', '17:00', 'Unab', 120, 50),
(4, '18.942.234-k', 'jueves', '12:00', 'UFSM', 60, 30),
(5, '20.348.718-2', 'sabado', '9:00', 'UC', 180, 50),
(6, '1.284.648-7', 'lunes', '10:00', 'Unab', 120, 30),
(7, '6.750.958-7', 'martes', '11:00', 'UC', 45, 10),
(8, '6.677.542-7', 'miercoles', '12:00', 'UFSM', 60, 20),
(9, '17.949.679-1', 'jueves', '15:00', 'Unab', 180, 25),
(10, '14.843.818-7', 'viernes', '', 'UPLA', 45, 15),
(11, '17.789.848-1', 'lunes', '15:00', 'La Florida', 60, 70),
(12, '15.344.298-7', 'martes', '16:00', 'Quilpue', 8, 20),
(13, '12.355.238-0', 'miercoles', '15:00', 'La Florida', 60, 55),
(14, '20.555.218-2', 'martes', '16:00', 'Quilpue', 8, 31),
(15, '19.546.673-8', 'sabado', '9:00', 'La Florida', 60, 70),
(16, '14.426.874-k', 'sabado', '8:00', 'Vina del Mar', 60, 20),
(17, '9.364.569-k', 'viernes', '10:00', 'La Florida', 29, 55),
(18, '13.714.941-0', 'miercoles', '11:00', 'Valparaiso', 20, 51),
(19, '1-9', 'domingo', '9:00', 'La Florida', 50, 70),
(20, '2-7', 'lunes', '8:00', 'Vina del Mar', 45, 20),
(21, '12.988.343-8', 'martes', '10:30', 'municiapalidad quilpue', 60, 20),
(22, '10.454.222-0', 'lunes', '12:30', 'Duoc Vinia del mar', 45, 5),
(23, '79.233.989-2', 'miercoles', '13:20', 'Santa Maria', 20, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `rutCliente` int(9) NOT NULL,
  `Nombres` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Apellidos` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Telefono` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `AFP` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SistemaSalud` int(2) DEFAULT NULL,
  `Direccion` varchar(70) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Comuna` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Accidente`
--
ALTER TABLE `Accidente`
  ADD PRIMARY KEY (`idAccidente`),
  ADD KEY `Cliente_rutCliente` (`Cliente_rutCliente`);

--
-- Indices de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD PRIMARY KEY (`idAsistentes`),
  ADD UNIQUE KEY `nombres_unicos` (`nombres`),
  ADD KEY `capacitacion_idCapacitacion` (`capacitacion_idCapacitacion`);

--
-- Indices de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`idCapacitacion`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`rutCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  MODIFY `idAsistentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  MODIFY `idCapacitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Accidente`
--
ALTER TABLE `Accidente`
  ADD CONSTRAINT `accidente_ibfk_1` FOREIGN KEY (`Cliente_rutCliente`) REFERENCES `Cliente` (`rutCliente`);

--
-- Filtros para la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD CONSTRAINT `capacitacion_idCapacitacion` FOREIGN KEY (`capacitacion_idCapacitacion`) REFERENCES `capacitacion` (`idCapacitacion`);
COMMIT;


/*
3. Genere una consulta que permita crear una restricción de valor único sobre el campo “telefono” de la tabla Cliente.
*/

ALTER TABLE cliente ADD CONSTRAINT uk_telefono UNIQUE (telefono);

/* 4. Genere una consulta que permita restringir los valores posibles del campo sistemasalud de la tabla Cliente al conjunto {1,2}.*/

ALTER TABLE cliente
ADD CONSTRAINT chk_sistemasalud CHECK (sistemasalud IN (1,2));


/*
5. Genere las consultas para insertar cuatro registros en la tabla Cliente, y consultas para insertar siete registros en la tabla Accidente, asociados a los clientes recién ingresados.*/

INSERT into Cliente 
(rutcliente, nombres, apellidos, telefono, afp, sistemasalud, direccion, comuna, edad)
VALUES
('125669098', 'camila', 'barb', 23443255, 'modelo', 1, 'calle 1234', 'quilpue', 29),
('134666094', 'angus', 'parrila', 23478900, 'provida', 2, 'calle 9900', 'villa alemana', 33),
('115660998', 'mokita', 'latte', 99988856, 'provida', 2, 'calle 3333', 'valparaiso', 43),
('165662798', 'paulina', 'mena', 3334487, 'modelo', 1, 'calle 1234', 'limache', 65);


INSERT INTO Accidente (idAccidente, Dia, Hora, Lugar, Origen, Consecuencias, Cliente_rutCliente) 
VALUES (1, '2023-03-03', '14:30:00', 'Puente cancha', 'choque con camion', 'heridas graves', 125669098), 
       (2, '2022-08-13', '12:30:00', 'Canal Chacao', 'frenos cortados', 'muerte', 134666094), 
       (3, '2023-03-01', '15:30:00', 'edificio 1b', 'se le cae material pesado encima', 'Estado Vegetal', 115660998), 
       (4, '2023-02-28', '00:29:00', 'mezcla materiales', 'se resbala sobre la mezcladora de cemento', 'muerte', 165662798),
       (5, '2023-01-14', '12:16:00', 'Lugar del accidente', 'lluvia, camino humedo', 'heridas leves', 123456789), 
       (6, '2023-03-15', '11:23:00', 'Lugar del accidente', 'sin casco', 'se le rompe la cabeza y se muere', 123486789), 
       (7, '2023-02-02', '12:45:00', 'entrada al trabajo', 'atropellado por camion gigante', 'heridas leves', 189456789);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
