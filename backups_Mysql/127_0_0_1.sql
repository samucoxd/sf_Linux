-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2019 a las 16:55:37
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sanfernandodb`
--
CREATE DATABASE IF NOT EXISTS `sanfernandodb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `sanfernandodb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlpedido`
--

CREATE TABLE `controlpedido` (
  `idPEdido` int(11) NOT NULL,
  `idNota` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `noFac` int(11) DEFAULT NULL,
  `noClie` int(11) DEFAULT NULL,
  `cliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noVende` int(11) DEFAULT NULL,
  `vendedor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preparacion` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `despacho` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `nulo` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `controlpedido`
--

INSERT INTO `controlpedido` (`idPEdido`, `idNota`, `fecha`, `noFac`, `noClie`, `cliente`, `noVende`, `vendedor`, `preparacion`, `despacho`, `nulo`) VALUES
(1, 85701, '2019-08-08', 4763, 3770, 'GOBIERNO AUTONOMO MUNICIPAL DE SANTA CRUZ', 252, 'RONNY MARTIN HURTADO SANTIAGO', 'S', 'S', 'S'),
(2, 85703, '2019-08-08', 4765, 4120, 'EDWIN LICUONA', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(3, 85704, '2019-08-08', 4766, 3741, 'KAROLINA HUANCA', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(4, 85705, '2019-08-08', 4767, 4416, 'FATIMA MARENA PEREZ ESCALIER', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(5, 85706, '2019-08-08', 4768, 3578, 'TBS FARMA HERNANDO SALDIAS', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(6, 85707, '2019-08-08', 4769, 4760, 'RUTH VASQUEZ TRUJILLO', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(7, 85708, '2019-08-08', 4770, 3149, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(8, 85709, '2019-08-08', 4771, 4510, 'SIN NOMBRE', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(9, 85710, '2019-08-08', 4772, 3042, 'SIN NOMBRE', 3000, 'SF CONTAC CENTER', 'N', 'N', 'N'),
(10, 85712, '2019-08-08', 4774, 3179, 'SIN NOMBRE', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(11, 85713, '2019-08-08', 4775, 3467, 'MARGOTH YOLANDA GAMBOA HINOJOSA', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(12, 85715, '2019-08-08', 4777, 3362, 'HOSPITAL UNIVERSITARIO HERNANDEZ VERA', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(13, 85716, '2019-08-08', 4778, 3280, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(14, 85717, '2019-08-08', 4779, 3411, 'FARMACIA AGUA VIVA', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(15, 85718, '2019-08-08', 4780, 4407, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(16, 85719, '2019-08-08', 4781, 4622, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(17, 85720, '2019-08-08', 4782, 3899, 'JOSE LUIS CARRIZALES SALINAS', 3899, 'JOSE LUIS CARRIZALES SALINAS', 'N', 'N', 'N'),
(18, 85721, '2019-08-08', 4783, 3646, 'JOSE JARILLO', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(19, 85722, '2019-08-08', 4784, 4666, 'MARIA DEISY ESCALERA CHAMBI', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(20, 85723, '2019-08-08', 4785, 3178, 'FARMACIA OKINAWA SRL', 236, 'GUSTAVO MARTINEZ ROJAS', 'N', 'N', 'N'),
(21, 85724, '2019-08-08', 4786, 4295, 'FARMACIA VILLALTA - ELENA FERNANDEZ', 186, 'GRECIA FERNANDEZ PARRA', 'N', 'N', 'N'),
(22, 85725, '2019-08-08', 4787, 3143, 'FARMACIA LOS MANGALES', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(23, 85726, '2019-08-08', 4788, 4759, 'PATRICIA MARTINEZ QUISPE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(24, 85727, '2019-08-08', 4789, 3100, 'SIN NOMBRE', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(25, 85728, '2019-08-08', 4790, 3350, 'YOLANDA ENCINAS ARISPE', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(26, 85729, '2019-08-08', 4791, 3183, 'FARMACIA PANAMERICANA', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(27, 85730, '2019-08-08', 4792, 3380, 'ANA BELLA BALCAZAR GUTIERREZ-FARMACIA SANATODO', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(28, 85731, '2019-08-08', 4793, 4112, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(29, 85732, '2019-08-08', 4794, 3370, 'SIN NOMBRE', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(30, 85733, '2019-08-08', 4795, 3980, 'HOSPITAL CATOLICO SM-HCSM', 206, 'YEFRIGT ANGULO ARTEAGA', 'N', 'N', 'N'),
(31, 85734, '2019-08-08', 4796, 3013, 'FCIA. SANTA CLARA DE ASIS-DORA AJATA', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(32, 85735, '2019-08-08', 4797, 4667, 'MARTHA ORTIZ ACHO VDA. DE VILLARROEL', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(33, 85736, '2019-08-08', 4798, 3007, 'JAFETH S.R.L.', 186, 'GRECIA FERNANDEZ PARRA', 'N', 'N', 'N'),
(34, 85737, '2019-08-08', 4799, 3507, 'APOLINAR SANTIAGO RAMIREZ CHOQUECALLATA', 232, 'PRISCILA SEPTIMO COCA', 'N', 'N', 'N'),
(35, 85738, '2019-08-08', 4800, 3687, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(36, 85739, '2019-08-08', 4801, 3670, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(37, 85740, '2019-08-08', 4802, 3677, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(38, 85741, '2019-08-08', 4803, 3677, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(39, 85742, '2019-08-08', 4804, 3677, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(40, 85742, '2019-08-08', 4805, 3677, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(41, 84783, '2019-07-12', 3861, 4124, 'SIN NOMBRE', 186, 'GRECIA FERNANDEZ PARRA', 'S', 'N', 'N'),
(42, 84784, '2019-07-12', 3862, 3670, 'SIN NOMBRE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(43, 84785, '2019-07-12', 3863, 4338, 'RODRIGO PAZ LIT - FARMACIA FARMATOR', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(44, 84786, '2019-07-12', 3864, 3677, 'JUAN BAUTISTA DURAND VILLAFUERTE', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(45, 84787, '2019-07-12', 3865, 3042, 'SIN NOMBRE', 3000, 'SF CONTAC CENTER', 'N', 'N', 'N'),
(46, 84788, '2019-07-12', 3866, 3178, 'FARMACIA OKINAWA SRL', 236, 'GUSTAVO MARTINEZ ROJAS', 'N', 'N', 'N'),
(47, 84789, '2019-07-12', 3867, 4454, 'DANIELA QUISBERT PAZ', 198, 'GLENIDA ZARATE LLANOS', 'N', 'N', 'N'),
(48, 84790, '2019-07-12', 3868, 3853, 'HIPERMAXI S.A.', 236, 'GUSTAVO MARTINEZ ROJAS', 'N', 'N', 'N'),
(49, 84791, '2019-07-12', 3869, 3221, 'SIN NOMBRE', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(50, 84792, '2019-07-12', 3870, 4545, 'MILEN SHEILA ARNEZ PATINO', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(51, 84793, '2019-07-12', 3871, 3306, 'ADELAIDA ORTUNO CLAROS', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(52, 84794, '2019-07-12', 3872, 4103, 'FARMACIA BUENA VISTA', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(53, 84795, '2019-07-12', 3873, 4752, 'LIZ HEIDY HURTADO BRAMINI', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(54, 84796, '2019-07-12', 3874, 3485, 'SIN NOMBRE', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(55, 84797, '2019-07-12', 3875, 3055, 'YIMMY CALZADILLA VILLARROEL', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(56, 84798, '2019-07-12', 3876, 4240, 'FARMACIA SAN MIGUEL ARCANGEL SUC I', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(57, 84799, '2019-07-12', 3877, 3069, 'VICTORIA GUTIERREZ - FARMACIA CRISTAL', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(58, 84800, '2019-07-12', 3878, 3267, 'CADENA DEL SERVICIO S.R.L.', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(59, 84801, '2019-07-12', 3879, 4746, 'EMMA ESTHELA GANGAS LINERAS', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(60, 84802, '2019-07-12', 3880, 110, 'SIN NOMBRE', 1000, 'SAN FERNANDO S.R.L.', 'N', 'N', 'N'),
(61, 84803, '2019-07-12', 3881, 3083, 'ENNA ORTIZ VARGAS - FARMACIA EL BUEN PASTOR', 186, 'GRECIA FERNANDEZ PARRA', 'N', 'N', 'N'),
(62, 84804, '2019-07-12', 3882, 4681, 'NATALIA MORENO HURTADO', 186, 'GRECIA FERNANDEZ PARRA', 'N', 'N', 'N'),
(63, 84805, '2019-07-12', 3883, 3455, 'ROSSIO DE FATIMA HINOJOSA CABALLERO-HENR', 198, 'GLENIDA ZARATE LLANOS', 'N', 'N', 'N'),
(64, 84806, '2019-07-12', 3884, 3094, 'KATHERINE BROUSET SAAVEDRA', 198, 'GLENIDA ZARATE LLANOS', 'N', 'N', 'N'),
(65, 84807, '2019-07-12', 3885, 4079, 'FARMACIA VELASQUEZ', 198, 'GLENIDA ZARATE LLANOS', 'N', 'N', 'N'),
(66, 84808, '2019-07-12', 3886, 4080, 'SIN NOMBRE', 198, 'GLENIDA ZARATE LLANOS', 'N', 'N', 'N'),
(67, 84809, '2019-07-12', 3887, 4094, 'JUAN JOSE MONTANO MEJIA', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(68, 84810, '2019-07-12', 3888, 3623, 'SIN NOMBRE', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(69, 84811, '2019-07-12', 3889, 3608, 'REINA MEJIA-FARMACIA VIRGEN LA BELLA', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(70, 84812, '2019-07-12', 3890, 3623, 'SIN NOMBRE', 231, 'SILVIA PAOLA SAUCEDO ROBLES', 'N', 'N', 'N'),
(71, 84813, '2019-07-12', 3891, 3995, 'SIN NOMBRE', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(72, 84814, '2019-07-12', 3892, 3622, 'SIN NOMBRE', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(73, 84815, '2019-07-12', 3893, 4276, 'JOSE BALDIVIESO GUERRERO', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(74, 84816, '2019-07-12', 3894, 4449, 'JESICA RIOS CABALLERO', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(75, 84817, '2019-07-12', 3895, 4657, 'VERONICA MAMANI CONDORI', 15, 'DIETMAR VARGAS ANEZ', 'N', 'N', 'N'),
(76, 84818, '2019-07-12', 3896, 3064, 'CARLA VERONICA HUAYHUA CALLE', 53, 'MARCELA CHOQUECALLATA WANARAYA', 'N', 'N', 'N'),
(77, 84819, '2019-07-12', 3897, 4297, 'FARMACIA FARMAMEL-ARCENIO MELENDRES R.', 196, 'OLGA RUBELIA PENALOZA MAURI', 'N', 'N', 'N'),
(78, 84820, '2019-07-12', 3898, 3058, 'FARMACIA CHAVEZ S.A.', 236, 'GUSTAVO MARTINEZ ROJAS', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachoalmacen`
--

CREATE TABLE `despachoalmacen` (
  `idDespacho` int(11) NOT NULL,
  `idNota` int(11) DEFAULT NULL,
  `cobrador` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `horaSalida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `despachoalmacen`
--

INSERT INTO `despachoalmacen` (`idDespacho`, `idNota`, `cobrador`, `fechaSalida`, `horaSalida`) VALUES
(1, 85701, 'sva', '2019-08-06', '08:21:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nulos`
--

CREATE TABLE `nulos` (
  `idNulos` int(11) NOT NULL,
  `idNota` int(11) DEFAULT NULL,
  `fechaNulo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `motivo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nulos`
--

INSERT INTO `nulos` (`idNulos`, `idNota`, `fechaNulo`, `motivo`, `obs`) VALUES
(1, 85701, '2019-08-09 04:09:09', 'ePrecio', 'error de precio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pickingalmacen`
--

CREATE TABLE `pickingalmacen` (
  `idPicking` int(11) NOT NULL,
  `idNota` int(11) DEFAULT NULL,
  `piking` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revision` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `embalaje` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `falla` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaPreparacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pickingalmacen`
--

INSERT INTO `pickingalmacen` (`idPicking`, `idNota`, `piking`, `revision`, `embalaje`, `falla`, `fechaPreparacion`) VALUES
(1, 85701, 'sva', 'ame', 'csb', '', '2019-08-09 04:21:52'),
(2, 84783, 'sva', 'sva', 'sva', 'faltante', '2019-08-09 21:17:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `controlpedido`
--
ALTER TABLE `controlpedido`
  ADD PRIMARY KEY (`idPEdido`),
  ADD UNIQUE KEY `Unique_controlPedido` (`idNota`,`noFac`);

--
-- Indices de la tabla `despachoalmacen`
--
ALTER TABLE `despachoalmacen`
  ADD PRIMARY KEY (`idDespacho`),
  ADD KEY `fk_idDespacho` (`idNota`);

--
-- Indices de la tabla `nulos`
--
ALTER TABLE `nulos`
  ADD PRIMARY KEY (`idNulos`),
  ADD KEY `fk_idNulo` (`idNota`);

--
-- Indices de la tabla `pickingalmacen`
--
ALTER TABLE `pickingalmacen`
  ADD PRIMARY KEY (`idPicking`),
  ADD KEY `FK_Datos_pedido` (`idNota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `controlpedido`
--
ALTER TABLE `controlpedido`
  MODIFY `idPEdido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `despachoalmacen`
--
ALTER TABLE `despachoalmacen`
  MODIFY `idDespacho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `nulos`
--
ALTER TABLE `nulos`
  MODIFY `idNulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pickingalmacen`
--
ALTER TABLE `pickingalmacen`
  MODIFY `idPicking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `despachoalmacen`
--
ALTER TABLE `despachoalmacen`
  ADD CONSTRAINT `fk_idDespacho` FOREIGN KEY (`idNota`) REFERENCES `controlpedido` (`idNota`);

--
-- Filtros para la tabla `nulos`
--
ALTER TABLE `nulos`
  ADD CONSTRAINT `fk_idNulo` FOREIGN KEY (`idNota`) REFERENCES `controlpedido` (`idNota`);

--
-- Filtros para la tabla `pickingalmacen`
--
ALTER TABLE `pickingalmacen`
  ADD CONSTRAINT `FK_Datos_pedido` FOREIGN KEY (`idNota`) REFERENCES `controlpedido` (`idNota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
