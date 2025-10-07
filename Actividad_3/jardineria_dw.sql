-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2025 a las 22:39:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jardineria_dw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_cliente`
--

CREATE TABLE `dim_cliente` (
  `cliente_key` int(11) NOT NULL,
  `codigo_cliente_original` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_cliente`
--

INSERT INTO `dim_cliente` (`cliente_key`, `codigo_cliente_original`, `nombre_cliente`, `ciudad`, `region`, `pais`) VALUES
(1, 1, 'GoldFish Garden', 'San Francisco', NULL, 'USA'),
(2, 2, 'Gardening Associates', 'Miami', 'Miami', 'USA'),
(3, 3, 'Gerudo Valley', 'New York', NULL, 'USA'),
(4, 4, 'Tendo Garden', 'Miami', NULL, 'USA'),
(5, 5, 'Lasas S.A.', 'Fuenlabrada', 'Madrid', 'Spain'),
(6, 6, 'Beragua', 'Madrid', 'Madrid', 'Spain'),
(7, 7, 'Club Golf Puerta del hierro', 'Madrid', 'Madrid', 'Spain'),
(8, 8, 'Naturagua', 'Madrid', 'Madrid', 'Spain'),
(9, 9, 'DaraDistribuciones', 'Madrid', 'Madrid', 'Spain'),
(10, 10, 'Madrileña de riegos', 'Madrid', 'Madrid', 'Spain'),
(11, 11, 'Lasas S.A.', 'Fuenlabrada', 'Madrid', 'Spain'),
(12, 12, 'Camunas Jardines S.L.', 'San Lorenzo del Escorial', 'Madrid', 'Spain'),
(13, 13, 'Dardena S.A.', 'Madrid', 'Madrid', 'Spain'),
(14, 14, 'Jardin de Flores', 'Madrid', 'Madrid', 'Spain'),
(15, 15, 'Flores Marivi', 'Fuenlabrada', 'Madrid', 'Spain'),
(16, 16, 'Flowers, S.A', 'Montornes del valles', 'Barcelona', 'Spain'),
(17, 17, 'Naturajardin', 'Madrid', 'Madrid', 'Spain'),
(18, 18, 'Golf S.A.', 'Santa cruz de Tenerife', 'Islas Canarias', 'Spain'),
(19, 19, 'Americh Golf Management SL', 'Barcelona', 'Cataluña', 'Spain'),
(20, 20, 'Aloha', 'Canarias', 'Canarias', 'Spain'),
(21, 21, 'El Prat', 'Barcelona', 'Cataluña', 'Spain'),
(22, 22, 'Sotogrande', 'Sotogrande', 'Cadiz', 'Spain'),
(23, 23, 'Vivero Humanes', 'Humanes', 'Madrid', 'Spain'),
(24, 24, 'Fuenla City', 'Fuenlabrada', 'Madrid', 'Spain'),
(25, 25, 'Jardines y Mansiones Cactus SL', 'Madrid', 'Madrid', 'Spain'),
(26, 26, 'Jardinerías Matías SL', 'Madrid', 'Madrid', 'Spain'),
(27, 27, 'Agrojardin', 'Getafe', 'Madrid', 'Spain'),
(28, 28, 'Top Campo', 'Humanes', 'Madrid', 'Spain'),
(29, 29, 'Jardineria Sara', 'Fuenlabrada', 'Madrid', 'Spain'),
(30, 30, 'Campohermoso', 'Fuenlabrada', 'Madrid', 'Spain'),
(31, 31, 'france telecom', 'Paris', NULL, 'France'),
(32, 32, 'Musée du Louvre', 'Paris', NULL, 'France'),
(33, 33, 'Tutifruti S.A', 'Sydney', 'Nueva Gales del Sur', 'Australia'),
(34, 34, 'Flores S.L.', 'Madrid', 'Fuenlabrada', 'Spain'),
(35, 35, 'The Magic Garden', 'London', 'London', 'United Kingdom'),
(36, 36, 'El Jardin Viviente S.L', 'Sydney', 'Nueva Gales del Sur', 'Australia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_empleado`
--

CREATE TABLE `dim_empleado` (
  `empleado_key` int(11) NOT NULL,
  `codigo_empleado_original` int(11) NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `nombre_jefe` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_empleado`
--

INSERT INTO `dim_empleado` (`empleado_key`, `codigo_empleado_original`, `nombre_completo`, `puesto`, `nombre_jefe`) VALUES
(1, 1, 'Marcos Magaña Perez', 'Director General', 'N/A'),
(2, 2, 'Ruben López Martinez', 'Subdirector Marketing', 'Marcos Magaña'),
(3, 3, 'Alberto Soria Carrasco', 'Subdirector Ventas', 'Ruben López'),
(4, 4, 'Maria Solís Jerez', 'Secretaria', 'Ruben López'),
(5, 5, 'Felipe Rosas Marquez', 'Representante Ventas', 'Alberto Soria'),
(6, 6, 'Juan Carlos Ortiz Serrano', 'Representante Ventas', 'Alberto Soria'),
(7, 7, 'Carlos Soria Jimenez', 'Director Oficina', 'Alberto Soria'),
(8, 8, 'Mariano López Murcia', 'Representante Ventas', 'Carlos Soria'),
(9, 9, 'Lucio Campoamor Martín', 'Representante Ventas', 'Carlos Soria'),
(10, 10, 'Hilario Rodriguez Huertas', 'Representante Ventas', 'Carlos Soria'),
(11, 11, 'Emmanuel Magaña Perez', 'Director Oficina', 'Alberto Soria'),
(12, 12, 'José Manuel Martinez De la Osa', 'Representante Ventas', 'Emmanuel Magaña'),
(13, 13, 'David Palma Aceituno', 'Representante Ventas', 'Emmanuel Magaña'),
(14, 14, 'Oscar Palma Aceituno', 'Representante Ventas', 'Emmanuel Magaña'),
(15, 15, 'Francois Fignon ', 'Director Oficina', 'Alberto Soria'),
(16, 16, 'Lionel Narvaez ', 'Representante Ventas', 'Francois Fignon'),
(17, 17, 'Laurent Serra ', 'Representante Ventas', 'Francois Fignon'),
(18, 18, 'Michael Bolton ', 'Director Oficina', 'Alberto Soria'),
(19, 19, 'Walter Santiago Sanchez Lopez', 'Representante Ventas', 'Michael Bolton'),
(20, 20, 'Hilary Washington ', 'Director Oficina', 'Alberto Soria'),
(21, 21, 'Marcus Paxton ', 'Representante Ventas', 'Hilary Washington'),
(22, 22, 'Lorena Paxton ', 'Representante Ventas', 'Hilary Washington'),
(23, 23, 'Nei Nishikori ', 'Director Oficina', 'Alberto Soria'),
(24, 24, 'Narumi Riko ', 'Representante Ventas', 'Nei Nishikori'),
(25, 25, 'Takuma Nomura ', 'Representante Ventas', 'Nei Nishikori'),
(26, 26, 'Amy Johnson ', 'Director Oficina', 'Alberto Soria'),
(27, 27, 'Larry Westfalls ', 'Representante Ventas', 'Amy Johnson'),
(28, 28, 'John Walton ', 'Representante Ventas', 'Amy Johnson'),
(29, 29, 'Kevin Fallmer ', 'Director Oficina', 'Alberto Soria'),
(30, 30, 'Julian Bellinelli ', 'Representante Ventas', 'Kevin Fallmer'),
(31, 31, 'Mariko Kishi ', 'Representante Ventas', 'Kevin Fallmer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_oficina`
--

CREATE TABLE `dim_oficina` (
  `oficina_key` int(11) NOT NULL,
  `codigo_oficina_original` int(11) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_oficina`
--

INSERT INTO `dim_oficina` (`oficina_key`, `codigo_oficina_original`, `ciudad`, `pais`, `region`) VALUES
(1, 0, 'Barcelona', 'España', 'Barcelona'),
(2, 0, 'Boston', 'EEUU', 'MA'),
(3, 0, 'Londres', 'Inglaterra', 'EMEA'),
(4, 0, 'Madrid', 'España', 'Madrid'),
(5, 0, 'Paris', 'Francia', 'EMEA'),
(6, 0, 'San Francisco', 'EEUU', 'CA'),
(7, 0, 'Sydney', 'Australia', 'APAC'),
(8, 0, 'Talavera de la Reina', 'España', 'Castilla-LaMancha'),
(9, 0, 'Tokyo', 'Japón', 'Chiyoda-Ku');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_producto`
--

CREATE TABLE `dim_producto` (
  `producto_key` int(11) NOT NULL,
  `codigo_producto_original` int(11) NOT NULL,
  `nombre_producto` varchar(70) NOT NULL,
  `categoria_producto` varchar(50) NOT NULL,
  `proveedor` varchar(50) DEFAULT NULL,
  `precio_venta` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_producto`
--

INSERT INTO `dim_producto` (`producto_key`, `codigo_producto_original`, `nombre_producto`, `categoria_producto`, `proveedor`, `precio_venta`) VALUES
(1, 11679, 'Sierra de Poda 400MM', 'Herramientas', 'HiperGarden Tools', 14.00),
(2, 21636, 'Pala', 'Herramientas', 'HiperGarden Tools', 14.00),
(3, 22225, 'Rastrillo de Jardín', 'Herramientas', 'HiperGarden Tools', 12.00),
(4, 30310, 'Azadón', 'Herramientas', 'HiperGarden Tools', 12.00),
(5, 0, 'Ajedrea', 'Aromaticas', 'Murcia Seasons', 1.00),
(6, 0, 'Lavándula Dentata', 'Aromaticas', 'Murcia Seasons', 1.00),
(7, 0, 'Mejorana', 'Aromaticas', 'Murcia Seasons', 1.00),
(8, 0, 'Melissa', 'Aromaticas', 'Murcia Seasons', 1.00),
(9, 0, 'Mentha Sativa', 'Aromaticas', 'Murcia Seasons', 1.00),
(10, 0, 'Petrosilium Hortense (Peregil)', 'Aromaticas', 'Murcia Seasons', 1.00),
(11, 0, 'Salvia Mix', 'Aromaticas', 'Murcia Seasons', 1.00),
(12, 0, 'Thymus Citriodra (Tomillo limón)', 'Aromaticas', 'Murcia Seasons', 1.00),
(13, 0, 'Thymus Vulgaris', 'Aromaticas', 'Murcia Seasons', 1.00),
(14, 0, 'Santolina Chamaecyparys', 'Aromaticas', 'Murcia Seasons', 1.00),
(15, 0, 'Expositor Cítricos Mix', 'Frutales', 'Frutales Talavera S.A', 7.00),
(16, 0, 'Limonero 2 años injerto', 'Frutales', 'NaranjasValencianas.com', 7.00),
(17, 0, 'Nectarina', 'Frutales', 'Frutales Talavera S.A', 11.00),
(18, 0, 'Nogal', 'Frutales', 'Frutales Talavera S.A', 13.00),
(19, 0, 'Olea-Olivos', 'Frutales', 'Frutales Talavera S.A', 18.00),
(20, 0, 'Olea-Olivos', 'Frutales', 'Frutales Talavera S.A', 25.00),
(21, 0, 'Olea-Olivos', 'Frutales', 'Frutales Talavera S.A', 49.00),
(22, 0, 'Olea-Olivos', 'Frutales', 'Frutales Talavera S.A', 70.00),
(23, 0, 'Peral', 'Frutales', 'Frutales Talavera S.A', 11.00),
(24, 0, 'Peral', 'Frutales', 'Frutales Talavera S.A', 22.00),
(25, 0, 'Peral', 'Frutales', 'Frutales Talavera S.A', 32.00),
(26, 0, 'Limonero 30/40', 'Frutales', 'NaranjasValencianas.com', 100.00),
(27, 0, 'Kunquat', 'Frutales', 'NaranjasValencianas.com', 21.00),
(28, 0, 'Kunquat  EXTRA con FRUTA', 'Frutales', 'NaranjasValencianas.com', 57.00),
(29, 0, 'Calamondin Mini', 'Frutales', 'Frutales Talavera S.A', 10.00),
(30, 0, 'Calamondin Copa', 'Frutales', 'Frutales Talavera S.A', 25.00),
(31, 0, 'Calamondin Copa EXTRA Con FRUTA', 'Frutales', 'Frutales Talavera S.A', 45.00),
(32, 0, 'Rosal bajo 1Âª -En maceta-inicio brotación', 'Frutales', 'Frutales Talavera S.A', 2.00),
(33, 0, 'ROSAL TREPADOR', 'Frutales', 'Frutales Talavera S.A', 4.00),
(34, 0, 'Camelia Blanco, Chrysler Rojo, Soraya Naranja,', 'Frutales', 'NaranjasValencianas.com', 4.00),
(35, 0, 'Naranjo -Plantón joven 1 año injerto', 'Frutales', 'NaranjasValencianas.com', 6.00),
(36, 0, 'Landora Amarillo, Rose Gaujard bicolor blanco-rojo', 'Frutales', 'Frutales Talavera S.A', 4.00),
(37, 0, 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte', 'Frutales', 'Frutales Talavera S.A', 4.00),
(38, 0, 'Pitimini rojo', 'Frutales', 'Frutales Talavera S.A', 4.00),
(39, 0, 'Rosal copa', 'Frutales', 'Frutales Talavera S.A', 8.00),
(40, 0, 'Albaricoquero Corbato', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(41, 0, 'Albaricoquero Moniqui', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(42, 0, 'Albaricoquero Kurrot', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(43, 0, 'Cerezo Burlat', 'Frutales', 'Jerte Distribuciones S.L.', 8.00),
(44, 0, 'Cerezo Picota', 'Frutales', 'Jerte Distribuciones S.L.', 8.00),
(45, 0, 'Cerezo Napoleón', 'Frutales', 'Jerte Distribuciones S.L.', 8.00),
(46, 0, 'Naranjo 2 años injerto', 'Frutales', 'NaranjasValencianas.com', 7.00),
(47, 0, 'Ciruelo R. Claudia Verde', 'Frutales', 'Frutales Talavera S.A', 8.00),
(48, 0, 'Ciruelo Santa Rosa', 'Frutales', 'Frutales Talavera S.A', 8.00),
(49, 0, 'Ciruelo Golden Japan', 'Frutales', 'Frutales Talavera S.A', 8.00),
(50, 0, 'Ciruelo Friar', 'Frutales', 'Frutales Talavera S.A', 8.00),
(51, 0, 'Ciruelo Reina C. De Ollins', 'Frutales', 'Frutales Talavera S.A', 8.00),
(52, 0, 'Ciruelo Claudia Negra', 'Frutales', 'Frutales Talavera S.A', 8.00),
(53, 0, 'Granado Mollar de Elche', 'Frutales', 'Frutales Talavera S.A', 9.00),
(54, 0, 'Higuera Napolitana', 'Frutales', 'Frutales Talavera S.A', 9.00),
(55, 0, 'Higuera Verdal', 'Frutales', 'Frutales Talavera S.A', 9.00),
(56, 0, 'Higuera Breva', 'Frutales', 'Frutales Talavera S.A', 9.00),
(57, 0, 'Naranjo calibre 8/10', 'Frutales', 'NaranjasValencianas.com', 29.00),
(58, 0, 'Manzano Starking Delicious', 'Frutales', 'Frutales Talavera S.A', 8.00),
(59, 0, 'Manzano Reineta', 'Frutales', 'Frutales Talavera S.A', 8.00),
(60, 0, 'Manzano Golden Delicious', 'Frutales', 'Frutales Talavera S.A', 8.00),
(61, 0, 'Membrillero Gigante de Wranja', 'Frutales', 'Frutales Talavera S.A', 8.00),
(62, 0, 'Melocotonero Spring Crest', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(63, 0, 'Melocotonero Amarillo de Agosto', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(64, 0, 'Melocotonero Federica', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(65, 0, 'Melocotonero Paraguayo', 'Frutales', 'Melocotones de Cieza S.A.', 8.00),
(66, 0, 'Nogal Común', 'Frutales', 'Frutales Talavera S.A', 9.00),
(67, 0, 'Parra Uva de Mesa', 'Frutales', 'Frutales Talavera S.A', 8.00),
(68, 0, 'Mandarino -Plantón joven', 'Frutales', 'Frutales Talavera S.A', 6.00),
(69, 0, 'Peral Castell', 'Frutales', 'Frutales Talavera S.A', 8.00),
(70, 0, 'Peral Williams', 'Frutales', 'Frutales Talavera S.A', 8.00),
(71, 0, 'Peral Conference', 'Frutales', 'Frutales Talavera S.A', 8.00),
(72, 0, 'Peral Blanq. de Aranjuez', 'Frutales', 'Frutales Talavera S.A', 8.00),
(73, 0, 'Níspero Tanaca', 'Frutales', 'Frutales Talavera S.A', 9.00),
(74, 0, 'Olivo Cipresino', 'Frutales', 'Frutales Talavera S.A', 8.00),
(75, 0, 'Nectarina', 'Frutales', 'Frutales Talavera S.A', 8.00),
(76, 0, 'Kaki Rojo Brillante', 'Frutales', 'NaranjasValencianas.com', 9.00),
(77, 0, 'Albaricoquero', 'Frutales', 'Melocotones de Cieza S.A.', 11.00),
(78, 0, 'Albaricoquero', 'Frutales', 'Melocotones de Cieza S.A.', 22.00),
(79, 0, 'Mandarino 2 años injerto', 'Frutales', 'Frutales Talavera S.A', 7.00),
(80, 0, 'Albaricoquero', 'Frutales', 'Melocotones de Cieza S.A.', 32.00),
(81, 0, 'Albaricoquero', 'Frutales', 'Melocotones de Cieza S.A.', 49.00),
(82, 0, 'Albaricoquero', 'Frutales', 'Melocotones de Cieza S.A.', 70.00),
(83, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 11.00),
(84, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 22.00),
(85, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 32.00),
(86, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 49.00),
(87, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 70.00),
(88, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 80.00),
(89, 0, 'Cerezo', 'Frutales', 'Jerte Distribuciones S.L.', 91.00),
(90, 0, 'Mandarino calibre 8/10', 'Frutales', 'Frutales Talavera S.A', 29.00),
(91, 0, 'Ciruelo', 'Frutales', 'Frutales Talavera S.A', 11.00),
(92, 0, 'Ciruelo', 'Frutales', 'Frutales Talavera S.A', 22.00),
(93, 0, 'Ciruelo', 'Frutales', 'Frutales Talavera S.A', 32.00),
(94, 0, 'Granado', 'Frutales', 'Frutales Talavera S.A', 13.00),
(95, 0, 'Granado', 'Frutales', 'Frutales Talavera S.A', 22.00),
(96, 0, 'Granado', 'Frutales', 'Frutales Talavera S.A', 32.00),
(97, 0, 'Granado', 'Frutales', 'Frutales Talavera S.A', 49.00),
(98, 0, 'Granado', 'Frutales', 'Frutales Talavera S.A', 70.00),
(99, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 15.00),
(100, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 22.00),
(101, 0, 'Limonero -Plantón joven', 'Frutales', 'NaranjasValencianas.com', 6.00),
(102, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 32.00),
(103, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 49.00),
(104, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 70.00),
(105, 0, 'Higuera', 'Frutales', 'Frutales Talavera S.A', 80.00),
(106, 0, 'Kaki', 'Frutales', 'NaranjasValencianas.com', 13.00),
(107, 0, 'Kaki', 'Frutales', 'NaranjasValencianas.com', 70.00),
(108, 0, 'Manzano', 'Frutales', 'Frutales Talavera S.A', 11.00),
(109, 0, 'Manzano', 'Frutales', 'Frutales Talavera S.A', 22.00),
(110, 0, 'Manzano', 'Frutales', 'Frutales Talavera S.A', 32.00),
(111, 0, 'Manzano', 'Frutales', 'Frutales Talavera S.A', 49.00),
(112, 0, 'Limonero calibre 8/10', 'Frutales', 'NaranjasValencianas.com', 29.00),
(113, 0, 'Níspero', 'Frutales', 'Frutales Talavera S.A', 70.00),
(114, 0, 'Níspero', 'Frutales', 'Frutales Talavera S.A', 80.00),
(115, 0, 'Melocotonero', 'Frutales', 'Melocotones de Cieza S.A.', 11.00),
(116, 0, 'Melocotonero', 'Frutales', 'Melocotones de Cieza S.A.', 22.00),
(117, 0, 'Melocotonero', 'Frutales', 'Melocotones de Cieza S.A.', 32.00),
(118, 0, 'Melocotonero', 'Frutales', 'Melocotones de Cieza S.A.', 49.00),
(119, 0, 'Membrillero', 'Frutales', 'Frutales Talavera S.A', 11.00),
(120, 0, 'Membrillero', 'Frutales', 'Frutales Talavera S.A', 22.00),
(121, 0, 'Membrillero', 'Frutales', 'Frutales Talavera S.A', 32.00),
(122, 0, 'Membrillero', 'Frutales', 'Frutales Talavera S.A', 49.00),
(123, 0, 'Arbustos Mix Maceta', 'Ornamentales', 'Valencia Garden Service', 5.00),
(124, 0, 'Mimosa Injerto CLASICA Dealbata', 'Ornamentales', 'Viveros EL OASIS', 12.00),
(125, 0, 'Expositor Mimosa Semilla Mix', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(126, 0, 'Mimosa Semilla Bayleyana', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(127, 0, 'Mimosa Semilla Bayleyana', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(128, 0, 'Mimosa Semilla Cyanophylla', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(129, 0, 'Mimosa Semilla Espectabilis', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(130, 0, 'Mimosa Semilla Longifolia', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(131, 0, 'Mimosa Semilla Floribunda 4 estaciones', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(132, 0, 'Abelia Floribunda', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(133, 0, 'Callistemom (Mix)', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(134, 0, 'Callistemom (Mix)', 'Ornamentales', 'Viveros EL OASIS', 2.00),
(135, 0, 'Corylus Avellana \"Contorta\"', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(136, 0, 'Escallonia (Mix)', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(137, 0, 'Evonimus Emerald Gayeti', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(138, 0, 'Evonimus Pulchellus', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(139, 0, 'Forsytia Intermedia \"Lynwood\"', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(140, 0, 'Hibiscus Syriacus  \"Diana\" -Blanco Puro', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(141, 0, 'Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(142, 0, 'Hibiscus Syriacus \"Pink Giant\" Rosa', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(143, 0, 'Laurus Nobilis Arbusto - Ramificado Bajo', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(144, 0, 'Lonicera Nitida', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(145, 0, 'Lonicera Nitida \"Maigrum\"', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(146, 0, 'Lonicera Pileata', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(147, 0, 'Philadelphus \"Virginal\"', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(148, 0, 'Prunus pisardii', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(149, 0, 'Viburnum Tinus \"Eve Price\"', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(150, 0, 'Weigelia \"Bristol Ruby\"', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(151, 0, 'Camelia japonica', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(152, 0, 'Camelia japonica ejemplar', 'Ornamentales', 'Viveros EL OASIS', 98.00),
(153, 0, 'Camelia japonica ejemplar', 'Ornamentales', 'Viveros EL OASIS', 110.00),
(154, 0, 'Callistemom COPA', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(155, 0, 'Leptospermum formado PIRAMIDE', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(156, 0, 'Leptospermum COPA', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(157, 0, 'Nerium oleander-CALIDAD \"GARDEN\"', 'Ornamentales', 'Viveros EL OASIS', 2.00),
(158, 0, 'Nerium Oleander Arbusto GRANDE', 'Ornamentales', 'Viveros EL OASIS', 38.00),
(159, 0, 'Nerium oleander COPA  Calibre 6/8', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(160, 0, 'Nerium oleander ARBOL Calibre 8/10', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(161, 0, 'ROSAL TREPADOR', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(162, 0, 'Camelia Blanco, Chrysler Rojo, Soraya Naranja,', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(163, 0, 'Landora Amarillo, Rose Gaujard bicolor blanco-rojo', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(164, 0, 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(165, 0, 'Pitimini rojo', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(166, 0, 'Solanum Jazminoide', 'Ornamentales', 'Viveros EL OASIS', 2.00),
(167, 0, 'Wisteria Sinensis  azul, rosa, blanca', 'Ornamentales', 'Viveros EL OASIS', 9.00),
(168, 0, 'Wisteria Sinensis INJERTADAS DECÃ“', 'Ornamentales', 'Viveros EL OASIS', 12.00),
(169, 0, 'Bougamvillea Sanderiana Tutor', 'Ornamentales', 'Viveros EL OASIS', 2.00),
(170, 0, 'Bougamvillea Sanderiana Tutor', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(171, 0, 'Bougamvillea Sanderiana Tutor', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(172, 0, 'Bougamvillea Sanderiana Espaldera', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(173, 0, 'Bougamvillea Sanderiana Espaldera', 'Ornamentales', 'Viveros EL OASIS', 17.00),
(174, 0, 'Bougamvillea roja, naranja', 'Ornamentales', 'Viveros EL OASIS', 2.00),
(175, 0, 'Bougamvillea Sanderiana, 3 tut. piramide', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(176, 0, 'Expositor Árboles clima continental', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(177, 0, 'Expositor Árboles clima mediterráneo', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(178, 0, 'Expositor Árboles borde del mar', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(179, 0, 'Acer Negundo', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(180, 0, 'Acer platanoides', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(181, 0, 'Acer Pseudoplatanus', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(182, 0, 'Brachychiton Acerifolius', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(183, 0, 'Brachychiton Discolor', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(184, 0, 'Brachychiton Rupestris', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(185, 0, 'Cassia Corimbosa', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(186, 0, 'Cassia Corimbosa', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(187, 0, 'Chitalpa Summer Bells', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(188, 0, 'Erytrina Kafra', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(189, 0, 'Erytrina Kafra', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(190, 0, 'Eucalyptus Citriodora', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(191, 0, 'Eucalyptus Ficifolia', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(192, 0, 'Eucalyptus Ficifolia', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(193, 0, 'Hibiscus Syriacus  Var. Injertadas 1 Tallo', 'Ornamentales', 'Viveros EL OASIS', 12.00),
(194, 0, 'Lagunaria Patersonii', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(195, 0, 'Lagunaria Patersonii', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(196, 0, 'Lagunaria patersonii  calibre 8/10', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(197, 0, 'Morus Alba', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(198, 0, 'Morus Alba  calibre 8/10', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(199, 0, 'Platanus Acerifolia', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(200, 0, 'Prunus pisardii', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(201, 0, 'Robinia Pseudoacacia Casque Rouge', 'Ornamentales', 'Viveros EL OASIS', 15.00),
(202, 0, 'Salix Babylonica  Pendula', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(203, 0, 'Sesbania Punicea', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(204, 0, 'Tamarix  Ramosissima Pink Cascade', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(205, 0, 'Tamarix  Ramosissima Pink Cascade', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(206, 0, 'Tecoma Stands', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(207, 0, 'Tecoma Stands', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(208, 0, 'Tipuana Tipu', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(209, 0, 'Pleioblastus distichus-Bambú enano', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(210, 0, 'Sasa palmata', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(211, 0, 'Sasa palmata', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(212, 0, 'Sasa palmata', 'Ornamentales', 'Viveros EL OASIS', 25.00),
(213, 0, 'Phylostachys aurea', 'Ornamentales', 'Viveros EL OASIS', 22.00),
(214, 0, 'Phylostachys aurea', 'Ornamentales', 'Viveros EL OASIS', 32.00),
(215, 0, 'Phylostachys Bambusa Spectabilis', 'Ornamentales', 'Viveros EL OASIS', 24.00),
(216, 0, 'Phylostachys biseti', 'Ornamentales', 'Viveros EL OASIS', 22.00),
(217, 0, 'Phylostachys biseti', 'Ornamentales', 'Viveros EL OASIS', 20.00),
(218, 0, 'Pseudosasa japonica (Metake)', 'Ornamentales', 'Viveros EL OASIS', 20.00),
(219, 0, 'Pseudosasa japonica (Metake)', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(220, 0, 'Cedrus Deodara', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(221, 0, 'Cedrus Deodara \"Feeling Blue\" Novedad', 'Ornamentales', 'Viveros EL OASIS', 12.00),
(222, 0, 'Juniperus chinensis \"Blue Alps\"', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(223, 0, 'Juniperus Chinensis Stricta', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(224, 0, 'Juniperus horizontalis Wiltonii', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(225, 0, 'Juniperus squamata \"Blue Star\"', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(226, 0, 'Juniperus x media Phitzeriana verde', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(227, 0, 'Pinus Canariensis', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(228, 0, 'Pinus Halepensis', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(229, 0, 'Pinus Pinea -Pino Piñonero', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(230, 0, 'Thuja Esmeralda', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(231, 0, 'Tuja Occidentalis Woodwardii', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(232, 0, 'Tuja orientalis \"Aurea nana\"', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(233, 0, 'Archontophoenix Cunninghamiana', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(234, 0, 'Beucarnea Recurvata', 'Ornamentales', 'Viveros EL OASIS', 39.00),
(235, 0, 'Beucarnea Recurvata', 'Ornamentales', 'Viveros EL OASIS', 59.00),
(236, 0, 'Bismarckia Nobilis', 'Ornamentales', 'Viveros EL OASIS', 217.00),
(237, 0, 'Bismarckia Nobilis', 'Ornamentales', 'Viveros EL OASIS', 266.00),
(238, 0, 'Brahea Armata', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(239, 0, 'Brahea Armata', 'Ornamentales', 'Viveros EL OASIS', 112.00),
(240, 0, 'Brahea Edulis', 'Ornamentales', 'Viveros EL OASIS', 19.00),
(241, 0, 'Brahea Edulis', 'Ornamentales', 'Viveros EL OASIS', 64.00),
(242, 0, 'Butia Capitata', 'Ornamentales', 'Viveros EL OASIS', 25.00),
(243, 0, 'Butia Capitata', 'Ornamentales', 'Viveros EL OASIS', 29.00),
(244, 0, 'Butia Capitata', 'Ornamentales', 'Viveros EL OASIS', 36.00),
(245, 0, 'Butia Capitata', 'Ornamentales', 'Viveros EL OASIS', 59.00),
(246, 0, 'Butia Capitata', 'Ornamentales', 'Viveros EL OASIS', 87.00),
(247, 0, 'Chamaerops Humilis', 'Ornamentales', 'Viveros EL OASIS', 4.00),
(248, 0, 'Chamaerops Humilis', 'Ornamentales', 'Viveros EL OASIS', 7.00),
(249, 0, 'Chamaerops Humilis', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(250, 0, 'Chamaerops Humilis', 'Ornamentales', 'Viveros EL OASIS', 38.00),
(251, 0, 'Chamaerops Humilis', 'Ornamentales', 'Viveros EL OASIS', 64.00),
(252, 0, 'Chamaerops Humilis \"Cerifera\"', 'Ornamentales', 'Viveros EL OASIS', 32.00),
(253, 0, 'Chrysalidocarpus Lutescens -ARECA', 'Ornamentales', 'Viveros EL OASIS', 22.00),
(254, 0, 'Cordyline Australis -DRACAENA', 'Ornamentales', 'Viveros EL OASIS', 38.00),
(255, 0, 'Cycas Revoluta', 'Ornamentales', 'Viveros EL OASIS', 15.00),
(256, 0, 'Cycas Revoluta', 'Ornamentales', 'Viveros EL OASIS', 34.00),
(257, 0, 'Dracaena Drago', 'Ornamentales', 'Viveros EL OASIS', 13.00),
(258, 0, 'Dracaena Drago', 'Ornamentales', 'Viveros EL OASIS', 64.00),
(259, 0, 'Dracaena Drago', 'Ornamentales', 'Viveros EL OASIS', 92.00),
(260, 0, 'Jubaea Chilensis', 'Ornamentales', 'Viveros EL OASIS', 49.00),
(261, 0, 'Livistonia Australis', 'Ornamentales', 'Viveros EL OASIS', 19.00),
(262, 0, 'Livistonia Decipiens', 'Ornamentales', 'Viveros EL OASIS', 19.00),
(263, 0, 'Livistonia Decipiens', 'Ornamentales', 'Viveros EL OASIS', 49.00),
(264, 0, 'Phoenix Canariensis', 'Ornamentales', 'Viveros EL OASIS', 6.00),
(265, 0, 'Phoenix Canariensis', 'Ornamentales', 'Viveros EL OASIS', 19.00),
(266, 0, 'Rhaphis Excelsa', 'Ornamentales', 'Viveros EL OASIS', 21.00),
(267, 0, 'Rhaphis Humilis', 'Ornamentales', 'Viveros EL OASIS', 64.00),
(268, 0, 'Sabal Minor', 'Ornamentales', 'Viveros EL OASIS', 11.00),
(269, 0, 'Sabal Minor', 'Ornamentales', 'Viveros EL OASIS', 34.00),
(270, 0, 'Trachycarpus Fortunei', 'Ornamentales', 'Viveros EL OASIS', 18.00),
(271, 0, 'Trachycarpus Fortunei', 'Ornamentales', 'Viveros EL OASIS', 462.00),
(272, 0, 'Washingtonia Robusta', 'Ornamentales', 'Viveros EL OASIS', 3.00),
(273, 0, 'Washingtonia Robusta', 'Ornamentales', 'Viveros EL OASIS', 5.00),
(274, 0, 'Yucca Jewel', 'Ornamentales', 'Viveros EL OASIS', 10.00),
(275, 0, 'Zamia Furfuracaea', 'Ornamentales', 'Viveros EL OASIS', 168.00),
(276, 0, 'Mimosa DEALBATA Gaulois Astier', 'Ornamentales', 'Viveros EL OASIS', 14.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tiempo`
--

CREATE TABLE `dim_tiempo` (
  `tiempo_key` int(11) NOT NULL,
  `fecha_completa` date NOT NULL,
  `anio` smallint(6) NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `trimestre` tinyint(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `nombre_mes` varchar(20) NOT NULL,
  `dia` tinyint(4) NOT NULL,
  `dia_semana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_tiempo`
--

INSERT INTO `dim_tiempo` (`tiempo_key`, `fecha_completa`, `anio`, `semestre`, `trimestre`, `mes`, `nombre_mes`, `dia`, `dia_semana`) VALUES
(1, '2006-01-17', 2006, 1, 1, 1, 'Enero', 17, 'Martes'),
(2, '2007-10-23', 2007, 2, 4, 10, 'Octubre', 23, 'Martes'),
(3, '2008-06-20', 2008, 1, 2, 6, 'Junio', 20, 'Viernes'),
(4, '2009-01-20', 2009, 1, 1, 1, 'Enero', 20, 'Martes'),
(5, '2008-11-09', 2008, 2, 4, 11, 'Noviembre', 9, 'Domingo'),
(6, '2008-12-22', 2008, 2, 4, 12, 'Diciembre', 22, 'Lunes'),
(7, '2009-01-15', 2009, 1, 1, 1, 'Enero', 15, 'Jueves'),
(8, '2009-01-22', 2009, 1, 1, 1, 'Enero', 22, 'Jueves'),
(9, '2009-01-12', 2009, 1, 1, 1, 'Enero', 12, 'Lunes'),
(10, '2009-01-02', 2009, 1, 1, 1, 'Enero', 2, 'Viernes'),
(11, '2009-01-09', 2009, 1, 1, 1, 'Enero', 9, 'Viernes'),
(12, '2009-01-06', 2009, 1, 1, 1, 'Enero', 6, 'Martes'),
(13, '2009-01-08', 2009, 1, 1, 1, 'Enero', 8, 'Jueves'),
(14, '2009-01-05', 2009, 1, 1, 1, 'Enero', 5, 'Lunes'),
(15, '2009-01-18', 2009, 1, 1, 1, 'Enero', 18, 'Domingo'),
(16, '2009-01-11', 2009, 1, 1, 1, 'Enero', 11, 'Domingo'),
(17, '2008-12-30', 2008, 2, 4, 12, 'Diciembre', 30, 'Martes'),
(18, '2008-07-14', 2008, 2, 3, 7, 'Julio', 14, 'Lunes'),
(19, '2009-02-02', 2009, 1, 1, 2, 'Febrero', 2, 'Lunes'),
(20, '2009-02-06', 2009, 1, 1, 2, 'Febrero', 6, 'Viernes'),
(21, '2009-02-07', 2009, 1, 1, 2, 'Febrero', 7, 'Sábado'),
(22, '2009-02-10', 2009, 1, 1, 2, 'Febrero', 10, 'Martes'),
(23, '2008-08-01', 2008, 2, 3, 8, 'Agosto', 1, 'Viernes'),
(24, '2008-08-03', 2008, 2, 3, 8, 'Agosto', 3, 'Domingo'),
(25, '2008-09-04', 2008, 2, 3, 9, 'Septiembre', 4, 'Jueves'),
(26, '2007-01-07', 2007, 1, 1, 1, 'Enero', 7, 'Domingo'),
(27, '2007-05-20', 2007, 1, 2, 5, 'Mayo', 20, 'Domingo'),
(28, '2007-06-20', 2007, 1, 2, 6, 'Junio', 20, 'Miércoles'),
(29, '2008-03-10', 2008, 1, 1, 3, 'Marzo', 10, 'Lunes'),
(30, '2008-10-15', 2008, 2, 4, 10, 'Octubre', 15, 'Miércoles'),
(31, '2008-11-03', 2008, 2, 4, 11, 'Noviembre', 3, 'Lunes'),
(32, '2009-03-05', 2009, 1, 1, 3, 'Marzo', 5, 'Jueves'),
(33, '2009-03-06', 2009, 1, 1, 3, 'Marzo', 6, 'Viernes'),
(34, '2009-03-09', 2009, 1, 1, 3, 'Marzo', 9, 'Lunes'),
(35, '2009-03-12', 2009, 1, 1, 3, 'Marzo', 12, 'Jueves'),
(36, '2009-03-22', 2009, 1, 1, 3, 'Marzo', 22, 'Domingo'),
(37, '2009-03-25', 2009, 1, 1, 3, 'Marzo', 25, 'Miércoles'),
(38, '2009-03-26', 2009, 1, 1, 3, 'Marzo', 26, 'Jueves'),
(39, '2009-04-01', 2009, 1, 2, 4, 'Abril', 1, 'Miércoles'),
(40, '2009-04-03', 2009, 1, 2, 4, 'Abril', 3, 'Viernes'),
(41, '2009-04-15', 2009, 1, 2, 4, 'Abril', 15, 'Miércoles'),
(42, '2008-03-17', 2008, 1, 1, 3, 'Marzo', 17, 'Lunes'),
(43, '2008-07-12', 2008, 2, 3, 7, 'Julio', 12, 'Sábado'),
(44, '2008-10-01', 2008, 2, 4, 10, 'Octubre', 1, 'Miércoles'),
(45, '2008-12-07', 2008, 2, 4, 12, 'Diciembre', 7, 'Domingo'),
(46, '2008-12-10', 2008, 2, 4, 12, 'Diciembre', 10, 'Miércoles'),
(47, '2008-12-19', 2008, 2, 4, 12, 'Diciembre', 19, 'Viernes'),
(48, '2009-01-24', 2009, 1, 1, 1, 'Enero', 24, 'Sábado'),
(49, '2009-01-14', 2009, 1, 1, 1, 'Enero', 14, 'Miércoles'),
(50, '2008-11-15', 2008, 2, 4, 11, 'Noviembre', 15, 'Sábado'),
(51, '2009-01-03', 2009, 1, 1, 1, 'Enero', 3, 'Sábado'),
(52, '2008-12-15', 2008, 2, 4, 12, 'Diciembre', 15, 'Lunes'),
(53, '2009-01-25', 2009, 1, 1, 1, 'Enero', 25, 'Domingo'),
(54, '2007-10-05', 2007, 2, 4, 10, 'Octubre', 5, 'Viernes'),
(55, '2009-03-18', 2009, 1, 1, 3, 'Marzo', 18, 'Miércoles'),
(56, '2009-04-19', 2009, 1, 2, 4, 'Abril', 19, 'Domingo'),
(57, '2009-05-03', 2009, 1, 2, 5, 'Mayo', 3, 'Domingo'),
(58, '2009-10-18', 2009, 2, 4, 10, 'Octubre', 18, 'Domingo'),
(59, '2008-01-04', 2008, 1, 1, 1, 'Enero', 4, 'Viernes'),
(60, '2008-03-20', 2008, 1, 1, 3, 'Marzo', 20, 'Jueves'),
(61, '2008-10-08', 2008, 2, 4, 10, 'Octubre', 8, 'Miércoles'),
(62, '2009-02-15', 2009, 1, 1, 2, 'Febrero', 15, 'Domingo'),
(63, '2009-01-10', 2009, 1, 1, 1, 'Enero', 10, 'Sábado'),
(64, '2009-03-07', 2009, 1, 1, 3, 'Marzo', 7, 'Sábado'),
(65, '2008-12-28', 2008, 2, 4, 12, 'Diciembre', 28, 'Domingo'),
(66, '2009-03-02', 2009, 1, 1, 3, 'Marzo', 2, 'Lunes'),
(67, '2009-02-14', 2009, 1, 1, 2, 'Febrero', 14, 'Sábado'),
(68, '2009-05-13', 2009, 1, 2, 5, 'Mayo', 13, 'Miércoles'),
(69, '2009-04-06', 2009, 1, 2, 4, 'Abril', 6, 'Lunes'),
(70, '2009-04-09', 2009, 1, 2, 4, 'Abril', 9, 'Jueves'),
(71, '2006-05-25', 2006, 1, 2, 5, 'Mayo', 25, 'Jueves'),
(72, '2007-03-19', 2007, 1, 1, 3, 'Marzo', 19, 'Lunes'),
(73, '2008-03-05', 2008, 1, 1, 3, 'Marzo', 5, 'Miércoles'),
(74, '2008-10-28', 2008, 2, 4, 10, 'Octubre', 28, 'Martes'),
(75, '2008-11-29', 2008, 2, 4, 11, 'Noviembre', 29, 'Sábado'),
(76, '2008-06-28', 2008, 1, 2, 6, 'Junio', 28, 'Sábado'),
(77, '2008-08-25', 2008, 2, 3, 8, 'Agosto', 25, 'Lunes'),
(78, '2008-11-10', 2008, 2, 4, 11, 'Noviembre', 10, 'Lunes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hechos_ventas`
--

CREATE TABLE `hechos_ventas` (
  `tiempo_key` int(11) NOT NULL,
  `producto_key` int(11) NOT NULL,
  `cliente_key` int(11) NOT NULL,
  `empleado_key` int(11) NOT NULL,
  `oficina_key` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unidad` decimal(15,2) NOT NULL,
  `total_linea` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dim_cliente`
--
ALTER TABLE `dim_cliente`
  ADD PRIMARY KEY (`cliente_key`);

--
-- Indices de la tabla `dim_empleado`
--
ALTER TABLE `dim_empleado`
  ADD PRIMARY KEY (`empleado_key`);

--
-- Indices de la tabla `dim_oficina`
--
ALTER TABLE `dim_oficina`
  ADD PRIMARY KEY (`oficina_key`);

--
-- Indices de la tabla `dim_producto`
--
ALTER TABLE `dim_producto`
  ADD PRIMARY KEY (`producto_key`);

--
-- Indices de la tabla `dim_tiempo`
--
ALTER TABLE `dim_tiempo`
  ADD PRIMARY KEY (`tiempo_key`),
  ADD UNIQUE KEY `fecha_completa_unique` (`fecha_completa`);

--
-- Indices de la tabla `hechos_ventas`
--
ALTER TABLE `hechos_ventas`
  ADD PRIMARY KEY (`tiempo_key`,`producto_key`,`cliente_key`,`empleado_key`,`oficina_key`),
  ADD KEY `fk_hechos_producto` (`producto_key`),
  ADD KEY `fk_hechos_cliente` (`cliente_key`),
  ADD KEY `fk_hechos_empleado` (`empleado_key`),
  ADD KEY `fk_hechos_oficina` (`oficina_key`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dim_cliente`
--
ALTER TABLE `dim_cliente`
  MODIFY `cliente_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `dim_empleado`
--
ALTER TABLE `dim_empleado`
  MODIFY `empleado_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `dim_oficina`
--
ALTER TABLE `dim_oficina`
  MODIFY `oficina_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `dim_producto`
--
ALTER TABLE `dim_producto`
  MODIFY `producto_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT de la tabla `dim_tiempo`
--
ALTER TABLE `dim_tiempo`
  MODIFY `tiempo_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hechos_ventas`
--
ALTER TABLE `hechos_ventas`
  ADD CONSTRAINT `fk_hechos_cliente` FOREIGN KEY (`cliente_key`) REFERENCES `dim_cliente` (`cliente_key`),
  ADD CONSTRAINT `fk_hechos_empleado` FOREIGN KEY (`empleado_key`) REFERENCES `dim_empleado` (`empleado_key`),
  ADD CONSTRAINT `fk_hechos_oficina` FOREIGN KEY (`oficina_key`) REFERENCES `dim_oficina` (`oficina_key`),
  ADD CONSTRAINT `fk_hechos_producto` FOREIGN KEY (`producto_key`) REFERENCES `dim_producto` (`producto_key`),
  ADD CONSTRAINT `fk_hechos_tiempo` FOREIGN KEY (`tiempo_key`) REFERENCES `dim_tiempo` (`tiempo_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
