-- 1) Crear DB staging
CREATE DATABASE IF NOT EXISTS staging_jardineria CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE staging_jardineria;

-- 2) Tabla staging: cliente
CREATE TABLE stg_cliente (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,                         -- ID_cliente del origen
  nombre_cliente VARCHAR(100),
  nombre_contacto VARCHAR(60),
  apellido_contacto VARCHAR(60),
  telefono VARCHAR(30),
  fax VARCHAR(30),
  linea_direccion1 VARCHAR(200),
  linea_direccion2 VARCHAR(200),
  ciudad VARCHAR(100),
  region VARCHAR(100),
  pais VARCHAR(100),
  codigo_postal VARCHAR(20),
  empleado_rep_ventas_id INT,
  limite_credito DECIMAL(15,2),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  source_system VARCHAR(50) DEFAULT 'jardineria',
  is_valid TINYINT(1) DEFAULT 1,
  validation_errors TEXT,
  raw_row JSON,
  UNIQUE KEY uq_stg_cliente_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) Tabla staging: producto
CREATE TABLE stg_producto (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  CodigoProducto VARCHAR(50),
  nombre VARCHAR(200),
  categoria_id INT,
  dimensiones VARCHAR(50),
  proveedor VARCHAR(150),
  descripcion TEXT,
  cantidad_en_stock INT,
  precio_venta DECIMAL(15,2),
  precio_proveedor DECIMAL(15,2),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  source_system VARCHAR(50) DEFAULT 'jardineria',
  is_valid TINYINT(1) DEFAULT 1,
  validation_errors TEXT,
  raw_row JSON,
  UNIQUE KEY uq_stg_producto_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Tabla staging: pedido
CREATE TABLE stg_pedido (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  fecha_pedido DATE,
  fecha_esperada DATE,
  fecha_entrega DATE,
  estado VARCHAR(50),
  comentarios TEXT,
  cliente_id INT,
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  source_system VARCHAR(50) DEFAULT 'jardineria',
  is_valid TINYINT(1) DEFAULT 1,
  validation_errors TEXT,
  raw_row JSON,
  UNIQUE KEY uq_stg_pedido_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5) Tabla staging: detalle_pedido
CREATE TABLE stg_detalle_pedido (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,          -- ID_detalle_pedido
  pedido_id INT,          -- ID_pedido
  producto_id INT,        -- ID_producto
  cantidad INT,
  precio_unidad DECIMAL(15,2),
  numero_linea SMALLINT,
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  source_system VARCHAR(50) DEFAULT 'jardineria',
  is_valid TINYINT(1) DEFAULT 1,
  validation_errors TEXT,
  raw_row JSON,
  UNIQUE KEY uq_stg_detalle_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6) Tabla staging: pago
CREATE TABLE stg_pago (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  cliente_id INT,
  forma_pago VARCHAR(80),
  id_transaccion VARCHAR(120),
  fecha_pago DATE,
  total DECIMAL(15,2),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  source_system VARCHAR(50) DEFAULT 'jardineria',
  is_valid TINYINT(1) DEFAULT 1,
  validation_errors TEXT,
  raw_row JSON,
  UNIQUE KEY uq_stg_pago_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7) staging para categoria, empleado, oficina (más simple)
CREATE TABLE stg_categoria_producto (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  desc_categoria VARCHAR(200),
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(300),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  raw_row JSON,
  UNIQUE KEY uq_stg_cat_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE stg_empleado (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  nombre VARCHAR(100),
  apellido1 VARCHAR(100),
  apellido2 VARCHAR(100),
  extension VARCHAR(20),
  email VARCHAR(150),
  oficina_id INT,
  id_jefe INT,
  puesto VARCHAR(150),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  raw_row JSON,
  UNIQUE KEY uq_stg_empleado_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE stg_oficina (
  load_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  source_id INT,
  descripcion VARCHAR(50),
  ciudad VARCHAR(100),
  pais VARCHAR(100),
  region VARCHAR(100),
  codigo_postal VARCHAR(30),
  telefono VARCHAR(30),
  linea_direccion1 VARCHAR(200),
  linea_direccion2 VARCHAR(200),
  load_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  raw_row JSON,
  UNIQUE KEY uq_stg_oficina_source (source_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
