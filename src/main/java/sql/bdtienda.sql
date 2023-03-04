-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2022 a las 20:41:48
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdtienda2`
--
CREATE DATABASE IF NOT EXISTS `bdtienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdtienda`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spAddArticulo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddArticulo` (IN `coda` CHAR(6), IN `codacateg` CHAR(5), IN `descu` VARCHAR(100), IN `precio` DECIMAL(8,1), IN `stock` INT(11), IN `imagen` VARCHAR(100))   BEGIN
insert into articulos values (coda, codacateg, descu,precio,stock,imagen);
END$$

DROP PROCEDURE IF EXISTS `spAddcliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddcliente` (IN `coda` CHAR(8), IN `ape` VARCHAR(30), IN `nom` VARCHAR(30), IN `addres` VARCHAR(30), IN `email` VARCHAR(30), IN `fechanac` INT(11), IN `clave` CHAR(8))   BEGIN
insert into clientes values (coda,ape, nom,addres,email,fechanac,clave);
END$$

DROP PROCEDURE IF EXISTS `SPdetalle`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdetalle` (`fac` CHAR(8), `coda` CHAR(6), `can` INT, `talla` CHAR(1))   BEGIN
insert into facdet values (fac,coda, can,talla);
update articulos set stock= stock -can where idarticulo=coda;
END$$

DROP PROCEDURE IF EXISTS `SPFACTURA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPFACTURA` (IN `codc` CHAR(8), IN `tot` NUMERIC(8,1))   BEGIN
 DECLARE nro INT;
  DECLARE fac CHAR(8);
  SET @now = NOW();
  SET @fecha_actual = DATE_FORMAT(@now, '%Y-%m-%d');
  SELECT IFNULL(MAX(nrofactura), 0) + 1  INTO nro FROM faccab;
  SET fac = LPAD(nro, 8, '0');
  INSERT INTO faccab VALUES (fac, @fecha_actual, codc, tot);
  SELECT fac; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `IdArticulo` char(6) NOT NULL,
  `IdCategoria` char(5) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `PrecioUnidad` decimal(8,1) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Imagen` varchar(100) NOT NULL,
  `Idsubcateg` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`IdArticulo`, `IdCategoria`, `Descripcion`, `PrecioUnidad`, `Stock`, `Imagen`, `Idsubcateg`) VALUES
('ART01', 'CAT04', 'Novedad 1', '20.0', 14, 'Novedad/polo1.webp', 'SUBCAT01'),
('ART02', 'CAT04', 'Novedad 2', '19.0', 14, 'Novedad/polo2.webp', 'SUBCAT02'),
('ART03', 'CAT04', 'Novedad 3', '94.0', 15, 'Novedad/pantalon1.webp', 'SUBCAT01'),
('ART04', 'CAT04', 'Novedad 4', '16.0', 16, 'Novedad/polo3.webp', 'SUBCAT01'),
('ART05', 'CAT04', 'Novedad 5', '16.0', 18, 'Novedad/polo1.webp', 'SUBCAT01'),
('ART06', 'CAT02', 'Casaca Plumas Hombre University Club', '199.9', 25, 'Hombres/Casacas/c1.PNG', 'SUBCAT05'),
('ART07', 'CAT02', 'Casaca Hombre Ecko', '229.9', 30, 'Hombres/Casacas/C2.PNG', 'SUBCAT05'),
('ART08', 'CAT02', 'Casaca Hombre Mango', '499.9', 35, 'Hombres/Casacas/c3.PNG', 'SUBCAT05'),
('ART09', 'CAT02', 'Casaca Hombre Jack & Jones', '229.9', 30, 'Hombres/Casacas/c4.PNG', 'SUBCAT05'),
('ART10', 'CAT02', 'Pantalón Hombre Oliva Newport', '99.9', 25, 'Hombres/Pantalones/p1.PNG', 'SUBCAT03'),
('ART11', 'CAT02', 'Pantalon Jogger Hombre', '99.9', 20, 'Hombres/Pantalones/p2.PNG', 'SUBCAT03'),
('ART12', 'CAT02', 'Pantalón Hombre Crema', '199.9', 35, 'Hombres/Pantalones/p3.PNG', 'SUBCAT03'),
('ART13', 'CAT02', 'Pantalon Drill Stretch Hombre', '149.9', 30, 'Hombres/Pantalones/p4.PNG', 'SUBCAT03'),
('ART14', 'CAT02', 'Polo Manga Corta Hombre', '69.9', 30, 'Hombres/Polos/p1.PNG', 'SUBCAT02'),
('ART15', 'CAT02', 'Polo Manga Corta Hombre', '69.9', 30, 'Hombres/Polos/p2.PNG', 'SUBCAT02'),
('ART16', 'CAT02', 'Polo Manga Corta Hombre', '89.9', 15, 'Hombres/Polos/p3.PNG', 'SUBCAT02'),
('ART17', 'CAT02', 'Polo Manga Corta 100% Algodon Hombre Newport', '39.9', 20, 'Hombres/Polos/p4.PNG', 'SUBCAT02'),
('ART18', 'CAT02', 'Zapatillas Urbanas Hombre Adidas Breaknet', '219.9', 12, 'Hombres/Zapatillas/z1.PNG', 'SUBCAT07'),
('ART19', 'CAT02', 'Zapatos Casuales Hombre Actvitta', '159.9', 7, 'Hombres/Zapatillas/z2.PNG', 'SUBCAT07'),
('ART20', 'CAT02', 'Zapatillas Urbanas Hombre Skechers Arch Fit', '309.9', 5, 'Hombres/Zapatillas/z3.PNG', 'SUBCAT07'),
('ART21', 'CAT02', 'Zapatillas Converse Leather', '329.9', 4, 'Hombres/Zapatillas/z4.PNG', 'SUBCAT07'),
('ART22', 'CAT02', 'Zapato de Vestir Hombre Whiddon Pace', '529.9', 10, 'Hombres/Zapatos/z1.PNG', 'SUBCAT08'),
('ART23', 'CAT02', 'Zapatos de Hombre Dauss Marrones', '269.9', 9, 'Hombres/Zapatos/z2.PNG', 'SUBCAT08'),
('ART24', 'CAT02', 'Zapatos Formales Hombre Basement Bartic', '149.9', 15, 'Hombres/Zapatos/z3.PNG', 'SUBCAT08'),
('ART25', 'CAT02', 'Zapatos Casuales Hombre Calimod', '299.9', 2, 'Hombres/Zapatos/z4.png', 'SUBCAT08'),
('ART26', 'CAT01', 'Chaleco Mujer University Club', '129.9', 4, 'Mujeres/Casacas/c1.PNG', 'SUBCAT09'),
('ART27', 'CAT01', 'Casaca Mujer Sybilla', '129.9', 20, 'Mujeres/Casacas/c2.PNG', 'SUBCAT09'),
('ART28', 'CAT01', 'Casaca Mujer Newport', '219.9', 14, 'Mujeres/Casacas/c3.PNG', 'SUBCAT09'),
('ART29', 'CAT01', 'Casaca Jean Mujer Pionier', '199.9', 22, 'Mujeres/Casacas/c4.PNG', 'SUBCAT09'),
('ART30', 'CAT01', 'Falda Mujer Sybilla', '89.9', 24, 'Mujeres/Faldas y Pantalones/f1.PNG', 'SUBCAT10'),
('ART31', 'CAT01', 'Falda Jean Mujer Elle', '99.9', 15, 'Mujeres/Faldas y Pantalones/f2.PNG', 'SUBCAT10'),
('ART32', 'CAT01', 'Falda Camila Viali Brianna Negro', '179.9', 17, 'Mujeres/Faldas y Pantalones/f3.PNG', 'SUBCAT10'),
('ART33', 'CAT01', 'Leggins Mujer Apology x  Viviana Rivas PLata', '149.9', 7, 'Mujeres/Faldas y Pantalones/p1.PNG', 'SUBCAT10'),
('ART34', 'CAT01', 'Pantalon Mujer Denimlab', '89.9', 9, 'Mujeres/Faldas y Pantalones/p2.PNG', 'SUBCAT10'),
('ART35', 'CAT01', 'Jean Skinny Mujer Mossimo', '49.9', 16, 'Mujeres/Faldas y Pantalones/p3.PNG', 'SUBCAT10'),
('ART36', 'CAT01', 'Polo Manga Larga Stefano Cocci', '49.9', 13, 'Mujeres/Polos y Blusas/b1.PNG', 'SUBCAT04'),
('ART37', 'CAT01', 'Blusa Manga Larga Mujer University Club', '99.9', 9, 'Mujeres/Polos y Blusas/b2.PNG', 'SUBCAT04'),
('ART38', 'CAT01', 'Blusa Encaje Mujer Elle', '59.9', 3, 'Mujeres/Polos y Blusas/p1.PNG', 'SUBCAT04'),
('ART39', 'CAT01', 'Polo Manga Corta 100% Algodón Mujer Levis', '79.9', 15, 'Mujeres/Polos y Blusas/p2.PNG', 'SUBCAT04'),
('ART40', 'CAT01', 'Zapatillas Urbanas Mujer Sybilla Bosineta RS', '99.9', 4, 'Mujeres/Zapatillas/z1.PNG', 'SUBCAT11'),
('ART41', 'CAT01', 'Zapatillas Running Mujer Asics Gel-Contend 7 Rosequar', '279.9', 15, 'Mujeres/Zapatillas/z2.PNG', 'SUBCAT11'),
('ART42', 'CAT01', 'Zapatillas urbanas Mujer New Balance', '379.9', 13, 'Mujeres/Zapatillas/z3.PNG', 'SUBCAT11'),
('ART43', 'CAT01', 'Zapatillas Running Mujer Asics Gel Torrance', '279.9', 9, 'Mujeres/Zapatillas/z4.PNG', 'SUBCAT11'),
('ART44', 'CAT01', 'Zapatos casuales Mujer Basement Amo', '149.9', 8, 'Mujeres/Zapatos y Botas/z1.PNG', 'SUBCAT01'),
('ART45', 'CAT01', 'Botines Casuales Mujer Mila', '189.9', 13, 'Mujeres/Zapatos y Botas/z2.PNG', 'SUBCAT01'),
('ART46', 'CAT01', 'Zapatos Casuales Mujer Call it Spring Dyvon', '249.9', 16, 'Mujeres/Zapatos y Botas/z3.PNG', 'SUBCAT01'),
('ART47', 'CAT01', 'Botines Casuales Mujer Gotta', '259.9', 20, 'Mujeres/Zapatos y Botas/z4.PNG', 'SUBCAT01'),
('ART48', 'CAT03', 'Blusa Viscosa Niña', '49.9', 14, 'Niños/Blusas/b1.png', 'SUBCAT12'),
('ART49', 'CAT03', 'Blusca Blanca Viscosa Niña', '179.9', 7, 'Niños/Blusas/b2.png', 'SUBCAT12'),
('ART50', 'CAT03', 'Blusa Manga Larga Algodon Niña', '59.9', 3, 'Niños/Blusas/b3.png', 'SUBCAT12'),
('ART51', 'CAT03', 'Blusca Viscosa Azul Niña', '69.9', 12, 'Niños/Blusas/b4.png', 'SUBCAT12'),
('ART52', 'CAT03', 'Casaca Niño YAMP', '129.9', 14, 'Niños/Casacas/c1.png', 'SUBCAT13'),
('ART53', 'CAT03', 'Casaca con capucha Niño', '295.9', 1, 'Niños/Casacas/c2.png', 'SUBCAT13'),
('ART54', 'CAT03', 'Casaca Roja Niña Eleven', '99.9', 15, 'Niños/Casacas/c3.png', 'SUBCAT13'),
('ART55', 'CAT03', 'Casaca Rosa Niña', '262.9', 8, 'Niños/Casacas/c4.png', 'SUBCAT13'),
('ART56', 'CAT03', 'Pantalon Buzo Algodon Niño', '99.9', 10, 'Niños/Pantalones/p1.png', 'SUBCAT14'),
('ART57', 'CAT03', 'Pantalon Azul Niño', '130.9', 15, 'Niños/Pantalones/p2.png', 'SUBCAT14'),
('ART58', 'CAT03', 'Jean Strech Comfort Recto Bruno Niño', '109.9', 20, 'Niños/Pantalones/p3.png', 'SUBCAT14'),
('ART59', 'CAT03', 'Jean Strech Semi Pitillo Rhibas Niño', '109.9', 25, 'Niños/Pantalones/p4.png', 'SUBCAT14'),
('ART60', 'CAT03', 'Polo Manga Corta Algodon Niño Levis', '49.9', 15, 'Niños/Polos/p1.png', 'SUBCAT06'),
('ART61', 'CAT03', 'Polo Manga Corta Algodon Niño Federation', '39.9', 12, 'Niños/Polos/p2.png', 'SUBCAT06'),
('ART62', 'CAT03', 'Polo Manga Larga Algodon Niña Eleven', '49.9', 20, 'Niños/Polos/p3.png', 'SUBCAT06'),
('ART63', 'CAT03', 'Polo Manga Corta Algodon Niña Eleven', '109.9', 22, 'Niños/Polos/p4.png', 'SUBCAT06'),
('ART64', 'CAT03', 'Zapatillas Urbanas Niño Adidas Originals Superstar 360 Pato Donald', '229.9', 10, 'Niños/Zapatillas/za1.png', 'SUBCAT15'),
('ART65', 'CAT03', 'Zapatillas Deportivas Niño Reebok Royal Classic Jogger 2', '139.9', 6, 'Niños/Zapatillas/za2.png', 'SUBCAT15'),
('ART66', 'CAT03', 'Zapatillas deportivas Niña Adidas Runfalcon 2.0', '139.9', 14, 'Niños/Zapatillas/za3.png', 'SUBCAT15'),
('ART67', 'CAT03', 'Zapatillas Urbanas Niña Reebok Royal Prime 2', '119.9', 10, 'Niños/Zapatillas/za4.png', 'SUBCAT15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `IdCategoria` char(5) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `Imagen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `Descripcion`, `Imagen`) VALUES
('CAT01', 'MUJER', 'MUJER.webp'),
('CAT02', 'HOMBRE', 'HOMBRE.webp'),
('CAT03', 'NIÑOS', 'NIÑOS.webp'),
('CAT04', 'NOVEDADES', 'NOVEDADES.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `IdCliente` char(8) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Edad` int(11) NOT NULL,
  `PassWord` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Apellidos`, `Nombres`, `Direccion`, `Email`, `Edad`, `PassWord`) VALUES
('CLI00001', 'Vera Perez', 'Alberto', 'AV.AREQUIPA 190', 'perez@yahoo.es', 39, '123456'),
('CLI00002', 'Aliaga Mendez', 'Carlos', 'AV.AREQUIPA 567', 'pdiaz@yahoo.es', 23, 'alfa'),
('CLI00003', 'Castro Diaz', 'Ricardo', 'AV.AREQUIPA 1045', 'jmendez@yahoo.es', 25, 'omega'),
('CLI00011', 'Vargas Montes', 'erick', '', 'erick131115@gmail.com', 20, '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faccab`
--

DROP TABLE IF EXISTS `faccab`;
CREATE TABLE `faccab` (
  `NroFactura` char(8) NOT NULL,
  `FechaFactura` datetime NOT NULL,
  `IdCliente` char(8) NOT NULL,
  `MontoTotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `faccab`
--

INSERT INTO `faccab` (`NroFactura`, `FechaFactura`, `IdCliente`, `MontoTotal`) VALUES
('00000001', '2022-07-16 00:00:00', 'CLI00001', '0'),
('00000002', '2022-07-20 00:00:00', 'CLI00001', '19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facdet`
--

DROP TABLE IF EXISTS `facdet`;
CREATE TABLE `facdet` (
  `NroFactura` char(8) NOT NULL,
  `IdArticulo` char(6) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `talla` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facdet`
--

INSERT INTO `facdet` (`NroFactura`, `IdArticulo`, `Cantidad`, `talla`) VALUES
('00000002', 'ART02', 1, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `Descripcion` varchar(30) NOT NULL,
  `Idsubcateg` char(8) NOT NULL,
  `Imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`Descripcion`, `Idsubcateg`, `Imagen`) VALUES
('ZAPATOS Y BOTAS | MUJER', 'SUBCAT01', 'zapatos-mujer.webp'),
('POLOS | HOMBRE', 'SUBCAT02', 'polo.jpg'),
('PANTALONES | HOMBRE', 'SUBCAT03', 'pantalon.jpg'),
('POLOS Y BLUSAS | MUJER', 'SUBCAT04', 'blusas.jpg'),
('CASACAS Y ABRIGOS | HOMBRE', 'SUBCAT05', 'casacas.webp'),
('POLOS | NIÑOS', 'SUBCAT06', 'polonino.jpg'),
('ZAPATILLAS | HOMBRE', 'SUBCAT07', 'zH.png'),
('ZAPATOS | HOMBRE', 'SUBCAT08', 'zapH.png'),
('CASACAS Y ABRIGOS | MUJER', 'SUBCAT09', 'cM.png'),
('FALDAS Y PANTALONES | MUJER', 'SUBCAT10', 'fM.png'),
('ZAPATILLAS | MUJER', 'SUBCAT11', 'zapatillas-mujer.png'),
('BLUSAS | NIÑOS', 'SUBCAT12', 'blusasN.png'),
('CASACAS | NIÑOS', 'SUBCAT13', 'cN.png'),
('PANTALONES | NIÑOS', 'SUBCAT14', 'pantN.PNG'),
('ZAPATILLAS | NIÑOS', 'SUBCAT15', 'zN.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`IdArticulo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `faccab`
--
ALTER TABLE `faccab`
  ADD PRIMARY KEY (`NroFactura`);

--
-- Indices de la tabla `facdet`
--
ALTER TABLE `facdet`
  ADD PRIMARY KEY (`NroFactura`,`IdArticulo`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`Idsubcateg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
