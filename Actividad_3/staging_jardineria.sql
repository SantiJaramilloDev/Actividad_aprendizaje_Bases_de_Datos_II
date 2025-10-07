-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2025 a las 22:39:22
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
-- Base de datos: `staging_jardineria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_categoria_producto`
--

CREATE TABLE `stg_categoria_producto` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `desc_categoria` varchar(200) DEFAULT NULL,
  `descripcion_texto` text DEFAULT NULL,
  `descripcion_html` text DEFAULT NULL,
  `imagen` varchar(300) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_categoria_producto`
--

INSERT INTO `stg_categoria_producto` (`load_id`, `source_id`, `desc_categoria`, `descripcion_texto`, `descripcion_html`, `imagen`, `load_date`, `raw_row`) VALUES
(1, 1, 'Herbaceas', 'Plantas para jardin decorativas', NULL, NULL, '2025-09-15 15:55:32', '{\"Id_Categoria\": 1}'),
(2, 2, 'Herramientas', '2 para todo tipo de acción', NULL, NULL, '2025-09-15 15:55:32', '{\"Id_Categoria\": 2}'),
(3, 3, 'Aromaticas', 'Plantas aromáticas', NULL, NULL, '2025-09-15 15:55:32', '{\"Id_Categoria\": 3}'),
(4, 4, 'Frutales', 'Árboles pequeños de producción frutal', NULL, NULL, '2025-09-15 15:55:32', '{\"Id_Categoria\": 4}'),
(5, 5, 'Ornamentales', 'Plantas vistosas para la decoración del jardín', NULL, NULL, '2025-09-15 15:55:32', '{\"Id_Categoria\": 5}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_cliente`
--

CREATE TABLE `stg_cliente` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `nombre_contacto` varchar(60) DEFAULT NULL,
  `apellido_contacto` varchar(60) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `linea_direccion1` varchar(200) DEFAULT NULL,
  `linea_direccion2` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `empleado_rep_ventas_id` int(11) DEFAULT NULL,
  `limite_credito` decimal(15,2) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `source_system` varchar(50) DEFAULT 'jardineria',
  `is_valid` tinyint(1) DEFAULT 1,
  `validation_errors` text DEFAULT NULL,
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_cliente`
--

INSERT INTO `stg_cliente` (`load_id`, `source_id`, `nombre_cliente`, `nombre_contacto`, `apellido_contacto`, `telefono`, `fax`, `linea_direccion1`, `linea_direccion2`, `ciudad`, `region`, `pais`, `codigo_postal`, `empleado_rep_ventas_id`, `limite_credito`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(1, 1, 'GoldFish Garden', 'Daniel G', 'GoldFish', '5556901745', '5556901746', 'False Street 52 2 A', NULL, 'San Francisco', NULL, 'USA', '24006', 19, 3000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 1, \"nombre_cliente\": \"GoldFish Garden\"}'),
(2, 2, 'Gardening Associates', 'Anne', 'Wright', '5557410345', '5557410346', 'Wall-e Avenue', NULL, 'Miami', 'Miami', 'USA', '24010', 19, 6000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 2, \"nombre_cliente\": \"Gardening Associates\"}'),
(3, 3, 'Gerudo Valley', 'Link', 'Flaute', '5552323129', '5552323128', 'Oaks Avenue nº22', NULL, 'New York', NULL, 'USA', '85495', 22, 12000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 3, \"nombre_cliente\": \"Gerudo Valley\"}'),
(4, 4, 'Tendo Garden', 'Akane', 'Tendo', '55591233210', '55591233211', 'Null Street nº69', NULL, 'Miami', NULL, 'USA', '696969', 22, 600000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 4, \"nombre_cliente\": \"Tendo Garden\"}'),
(5, 5, 'Lasas S.A.', 'Antonio', 'Lasas', '34916540145', '34914851312', 'C/Leganes 15', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '28945', 8, 154310.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 5, \"nombre_cliente\": \"Lasas S.A.\"}'),
(6, 6, 'Beragua', 'Jose', 'Bermejo', '654987321', '916549872', 'C/pintor segundo', 'Getafe', 'Madrid', 'Madrid', 'Spain', '28942', 11, 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 6, \"nombre_cliente\": \"Beragua\"}'),
(7, 7, 'Club Golf Puerta del hierro', 'Paco', 'Lopez', '62456810', '919535678', 'C/sinesio delgado', 'Madrid', 'Madrid', 'Madrid', 'Spain', '28930', 11, 40000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 7, \"nombre_cliente\": \"Club Golf Puerta del hierro\"}'),
(8, 8, 'Naturagua', 'Guillermo', 'Rengifo', '689234750', '916428956', 'C/majadahonda', 'Boadilla', 'Madrid', 'Madrid', 'Spain', '28947', 11, 32000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 8, \"nombre_cliente\": \"Naturagua\"}'),
(9, 9, 'DaraDistribuciones', 'David', 'Serrano', '675598001', '916421756', 'C/azores', 'Fuenlabrada', 'Madrid', 'Madrid', 'Spain', '28946', 11, 50000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 9, \"nombre_cliente\": \"DaraDistribuciones\"}'),
(10, 10, 'Madrileña de riegos', 'Jose', 'Tacaño', '655983045', '916689215', 'C/Lagañas', 'Fuenlabrada', 'Madrid', 'Madrid', 'Spain', '28943', 11, 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 10, \"nombre_cliente\": \"Madrileña de riegos\"}'),
(11, 11, 'Lasas S.A.', 'Antonio', 'Lasas', '34916540145', '34914851312', 'C/Leganes 15', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '28945', 8, 154310.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 11, \"nombre_cliente\": \"Lasas S.A.\"}'),
(12, 12, 'Camunas Jardines S.L.', 'Pedro', 'Camunas', '34914873241', '34914871541', 'C/Virgenes 45', 'C/Princesas 2 1ºB', 'San Lorenzo del Escorial', 'Madrid', 'Spain', '28145', 8, 16481.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 12, \"nombre_cliente\": \"Camunas Jardines S.L.\"}'),
(13, 13, 'Dardena S.A.', 'Juan', 'Rodriguez', '34912453217', '34912484764', 'C/Nueva York 74', NULL, 'Madrid', 'Madrid', 'Spain', '28003', 8, 321000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 13, \"nombre_cliente\": \"Dardena S.A.\"}'),
(14, 14, 'Jardin de Flores', 'Javier', 'Villar', '654865643', '914538776', 'C/ Oña 34', NULL, 'Madrid', 'Madrid', 'Spain', '28950', 30, 40000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 14, \"nombre_cliente\": \"Jardin de Flores\"}'),
(15, 15, 'Flores Marivi', 'Maria', 'Rodriguez', '666555444', '912458657', 'C/Leganes24', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '28945', 5, 1500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 15, \"nombre_cliente\": \"Flores Marivi\"}'),
(16, 16, 'Flowers, S.A', 'Beatriz', 'Fernandez', '698754159', '978453216', 'C/Luis Salquillo4', NULL, 'Montornes del valles', 'Barcelona', 'Spain', '24586', 5, 3500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 16, \"nombre_cliente\": \"Flowers, S.A\"}'),
(17, 17, 'Naturajardin', 'Victoria', 'Cruz', '612343529', '916548735', 'Plaza Magallón 15', NULL, 'Madrid', 'Madrid', 'Spain', '28011', 30, 5050.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 17, \"nombre_cliente\": \"Naturajardin\"}'),
(18, 18, 'Golf S.A.', 'Luis', 'Martinez', '916458762', '912354475', 'C/Estancado', NULL, 'Santa cruz de Tenerife', 'Islas Canarias', 'Spain', '38297', 12, 30000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 18, \"nombre_cliente\": \"Golf S.A.\"}'),
(19, 19, 'Americh Golf Management SL', 'Mario', 'Suarez', '964493072', '964493063', 'C/Letardo', NULL, 'Barcelona', 'Cataluña', 'Spain', '12320', 12, 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 19, \"nombre_cliente\": \"Americh Golf Management SL\"}'),
(20, 20, 'Aloha', 'Cristian', 'Rodrigez', '916485852', '914489898', 'C/Roman 3', NULL, 'Canarias', 'Canarias', 'Spain', '35488', 12, 50000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 20, \"nombre_cliente\": \"Aloha\"}'),
(21, 21, 'El Prat', 'Francisco', 'Camacho', '916882323', '916493211', 'Avenida Tibidabo', NULL, 'Barcelona', 'Cataluña', 'Spain', '12320', 12, 30000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 21, \"nombre_cliente\": \"El Prat\"}'),
(22, 22, 'Sotogrande', 'Maria', 'Santillana', '915576622', '914825645', 'C/Paseo del Parque', NULL, 'Sotogrande', 'Cadiz', 'Spain', '11310', 12, 60000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 22, \"nombre_cliente\": \"Sotogrande\"}'),
(23, 23, 'Vivero Humanes', 'Federico', 'Gomez', '654987690', '916040875', 'C/Miguel Echegaray 54', NULL, 'Humanes', 'Madrid', 'Spain', '28970', 30, 7430.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 23, \"nombre_cliente\": \"Vivero Humanes\"}'),
(24, 24, 'Fuenla City', 'Tony', 'Muñoz Mena', '675842139', '915483754', 'C/Callo 52', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '28574', 5, 4500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 24, \"nombre_cliente\": \"Fuenla City\"}'),
(25, 25, 'Jardines y Mansiones Cactus SL', 'Eva María', 'Sánchez', '916877445', '914477777', 'Polígono Industrial Maspalomas, Nº52', 'Móstoles', 'Madrid', 'Madrid', 'Spain', '29874', 9, 76000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 25, \"nombre_cliente\": \"Jardines y Mansiones Cactus SL\"}'),
(26, 26, 'Jardinerías Matías SL', 'Matías', 'San Martín', '916544147', '917897474', 'C/Francisco Arce, Nº44', 'Bustarviejo', 'Madrid', 'Madrid', 'Spain', '37845', 9, 100500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 26, \"nombre_cliente\": \"Jardinerías Matías SL\"}'),
(27, 27, 'Agrojardin', 'Benito', 'Lopez', '675432926', '916549264', 'C/Mar Caspio 43', NULL, 'Getafe', 'Madrid', 'Spain', '28904', 30, 8040.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 27, \"nombre_cliente\": \"Agrojardin\"}'),
(28, 28, 'Top Campo', 'Joseluis', 'Sanchez', '685746512', '974315924', 'C/Ibiza 32', NULL, 'Humanes', 'Madrid', 'Spain', '28574', 5, 5500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 28, \"nombre_cliente\": \"Top Campo\"}'),
(29, 29, 'Jardineria Sara', 'Sara', 'Marquez', '675124537', '912475843', 'C/Lima 1', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '27584', 5, 7500.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 29, \"nombre_cliente\": \"Jardineria Sara\"}'),
(30, 30, 'Campohermoso', 'Luis', 'Jimenez', '645925376', '916159116', 'C/Peru 78', NULL, 'Fuenlabrada', 'Madrid', 'Spain', '28945', 30, 3250.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 30, \"nombre_cliente\": \"Campohermoso\"}'),
(31, 31, 'france telecom', 'FraÃ§ois', 'Toulou', '(33)5120578961', '(33)5120578961', '6 place d Alleray 15Ã¨me', NULL, 'Paris', NULL, 'France', '75010', 16, 10000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 31, \"nombre_cliente\": \"france telecom\"}'),
(32, 32, 'Musée du Louvre', 'Pierre', 'Delacroux', '(33)0140205050', '(33)0140205442', 'Quai du Louvre', NULL, 'Paris', NULL, 'France', '75058', 16, 30000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 32, \"nombre_cliente\": \"Musée du Louvre\"}'),
(33, 33, 'Tutifruti S.A', 'Jacob', 'Jones', '2 9261-2433', '2 9283-1695', 'level 24, St. Martins Tower.-31 Market St.', NULL, 'Sydney', 'Nueva Gales del Sur', 'Australia', '2000', 31, 10000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 33, \"nombre_cliente\": \"Tutifruti S.A\"}'),
(34, 34, 'Flores S.L.', 'Antonio', 'Romero', '654352981', '685249700', 'Avenida España', NULL, 'Madrid', 'Fuenlabrada', 'Spain', '29643', 18, 6000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 34, \"nombre_cliente\": \"Flores S.L.\"}'),
(35, 35, 'The Magic Garden', 'Richard', 'Mcain', '926523468', '9364875882', 'Lihgting Park', NULL, 'London', 'London', 'United Kingdom', '65930', 18, 10000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 35, \"nombre_cliente\": \"The Magic Garden\"}'),
(36, 36, 'El Jardin Viviente S.L', 'Justin', 'Smith', '2 8005-7161', '2 8005-7162', '176 Cumberland Street The rocks', NULL, 'Sydney', 'Nueva Gales del Sur', 'Australia', '2003', 31, 8000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_cliente\": 36, \"nombre_cliente\": \"El Jardin Viviente S.L\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_detalle_pedido`
--

CREATE TABLE `stg_detalle_pedido` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unidad` decimal(15,2) DEFAULT NULL,
  `numero_linea` smallint(6) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `source_system` varchar(50) DEFAULT 'jardineria',
  `is_valid` tinyint(1) DEFAULT 1,
  `validation_errors` text DEFAULT NULL,
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_detalle_pedido`
--

INSERT INTO `stg_detalle_pedido` (`load_id`, `source_id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unidad`, `numero_linea`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(1, 1, 1, 87, 10, 70.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 1, \"ID_pedido\": 1}'),
(2, 2, 1, 151, 40, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 2, \"ID_pedido\": 1}'),
(3, 3, 1, 165, 25, 4.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 3, \"ID_pedido\": 1}'),
(4, 4, 1, 265, 15, 19.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 4, \"ID_pedido\": 1}'),
(5, 5, 1, 276, 23, 14.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 5, \"ID_pedido\": 1}'),
(6, 6, 2, 57, 3, 29.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 6, \"ID_pedido\": 2}'),
(7, 7, 2, 58, 7, 8.00, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 7, \"ID_pedido\": 2}'),
(8, 8, 2, 164, 50, 4.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 8, \"ID_pedido\": 2}'),
(9, 9, 2, 165, 20, 5.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 9, \"ID_pedido\": 2}'),
(10, 10, 2, 183, 12, 6.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 10, \"ID_pedido\": 2}'),
(11, 11, 2, 251, 67, 64.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 11, \"ID_pedido\": 2}'),
(12, 12, 2, 271, 5, 462.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 12, \"ID_pedido\": 2}'),
(13, 13, 3, 66, 120, 9.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 13, \"ID_pedido\": 3}'),
(14, 14, 3, 146, 32, 5.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 14, \"ID_pedido\": 3}'),
(15, 15, 3, 147, 11, 5.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 15, \"ID_pedido\": 3}'),
(16, 16, 3, 237, 30, 266.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 16, \"ID_pedido\": 3}'),
(17, 17, 3, 241, 15, 65.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 17, \"ID_pedido\": 3}'),
(18, 18, 3, 242, 24, 25.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 18, \"ID_pedido\": 3}'),
(19, 19, 4, 48, 12, 8.00, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 19, \"ID_pedido\": 4}'),
(20, 20, 4, 51, 42, 8.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 20, \"ID_pedido\": 4}'),
(21, 21, 4, 58, 42, 9.00, 8, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 21, \"ID_pedido\": 4}'),
(22, 22, 4, 176, 3, 6.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 22, \"ID_pedido\": 4}'),
(23, 23, 4, 179, 4, 6.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 23, \"ID_pedido\": 4}'),
(24, 24, 4, 180, 17, 9.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 24, \"ID_pedido\": 4}'),
(25, 25, 4, 181, 38, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 25, \"ID_pedido\": 4}'),
(26, 26, 4, 246, 21, 59.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 26, \"ID_pedido\": 4}'),
(27, 27, 8, 23, 3, 11.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 27, \"ID_pedido\": 8}'),
(28, 28, 8, 25, 1, 32.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 28, \"ID_pedido\": 8}'),
(29, 29, 8, 26, 10, 100.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 29, \"ID_pedido\": 8}'),
(30, 30, 9, 5, 80, 1.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 30, \"ID_pedido\": 9}'),
(31, 31, 9, 12, 450, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 31, \"ID_pedido\": 9}'),
(32, 32, 9, 23, 80, 8.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 32, \"ID_pedido\": 9}'),
(33, 33, 9, 89, 15, 91.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 33, \"ID_pedido\": 9}'),
(34, 34, 10, 104, 5, 70.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 34, \"ID_pedido\": 10}'),
(35, 35, 10, 114, 30, 75.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 35, \"ID_pedido\": 10}'),
(36, 36, 10, 258, 5, 64.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 36, \"ID_pedido\": 10}'),
(37, 37, 11, 10, 180, 1.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 37, \"ID_pedido\": 11}'),
(38, 38, 11, 271, 80, 8.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 38, \"ID_pedido\": 11}'),
(39, 39, 12, 13, 290, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 39, \"ID_pedido\": 12}'),
(40, 40, 13, 1, 5, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 40, \"ID_pedido\": 13}'),
(41, 41, 13, 2, 12, 14.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 41, \"ID_pedido\": 13}'),
(42, 42, 13, 26, 5, 100.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 42, \"ID_pedido\": 13}'),
(43, 43, 14, 17, 8, 11.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 43, \"ID_pedido\": 14}'),
(44, 44, 14, 28, 13, 57.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 44, \"ID_pedido\": 14}'),
(45, 45, 15, 106, 4, 13.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 45, \"ID_pedido\": 15}'),
(46, 46, 15, 125, 2, 6.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 46, \"ID_pedido\": 15}'),
(47, 47, 15, 180, 6, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 47, \"ID_pedido\": 15}'),
(48, 48, 15, 227, 9, 10.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 48, \"ID_pedido\": 15}'),
(49, 49, 16, 4, 12, 12.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 49, \"ID_pedido\": 16}'),
(50, 50, 16, 53, 10, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 50, \"ID_pedido\": 16}'),
(51, 51, 17, 1, 5, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 51, \"ID_pedido\": 17}'),
(52, 52, 17, 3, 5, 12.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 52, \"ID_pedido\": 17}'),
(53, 53, 17, 54, 5, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 53, \"ID_pedido\": 17}'),
(54, 54, 17, 84, 5, 22.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 54, \"ID_pedido\": 17}'),
(55, 55, 17, 160, 5, 18.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 55, \"ID_pedido\": 17}'),
(56, 56, 18, 3, 4, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 56, \"ID_pedido\": 18}'),
(57, 57, 18, 38, 2, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 57, \"ID_pedido\": 18}'),
(58, 58, 18, 183, 10, 6.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 58, \"ID_pedido\": 18}'),
(59, 59, 19, 4, 9, 12.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 59, \"ID_pedido\": 19}'),
(60, 60, 19, 39, 6, 8.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 60, \"ID_pedido\": 19}'),
(61, 61, 19, 96, 1, 32.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 61, \"ID_pedido\": 19}'),
(62, 62, 19, 106, 5, 13.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 62, \"ID_pedido\": 19}'),
(63, 63, 19, 232, 20, 4.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 63, \"ID_pedido\": 19}'),
(64, 64, 20, 1, 14, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 64, \"ID_pedido\": 20}'),
(65, 65, 20, 4, 8, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 65, \"ID_pedido\": 20}'),
(66, 66, 21, 2, 5, 14.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 66, \"ID_pedido\": 21}'),
(67, 67, 21, 33, 22, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 67, \"ID_pedido\": 21}'),
(68, 68, 21, 72, 3, 8.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 68, \"ID_pedido\": 21}'),
(69, 69, 22, 264, 1, 6.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 69, \"ID_pedido\": 22}'),
(70, 70, 23, 6, 110, 1.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 70, \"ID_pedido\": 23}'),
(71, 71, 23, 24, 50, 22.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 71, \"ID_pedido\": 23}'),
(72, 72, 23, 107, 4, 70.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 72, \"ID_pedido\": 23}'),
(73, 73, 23, 273, 30, 5.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 73, \"ID_pedido\": 23}'),
(74, 74, 24, 3, 3, 15.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 74, \"ID_pedido\": 24}'),
(75, 75, 24, 15, 4, 7.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 75, \"ID_pedido\": 24}'),
(76, 76, 24, 39, 2, 7.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 76, \"ID_pedido\": 24}'),
(77, 77, 24, 265, 10, 20.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 77, \"ID_pedido\": 24}'),
(78, 78, 25, 98, 15, 69.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 78, \"ID_pedido\": 25}'),
(79, 79, 25, 112, 4, 30.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 79, \"ID_pedido\": 25}'),
(80, 80, 25, 117, 10, 30.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 80, \"ID_pedido\": 25}'),
(81, 81, 26, 30, 9, 25.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 81, \"ID_pedido\": 26}'),
(82, 82, 26, 212, 4, 25.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 82, \"ID_pedido\": 26}'),
(83, 83, 26, 242, 14, 25.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 83, \"ID_pedido\": 26}'),
(84, 84, 27, 125, 22, 6.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 84, \"ID_pedido\": 27}'),
(85, 85, 27, 126, 22, 6.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 85, \"ID_pedido\": 27}'),
(86, 86, 27, 210, 40, 6.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 86, \"ID_pedido\": 27}'),
(87, 87, 28, 26, 8, 99.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 87, \"ID_pedido\": 28}'),
(88, 88, 28, 237, 3, 266.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 88, \"ID_pedido\": 28}'),
(89, 89, 28, 271, 1, 462.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 89, \"ID_pedido\": 28}'),
(90, 90, 29, 104, 4, 70.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 90, \"ID_pedido\": 29}'),
(91, 91, 29, 112, 4, 28.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 91, \"ID_pedido\": 29}'),
(92, 92, 29, 117, 20, 31.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 92, \"ID_pedido\": 29}'),
(93, 93, 29, 153, 2, 111.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 93, \"ID_pedido\": 29}'),
(94, 94, 29, 184, 10, 9.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 94, \"ID_pedido\": 29}'),
(95, 95, 30, 8, 10, 1.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 95, \"ID_pedido\": 30}'),
(96, 96, 30, 25, 2, 32.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 96, \"ID_pedido\": 30}'),
(97, 97, 30, 27, 2, 19.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 97, \"ID_pedido\": 30}'),
(98, 98, 30, 93, 4, 31.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 98, \"ID_pedido\": 30}'),
(99, 99, 30, 111, 10, 45.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 99, \"ID_pedido\": 30}'),
(100, 100, 30, 144, 5, 5.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 100, \"ID_pedido\": 30}'),
(101, 101, 31, 13, 25, 2.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 101, \"ID_pedido\": 31}'),
(102, 102, 31, 19, 1, 20.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 102, \"ID_pedido\": 31}'),
(103, 103, 31, 57, 6, 29.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 103, \"ID_pedido\": 31}'),
(104, 104, 32, 1, 1, 14.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 104, \"ID_pedido\": 32}'),
(105, 105, 32, 2, 4, 15.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 105, \"ID_pedido\": 32}'),
(106, 106, 32, 3, 1, 15.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 106, \"ID_pedido\": 32}'),
(107, 107, 32, 152, 29, 100.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 107, \"ID_pedido\": 32}'),
(108, 108, 32, 217, 5, 20.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 108, \"ID_pedido\": 32}'),
(109, 109, 33, 32, 423, 2.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 109, \"ID_pedido\": 33}'),
(110, 110, 33, 45, 120, 8.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 110, \"ID_pedido\": 33}'),
(111, 111, 33, 238, 212, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 111, \"ID_pedido\": 33}'),
(112, 112, 33, 271, 150, 462.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 112, \"ID_pedido\": 33}'),
(113, 113, 34, 46, 56, 7.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 113, \"ID_pedido\": 34}'),
(114, 114, 34, 90, 12, 29.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 114, \"ID_pedido\": 34}'),
(115, 115, 34, 196, 20, 18.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 115, \"ID_pedido\": 34}'),
(116, 116, 34, 198, 24, 18.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 116, \"ID_pedido\": 34}'),
(117, 117, 35, 2, 12, 14.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 117, \"ID_pedido\": 35}'),
(118, 118, 35, 65, 55, 8.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 118, \"ID_pedido\": 35}'),
(119, 119, 35, 189, 3, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 119, \"ID_pedido\": 35}'),
(120, 120, 35, 205, 36, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 120, \"ID_pedido\": 35}'),
(121, 121, 35, 249, 72, 10.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 121, \"ID_pedido\": 35}'),
(122, 122, 36, 4, 4, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 122, \"ID_pedido\": 36}'),
(123, 123, 36, 15, 2, 7.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 123, \"ID_pedido\": 36}'),
(124, 124, 36, 171, 6, 7.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 124, \"ID_pedido\": 36}'),
(125, 125, 36, 227, 1, 12.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 125, \"ID_pedido\": 36}'),
(126, 126, 36, 276, 15, 13.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 126, \"ID_pedido\": 36}'),
(127, 127, 37, 22, 4, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 127, \"ID_pedido\": 37}'),
(128, 128, 37, 76, 203, 8.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 128, \"ID_pedido\": 37}'),
(129, 129, 37, 200, 38, 10.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 129, \"ID_pedido\": 37}'),
(130, 130, 38, 1, 5, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 130, \"ID_pedido\": 38}'),
(131, 131, 38, 2, 2, 14.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 131, \"ID_pedido\": 38}'),
(132, 132, 39, 3, 3, 12.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 132, \"ID_pedido\": 39}'),
(133, 133, 39, 4, 6, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 133, \"ID_pedido\": 39}'),
(134, 134, 40, 5, 4, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 134, \"ID_pedido\": 40}'),
(135, 135, 40, 6, 8, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 135, \"ID_pedido\": 40}'),
(136, 136, 41, 7, 5, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 136, \"ID_pedido\": 41}'),
(137, 137, 41, 8, 5, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 137, \"ID_pedido\": 41}'),
(138, 138, 42, 9, 3, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 138, \"ID_pedido\": 42}'),
(139, 139, 42, 10, 1, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 139, \"ID_pedido\": 42}'),
(140, 140, 43, 11, 9, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 140, \"ID_pedido\": 43}'),
(141, 141, 44, 12, 5, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 141, \"ID_pedido\": 44}'),
(142, 142, 45, 13, 6, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 142, \"ID_pedido\": 45}'),
(143, 143, 45, 14, 4, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 143, \"ID_pedido\": 45}'),
(144, 144, 46, 15, 4, 7.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 144, \"ID_pedido\": 46}'),
(145, 145, 46, 16, 8, 7.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 145, \"ID_pedido\": 46}'),
(146, 146, 47, 17, 9, 11.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 146, \"ID_pedido\": 47}'),
(147, 147, 47, 18, 5, 13.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 147, \"ID_pedido\": 47}'),
(148, 148, 48, 19, 1, 18.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 148, \"ID_pedido\": 48}'),
(149, 149, 48, 20, 1, 25.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 149, \"ID_pedido\": 48}'),
(150, 150, 48, 258, 50, 64.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 150, \"ID_pedido\": 48}'),
(151, 151, 48, 260, 45, 49.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 151, \"ID_pedido\": 48}'),
(152, 152, 48, 261, 50, 19.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 152, \"ID_pedido\": 48}'),
(153, 153, 49, 228, 50, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 153, \"ID_pedido\": 49}'),
(154, 154, 49, 229, 10, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 154, \"ID_pedido\": 49}'),
(155, 155, 49, 230, 5, 5.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 155, \"ID_pedido\": 49}'),
(156, 156, 50, 249, 12, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 156, \"ID_pedido\": 50}'),
(157, 157, 50, 250, 15, 38.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 157, \"ID_pedido\": 50}'),
(158, 158, 50, 251, 44, 64.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 158, \"ID_pedido\": 50}'),
(159, 159, 51, 233, 50, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 159, \"ID_pedido\": 51}'),
(160, 160, 51, 234, 80, 39.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 160, \"ID_pedido\": 51}'),
(161, 161, 51, 235, 70, 59.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 161, \"ID_pedido\": 51}'),
(162, 162, 53, 35, 1, 7.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 162, \"ID_pedido\": 53}'),
(163, 163, 53, 107, 1, 70.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 163, \"ID_pedido\": 53}'),
(164, 164, 53, 108, 2, 11.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 164, \"ID_pedido\": 53}'),
(165, 165, 53, 140, 6, 7.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 165, \"ID_pedido\": 53}'),
(166, 166, 54, 1, 3, 14.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 166, \"ID_pedido\": 54}'),
(167, 167, 54, 17, 45, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 167, \"ID_pedido\": 54}'),
(168, 168, 54, 33, 5, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 168, \"ID_pedido\": 54}'),
(169, 169, 54, 100, 3, 22.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 169, \"ID_pedido\": 54}'),
(170, 170, 54, 140, 8, 7.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 170, \"ID_pedido\": 54}'),
(171, 171, 54, 147, 3, 5.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 171, \"ID_pedido\": 54}'),
(172, 172, 54, 192, 2, 10.00, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 172, \"ID_pedido\": 54}'),
(173, 173, 55, 139, 9, 7.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 173, \"ID_pedido\": 55}'),
(174, 174, 55, 237, 2, 266.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 174, \"ID_pedido\": 55}'),
(175, 175, 55, 251, 6, 64.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 175, \"ID_pedido\": 55}'),
(176, 176, 55, 267, 2, 64.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 176, \"ID_pedido\": 55}'),
(177, 177, 55, 271, 1, 462.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 177, \"ID_pedido\": 55}'),
(178, 178, 56, 153, 1, 115.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 178, \"ID_pedido\": 56}'),
(179, 179, 56, 154, 10, 18.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 179, \"ID_pedido\": 56}'),
(180, 180, 56, 203, 1, 6.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 180, \"ID_pedido\": 56}'),
(181, 181, 56, 220, 3, 10.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 181, \"ID_pedido\": 56}'),
(182, 182, 56, 231, 4, 4.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 182, \"ID_pedido\": 56}'),
(183, 183, 56, 274, 3, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 183, \"ID_pedido\": 56}'),
(184, 184, 57, 89, 6, 91.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 184, \"ID_pedido\": 57}'),
(185, 185, 57, 103, 3, 49.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 185, \"ID_pedido\": 57}'),
(186, 186, 57, 106, 2, 13.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 186, \"ID_pedido\": 57}'),
(187, 187, 57, 117, 6, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 187, \"ID_pedido\": 57}'),
(188, 188, 58, 126, 65, 18.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 188, \"ID_pedido\": 58}'),
(189, 189, 58, 163, 80, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 189, \"ID_pedido\": 58}'),
(190, 190, 58, 196, 69, 15.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 190, \"ID_pedido\": 58}'),
(191, 191, 58, 201, 150, 15.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 191, \"ID_pedido\": 58}'),
(192, 192, 74, 87, 15, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 192, \"ID_pedido\": 74}'),
(193, 193, 74, 251, 34, 64.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 193, \"ID_pedido\": 74}'),
(194, 194, 74, 271, 42, 8.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 194, \"ID_pedido\": 74}'),
(195, 195, 75, 10, 60, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 195, \"ID_pedido\": 75}'),
(196, 196, 75, 109, 24, 22.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 196, \"ID_pedido\": 75}'),
(197, 197, 75, 181, 46, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 197, \"ID_pedido\": 75}'),
(198, 198, 76, 13, 250, 1.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 198, \"ID_pedido\": 76}'),
(199, 199, 76, 100, 40, 22.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 199, \"ID_pedido\": 76}'),
(200, 200, 76, 109, 24, 22.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 200, \"ID_pedido\": 76}'),
(201, 201, 76, 117, 35, 9.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 201, \"ID_pedido\": 76}'),
(202, 202, 76, 220, 25, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 202, \"ID_pedido\": 76}'),
(203, 203, 77, 3, 34, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 203, \"ID_pedido\": 77}'),
(204, 204, 77, 4, 15, 12.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 204, \"ID_pedido\": 77}'),
(205, 205, 78, 72, 25, 8.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 205, \"ID_pedido\": 78}'),
(206, 206, 78, 107, 56, 70.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 206, \"ID_pedido\": 78}'),
(207, 207, 78, 181, 42, 10.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 207, \"ID_pedido\": 78}'),
(208, 208, 78, 232, 30, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 208, \"ID_pedido\": 78}'),
(209, 209, 79, 264, 50, 6.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 209, \"ID_pedido\": 79}'),
(210, 210, 80, 26, 40, 100.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 210, \"ID_pedido\": 80}'),
(211, 211, 80, 53, 47, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 211, \"ID_pedido\": 80}'),
(212, 212, 80, 160, 75, 18.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 212, \"ID_pedido\": 80}'),
(213, 213, 81, 232, 30, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 213, \"ID_pedido\": 81}'),
(214, 214, 82, 251, 34, 64.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 214, \"ID_pedido\": 82}'),
(215, 215, 83, 232, 30, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 215, \"ID_pedido\": 83}'),
(216, 216, 89, 25, 3, 32.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 216, \"ID_pedido\": 89}'),
(217, 217, 89, 46, 15, 7.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 217, \"ID_pedido\": 89}'),
(218, 218, 89, 60, 12, 8.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 218, \"ID_pedido\": 89}'),
(219, 219, 89, 86, 5, 49.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 219, \"ID_pedido\": 89}'),
(220, 220, 89, 109, 4, 22.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 220, \"ID_pedido\": 89}'),
(221, 221, 89, 181, 8, 10.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 221, \"ID_pedido\": 89}'),
(222, 222, 90, 5, 19, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 222, \"ID_pedido\": 90}'),
(223, 223, 90, 6, 10, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 223, \"ID_pedido\": 90}'),
(224, 224, 90, 7, 12, 1.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 224, \"ID_pedido\": 90}'),
(225, 225, 91, 17, 52, 11.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 225, \"ID_pedido\": 91}'),
(226, 226, 91, 18, 14, 13.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 226, \"ID_pedido\": 91}'),
(227, 227, 91, 19, 35, 18.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 227, \"ID_pedido\": 91}'),
(228, 228, 92, 25, 12, 23.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 228, \"ID_pedido\": 92}'),
(229, 229, 92, 26, 20, 100.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 229, \"ID_pedido\": 92}'),
(230, 230, 92, 27, 30, 21.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 230, \"ID_pedido\": 92}'),
(231, 231, 93, 73, 25, 9.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 231, \"ID_pedido\": 93}'),
(232, 232, 93, 77, 51, 11.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 232, \"ID_pedido\": 93}'),
(233, 233, 93, 80, 3, 32.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 233, \"ID_pedido\": 93}'),
(234, 234, 94, 1, 12, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 234, \"ID_pedido\": 94}'),
(235, 235, 94, 26, 33, 100.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 235, \"ID_pedido\": 94}'),
(236, 236, 94, 57, 79, 29.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 236, \"ID_pedido\": 94}'),
(237, 237, 95, 16, 9, 7.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 237, \"ID_pedido\": 95}'),
(238, 238, 95, 96, 6, 32.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 238, \"ID_pedido\": 95}'),
(239, 239, 95, 104, 5, 70.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 239, \"ID_pedido\": 95}'),
(240, 240, 96, 61, 6, 8.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 240, \"ID_pedido\": 96}'),
(241, 241, 96, 79, 16, 7.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 241, \"ID_pedido\": 96}'),
(242, 242, 96, 92, 10, 22.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 242, \"ID_pedido\": 96}'),
(243, 243, 96, 113, 4, 70.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 243, \"ID_pedido\": 96}'),
(244, 244, 97, 59, 12, 8.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 244, \"ID_pedido\": 97}'),
(245, 245, 97, 73, 14, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 245, \"ID_pedido\": 97}'),
(246, 246, 97, 180, 10, 10.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 246, \"ID_pedido\": 97}'),
(247, 247, 98, 50, 14, 8.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 247, \"ID_pedido\": 98}'),
(248, 248, 98, 75, 16, 8.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 248, \"ID_pedido\": 98}'),
(249, 249, 98, 80, 8, 32.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 249, \"ID_pedido\": 98}'),
(250, 250, 98, 101, 18, 6.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 250, \"ID_pedido\": 98}'),
(251, 251, 98, 107, 6, 70.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 251, \"ID_pedido\": 98}'),
(252, 252, 99, 181, 15, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 252, \"ID_pedido\": 99}'),
(253, 253, 99, 251, 30, 64.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 253, \"ID_pedido\": 99}'),
(254, 254, 100, 109, 20, 22.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 254, \"ID_pedido\": 100}'),
(255, 255, 100, 117, 40, 9.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 255, \"ID_pedido\": 100}'),
(256, 256, 101, 10, 50, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 256, \"ID_pedido\": 101}'),
(257, 257, 101, 13, 159, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 257, \"ID_pedido\": 101}'),
(258, 258, 102, 3, 32, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 258, \"ID_pedido\": 102}'),
(259, 259, 102, 4, 23, 12.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 259, \"ID_pedido\": 102}'),
(260, 260, 103, 72, 12, 8.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 260, \"ID_pedido\": 103}'),
(261, 261, 103, 232, 52, 4.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 261, \"ID_pedido\": 103}'),
(262, 262, 104, 107, 9, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 262, \"ID_pedido\": 104}'),
(263, 263, 104, 181, 113, 10.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 263, \"ID_pedido\": 104}'),
(264, 264, 105, 251, 21, 64.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 264, \"ID_pedido\": 105}'),
(265, 265, 105, 264, 27, 6.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 265, \"ID_pedido\": 105}'),
(266, 266, 106, 13, 231, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 266, \"ID_pedido\": 106}'),
(267, 267, 106, 160, 47, 18.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 267, \"ID_pedido\": 106}'),
(268, 268, 107, 4, 143, 12.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 268, \"ID_pedido\": 107}'),
(269, 269, 107, 26, 15, 100.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 269, \"ID_pedido\": 107}'),
(270, 270, 108, 72, 53, 8.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 270, \"ID_pedido\": 108}'),
(271, 271, 108, 232, 59, 4.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 271, \"ID_pedido\": 108}'),
(272, 272, 109, 38, 8, 4.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 272, \"ID_pedido\": 109}'),
(273, 273, 109, 53, 12, 9.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 273, \"ID_pedido\": 109}'),
(274, 274, 109, 63, 14, 8.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 274, \"ID_pedido\": 109}'),
(275, 275, 109, 128, 20, 10.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 275, \"ID_pedido\": 109}'),
(276, 276, 109, 143, 10, 5.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 276, \"ID_pedido\": 109}'),
(277, 277, 109, 149, 3, 5.00, 6, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 277, \"ID_pedido\": 109}'),
(278, 278, 109, 154, 2, 18.00, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 278, \"ID_pedido\": 109}'),
(279, 279, 110, 14, 6, 1.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 279, \"ID_pedido\": 110}'),
(280, 280, 110, 15, 14, 7.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 280, \"ID_pedido\": 110}'),
(281, 281, 110, 31, 1, 45.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 281, \"ID_pedido\": 110}'),
(282, 282, 115, 2, 5, 14.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 282, \"ID_pedido\": 115}'),
(283, 283, 115, 5, 32, 1.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 283, \"ID_pedido\": 115}'),
(284, 284, 115, 9, 18, 1.00, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 284, \"ID_pedido\": 115}'),
(285, 285, 115, 50, 13, 8.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 285, \"ID_pedido\": 115}'),
(286, 286, 115, 224, 10, 4.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 286, \"ID_pedido\": 115}'),
(287, 287, 114, 99, 2, 15.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 287, \"ID_pedido\": 114}'),
(288, 288, 114, 102, 1, 32.00, 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 288, \"ID_pedido\": 114}'),
(289, 289, 114, 170, 17, 4.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 289, \"ID_pedido\": 114}'),
(290, 290, 114, 203, 4, 6.00, 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 290, \"ID_pedido\": 114}'),
(291, 291, 110, 8, 15, 1.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 291, \"ID_pedido\": 110}'),
(292, 292, 110, 174, 18, 2.00, 2, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 292, \"ID_pedido\": 110}'),
(293, 293, 52, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 293, \"ID_pedido\": 52}'),
(294, 294, 59, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 294, \"ID_pedido\": 59}'),
(295, 295, 60, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 295, \"ID_pedido\": 60}'),
(296, 296, 61, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 296, \"ID_pedido\": 61}'),
(297, 297, 62, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 297, \"ID_pedido\": 62}'),
(298, 298, 63, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 298, \"ID_pedido\": 63}'),
(299, 299, 64, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 299, \"ID_pedido\": 64}'),
(300, 300, 65, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 300, \"ID_pedido\": 65}'),
(301, 301, 66, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 301, \"ID_pedido\": 66}'),
(302, 302, 67, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 302, \"ID_pedido\": 67}'),
(303, 303, 68, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 303, \"ID_pedido\": 68}'),
(304, 304, 111, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 304, \"ID_pedido\": 111}'),
(305, 305, 112, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 305, \"ID_pedido\": 112}'),
(306, 306, 113, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 306, \"ID_pedido\": 113}'),
(307, 307, 114, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 307, \"ID_pedido\": 114}'),
(308, 308, 115, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 308, \"ID_pedido\": 115}'),
(309, 309, 108, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 309, \"ID_pedido\": 108}'),
(310, 310, 109, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 310, \"ID_pedido\": 109}'),
(311, 311, 110, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 311, \"ID_pedido\": 110}'),
(312, 312, 101, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 312, \"ID_pedido\": 101}'),
(313, 313, 103, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 313, \"ID_pedido\": 103}'),
(314, 314, 104, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 314, \"ID_pedido\": 104}'),
(315, 315, 105, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 315, \"ID_pedido\": 105}'),
(316, 316, 102, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 316, \"ID_pedido\": 102}'),
(317, 317, 101, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 317, \"ID_pedido\": 101}'),
(318, 318, 100, 87, 10, 70.00, 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_detalle_pedido\": 318, \"ID_pedido\": 100}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_empleado`
--

CREATE TABLE `stg_empleado` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido1` varchar(100) DEFAULT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `oficina_id` int(11) DEFAULT NULL,
  `id_jefe` int(11) DEFAULT NULL,
  `puesto` varchar(150) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_empleado`
--

INSERT INTO `stg_empleado` (`load_id`, `source_id`, `nombre`, `apellido1`, `apellido2`, `extension`, `email`, `oficina_id`, `id_jefe`, `puesto`, `load_date`, `raw_row`) VALUES
(1, 1, 'Marcos', 'Magaña', 'Perez', '3897', 'marcos@jardineria.es', 8, NULL, 'Director General', '2025-09-15 15:55:32', '{\"ID_empleado\": 1}'),
(2, 2, 'Ruben', 'López', 'Martinez', '2899', 'rlopez@jardineria.es', 8, 1, 'Subdirector Marketing', '2025-09-15 15:55:32', '{\"ID_empleado\": 2}'),
(3, 3, 'Alberto', 'Soria', 'Carrasco', '2837', 'asoria@jardineria.es', 8, 2, 'Subdirector Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 3}'),
(4, 4, 'Maria', 'Solís', 'Jerez', '2847', 'msolis@jardineria.es', 8, 2, 'Secretaria', '2025-09-15 15:55:32', '{\"ID_empleado\": 4}'),
(5, 5, 'Felipe', 'Rosas', 'Marquez', '2844', 'frosas@jardineria.es', 8, 3, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 5}'),
(6, 6, 'Juan Carlos', 'Ortiz', 'Serrano', '2845', 'cortiz@jardineria.es', 8, 3, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 6}'),
(7, 7, 'Carlos', 'Soria', 'Jimenez', '2444', 'csoria@jardineria.es', 4, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 7}'),
(8, 8, 'Mariano', 'López', 'Murcia', '2442', 'mlopez@jardineria.es', 4, 7, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 8}'),
(9, 9, 'Lucio', 'Campoamor', 'Martín', '2442', 'lcampoamor@jardineria.es', 4, 7, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 9}'),
(10, 10, 'Hilario', 'Rodriguez', 'Huertas', '2444', 'hrodriguez@jardineria.es', 4, 7, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 10}'),
(11, 11, 'Emmanuel', 'Magaña', 'Perez', '2518', 'manu@jardineria.es', 1, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 11}'),
(12, 12, 'José Manuel', 'Martinez', 'De la Osa', '2519', 'jmmart@hotmail.es', 1, 11, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 12}'),
(13, 13, 'David', 'Palma', 'Aceituno', '2519', 'dpalma@jardineria.es', 1, 11, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 13}'),
(14, 14, 'Oscar', 'Palma', 'Aceituno', '2519', 'opalma@jardineria.es', 1, 11, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 14}'),
(15, 15, 'Francois', 'Fignon', '', '9981', 'ffignon@gardening.com', 5, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 15}'),
(16, 16, 'Lionel', 'Narvaez', '', '9982', 'lnarvaez@gardening.com', 5, 15, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 16}'),
(17, 17, 'Laurent', 'Serra', '', '9982', 'lserra@gardening.com', 5, 15, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 17}'),
(18, 18, 'Michael', 'Bolton', '', '7454', 'mbolton@gardening.com', 6, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 18}'),
(19, 19, 'Walter Santiago', 'Sanchez', 'Lopez', '7454', 'wssanchez@gardening.com', 6, 18, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 19}'),
(20, 20, 'Hilary', 'Washington', '', '7565', 'hwashington@gardening.com', 2, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 20}'),
(21, 21, 'Marcus', 'Paxton', '', '7565', 'mpaxton@gardening.com', 2, 20, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 21}'),
(22, 22, 'Lorena', 'Paxton', '', '7665', 'lpaxton@gardening.com', 2, 20, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 22}'),
(23, 23, 'Nei', 'Nishikori', '', '8734', 'nnishikori@gardening.com', 9, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 23}'),
(24, 24, 'Narumi', 'Riko', '', '8734', 'nriko@gardening.com', 9, 23, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 24}'),
(25, 25, 'Takuma', 'Nomura', '', '8735', 'tnomura@gardening.com', 9, 23, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 25}'),
(26, 26, 'Amy', 'Johnson', '', '3321', 'ajohnson@gardening.com', 3, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 26}'),
(27, 27, 'Larry', 'Westfalls', '', '3322', 'lwestfalls@gardening.com', 3, 26, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 27}'),
(28, 28, 'John', 'Walton', '', '3322', 'jwalton@gardening.com', 3, 26, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 28}'),
(29, 29, 'Kevin', 'Fallmer', '', '3210', 'kfalmer@gardening.com', 7, 3, 'Director Oficina', '2025-09-15 15:55:32', '{\"ID_empleado\": 29}'),
(30, 30, 'Julian', 'Bellinelli', '', '3211', 'jbellinelli@gardening.com', 7, 29, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 30}'),
(31, 31, 'Mariko', 'Kishi', '', '3211', 'mkishi@gardening.com', 7, 29, 'Representante Ventas', '2025-09-15 15:55:32', '{\"ID_empleado\": 31}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_oficina`
--

CREATE TABLE `stg_oficina` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `linea_direccion1` varchar(200) DEFAULT NULL,
  `linea_direccion2` varchar(200) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_oficina`
--

INSERT INTO `stg_oficina` (`load_id`, `source_id`, `descripcion`, `ciudad`, `pais`, `region`, `codigo_postal`, `telefono`, `linea_direccion1`, `linea_direccion2`, `load_date`, `raw_row`) VALUES
(1, 1, 'BCN-ES', 'Barcelona', 'España', 'Barcelona', '08019', '+34 93 3561182', 'Avenida Diagonal, 38', '3A escalera Derecha', '2025-09-15 15:55:32', '{\"ID_oficina\": 1}'),
(2, 2, 'BOS-USA', 'Boston', 'EEUU', 'MA', '02108', '+1 215 837 0825', '1550 Court Place', 'Suite 102', '2025-09-15 15:55:32', '{\"ID_oficina\": 2}'),
(3, 3, 'LON-UK', 'Londres', 'Inglaterra', 'EMEA', 'EC2N 1HN', '+44 20 78772041', '52 Old Broad Street', 'Ground Floor', '2025-09-15 15:55:32', '{\"ID_oficina\": 3}'),
(4, 4, 'MAD-ES', 'Madrid', 'España', 'Madrid', '28032', '+34 91 7514487', 'Bulevar Indalecio Prieto, 32', '', '2025-09-15 15:55:32', '{\"ID_oficina\": 4}'),
(5, 5, 'PAR-FR', 'Paris', 'Francia', 'EMEA', '75017', '+33 14 723 4404', '29 Rue Jouffroy d\'abbans', '', '2025-09-15 15:55:32', '{\"ID_oficina\": 5}'),
(6, 6, 'SFC-USA', 'San Francisco', 'EEUU', 'CA', '94080', '+1 650 219 4782', '100 Market Street', 'Suite 300', '2025-09-15 15:55:32', '{\"ID_oficina\": 6}'),
(7, 7, 'SYD-AU', 'Sydney', 'Australia', 'APAC', 'NSW 2010', '+61 2 9264 2451', '5-11 Wentworth Avenue', 'Floor #2', '2025-09-15 15:55:32', '{\"ID_oficina\": 7}'),
(8, 8, 'TAL-ES', 'Talavera de la Reina', 'España', 'Castilla-LaMancha', '45632', '+34 925 867231', 'Francisco Aguirre, 32', '5º piso (exterior)', '2025-09-15 15:55:32', '{\"ID_oficina\": 8}'),
(9, 9, 'TOK-JP', 'Tokyo', 'Japón', 'Chiyoda-Ku', '102-8578', '+81 33 224 5000', '4-1 Kioicho', '', '2025-09-15 15:55:32', '{\"ID_oficina\": 9}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_pago`
--

CREATE TABLE `stg_pago` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `forma_pago` varchar(80) DEFAULT NULL,
  `id_transaccion` varchar(120) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `source_system` varchar(50) DEFAULT 'jardineria',
  `is_valid` tinyint(1) DEFAULT 1,
  `validation_errors` text DEFAULT NULL,
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_pago`
--

INSERT INTO `stg_pago` (`load_id`, `source_id`, `cliente_id`, `forma_pago`, `id_transaccion`, `fecha_pago`, `total`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(1, 1, 1, 'PayPal', 'ak-std-000001', '2008-11-10', 2000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 1, \"total\": 2000.00}'),
(2, 2, 1, 'PayPal', 'ak-std-000002', '2008-12-10', 2000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 2, \"total\": 2000.00}'),
(3, 3, 3, 'PayPal', 'ak-std-000003', '2009-01-16', 5000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 3, \"total\": 5000.00}'),
(4, 4, 3, 'PayPal', 'ak-std-000004', '2009-02-16', 5000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 4, \"total\": 5000.00}'),
(5, 5, 3, 'PayPal', 'ak-std-000005', '2009-02-19', 926.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 5, \"total\": 926.00}'),
(6, 6, 4, 'PayPal', 'ak-std-000006', '2007-01-08', 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 6, \"total\": 20000.00}'),
(7, 7, 4, 'PayPal', 'ak-std-000007', '2007-01-08', 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 7, \"total\": 20000.00}'),
(8, 8, 4, 'PayPal', 'ak-std-000008', '2007-01-08', 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 8, \"total\": 20000.00}'),
(9, 9, 4, 'PayPal', 'ak-std-000009', '2007-01-08', 20000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 9, \"total\": 20000.00}'),
(10, 10, 4, 'PayPal', 'ak-std-000010', '2007-01-08', 1849.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 10, \"total\": 1849.00}'),
(11, 11, 5, 'Transferencia', 'ak-std-000011', '2006-01-18', 23794.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 11, \"total\": 23794.00}'),
(12, 12, 7, 'Cheque', 'ak-std-000012', '2009-01-13', 2390.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 12, \"total\": 2390.00}'),
(13, 13, 9, 'PayPal', 'ak-std-000013', '2009-01-06', 929.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 13, \"total\": 929.00}'),
(14, 14, 13, 'PayPal', 'ak-std-000014', '2008-08-04', 2246.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 14, \"total\": 2246.00}'),
(15, 15, 14, 'PayPal', 'ak-std-000015', '2008-07-15', 4160.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 15, \"total\": 4160.00}'),
(16, 16, 15, 'PayPal', 'ak-std-000016', '2009-01-15', 2081.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 16, \"total\": 2081.00}'),
(17, 17, 15, 'PayPal', 'ak-std-000035', '2009-02-15', 10000.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 17, \"total\": 10000.00}'),
(18, 18, 16, 'PayPal', 'ak-std-000017', '2009-02-16', 4399.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 18, \"total\": 4399.00}'),
(19, 19, 19, 'PayPal', 'ak-std-000018', '2009-03-06', 232.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 19, \"total\": 232.00}'),
(20, 20, 23, 'PayPal', 'ak-std-000019', '2009-03-26', 272.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 20, \"total\": 272.00}'),
(21, 21, 26, 'PayPal', 'ak-std-000020', '2008-03-18', 18846.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 21, \"total\": 18846.00}'),
(22, 22, 27, 'PayPal', 'ak-std-000021', '2009-02-08', 10972.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 22, \"total\": 10972.00}'),
(23, 23, 28, 'PayPal', 'ak-std-000022', '2009-01-13', 8489.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 23, \"total\": 8489.00}'),
(24, 24, 30, 'PayPal', 'ak-std-000024', '2009-01-16', 7863.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 24, \"total\": 7863.00}'),
(25, 25, 35, 'PayPal', 'ak-std-000025', '2007-10-06', 3321.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 25, \"total\": 3321.00}'),
(26, 26, 36, 'PayPal', 'ak-std-000026', '2006-05-26', 1171.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pago\": 26, \"total\": 1171.00}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_pedido`
--

CREATE TABLE `stg_pedido` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_esperada` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `source_system` varchar(50) DEFAULT 'jardineria',
  `is_valid` tinyint(1) DEFAULT 1,
  `validation_errors` text DEFAULT NULL,
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_pedido`
--

INSERT INTO `stg_pedido` (`load_id`, `source_id`, `fecha_pedido`, `fecha_esperada`, `fecha_entrega`, `estado`, `comentarios`, `cliente_id`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(1, 1, '2006-01-17', '2006-01-19', '2006-01-19', 'Entregado', 'Pagado a plazos', 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 1, \"estado\": \"Entregado\"}'),
(2, 2, '2007-10-23', '2007-10-28', '2007-10-26', 'Entregado', 'La entrega llego antes de lo esperado', 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 2, \"estado\": \"Entregado\"}'),
(3, 3, '2008-06-20', '2008-06-25', NULL, 'Rechazado', 'Limite de credito superado', 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 3, \"estado\": \"Rechazado\"}'),
(4, 4, '2009-01-20', '2009-01-26', NULL, 'Pendiente', NULL, 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 4, \"estado\": \"Pendiente\"}'),
(5, 5, '2008-11-09', '2008-11-14', '2008-11-14', 'Entregado', 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 5, \"estado\": \"Entregado\"}'),
(6, 6, '2008-12-22', '2008-12-27', '2008-12-28', 'Entregado', 'El cliente comprueba la integridad del paquete, todo correcto', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 6, \"estado\": \"Entregado\"}'),
(7, 7, '2009-01-15', '2009-01-20', NULL, 'Pendiente', 'El cliente llama para confirmar la fecha - Esperando al proveedor', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 7, \"estado\": \"Pendiente\"}'),
(8, 8, '2009-01-20', '2009-01-27', NULL, 'Pendiente', 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 8, \"estado\": \"Pendiente\"}'),
(9, 9, '2009-01-22', '2009-01-27', NULL, 'Pendiente', 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 9, \"estado\": \"Pendiente\"}'),
(10, 10, '2009-01-12', '2009-01-14', '2009-01-15', 'Entregado', NULL, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 10, \"estado\": \"Entregado\"}'),
(11, 11, '2009-01-02', '2009-01-02', NULL, 'Rechazado', 'mal pago', 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 11, \"estado\": \"Rechazado\"}'),
(12, 12, '2009-01-09', '2009-01-12', '2009-01-11', 'Entregado', NULL, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 12, \"estado\": \"Entregado\"}'),
(13, 13, '2009-01-06', '2009-01-07', '2009-01-15', 'Entregado', NULL, 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 13, \"estado\": \"Entregado\"}'),
(14, 14, '2009-01-08', '2009-01-09', '2009-01-11', 'Entregado', 'mal estado', 7, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 14, \"estado\": \"Entregado\"}'),
(15, 15, '2009-01-05', '2009-01-06', '2009-01-07', 'Entregado', NULL, 9, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 15, \"estado\": \"Entregado\"}'),
(16, 16, '2009-01-18', '2009-02-12', NULL, 'Pendiente', 'entregar en murcia', 9, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 16, \"estado\": \"Pendiente\"}'),
(17, 17, '2009-01-20', '2009-02-15', NULL, 'Pendiente', NULL, 9, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 17, \"estado\": \"Pendiente\"}'),
(18, 18, '2009-01-09', '2009-01-09', '2009-01-09', 'Rechazado', 'mal pago', 9, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 18, \"estado\": \"Rechazado\"}'),
(19, 19, '2009-01-11', '2009-01-11', '2009-01-13', 'Entregado', NULL, 9, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 19, \"estado\": \"Entregado\"}'),
(20, 20, '2008-12-30', '2009-01-10', NULL, 'Rechazado', 'El pedido fue anulado por el cliente', 5, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 20, \"estado\": \"Rechazado\"}'),
(21, 21, '2008-07-14', '2008-07-31', '2008-07-25', 'Entregado', NULL, 14, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 21, \"estado\": \"Entregado\"}'),
(22, 22, '2009-02-02', '2009-02-08', NULL, 'Rechazado', 'El cliente carece de saldo en la cuenta asociada', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 22, \"estado\": \"Rechazado\"}'),
(23, 23, '2009-02-06', '2009-02-12', NULL, 'Rechazado', 'El cliente anula la operacion para adquirir mas producto', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 23, \"estado\": \"Rechazado\"}'),
(24, 24, '2009-02-07', '2009-02-13', NULL, 'Entregado', 'El pedido aparece como entregado pero no sabemos en que fecha', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 24, \"estado\": \"Entregado\"}'),
(25, 25, '2009-02-10', '2009-02-17', '2009-02-20', 'Entregado', 'El cliente se queja bastante de la espera asociada al producto', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 25, \"estado\": \"Entregado\"}'),
(26, 26, '2008-08-01', '2008-09-01', '2008-09-01', 'Rechazado', 'El cliente no está conforme con el pedido', 14, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 26, \"estado\": \"Rechazado\"}'),
(27, 27, '2008-08-03', '2008-09-03', '2008-08-31', 'Entregado', NULL, 13, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 27, \"estado\": \"Entregado\"}'),
(28, 28, '2008-09-04', '2008-09-30', '2008-10-04', 'Rechazado', 'El cliente ha rechazado por llegar 5 dias tarde', 13, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 28, \"estado\": \"Rechazado\"}'),
(29, 29, '2007-01-07', '2007-01-19', '2007-01-27', 'Entregado', 'Entrega tardia, el cliente puso reclamacion', 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 29, \"estado\": \"Entregado\"}'),
(30, 30, '2007-05-20', '2007-05-28', NULL, 'Rechazado', 'El pedido fue anulado por el cliente', 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 30, \"estado\": \"Rechazado\"}'),
(31, 31, '2007-06-20', '2008-06-28', '2008-06-28', 'Entregado', 'Pagado a plazos', 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 31, \"estado\": \"Entregado\"}'),
(32, 32, '2008-03-10', '2009-03-20', NULL, 'Rechazado', 'Limite de credito superado', 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 32, \"estado\": \"Rechazado\"}'),
(33, 33, '2008-10-15', '2008-12-15', '2008-12-10', 'Entregado', NULL, 14, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 33, \"estado\": \"Entregado\"}'),
(34, 34, '2008-11-03', '2009-11-13', NULL, 'Pendiente', 'El pedido nunca llego a su destino', 4, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 34, \"estado\": \"Pendiente\"}'),
(35, 35, '2009-03-05', '2009-03-06', '2009-03-07', 'Entregado', NULL, 19, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 35, \"estado\": \"Entregado\"}'),
(36, 36, '2009-03-06', '2009-03-07', '2009-03-09', 'Pendiente', NULL, 19, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 36, \"estado\": \"Pendiente\"}'),
(37, 37, '2009-03-09', '2009-03-10', '2009-03-13', 'Rechazado', NULL, 19, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 37, \"estado\": \"Rechazado\"}'),
(38, 38, '2009-03-12', '2009-03-13', '2009-03-13', 'Entregado', NULL, 19, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 38, \"estado\": \"Entregado\"}'),
(39, 39, '2009-03-22', '2009-03-23', '2009-03-27', 'Entregado', NULL, 19, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 39, \"estado\": \"Entregado\"}'),
(40, 40, '2009-03-25', '2009-03-26', '2009-03-28', 'Pendiente', NULL, 23, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 40, \"estado\": \"Pendiente\"}'),
(41, 41, '2009-03-26', '2009-03-27', '2009-03-30', 'Pendiente', NULL, 23, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 41, \"estado\": \"Pendiente\"}'),
(42, 42, '2009-04-01', '2009-03-04', '2009-03-07', 'Entregado', NULL, 23, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 42, \"estado\": \"Entregado\"}'),
(43, 43, '2009-04-03', '2009-03-04', '2009-03-05', 'Rechazado', NULL, 23, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 43, \"estado\": \"Rechazado\"}'),
(44, 44, '2009-04-15', '2009-03-17', '2009-03-17', 'Entregado', NULL, 23, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 44, \"estado\": \"Entregado\"}'),
(45, 45, '2008-03-17', '2008-03-30', '2008-03-29', 'Entregado', 'Según el Cliente, el pedido llegó defectuoso', 26, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 45, \"estado\": \"Entregado\"}'),
(46, 46, '2008-07-12', '2008-07-22', '2008-07-30', 'Entregado', 'El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora', 26, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 46, \"estado\": \"Entregado\"}'),
(47, 47, '2008-03-17', '2008-08-09', NULL, 'Pendiente', 'Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)', 26, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 47, \"estado\": \"Pendiente\"}'),
(48, 48, '2008-10-01', '2008-10-14', '2008-10-14', 'Entregado', 'Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.', 26, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 48, \"estado\": \"Entregado\"}'),
(49, 49, '2008-12-07', '2008-12-21', NULL, 'Pendiente', 'El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.', 26, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 49, \"estado\": \"Pendiente\"}'),
(50, 50, '2008-10-15', '2008-11-15', '2008-11-09', 'Entregado', 'El pedido llega 6 dias antes', 13, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 50, \"estado\": \"Entregado\"}'),
(51, 51, '2009-01-11', '2009-02-11', NULL, 'Pendiente', NULL, 14, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 51, \"estado\": \"Pendiente\"}'),
(52, 52, '2008-12-10', '2009-01-10', '2009-01-11', 'Entregado', 'Retrasado 1 dia por problemas de transporte', 14, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 52, \"estado\": \"Entregado\"}'),
(53, 53, '2008-12-19', '2009-01-20', NULL, 'Rechazado', 'El cliente a anulado el pedido el dia 2009-01-10', 13, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 53, \"estado\": \"Rechazado\"}'),
(54, 54, '2009-01-05', '2009-02-05', NULL, 'Pendiente', NULL, 13, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 54, \"estado\": \"Pendiente\"}'),
(55, 55, '2009-01-24', '2009-01-31', '2009-01-30', 'Entregado', 'Todo correcto', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 55, \"estado\": \"Entregado\"}'),
(56, 56, '2008-11-09', '2008-11-14', '2008-11-14', 'Entregado', 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 56, \"estado\": \"Entregado\"}'),
(57, 57, '2008-12-22', '2008-12-27', '2008-12-28', 'Entregado', 'El cliente comprueba la integridad del paquete, todo correcto', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 57, \"estado\": \"Entregado\"}'),
(58, 58, '2009-01-15', '2009-01-20', NULL, 'Pendiente', 'El cliente llama para confirmar la fecha - Esperando al proveedor', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 58, \"estado\": \"Pendiente\"}'),
(59, 59, '2009-01-20', '2009-01-27', NULL, 'Pendiente', 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 59, \"estado\": \"Pendiente\"}'),
(60, 60, '2009-01-22', '2009-01-27', NULL, 'Pendiente', 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 60, \"estado\": \"Pendiente\"}'),
(61, 61, '2009-01-24', '2009-01-31', '2009-01-30', 'Entregado', 'Todo correcto', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 61, \"estado\": \"Entregado\"}'),
(62, 62, '2009-02-02', '2009-02-08', NULL, 'Rechazado', 'El cliente carece de saldo en la cuenta asociada', 1, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 62, \"estado\": \"Rechazado\"}'),
(63, 63, '2009-02-06', '2009-02-12', NULL, 'Rechazado', 'El cliente anula la operacion para adquirir mas producto', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 63, \"estado\": \"Rechazado\"}'),
(64, 64, '2009-02-07', '2009-02-13', NULL, 'Entregado', 'El pedido aparece como entregado pero no sabemos en que fecha', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 64, \"estado\": \"Entregado\"}'),
(65, 65, '2009-02-10', '2009-02-17', '2009-02-20', 'Entregado', 'El cliente se queja bastante de la espera asociada al producto', 3, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 65, \"estado\": \"Entregado\"}'),
(66, 66, '2009-01-14', '2009-01-22', NULL, 'Rechazado', 'El pedido no llego el dia que queria el cliente por fallo del transporte', 15, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 66, \"estado\": \"Rechazado\"}'),
(67, 67, '2009-01-11', '2009-01-13', '2009-01-13', 'Entregado', 'El pedido llego perfectamente', 15, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 67, \"estado\": \"Entregado\"}'),
(68, 68, '2008-11-15', '2008-11-23', '2008-11-23', 'Entregado', NULL, 15, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 68, \"estado\": \"Entregado\"}'),
(69, 69, '2009-01-03', '2009-01-08', NULL, 'Pendiente', 'El pedido no pudo ser entregado por problemas meteorologicos', 15, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 69, \"estado\": \"Pendiente\"}'),
(70, 70, '2008-12-15', '2008-12-17', '2008-12-17', 'Entregado', 'Fue entregado, pero faltaba mercancia que sera entregada otro dia', 15, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 70, \"estado\": \"Entregado\"}'),
(71, 71, '2009-01-12', '2009-01-13', '2009-01-13', 'Entregado', NULL, 28, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 71, \"estado\": \"Entregado\"}'),
(72, 72, '2009-01-25', '2009-01-26', NULL, 'Pendiente', 'No terminó el pago', 28, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 72, \"estado\": \"Pendiente\"}'),
(73, 73, '2009-01-18', '2009-01-24', NULL, 'Rechazado', 'Los producto estaban en mal estado', 28, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 73, \"estado\": \"Rechazado\"}'),
(74, 74, '2009-01-20', '2009-01-29', '2009-01-29', 'Entregado', 'El pedido llego un poco mas tarde de la hora fijada', 28, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 74, \"estado\": \"Entregado\"}'),
(75, 75, '2009-01-24', '2009-01-28', NULL, 'Entregado', NULL, 28, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 75, \"estado\": \"Entregado\"}'),
(76, 76, '2007-10-05', '2007-12-13', '2007-12-10', 'Entregado', 'La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho', 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 76, \"estado\": \"Entregado\"}'),
(77, 77, '2009-02-07', '2008-02-17', NULL, 'Pendiente', 'Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día ', 27, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 77, \"estado\": \"Pendiente\"}'),
(78, 78, '2009-03-18', '2009-03-29', '2009-03-27', 'Entregado', 'Todo se entregó a su debido tiempo, incluso con un día de antelación', 27, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 78, \"estado\": \"Entregado\"}'),
(79, 79, '2009-04-19', '2009-04-30', '2009-05-03', 'Entregado', 'El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas', 27, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 79, \"estado\": \"Entregado\"}'),
(80, 80, '2009-05-03', '2009-05-30', '2009-05-17', 'Entregado', 'El pedido se entregó antes de lo esperado.', 27, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 80, \"estado\": \"Entregado\"}'),
(81, 81, '2009-10-18', '2009-11-01', NULL, 'Pendiente', 'El pedido está en camino.', 27, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 81, \"estado\": \"Pendiente\"}'),
(82, 82, '2008-01-04', '2008-01-19', '2008-01-19', 'Entregado', NULL, 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 82, \"estado\": \"Entregado\"}'),
(83, 83, '2008-03-20', '2008-04-12', '2008-04-13', 'Entregado', 'La entrega se retraso un dia', 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 83, \"estado\": \"Entregado\"}'),
(84, 84, '2008-10-08', '2008-11-25', '2008-11-25', 'Entregado', NULL, 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 84, \"estado\": \"Entregado\"}'),
(85, 85, '2009-01-08', '2009-02-13', NULL, 'Pendiente', NULL, 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 85, \"estado\": \"Pendiente\"}'),
(86, 86, '2009-02-15', '2009-02-27', NULL, 'Pendiente', NULL, 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 86, \"estado\": \"Pendiente\"}'),
(87, 87, '2009-01-10', '2009-01-15', '2009-01-15', 'Entregado', 'El pedido llego perfectamente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 87, \"estado\": \"Entregado\"}'),
(88, 88, '2009-03-07', '2009-03-27', NULL, 'Rechazado', 'El pedido fue rechazado por el cliente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 88, \"estado\": \"Rechazado\"}'),
(89, 89, '2008-12-28', '2009-01-08', '2009-01-08', 'Entregado', 'Pago pendiente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 89, \"estado\": \"Entregado\"}'),
(90, 90, '2009-01-15', '2009-01-20', '2009-01-24', 'Pendiente', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 90, \"estado\": \"Pendiente\"}'),
(91, 91, '2009-03-02', '2009-03-06', '2009-03-06', 'Entregado', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 91, \"estado\": \"Entregado\"}'),
(92, 92, '2009-02-14', '2009-02-20', NULL, 'Rechazado', 'el producto ha sido rechazado por la pesima calidad', 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 92, \"estado\": \"Rechazado\"}'),
(93, 93, '2009-05-13', '2009-05-15', '2009-05-20', 'Pendiente', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 93, \"estado\": \"Pendiente\"}'),
(94, 94, '2009-04-06', '2009-04-10', '2009-04-10', 'Entregado', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 94, \"estado\": \"Entregado\"}'),
(95, 95, '2009-04-09', '2009-04-15', '2009-04-15', 'Entregado', NULL, 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 95, \"estado\": \"Entregado\"}'),
(96, 96, '2006-05-25', '2006-07-28', '2006-07-28', 'Entregado', NULL, 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 96, \"estado\": \"Entregado\"}'),
(97, 97, '2007-03-19', '2007-04-24', '2007-04-24', 'Entregado', NULL, 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 97, \"estado\": \"Entregado\"}'),
(98, 98, '2008-03-05', '2008-03-30', '2008-03-30', 'Entregado', NULL, 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 98, \"estado\": \"Entregado\"}'),
(99, 99, '2009-03-05', '2009-04-06', '2009-05-07', 'Pendiente', NULL, 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 99, \"estado\": \"Pendiente\"}'),
(100, 100, '2008-10-28', '2008-11-09', '2009-01-09', 'Rechazado', 'El producto ha sido rechazado por la tardanza de el envio', 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 100, \"estado\": \"Rechazado\"}'),
(101, 101, '2009-01-15', '2009-01-29', '2009-01-31', 'Entregado', 'El envio llego dos dias más tarde debido al mal tiempo', 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 101, \"estado\": \"Entregado\"}'),
(102, 102, '2008-11-29', '2009-01-26', '2009-02-27', 'Pendiente', NULL, 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 102, \"estado\": \"Pendiente\"}'),
(103, 103, '2008-06-28', '2008-08-01', '2008-08-01', 'Entregado', NULL, 35, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 103, \"estado\": \"Entregado\"}'),
(104, 104, '2008-08-25', '2008-10-01', NULL, 'Rechazado', 'El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente', 32, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 104, \"estado\": \"Rechazado\"}'),
(105, 105, '2009-02-15', '2009-02-27', NULL, 'Pendiente', NULL, 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 105, \"estado\": \"Pendiente\"}'),
(106, 106, '2009-01-10', '2009-01-15', '2009-01-15', 'Entregado', 'El pedido llego perfectamente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 106, \"estado\": \"Entregado\"}'),
(107, 107, '2009-03-07', '2009-03-27', NULL, 'Rechazado', 'El pedido fue rechazado por el cliente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 107, \"estado\": \"Rechazado\"}'),
(108, 108, '2008-12-28', '2009-01-08', '2009-01-08', 'Entregado', 'Pago pendiente', 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 108, \"estado\": \"Entregado\"}'),
(109, 109, '2009-04-09', '2009-04-15', '2009-04-15', 'Entregado', NULL, 16, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 109, \"estado\": \"Entregado\"}'),
(110, 110, '2009-01-15', '2009-01-20', '2009-01-24', 'Pendiente', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 110, \"estado\": \"Pendiente\"}'),
(111, 111, '2009-03-02', '2009-03-06', '2009-03-06', 'Entregado', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 111, \"estado\": \"Entregado\"}'),
(112, 112, '2009-02-14', '2009-02-20', NULL, 'Rechazado', 'el producto ha sido rechazado por la pesima calidad', 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 112, \"estado\": \"Rechazado\"}'),
(113, 113, '2009-05-13', '2009-05-15', '2009-05-20', 'Pendiente', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 113, \"estado\": \"Pendiente\"}'),
(114, 114, '2009-04-06', '2009-04-10', '2009-04-10', 'Entregado', NULL, 30, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 114, \"estado\": \"Entregado\"}'),
(115, 115, '2008-11-10', '2008-12-10', '2008-12-29', 'Rechazado', 'El pedido ha sido rechazado por el cliente por el retraso en la entrega', 36, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_pedido\": 115, \"estado\": \"Rechazado\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stg_producto`
--

CREATE TABLE `stg_producto` (
  `load_id` bigint(20) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `CodigoProducto` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `dimensiones` varchar(50) DEFAULT NULL,
  `proveedor` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad_en_stock` int(11) DEFAULT NULL,
  `precio_venta` decimal(15,2) DEFAULT NULL,
  `precio_proveedor` decimal(15,2) DEFAULT NULL,
  `load_date` datetime DEFAULT current_timestamp(),
  `source_system` varchar(50) DEFAULT 'jardineria',
  `is_valid` tinyint(1) DEFAULT 1,
  `validation_errors` text DEFAULT NULL,
  `raw_row` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_row`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stg_producto`
--

INSERT INTO `stg_producto` (`load_id`, `source_id`, `CodigoProducto`, `nombre`, `categoria_id`, `dimensiones`, `proveedor`, `descripcion`, `cantidad_en_stock`, `precio_venta`, `precio_proveedor`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(1, 1, '11679', 'Sierra de Poda 400MM', 2, '0,258', 'HiperGarden Tools', 'Gracias a la poda se consigue manipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería también facilita que las plantas crezcan de un modo más equilibrado, y que las flores y los frutos vuelvan cada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que exijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unas 2 adecuadas para esta labor es también de vital importancia.', 15, 14.00, 11.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 1, \"nombre\": \"Sierra de Poda 400MM\"}'),
(2, 2, '21636', 'Pala', 2, '0,156', 'HiperGarden Tools', 'Palas de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetración en tierras muy compactas.', 15, 14.00, 13.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 2, \"nombre\": \"Pala\"}'),
(3, 3, '22225', 'Rastrillo de Jardín', 2, '1,064', 'HiperGarden Tools', 'Fabuloso rastillo que le ayudará a eliminar piedras, hojas, ramas y otros elementos incómodos en su jardín.', 15, 12.00, 11.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 3, \"nombre\": \"Rastrillo de Jardín\"}'),
(4, 4, '30310', 'Azadón', 2, '0,168', 'HiperGarden Tools', 'Longitud:24cm. Herramienta fabricada en acero y pintura epoxi,alargando su durabilidad y preveniendo la corrosión.Diseño pensado para el ahorro de trabajo.', 15, 12.00, 11.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 4, \"nombre\": \"Azadón\"}'),
(5, 5, 'AR-001', 'Ajedrea', 3, '15-20', 'Murcia Seasons', 'Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 5, \"nombre\": \"Ajedrea\"}'),
(6, 6, 'AR-002', 'Lavándula Dentata', 3, '15-20', 'Murcia Seasons', 'Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: España y Portugal. Mata de unos 60 cm de alto. Las hojas son aromáticas, dentadas y de color verde grisáceas.  Produce compactas espigas de flores pequeñas, ligeramente aromáticas, tubulares,de color azulado y con brácteas púrpuras.  Frutos: nuececillas alargadas encerradas en el tubo del cáliz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandas.  Tiene propiedades aromatizantes y calmantes. Adecuadas para la formación de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para las plantas vecinas.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 6, \"nombre\": \"Lavándula Dentata\"}'),
(7, 7, 'AR-003', 'Mejorana', 3, '15-20', 'Murcia Seasons', 'Origanum majorana. No hay que confundirlo con el orégano. Su sabor se parece más al tomillo, pero es más dulce y aromático.Se usan las hojas frescas o secas, picadas, machacadas o en polvo, en sopas, rellenos, quiches y tartas, tortillas, platos con papas y, como aderezo, en ramilletes de hierbas.El sabor delicado de la mejorana se elimina durante la cocción, de manera que es mejor agregarla cuando el plato esté en su punto o en aquéllos que apenas necesitan cocción.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 7, \"nombre\": \"Mejorana\"}'),
(8, 8, 'AR-004', 'Melissa', 3, '15-20', 'Murcia Seasons', 'Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 8, \"nombre\": \"Melissa \"}'),
(9, 9, 'AR-005', 'Mentha Sativa', 3, '15-20', 'Murcia Seasons', '¿Quién no conoce la Hierbabuena? Se trata de una plantita muy aromática, agradable y cultivada extensamente por toda España. Es hierba perenne (por tanto vive varios años, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jardín o en un rincón del huerto. Lo más importante es que cuente con bastante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los agujeros en hojas consecuencia de su ataque, retíralas una a una a mano; no uses insecticidas químicos.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 9, \"nombre\": \"Mentha Sativa\"}'),
(10, 10, 'AR-006', 'Petrosilium Hortense (Peregil)', 3, '15-20', 'Murcia Seasons', 'Nombre científico o latino: Petroselinum hortense, Petroselinum crispum. Nombre común o vulgar: Perejil, Perejil rizado Familia: Umbelliferae (Umbelíferas). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta naturalizada en casi toda Europa. Se utiliza como condimento y para adorno, pero también en ensaladas. Se suele regalar en las fruterías y verdulerías.El perejil lo hay de 2 tipos: de hojas planas y de hojas rizadas.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 10, \"nombre\": \"Petrosilium Hortense (Peregil)\"}'),
(11, 11, 'AR-007', 'Salvia Mix', 3, '15-20', 'Murcia Seasons', 'La Salvia es un pequeño arbusto que llega hasta el metro de alto.Tiene una vida breve, de unos pocos años.En el jardín, como otras aromáticas, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un camino de Salvia. Abona después de cada corte y recorta el arbusto una vez pase la floración.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 11, \"nombre\": \"Salvia Mix\"}'),
(12, 12, 'AR-008', 'Thymus Citriodra (Tomillo limón)', 3, '15-20', 'Murcia Seasons', 'Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 12, \"nombre\": \"Thymus Citriodra (Tomillo limón)\"}'),
(13, 13, 'AR-009', 'Thymus Vulgaris', 3, '15-20', 'Murcia Seasons', 'Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.\r\n En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 13, \"nombre\": \"Thymus Vulgaris\"}'),
(14, 14, 'AR-010', 'Santolina Chamaecyparys', 3, '15-20', 'Murcia Seasons', '', 140, 1.00, 0.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 14, \"nombre\": \"Santolina Chamaecyparys\"}'),
(15, 15, 'FR-1', 'Expositor Cítricos Mix', 4, '100-120', 'Frutales Talavera S.A', '', 15, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 15, \"nombre\": \"Expositor Cítricos Mix\"}'),
(16, 16, 'FR-10', 'Limonero 2 años injerto', 4, NULL, 'NaranjasValencianas.com', 'El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el hombre, en este caso buscando las necesidades del mercado.', 15, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 16, \"nombre\": \"Limonero 2 años injerto\"}'),
(17, 17, 'FR-100', 'Nectarina', 4, '8/10', 'Frutales Talavera S.A', 'Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 17, \"nombre\": \"Nectarina\"}'),
(18, 18, 'FR-101', 'Nogal', 4, '8/10', 'Frutales Talavera S.A', '', 50, 13.00, 10.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 18, \"nombre\": \"Nogal\"}'),
(19, 19, 'FR-102', 'Olea-Olivos', 4, '8/10', 'Frutales Talavera S.A', 'Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.', 50, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 19, \"nombre\": \"Olea-Olivos\"}'),
(20, 20, 'FR-103', 'Olea-Olivos', 4, '10/12', 'Frutales Talavera S.A', 'Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.', 50, 25.00, 20.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 20, \"nombre\": \"Olea-Olivos\"}'),
(21, 21, 'FR-104', 'Olea-Olivos', 4, '12/4', 'Frutales Talavera S.A', 'Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 21, \"nombre\": \"Olea-Olivos\"}'),
(22, 22, 'FR-105', 'Olea-Olivos', 4, '14/16', 'Frutales Talavera S.A', 'Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 22, \"nombre\": \"Olea-Olivos\"}'),
(23, 23, 'FR-106', 'Peral', 4, '8/10', 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 23, \"nombre\": \"Peral\"}'),
(24, 24, 'FR-107', 'Peral', 4, '10/12', 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 24, \"nombre\": \"Peral\"}'),
(25, 25, 'FR-108', 'Peral', 4, '12/14', 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 25, \"nombre\": \"Peral\"}'),
(26, 26, 'FR-11', 'Limonero 30/40', 4, NULL, 'NaranjasValencianas.com', 'El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el', 15, 100.00, 80.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 26, \"nombre\": \"Limonero 30/40\"}'),
(27, 27, 'FR-12', 'Kunquat', 4, NULL, 'NaranjasValencianas.com', 'su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ápice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillas, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.', 15, 21.00, 16.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 27, \"nombre\": \"Kunquat \"}'),
(28, 28, 'FR-13', 'Kunquat  EXTRA con FRUTA', 4, '150-170', 'NaranjasValencianas.com', 'su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ápice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillas, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.', 15, 57.00, 45.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 28, \"nombre\": \"Kunquat  EXTRA con FRUTA\"}'),
(29, 29, 'FR-14', 'Calamondin Mini', 4, NULL, 'Frutales Talavera S.A', 'Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..', 15, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 29, \"nombre\": \"Calamondin Mini\"}'),
(30, 30, 'FR-15', 'Calamondin Copa', 4, NULL, 'Frutales Talavera S.A', 'Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..', 15, 25.00, 20.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 30, \"nombre\": \"Calamondin Copa \"}'),
(31, 31, 'FR-16', 'Calamondin Copa EXTRA Con FRUTA', 4, '100-120', 'Frutales Talavera S.A', 'Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..', 15, 45.00, 36.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 31, \"nombre\": \"Calamondin Copa EXTRA Con FRUTA\"}'),
(32, 32, 'FR-17', 'Rosal bajo 1Âª -En maceta-inicio brotación', 4, NULL, 'Frutales Talavera S.A', '', 15, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 32, \"nombre\": \"Rosal bajo 1Âª -En maceta-inicio brotación\"}'),
(33, 33, 'FR-18', 'ROSAL TREPADOR', 4, NULL, 'Frutales Talavera S.A', '', 350, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 33, \"nombre\": \"ROSAL TREPADOR\"}'),
(34, 34, 'FR-19', 'Camelia Blanco, Chrysler Rojo, Soraya Naranja,', 4, NULL, 'NaranjasValencianas.com', '', 350, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 34, \"nombre\": \"Camelia Blanco, Chrysler Rojo, Soraya Naranja, \"}'),
(35, 35, 'FR-2', 'Naranjo -Plantón joven 1 año injerto', 4, NULL, 'NaranjasValencianas.com', 'El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.', 15, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 35, \"nombre\": \"Naranjo -Plantón joven 1 año injerto\"}'),
(36, 36, 'FR-20', 'Landora Amarillo, Rose Gaujard bicolor blanco-rojo', 4, NULL, 'Frutales Talavera S.A', '', 350, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 36, \"nombre\": \"Landora Amarillo, Rose Gaujard bicolor blanco-rojo\"}'),
(37, 37, 'FR-21', 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte', 4, NULL, 'Frutales Talavera S.A', '', 350, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 37, \"nombre\": \"Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte\"}'),
(38, 38, 'FR-22', 'Pitimini rojo', 4, NULL, 'Frutales Talavera S.A', '', 350, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 38, \"nombre\": \"Pitimini rojo\"}'),
(39, 39, 'FR-23', 'Rosal copa', 4, NULL, 'Frutales Talavera S.A', '', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 39, \"nombre\": \"Rosal copa \"}'),
(40, 40, 'FR-24', 'Albaricoquero Corbato', 4, NULL, 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 40, \"nombre\": \"Albaricoquero Corbato\"}'),
(41, 41, 'FR-25', 'Albaricoquero Moniqui', 4, NULL, 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 41, \"nombre\": \"Albaricoquero Moniqui\"}'),
(42, 42, 'FR-26', 'Albaricoquero Kurrot', 4, NULL, 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 42, \"nombre\": \"Albaricoquero Kurrot\"}'),
(43, 43, 'FR-27', 'Cerezo Burlat', 4, NULL, 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 43, \"nombre\": \"Cerezo Burlat\"}'),
(44, 44, 'FR-28', 'Cerezo Picota', 4, NULL, 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 44, \"nombre\": \"Cerezo Picota\"}'),
(45, 45, 'FR-29', 'Cerezo Napoleón', 4, NULL, 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 45, \"nombre\": \"Cerezo Napoleón\"}'),
(46, 46, 'FR-3', 'Naranjo 2 años injerto', 4, NULL, 'NaranjasValencianas.com', 'El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.', 15, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 46, \"nombre\": \"Naranjo 2 años injerto\"}'),
(47, 47, 'FR-30', 'Ciruelo R. Claudia Verde', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 47, \"nombre\": \"Ciruelo R. Claudia Verde   \"}'),
(48, 48, 'FR-31', 'Ciruelo Santa Rosa', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 48, \"nombre\": \"Ciruelo Santa Rosa\"}'),
(49, 49, 'FR-32', 'Ciruelo Golden Japan', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 49, \"nombre\": \"Ciruelo Golden Japan\"}'),
(50, 50, 'FR-33', 'Ciruelo Friar', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 50, \"nombre\": \"Ciruelo Friar\"}'),
(51, 51, 'FR-34', 'Ciruelo Reina C. De Ollins', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 51, \"nombre\": \"Ciruelo Reina C. De Ollins\"}'),
(52, 52, 'FR-35', 'Ciruelo Claudia Negra', 4, NULL, 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 52, \"nombre\": \"Ciruelo Claudia Negra\"}'),
(53, 53, 'FR-36', 'Granado Mollar de Elche', 4, NULL, 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 53, \"nombre\": \"Granado Mollar de Elche\"}'),
(54, 54, 'FR-37', 'Higuera Napolitana', 4, NULL, 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 54, \"nombre\": \"Higuera Napolitana\"}'),
(55, 55, 'FR-38', 'Higuera Verdal', 4, NULL, 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 55, \"nombre\": \"Higuera Verdal\"}'),
(56, 56, 'FR-39', 'Higuera Breva', 4, NULL, 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 56, \"nombre\": \"Higuera Breva\"}'),
(57, 57, 'FR-4', 'Naranjo calibre 8/10', 4, NULL, 'NaranjasValencianas.com', 'El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.', 15, 29.00, 23.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 57, \"nombre\": \"Naranjo calibre 8/10\"}'),
(58, 58, 'FR-40', 'Manzano Starking Delicious', 4, NULL, 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 58, \"nombre\": \"Manzano Starking Delicious\"}'),
(59, 59, 'FR-41', 'Manzano Reineta', 4, NULL, 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 59, \"nombre\": \"Manzano Reineta\"}'),
(60, 60, 'FR-42', 'Manzano Golden Delicious', 4, NULL, 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 60, \"nombre\": \"Manzano Golden Delicious\"}'),
(61, 61, 'FR-43', 'Membrillero Gigante de Wranja', 4, NULL, 'Frutales Talavera S.A', '', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 61, \"nombre\": \"Membrillero Gigante de Wranja\"}'),
(62, 62, 'FR-44', 'Melocotonero Spring Crest', 4, NULL, 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 62, \"nombre\": \"Melocotonero Spring Crest\"}'),
(63, 63, 'FR-45', 'Melocotonero Amarillo de Agosto', 4, NULL, 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 63, \"nombre\": \"Melocotonero Amarillo de Agosto\"}'),
(64, 64, 'FR-46', 'Melocotonero Federica', 4, NULL, 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 64, \"nombre\": \"Melocotonero Federica\"}'),
(65, 65, 'FR-47', 'Melocotonero Paraguayo', 4, NULL, 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 65, \"nombre\": \"Melocotonero Paraguayo\"}'),
(66, 66, 'FR-48', 'Nogal Común', 4, NULL, 'Frutales Talavera S.A', '', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 66, \"nombre\": \"Nogal Común\"}'),
(67, 67, 'FR-49', 'Parra Uva de Mesa', 4, NULL, 'Frutales Talavera S.A', '', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 67, \"nombre\": \"Parra Uva de Mesa\"}'),
(68, 68, 'FR-5', 'Mandarino -Plantón joven', 4, NULL, 'Frutales Talavera S.A', '', 15, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 68, \"nombre\": \"Mandarino -Plantón joven\"}'),
(69, 69, 'FR-50', 'Peral Castell', 4, NULL, 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 69, \"nombre\": \"Peral Castell\"}'),
(70, 70, 'FR-51', 'Peral Williams', 4, NULL, 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 70, \"nombre\": \"Peral Williams\"}'),
(71, 71, 'FR-52', 'Peral Conference', 4, NULL, 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 71, \"nombre\": \"Peral Conference\"}'),
(72, 72, 'FR-53', 'Peral Blanq. de Aranjuez', 4, NULL, 'Frutales Talavera S.A', 'Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 72, \"nombre\": \"Peral Blanq. de Aranjuez\"}'),
(73, 73, 'FR-54', 'Níspero Tanaca', 4, NULL, 'Frutales Talavera S.A', 'Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente utilizadas.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 73, \"nombre\": \"Níspero Tanaca\"}'),
(74, 74, 'FR-55', 'Olivo Cipresino', 4, NULL, 'Frutales Talavera S.A', 'Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 74, \"nombre\": \"Olivo Cipresino\"}'),
(75, 75, 'FR-56', 'Nectarina', 4, NULL, 'Frutales Talavera S.A', '', 400, 8.00, 6.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 75, \"nombre\": \"Nectarina\"}'),
(76, 76, 'FR-57', 'Kaki Rojo Brillante', 4, NULL, 'NaranjasValencianas.com', 'De crecimiento algo lento los primeros años, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.', 400, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 76, \"nombre\": \"Kaki Rojo Brillante\"}'),
(77, 77, 'FR-58', 'Albaricoquero', 4, '8/10', 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 200, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 77, \"nombre\": \"Albaricoquero\"}'),
(78, 78, 'FR-59', 'Albaricoquero', 4, '10/12', 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 200, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 78, \"nombre\": \"Albaricoquero\"}'),
(79, 79, 'FR-6', 'Mandarino 2 años injerto', 4, NULL, 'Frutales Talavera S.A', '', 15, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 79, \"nombre\": \"Mandarino 2 años injerto\"}'),
(80, 80, 'FR-60', 'Albaricoquero', 4, '12/14', 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 200, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 80, \"nombre\": \"Albaricoquero\"}'),
(81, 81, 'FR-61', 'Albaricoquero', 4, '14/16', 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 200, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 81, \"nombre\": \"Albaricoquero\"}'),
(82, 82, 'FR-62', 'Albaricoquero', 4, '16/18', 'Melocotones de Cieza S.A.', 'árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.', 200, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 82, \"nombre\": \"Albaricoquero\"}'),
(83, 83, 'FR-63', 'Cerezo', 4, '8/10', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 300, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 83, \"nombre\": \"Cerezo\"}'),
(84, 84, 'FR-64', 'Cerezo', 4, '10/12', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 15, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 84, \"nombre\": \"Cerezo\"}'),
(85, 85, 'FR-65', 'Cerezo', 4, '12/14', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 200, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 85, \"nombre\": \"Cerezo\"}');
INSERT INTO `stg_producto` (`load_id`, `source_id`, `CodigoProducto`, `nombre`, `categoria_id`, `dimensiones`, `proveedor`, `descripcion`, `cantidad_en_stock`, `precio_venta`, `precio_proveedor`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(86, 86, 'FR-66', 'Cerezo', 4, '14/16', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 86, \"nombre\": \"Cerezo\"}'),
(87, 87, 'FR-67', 'Cerezo', 4, '16/18', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 87, \"nombre\": \"Cerezo\"}'),
(88, 88, 'FR-68', 'Cerezo', 4, '18/20', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 50, 80.00, 64.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 88, \"nombre\": \"Cerezo\"}'),
(89, 89, 'FR-69', 'Cerezo', 4, '20/25', 'Jerte Distribuciones S.L.', 'Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado', 50, 91.00, 72.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 89, \"nombre\": \"Cerezo\"}'),
(90, 90, 'FR-7', 'Mandarino calibre 8/10', 4, NULL, 'Frutales Talavera S.A', '', 15, 29.00, 23.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 90, \"nombre\": \"Mandarino calibre 8/10\"}'),
(91, 91, 'FR-70', 'Ciruelo', 4, '8/10', 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 91, \"nombre\": \"Ciruelo\"}'),
(92, 92, 'FR-71', 'Ciruelo', 4, '10/12', 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 92, \"nombre\": \"Ciruelo\"}'),
(93, 93, 'FR-72', 'Ciruelo', 4, '12/14', 'Frutales Talavera S.A', 'árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 93, \"nombre\": \"Ciruelo\"}'),
(94, 94, 'FR-73', 'Granado', 4, '8/10', 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 50, 13.00, 10.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 94, \"nombre\": \"Granado\"}'),
(95, 95, 'FR-74', 'Granado', 4, '10/12', 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 95, \"nombre\": \"Granado\"}'),
(96, 96, 'FR-75', 'Granado', 4, '12/14', 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 96, \"nombre\": \"Granado\"}'),
(97, 97, 'FR-76', 'Granado', 4, '14/16', 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 97, \"nombre\": \"Granado\"}'),
(98, 98, 'FR-77', 'Granado', 4, '16/18', 'Frutales Talavera S.A', 'pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 98, \"nombre\": \"Granado\"}'),
(99, 99, 'FR-78', 'Higuera', 4, '8/10', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 15.00, 12.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 99, \"nombre\": \"Higuera\"}'),
(100, 100, 'FR-79', 'Higuera', 4, '10/12', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 100, \"nombre\": \"Higuera\"}'),
(101, 101, 'FR-8', 'Limonero -Plantón joven', 4, NULL, 'NaranjasValencianas.com', 'El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el', 15, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 101, \"nombre\": \"Limonero -Plantón joven\"}'),
(102, 102, 'FR-80', 'Higuera', 4, '12/14', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 102, \"nombre\": \"Higuera\"}'),
(103, 103, 'FR-81', 'Higuera', 4, '14/16', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 103, \"nombre\": \"Higuera\"}'),
(104, 104, 'FR-82', 'Higuera', 4, '16/18', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 104, \"nombre\": \"Higuera\"}'),
(105, 105, 'FR-83', 'Higuera', 4, '18/20', 'Frutales Talavera S.A', 'La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.', 50, 80.00, 64.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 105, \"nombre\": \"Higuera\"}'),
(106, 106, 'FR-84', 'Kaki', 4, '8/10', 'NaranjasValencianas.com', 'De crecimiento algo lento los primeros años, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.', 50, 13.00, 10.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 106, \"nombre\": \"Kaki\"}'),
(107, 107, 'FR-85', 'Kaki', 4, '16/18', 'NaranjasValencianas.com', 'De crecimiento algo lento los primeros años, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 107, \"nombre\": \"Kaki\"}'),
(108, 108, 'FR-86', 'Manzano', 4, '8/10', 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 108, \"nombre\": \"Manzano\"}'),
(109, 109, 'FR-87', 'Manzano', 4, '10/12', 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 109, \"nombre\": \"Manzano\"}'),
(110, 110, 'FR-88', 'Manzano', 4, '12/14', 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 110, \"nombre\": \"Manzano\"}'),
(111, 111, 'FR-89', 'Manzano', 4, '14/16', 'Frutales Talavera S.A', 'alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 111, \"nombre\": \"Manzano\"}'),
(112, 112, 'FR-9', 'Limonero calibre 8/10', 4, NULL, 'NaranjasValencianas.com', 'El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el', 15, 29.00, 23.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 112, \"nombre\": \"Limonero calibre 8/10\"}'),
(113, 113, 'FR-90', 'Níspero', 4, '16/18', 'Frutales Talavera S.A', 'Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente utilizadas.', 50, 70.00, 56.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 113, \"nombre\": \"Níspero\"}'),
(114, 114, 'FR-91', 'Níspero', 4, '18/20', 'Frutales Talavera S.A', 'Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente utilizadas.', 50, 80.00, 64.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 114, \"nombre\": \"Níspero\"}'),
(115, 115, 'FR-92', 'Melocotonero', 4, '8/10', 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 115, \"nombre\": \"Melocotonero\"}'),
(116, 116, 'FR-93', 'Melocotonero', 4, '10/12', 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 116, \"nombre\": \"Melocotonero\"}'),
(117, 117, 'FR-94', 'Melocotonero', 4, '12/14', 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 117, \"nombre\": \"Melocotonero\"}'),
(118, 118, 'FR-95', 'Melocotonero', 4, '14/16', 'Melocotones de Cieza S.A.', 'Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 118, \"nombre\": \"Melocotonero\"}'),
(119, 119, 'FR-96', 'Membrillero', 4, '8/10', 'Frutales Talavera S.A', 'arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 119, \"nombre\": \"Membrillero\"}'),
(120, 120, 'FR-97', 'Membrillero', 4, '10/12', 'Frutales Talavera S.A', 'arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 120, \"nombre\": \"Membrillero\"}'),
(121, 121, 'FR-98', 'Membrillero', 4, '12/14', 'Frutales Talavera S.A', 'arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 121, \"nombre\": \"Membrillero\"}'),
(122, 122, 'FR-99', 'Membrillero', 4, '14/16', 'Frutales Talavera S.A', 'arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 122, \"nombre\": \"Membrillero\"}'),
(123, 123, 'OR-001', 'Arbustos Mix Maceta', 5, '40-60', 'Valencia Garden Service', '', 25, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 123, \"nombre\": \"Arbustos Mix Maceta\"}'),
(124, 124, 'OR-100', 'Mimosa Injerto CLASICA Dealbata', 5, '100-110', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 12.00, 9.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 124, \"nombre\": \"Mimosa Injerto CLASICA Dealbata \"}'),
(125, 125, 'OR-101', 'Expositor Mimosa Semilla Mix', 5, '170-200', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 125, \"nombre\": \"Expositor Mimosa Semilla Mix\"}'),
(126, 126, 'OR-102', 'Mimosa Semilla Bayleyana', 5, '170-200', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 126, \"nombre\": \"Mimosa Semilla Bayleyana  \"}'),
(127, 127, 'OR-103', 'Mimosa Semilla Bayleyana', 5, '200-225', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 127, \"nombre\": \"Mimosa Semilla Bayleyana   \"}'),
(128, 128, 'OR-104', 'Mimosa Semilla Cyanophylla', 5, '200-225', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 128, \"nombre\": \"Mimosa Semilla Cyanophylla    \"}'),
(129, 129, 'OR-105', 'Mimosa Semilla Espectabilis', 5, '160-170', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 129, \"nombre\": \"Mimosa Semilla Espectabilis  \"}'),
(130, 130, 'OR-106', 'Mimosa Semilla Longifolia', 5, '200-225', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 130, \"nombre\": \"Mimosa Semilla Longifolia   \"}'),
(131, 131, 'OR-107', 'Mimosa Semilla Floribunda 4 estaciones', 5, '120-140', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 131, \"nombre\": \"Mimosa Semilla Floribunda 4 estaciones\"}'),
(132, 132, 'OR-108', 'Abelia Floribunda', 5, '35-45', 'Viveros EL OASIS', '', 100, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 132, \"nombre\": \"Abelia Floribunda\"}'),
(133, 133, 'OR-109', 'Callistemom (Mix)', 5, '35-45', 'Viveros EL OASIS', 'Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 100, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 133, \"nombre\": \"Callistemom (Mix)\"}'),
(134, 134, 'OR-110', 'Callistemom (Mix)', 5, '40-60', 'Viveros EL OASIS', 'Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 100, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 134, \"nombre\": \"Callistemom (Mix)\"}'),
(135, 135, 'OR-111', 'Corylus Avellana \"Contorta\"', 5, '35-45', 'Viveros EL OASIS', '', 100, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 135, \"nombre\": \"Corylus Avellana \\\"Contorta\\\"\"}'),
(136, 136, 'OR-112', 'Escallonia (Mix)', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 136, \"nombre\": \"Escallonia (Mix)\"}'),
(137, 137, 'OR-113', 'Evonimus Emerald Gayeti', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 137, \"nombre\": \"Evonimus Emerald Gayeti\"}'),
(138, 138, 'OR-114', 'Evonimus Pulchellus', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 138, \"nombre\": \"Evonimus Pulchellus\"}'),
(139, 139, 'OR-115', 'Forsytia Intermedia \"Lynwood\"', 5, '35-45', 'Viveros EL OASIS', '', 120, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 139, \"nombre\": \"Forsytia Intermedia \\\"Lynwood\\\"\"}'),
(140, 140, 'OR-116', 'Hibiscus Syriacus  \"Diana\" -Blanco Puro', 5, '35-45', 'Viveros EL OASIS', 'Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.', 120, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 140, \"nombre\": \"Hibiscus Syriacus  \\\"Diana\\\" -Blanco Puro\"}'),
(141, 141, 'OR-117', 'Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo', 5, '35-45', 'Viveros EL OASIS', 'Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.', 120, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 141, \"nombre\": \"Hibiscus Syriacus  \\\"Helene\\\" -Blanco-C.rojo\"}'),
(142, 142, 'OR-118', 'Hibiscus Syriacus \"Pink Giant\" Rosa', 5, '35-45', 'Viveros EL OASIS', 'Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.', 120, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 142, \"nombre\": \"Hibiscus Syriacus \\\"Pink Giant\\\" Rosa\"}'),
(143, 143, 'OR-119', 'Laurus Nobilis Arbusto - Ramificado Bajo', 5, '40-50', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 143, \"nombre\": \"Laurus Nobilis Arbusto - Ramificado Bajo\"}'),
(144, 144, 'OR-120', 'Lonicera Nitida', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 144, \"nombre\": \"Lonicera Nitida \"}'),
(145, 145, 'OR-121', 'Lonicera Nitida \"Maigrum\"', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 145, \"nombre\": \"Lonicera Nitida \\\"Maigrum\\\"\"}'),
(146, 146, 'OR-122', 'Lonicera Pileata', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 146, \"nombre\": \"Lonicera Pileata\"}'),
(147, 147, 'OR-123', 'Philadelphus \"Virginal\"', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 147, \"nombre\": \"Philadelphus \\\"Virginal\\\"\"}'),
(148, 148, 'OR-124', 'Prunus pisardii', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 148, \"nombre\": \"Prunus pisardii  \"}'),
(149, 149, 'OR-125', 'Viburnum Tinus \"Eve Price\"', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 149, \"nombre\": \"Viburnum Tinus \\\"Eve Price\\\"\"}'),
(150, 150, 'OR-126', 'Weigelia \"Bristol Ruby\"', 5, '35-45', 'Viveros EL OASIS', '', 120, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 150, \"nombre\": \"Weigelia \\\"Bristol Ruby\\\"\"}'),
(151, 151, 'OR-127', 'Camelia japonica', 5, '40-60', 'Viveros EL OASIS', 'Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.', 50, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 151, \"nombre\": \"Camelia japonica\"}'),
(152, 152, 'OR-128', 'Camelia japonica ejemplar', 5, '200-250', 'Viveros EL OASIS', 'Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.', 50, 98.00, 78.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 152, \"nombre\": \"Camelia japonica ejemplar\"}'),
(153, 153, 'OR-129', 'Camelia japonica ejemplar', 5, '250-300', 'Viveros EL OASIS', 'Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.', 50, 110.00, 88.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 153, \"nombre\": \"Camelia japonica ejemplar\"}'),
(154, 154, 'OR-130', 'Callistemom COPA', 5, '110/120', 'Viveros EL OASIS', 'Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..', 50, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 154, \"nombre\": \"Callistemom COPA\"}'),
(155, 155, 'OR-131', 'Leptospermum formado PIRAMIDE', 5, '80-100', 'Viveros EL OASIS', '', 50, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 155, \"nombre\": \"Leptospermum formado PIRAMIDE\"}'),
(156, 156, 'OR-132', 'Leptospermum COPA', 5, '110/120', 'Viveros EL OASIS', '', 50, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 156, \"nombre\": \"Leptospermum COPA\"}'),
(157, 157, 'OR-133', 'Nerium oleander-CALIDAD \"GARDEN\"', 5, '40-45', 'Viveros EL OASIS', '', 50, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 157, \"nombre\": \"Nerium oleander-CALIDAD \\\"GARDEN\\\"\"}'),
(158, 158, 'OR-134', 'Nerium Oleander Arbusto GRANDE', 5, '160-200', 'Viveros EL OASIS', '', 100, 38.00, 30.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 158, \"nombre\": \"Nerium Oleander Arbusto GRANDE\"}'),
(159, 159, 'OR-135', 'Nerium oleander COPA  Calibre 6/8', 5, '50-60', 'Viveros EL OASIS', '', 100, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 159, \"nombre\": \"Nerium oleander COPA  Calibre 6/8\"}'),
(160, 160, 'OR-136', 'Nerium oleander ARBOL Calibre 8/10', 5, '225-250', 'Viveros EL OASIS', '', 100, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 160, \"nombre\": \"Nerium oleander ARBOL Calibre 8/10\"}'),
(161, 161, 'OR-137', 'ROSAL TREPADOR', 5, NULL, 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 161, \"nombre\": \"ROSAL TREPADOR\"}'),
(162, 162, 'OR-138', 'Camelia Blanco, Chrysler Rojo, Soraya Naranja,', 5, NULL, 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 162, \"nombre\": \"Camelia Blanco, Chrysler Rojo, Soraya Naranja, \"}'),
(163, 163, 'OR-139', 'Landora Amarillo, Rose Gaujard bicolor blanco-rojo', 5, NULL, 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 163, \"nombre\": \"Landora Amarillo, Rose Gaujard bicolor blanco-rojo\"}'),
(164, 164, 'OR-140', 'Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte', 5, NULL, 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 164, \"nombre\": \"Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte\"}'),
(165, 165, 'OR-141', 'Pitimini rojo', 5, NULL, 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 165, \"nombre\": \"Pitimini rojo\"}'),
(166, 166, 'OR-142', 'Solanum Jazminoide', 5, '150-160', 'Viveros EL OASIS', '', 100, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 166, \"nombre\": \"Solanum Jazminoide\"}'),
(167, 167, 'OR-143', 'Wisteria Sinensis  azul, rosa, blanca', 5, NULL, 'Viveros EL OASIS', '', 100, 9.00, 7.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 167, \"nombre\": \"Wisteria Sinensis  azul, rosa, blanca\"}'),
(168, 168, 'OR-144', 'Wisteria Sinensis INJERTADAS DECÃ“', 5, '140-150', 'Viveros EL OASIS', '', 100, 12.00, 9.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 168, \"nombre\": \"Wisteria Sinensis INJERTADAS DECÃ“\"}'),
(169, 169, 'OR-145', 'Bougamvillea Sanderiana Tutor', 5, '80-100', 'Viveros EL OASIS', '', 100, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 169, \"nombre\": \"Bougamvillea Sanderiana Tutor\"}'),
(170, 170, 'OR-146', 'Bougamvillea Sanderiana Tutor', 5, '125-150', 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 170, \"nombre\": \"Bougamvillea Sanderiana Tutor\"}'),
(171, 171, 'OR-147', 'Bougamvillea Sanderiana Tutor', 5, '180-200', 'Viveros EL OASIS', '', 100, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 171, \"nombre\": \"Bougamvillea Sanderiana Tutor\"}'),
(172, 172, 'OR-148', 'Bougamvillea Sanderiana Espaldera', 5, '45-50', 'Viveros EL OASIS', '', 100, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 172, \"nombre\": \"Bougamvillea Sanderiana Espaldera\"}'),
(173, 173, 'OR-149', 'Bougamvillea Sanderiana Espaldera', 5, '140-150', 'Viveros EL OASIS', '', 100, 17.00, 13.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 173, \"nombre\": \"Bougamvillea Sanderiana Espaldera\"}'),
(174, 174, 'OR-150', 'Bougamvillea roja, naranja', 5, '110-130', 'Viveros EL OASIS', '', 100, 2.00, 1.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 174, \"nombre\": \"Bougamvillea roja, naranja\"}'),
(175, 175, 'OR-151', 'Bougamvillea Sanderiana, 3 tut. piramide', 5, NULL, 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 175, \"nombre\": \"Bougamvillea Sanderiana, 3 tut. piramide\"}'),
(176, 176, 'OR-152', 'Expositor Árboles clima continental', 5, '170-200', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 176, \"nombre\": \"Expositor Árboles clima continental\"}'),
(177, 177, 'OR-153', 'Expositor Árboles clima mediterráneo', 5, '170-200', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 177, \"nombre\": \"Expositor Árboles clima mediterráneo\"}'),
(178, 178, 'OR-154', 'Expositor Árboles borde del mar', 5, '170-200', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 178, \"nombre\": \"Expositor Árboles borde del mar\"}'),
(179, 179, 'OR-155', 'Acer Negundo', 5, '200-225', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 179, \"nombre\": \"Acer Negundo  \"}'),
(180, 180, 'OR-156', 'Acer platanoides', 5, '200-225', 'Viveros EL OASIS', '', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 180, \"nombre\": \"Acer platanoides  \"}'),
(181, 181, 'OR-157', 'Acer Pseudoplatanus', 5, '200-225', 'Viveros EL OASIS', '', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 181, \"nombre\": \"Acer Pseudoplatanus \"}'),
(182, 182, 'OR-158', 'Brachychiton Acerifolius', 5, '200-225', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 182, \"nombre\": \"Brachychiton Acerifolius  \"}'),
(183, 183, 'OR-159', 'Brachychiton Discolor', 5, '200-225', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 183, \"nombre\": \"Brachychiton Discolor  \"}'),
(184, 184, 'OR-160', 'Brachychiton Rupestris', 5, '170-200', 'Viveros EL OASIS', '', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 184, \"nombre\": \"Brachychiton Rupestris\"}'),
(185, 185, 'OR-161', 'Cassia Corimbosa', 5, '200-225', 'Viveros EL OASIS', '', 100, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 185, \"nombre\": \"Cassia Corimbosa  \"}'),
(186, 186, 'OR-162', 'Cassia Corimbosa', 5, '200-225', 'Viveros EL OASIS', '', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 186, \"nombre\": \"Cassia Corimbosa \"}'),
(187, 187, 'OR-163', 'Chitalpa Summer Bells', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 187, \"nombre\": \"Chitalpa Summer Bells   \"}'),
(188, 188, 'OR-164', 'Erytrina Kafra', 5, '170-180', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 188, \"nombre\": \"Erytrina Kafra\"}'),
(189, 189, 'OR-165', 'Erytrina Kafra', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 189, \"nombre\": \"Erytrina Kafra\"}'),
(190, 190, 'OR-166', 'Eucalyptus Citriodora', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 190, \"nombre\": \"Eucalyptus Citriodora  \"}'),
(191, 191, 'OR-167', 'Eucalyptus Ficifolia', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 191, \"nombre\": \"Eucalyptus Ficifolia  \"}'),
(192, 192, 'OR-168', 'Eucalyptus Ficifolia', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 192, \"nombre\": \"Eucalyptus Ficifolia   \"}'),
(193, 193, 'OR-169', 'Hibiscus Syriacus  Var. Injertadas 1 Tallo', 5, '170-200', 'Viveros EL OASIS', '', 80, 12.00, 9.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 193, \"nombre\": \"Hibiscus Syriacus  Var. Injertadas 1 Tallo \"}'),
(194, 194, 'OR-170', 'Lagunaria Patersonii', 5, '140-150', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 194, \"nombre\": \"Lagunaria Patersonii  \"}'),
(195, 195, 'OR-171', 'Lagunaria Patersonii', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 195, \"nombre\": \"Lagunaria Patersonii   \"}'),
(196, 196, 'OR-172', 'Lagunaria patersonii  calibre 8/10', 5, '200-225', 'Viveros EL OASIS', '', 80, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 196, \"nombre\": \"Lagunaria patersonii  calibre 8/10\"}'),
(197, 197, 'OR-173', 'Morus Alba', 5, '200-225', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 197, \"nombre\": \"Morus Alba  \"}'),
(198, 198, 'OR-174', 'Morus Alba  calibre 8/10', 5, '200-225', 'Viveros EL OASIS', '', 80, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 198, \"nombre\": \"Morus Alba  calibre 8/10\"}'),
(199, 199, 'OR-175', 'Platanus Acerifolia', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 199, \"nombre\": \"Platanus Acerifolia   \"}'),
(200, 200, 'OR-176', 'Prunus pisardii', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 200, \"nombre\": \"Prunus pisardii  \"}'),
(201, 201, 'OR-177', 'Robinia Pseudoacacia Casque Rouge', 5, '200-225', 'Viveros EL OASIS', '', 80, 15.00, 12.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 201, \"nombre\": \"Robinia Pseudoacacia Casque Rouge   \"}'),
(202, 202, 'OR-178', 'Salix Babylonica  Pendula', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 202, \"nombre\": \"Salix Babylonica  Pendula  \"}'),
(203, 203, 'OR-179', 'Sesbania Punicea', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 203, \"nombre\": \"Sesbania Punicea   \"}'),
(204, 204, 'OR-180', 'Tamarix  Ramosissima Pink Cascade', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 204, \"nombre\": \"Tamarix  Ramosissima Pink Cascade   \"}'),
(205, 205, 'OR-181', 'Tamarix  Ramosissima Pink Cascade', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 205, \"nombre\": \"Tamarix  Ramosissima Pink Cascade   \"}');
INSERT INTO `stg_producto` (`load_id`, `source_id`, `CodigoProducto`, `nombre`, `categoria_id`, `dimensiones`, `proveedor`, `descripcion`, `cantidad_en_stock`, `precio_venta`, `precio_proveedor`, `load_date`, `source_system`, `is_valid`, `validation_errors`, `raw_row`) VALUES
(206, 206, 'OR-182', 'Tecoma Stands', 5, '200-225', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 206, \"nombre\": \"Tecoma Stands   \"}'),
(207, 207, 'OR-183', 'Tecoma Stands', 5, '200-225', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 207, \"nombre\": \"Tecoma Stands  \"}'),
(208, 208, 'OR-184', 'Tipuana Tipu', 5, '170-200', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 208, \"nombre\": \"Tipuana Tipu  \"}'),
(209, 209, 'OR-185', 'Pleioblastus distichus-Bambú enano', 5, '15-20', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 209, \"nombre\": \"Pleioblastus distichus-Bambú enano\"}'),
(210, 210, 'OR-186', 'Sasa palmata', 5, '20-30', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 210, \"nombre\": \"Sasa palmata \"}'),
(211, 211, 'OR-187', 'Sasa palmata', 5, '40-45', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 211, \"nombre\": \"Sasa palmata \"}'),
(212, 212, 'OR-188', 'Sasa palmata', 5, '50-60', 'Viveros EL OASIS', '', 80, 25.00, 20.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 212, \"nombre\": \"Sasa palmata \"}'),
(213, 213, 'OR-189', 'Phylostachys aurea', 5, '180-200', 'Viveros EL OASIS', '', 80, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 213, \"nombre\": \"Phylostachys aurea\"}'),
(214, 214, 'OR-190', 'Phylostachys aurea', 5, '250-300', 'Viveros EL OASIS', '', 80, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 214, \"nombre\": \"Phylostachys aurea\"}'),
(215, 215, 'OR-191', 'Phylostachys Bambusa Spectabilis', 5, '180-200', 'Viveros EL OASIS', '', 80, 24.00, 19.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 215, \"nombre\": \"Phylostachys Bambusa Spectabilis\"}'),
(216, 216, 'OR-192', 'Phylostachys biseti', 5, '160-170', 'Viveros EL OASIS', '', 80, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 216, \"nombre\": \"Phylostachys biseti\"}'),
(217, 217, 'OR-193', 'Phylostachys biseti', 5, '160-180', 'Viveros EL OASIS', '', 80, 20.00, 16.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 217, \"nombre\": \"Phylostachys biseti\"}'),
(218, 218, 'OR-194', 'Pseudosasa japonica (Metake)', 5, '225-250', 'Viveros EL OASIS', '', 80, 20.00, 16.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 218, \"nombre\": \"Pseudosasa japonica (Metake)\"}'),
(219, 219, 'OR-195', 'Pseudosasa japonica (Metake)', 5, '30-40', 'Viveros EL OASIS', '', 80, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 219, \"nombre\": \"Pseudosasa japonica (Metake) \"}'),
(220, 220, 'OR-196', 'Cedrus Deodara', 5, '80-100', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 220, \"nombre\": \"Cedrus Deodara \"}'),
(221, 221, 'OR-197', 'Cedrus Deodara \"Feeling Blue\" Novedad', 5, 'rastrero', 'Viveros EL OASIS', '', 80, 12.00, 9.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 221, \"nombre\": \"Cedrus Deodara \\\"Feeling Blue\\\" Novedad\"}'),
(222, 222, 'OR-198', 'Juniperus chinensis \"Blue Alps\"', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 222, \"nombre\": \"Juniperus chinensis \\\"Blue Alps\\\"\"}'),
(223, 223, 'OR-199', 'Juniperus Chinensis Stricta', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 223, \"nombre\": \"Juniperus Chinensis Stricta\"}'),
(224, 224, 'OR-200', 'Juniperus horizontalis Wiltonii', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 224, \"nombre\": \"Juniperus horizontalis Wiltonii\"}'),
(225, 225, 'OR-201', 'Juniperus squamata \"Blue Star\"', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 225, \"nombre\": \"Juniperus squamata \\\"Blue Star\\\"\"}'),
(226, 226, 'OR-202', 'Juniperus x media Phitzeriana verde', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 226, \"nombre\": \"Juniperus x media Phitzeriana verde\"}'),
(227, 227, 'OR-203', 'Pinus Canariensis', 5, '80-100', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 227, \"nombre\": \"Pinus Canariensis\"}'),
(228, 228, 'OR-204', 'Pinus Halepensis', 5, '160-180', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 228, \"nombre\": \"Pinus Halepensis\"}'),
(229, 229, 'OR-205', 'Pinus Pinea -Pino Piñonero', 5, '70-80', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 229, \"nombre\": \"Pinus Pinea -Pino Piñonero\"}'),
(230, 230, 'OR-206', 'Thuja Esmeralda', 5, '80-100', 'Viveros EL OASIS', '', 80, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 230, \"nombre\": \"Thuja Esmeralda \"}'),
(231, 231, 'OR-207', 'Tuja Occidentalis Woodwardii', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 231, \"nombre\": \"Tuja Occidentalis Woodwardii\"}'),
(232, 232, 'OR-208', 'Tuja orientalis \"Aurea nana\"', 5, '20-30', 'Viveros EL OASIS', '', 80, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 232, \"nombre\": \"Tuja orientalis \\\"Aurea nana\\\"\"}'),
(233, 233, 'OR-209', 'Archontophoenix Cunninghamiana', 5, '80 - 100', 'Viveros EL OASIS', '', 80, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 233, \"nombre\": \"Archontophoenix Cunninghamiana\"}'),
(234, 234, 'OR-210', 'Beucarnea Recurvata', 5, '130  - 150', 'Viveros EL OASIS', '', 2, 39.00, 31.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 234, \"nombre\": \"Beucarnea Recurvata\"}'),
(235, 235, 'OR-211', 'Beucarnea Recurvata', 5, '180 - 200', 'Viveros EL OASIS', '', 5, 59.00, 47.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 235, \"nombre\": \"Beucarnea Recurvata\"}'),
(236, 236, 'OR-212', 'Bismarckia Nobilis', 5, '200 - 220', 'Viveros EL OASIS', '', 4, 217.00, 173.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 236, \"nombre\": \"Bismarckia Nobilis\"}'),
(237, 237, 'OR-213', 'Bismarckia Nobilis', 5, '240 - 260', 'Viveros EL OASIS', '', 4, 266.00, 212.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 237, \"nombre\": \"Bismarckia Nobilis\"}'),
(238, 238, 'OR-214', 'Brahea Armata', 5, '45 - 60', 'Viveros EL OASIS', '', 0, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 238, \"nombre\": \"Brahea Armata\"}'),
(239, 239, 'OR-215', 'Brahea Armata', 5, '120 - 140', 'Viveros EL OASIS', '', 100, 112.00, 89.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 239, \"nombre\": \"Brahea Armata\"}'),
(240, 240, 'OR-216', 'Brahea Edulis', 5, '80 - 100', 'Viveros EL OASIS', '', 100, 19.00, 15.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 240, \"nombre\": \"Brahea Edulis\"}'),
(241, 241, 'OR-217', 'Brahea Edulis', 5, '140 - 160', 'Viveros EL OASIS', '', 100, 64.00, 51.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 241, \"nombre\": \"Brahea Edulis\"}'),
(242, 242, 'OR-218', 'Butia Capitata', 5, '70 - 90', 'Viveros EL OASIS', '', 100, 25.00, 20.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 242, \"nombre\": \"Butia Capitata\"}'),
(243, 243, 'OR-219', 'Butia Capitata', 5, '90 - 110', 'Viveros EL OASIS', '', 100, 29.00, 23.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 243, \"nombre\": \"Butia Capitata\"}'),
(244, 244, 'OR-220', 'Butia Capitata', 5, '90 - 120', 'Viveros EL OASIS', '', 100, 36.00, 28.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 244, \"nombre\": \"Butia Capitata\"}'),
(245, 245, 'OR-221', 'Butia Capitata', 5, '85 - 105', 'Viveros EL OASIS', '', 100, 59.00, 47.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 245, \"nombre\": \"Butia Capitata\"}'),
(246, 246, 'OR-222', 'Butia Capitata', 5, '130 - 150', 'Viveros EL OASIS', '', 100, 87.00, 69.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 246, \"nombre\": \"Butia Capitata\"}'),
(247, 247, 'OR-223', 'Chamaerops Humilis', 5, '40 - 45', 'Viveros EL OASIS', '', 100, 4.00, 3.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 247, \"nombre\": \"Chamaerops Humilis\"}'),
(248, 248, 'OR-224', 'Chamaerops Humilis', 5, '50 - 60', 'Viveros EL OASIS', '', 100, 7.00, 5.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 248, \"nombre\": \"Chamaerops Humilis\"}'),
(249, 249, 'OR-225', 'Chamaerops Humilis', 5, '70 - 90', 'Viveros EL OASIS', '', 100, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 249, \"nombre\": \"Chamaerops Humilis\"}'),
(250, 250, 'OR-226', 'Chamaerops Humilis', 5, '115 - 130', 'Viveros EL OASIS', '', 100, 38.00, 30.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 250, \"nombre\": \"Chamaerops Humilis\"}'),
(251, 251, 'OR-227', 'Chamaerops Humilis', 5, '130 - 150', 'Viveros EL OASIS', '', 100, 64.00, 51.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 251, \"nombre\": \"Chamaerops Humilis\"}'),
(252, 252, 'OR-228', 'Chamaerops Humilis \"Cerifera\"', 5, '70 - 80', 'Viveros EL OASIS', '', 100, 32.00, 25.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 252, \"nombre\": \"Chamaerops Humilis \\\"Cerifera\\\"\"}'),
(253, 253, 'OR-229', 'Chrysalidocarpus Lutescens -ARECA', 5, '130 - 150', 'Viveros EL OASIS', '', 100, 22.00, 17.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 253, \"nombre\": \"Chrysalidocarpus Lutescens -ARECA\"}'),
(254, 254, 'OR-230', 'Cordyline Australis -DRACAENA', 5, '190 - 210', 'Viveros EL OASIS', '', 100, 38.00, 30.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 254, \"nombre\": \"Cordyline Australis -DRACAENA\"}'),
(255, 255, 'OR-231', 'Cycas Revoluta', 5, '55 - 65', 'Viveros EL OASIS', '', 100, 15.00, 12.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 255, \"nombre\": \"Cycas Revoluta\"}'),
(256, 256, 'OR-232', 'Cycas Revoluta', 5, '80 - 90', 'Viveros EL OASIS', '', 100, 34.00, 27.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 256, \"nombre\": \"Cycas Revoluta\"}'),
(257, 257, 'OR-233', 'Dracaena Drago', 5, '60 - 70', 'Viveros EL OASIS', '', 1, 13.00, 10.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 257, \"nombre\": \"Dracaena Drago\"}'),
(258, 258, 'OR-234', 'Dracaena Drago', 5, '130 - 150', 'Viveros EL OASIS', '', 2, 64.00, 51.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 258, \"nombre\": \"Dracaena Drago\"}'),
(259, 259, 'OR-235', 'Dracaena Drago', 5, '150 - 175', 'Viveros EL OASIS', '', 2, 92.00, 73.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 259, \"nombre\": \"Dracaena Drago\"}'),
(260, 260, 'OR-236', 'Jubaea Chilensis', 5, NULL, 'Viveros EL OASIS', '', 100, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 260, \"nombre\": \"Jubaea Chilensis\"}'),
(261, 261, 'OR-237', 'Livistonia Australis', 5, '100 - 125', 'Viveros EL OASIS', '', 50, 19.00, 15.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 261, \"nombre\": \"Livistonia Australis\"}'),
(262, 262, 'OR-238', 'Livistonia Decipiens', 5, '90 - 110', 'Viveros EL OASIS', '', 50, 19.00, 15.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 262, \"nombre\": \"Livistonia Decipiens\"}'),
(263, 263, 'OR-239', 'Livistonia Decipiens', 5, '180 - 200', 'Viveros EL OASIS', '', 50, 49.00, 39.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 263, \"nombre\": \"Livistonia Decipiens\"}'),
(264, 264, 'OR-240', 'Phoenix Canariensis', 5, '110 - 130', 'Viveros EL OASIS', '', 50, 6.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 264, \"nombre\": \"Phoenix Canariensis\"}'),
(265, 265, 'OR-241', 'Phoenix Canariensis', 5, '180 - 200', 'Viveros EL OASIS', '', 50, 19.00, 15.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 265, \"nombre\": \"Phoenix Canariensis\"}'),
(266, 266, 'OR-242', 'Rhaphis Excelsa', 5, '80 - 100', 'Viveros EL OASIS', '', 50, 21.00, 16.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 266, \"nombre\": \"Rhaphis Excelsa\"}'),
(267, 267, 'OR-243', 'Rhaphis Humilis', 5, '150- 170', 'Viveros EL OASIS', '', 50, 64.00, 51.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 267, \"nombre\": \"Rhaphis Humilis\"}'),
(268, 268, 'OR-244', 'Sabal Minor', 5, '60 - 75', 'Viveros EL OASIS', '', 50, 11.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 268, \"nombre\": \"Sabal Minor\"}'),
(269, 269, 'OR-245', 'Sabal Minor', 5, '120 - 140', 'Viveros EL OASIS', '', 50, 34.00, 27.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 269, \"nombre\": \"Sabal Minor\"}'),
(270, 270, 'OR-246', 'Trachycarpus Fortunei', 5, '90 - 105', 'Viveros EL OASIS', '', 50, 18.00, 14.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 270, \"nombre\": \"Trachycarpus Fortunei\"}'),
(271, 271, 'OR-247', 'Trachycarpus Fortunei', 5, '250-300', 'Viveros EL OASIS', '', 2, 462.00, 369.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 271, \"nombre\": \"Trachycarpus Fortunei\"}'),
(272, 272, 'OR-248', 'Washingtonia Robusta', 5, '60 - 70', 'Viveros EL OASIS', '', 15, 3.00, 2.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 272, \"nombre\": \"Washingtonia Robusta\"}'),
(273, 273, 'OR-249', 'Washingtonia Robusta', 5, '130 - 150', 'Viveros EL OASIS', '', 15, 5.00, 4.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 273, \"nombre\": \"Washingtonia Robusta\"}'),
(274, 274, 'OR-250', 'Yucca Jewel', 5, '80 - 105', 'Viveros EL OASIS', '', 15, 10.00, 8.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 274, \"nombre\": \"Yucca Jewel\"}'),
(275, 275, 'OR-251', 'Zamia Furfuracaea', 5, '90 - 110', 'Viveros EL OASIS', '', 15, 168.00, 134.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 275, \"nombre\": \"Zamia Furfuracaea\"}'),
(276, 276, 'OR-99', 'Mimosa DEALBATA Gaulois Astier', 5, '200-225', 'Viveros EL OASIS', 'Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...', 100, 14.00, 11.00, '2025-09-15 15:55:32', 'jardineria', 1, NULL, '{\"ID_producto\": 276, \"nombre\": \"Mimosa DEALBATA Gaulois Astier  \"}');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `stg_categoria_producto`
--
ALTER TABLE `stg_categoria_producto`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_cat_source` (`source_id`);

--
-- Indices de la tabla `stg_cliente`
--
ALTER TABLE `stg_cliente`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_cliente_source` (`source_id`);

--
-- Indices de la tabla `stg_detalle_pedido`
--
ALTER TABLE `stg_detalle_pedido`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_detalle_source` (`source_id`);

--
-- Indices de la tabla `stg_empleado`
--
ALTER TABLE `stg_empleado`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_empleado_source` (`source_id`);

--
-- Indices de la tabla `stg_oficina`
--
ALTER TABLE `stg_oficina`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_oficina_source` (`source_id`);

--
-- Indices de la tabla `stg_pago`
--
ALTER TABLE `stg_pago`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_pago_source` (`source_id`);

--
-- Indices de la tabla `stg_pedido`
--
ALTER TABLE `stg_pedido`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_pedido_source` (`source_id`);

--
-- Indices de la tabla `stg_producto`
--
ALTER TABLE `stg_producto`
  ADD PRIMARY KEY (`load_id`),
  ADD UNIQUE KEY `uq_stg_producto_source` (`source_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `stg_categoria_producto`
--
ALTER TABLE `stg_categoria_producto`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stg_cliente`
--
ALTER TABLE `stg_cliente`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `stg_detalle_pedido`
--
ALTER TABLE `stg_detalle_pedido`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT de la tabla `stg_empleado`
--
ALTER TABLE `stg_empleado`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `stg_oficina`
--
ALTER TABLE `stg_oficina`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `stg_pago`
--
ALTER TABLE `stg_pago`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `stg_pedido`
--
ALTER TABLE `stg_pedido`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `stg_producto`
--
ALTER TABLE `stg_producto`
  MODIFY `load_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
