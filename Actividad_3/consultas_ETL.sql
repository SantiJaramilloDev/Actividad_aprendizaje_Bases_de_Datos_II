-- ===================================================================
-- FASE 1: CREACIÓN DE LA ESTRUCTURA DEL DATA MART (jardineria_dw)
-- ===================================================================

-- Se recomienda ejecutar estas líneas manualmente en phpMyAdmin
-- CREATE DATABASE IF NOT EXISTS jardineria_dw;
-- USE jardineria_dw;

-- Para asegurar una carga limpia, eliminamos las tablas si ya existen
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS hechos_ventas;
DROP TABLE IF EXISTS dim_tiempo;
DROP TABLE IF EXISTS dim_producto;
DROP TABLE IF EXISTS dim_cliente;
DROP TABLE IF EXISTS dim_oficina;
DROP TABLE IF EXISTS dim_empleado;
SET FOREIGN_KEY_CHECKS=1;

-- Creación de la Dimensión Tiempo
CREATE TABLE dim_tiempo (
    tiempo_key INT PRIMARY KEY AUTO_INCREMENT,
    fecha_completa DATE NOT NULL,
    anio SMALLINT,
    semestre TINYINT,
    trimestre TINYINT,
    mes TINYINT,
    nombre_mes VARCHAR(20),
    dia TINYINT,
    dia_semana VARCHAR(20),
    UNIQUE KEY uq_fecha_completa (fecha_completa)
);

-- Creación de la Dimensión Producto
-- **AJUSTE:** Se añade `id_producto_original` para hacer un JOIN numérico más eficiente.
CREATE TABLE dim_producto (
    producto_key INT PRIMARY KEY AUTO_INCREMENT,
    id_producto_original INT NOT NULL,
    codigo_producto_original VARCHAR(15) NOT NULL,
    nombre_producto VARCHAR(70),
    categoria_producto VARCHAR(50),
    proveedor VARCHAR(50),
    precio_venta DECIMAL(15,2)
);

-- Creación de la Dimensión Cliente
CREATE TABLE dim_cliente (
    cliente_key INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cliente_original INT NOT NULL,
    nombre_cliente VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50)
);

-- Creación de la Dimensión Oficina
-- **AJUSTE:** `codigo_oficina_original` es INT para coincidir con la tabla de origen.
-- Se añade `descripcion_oficina` para el código de texto (ej: 'BCN-ES').
CREATE TABLE dim_oficina (
    oficina_key INT PRIMARY KEY AUTO_INCREMENT,
    codigo_oficina_original INT NOT NULL,
    descripcion_oficina VARCHAR(30),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50)
);

-- Creación de la Dimensión Empleado
CREATE TABLE dim_empleado (
    empleado_key INT PRIMARY KEY AUTO_INCREMENT,
    codigo_empleado_original INT NOT NULL,
    nombre_completo VARCHAR(150),
    puesto VARCHAR(50),
    nombre_jefe VARCHAR(150)
);

-- Creación de la Tabla de Hechos (Fact Table)
CREATE TABLE hechos_ventas (
    tiempo_key INT,
    producto_key INT,
    cliente_key INT,
    empleado_key INT,
    oficina_key INT,
    cantidad INT,
    precio_unidad DECIMAL(15,2),
    total_linea DECIMAL(15,2),
    FOREIGN KEY (tiempo_key) REFERENCES dim_tiempo(tiempo_key),
    FOREIGN KEY (producto_key) REFERENCES dim_producto(producto_key),
    FOREIGN KEY (cliente_key) REFERENCES dim_cliente(cliente_key),
    FOREIGN KEY (empleado_key) REFERENCES dim_empleado(empleado_key),
    FOREIGN KEY (oficina_key) REFERENCES dim_oficina(oficina_key)
);

-- ===================================================================
-- FASE 2: CARGA DE LAS TABLAS DE DIMENSIONES
-- ===================================================================

-- Carga de dim_tiempo
INSERT INTO jardineria_dw.dim_tiempo (fecha_completa, anio, semestre, trimestre, mes, nombre_mes, dia, dia_semana)
SELECT DISTINCT
    fecha_pedido AS fecha_completa,
    YEAR(fecha_pedido) AS anio,
    IF(MONTH(fecha_pedido) <= 6, 1, 2) AS semestre,
    QUARTER(fecha_pedido) AS trimestre,
    MONTH(fecha_pedido) AS mes,
    CASE MONTH(fecha_pedido)
        WHEN 1 THEN 'Enero' WHEN 2 THEN 'Febrero' WHEN 3 THEN 'Marzo' WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo' WHEN 6 THEN 'Junio' WHEN 7 THEN 'Julio' WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre' WHEN 10 THEN 'Octubre' WHEN 11 THEN 'Noviembre' WHEN 12 THEN 'Diciembre'
    END AS nombre_mes,
    DAY(fecha_pedido) AS dia,
    CASE DAYOFWEEK(fecha_pedido)
        WHEN 1 THEN 'Domingo' WHEN 2 THEN 'Lunes' WHEN 3 THEN 'Martes' WHEN 4 THEN 'Miércoles'
        WHEN 5 THEN 'Jueves' WHEN 6 THEN 'Viernes' WHEN 7 THEN 'Sábado'
    END AS dia_semana
FROM staging_jardineria.stg_pedido
WHERE fecha_pedido IS NOT NULL;

-- Carga de dim_producto
INSERT INTO jardineria_dw.dim_producto (id_producto_original, codigo_producto_original, nombre_producto, categoria_producto, proveedor, precio_venta)
SELECT 
    p.source_id,
    p.CodigoProducto,
    p.nombre,
    cp.desc_categoria,
    p.proveedor,
    p.precio_venta
FROM staging_jardineria.stg_producto p
LEFT JOIN staging_jardineria.stg_categoria_producto cp ON p.categoria_id = cp.source_id;

-- Carga de dim_cliente
INSERT INTO jardineria_dw.dim_cliente (codigo_cliente_original, nombre_cliente, ciudad, region, pais)
SELECT 
    source_id,
    nombre_cliente,
    ciudad,
    region,
    pais
FROM staging_jardineria.stg_cliente;

-- Carga de dim_oficina
INSERT INTO jardineria_dw.dim_oficina (codigo_oficina_original, descripcion_oficina, ciudad, pais, region)
SELECT 
    source_id,
    descripcion,
    ciudad,
    pais,
    region
FROM staging_jardineria.stg_oficina;

-- Carga de dim_empleado
INSERT INTO jardineria_dw.dim_empleado (codigo_empleado_original, nombre_completo, puesto, nombre_jefe)
SELECT 
    e.source_id,
    CONCAT(e.nombre, ' ', e.apellido1, ' ', IFNULL(e.apellido2, '')) AS nombre_completo,
    e.puesto,
    IFNULL(CONCAT(j.nombre, ' ', j.apellido1), 'N/A') AS nombre_jefe
FROM staging_jardineria.stg_empleado e
LEFT JOIN staging_jardineria.stg_empleado j ON e.id_jefe = j.source_id;

-- ===================================================================
-- FASE 3: CARGA DE LA TABLA DE HECHOS
-- ===================================================================

INSERT INTO jardineria_dw.hechos_ventas (
    tiempo_key, producto_key, cliente_key, empleado_key, oficina_key,
    cantidad, precio_unidad, total_linea
)
SELECT
    dt.tiempo_key,
    dp.producto_key,
    dc.cliente_key,
    de.empleado_key,
    do.oficina_key,
    det.cantidad,
    det.precio_unidad,
    (det.cantidad * det.precio_unidad) AS total_linea
FROM staging_jardineria.stg_detalle_pedido det
-- Uniones con tablas de Staging para obtener los IDs originales
JOIN staging_jardineria.stg_pedido ped ON det.pedido_id = ped.source_id
JOIN staging_jardineria.stg_cliente cli ON ped.cliente_id = cli.source_id
JOIN staging_jardineria.stg_empleado emp ON cli.empleado_rep_ventas_id = emp.source_id
-- Uniones con las Dimensiones para obtener las llaves foráneas (keys) del Data Mart
JOIN jardineria_dw.dim_tiempo dt ON ped.fecha_pedido = dt.fecha_completa
JOIN jardineria_dw.dim_producto dp ON det.producto_id = dp.id_producto_original -- **UNIÓN CORREGIDA**
JOIN jardineria_dw.dim_cliente dc ON ped.cliente_id = dc.codigo_cliente_original
JOIN jardineria_dw.dim_empleado de ON emp.source_id = de.codigo_empleado_original
JOIN jardineria_dw.dim_oficina do ON emp.oficina_id = do.codigo_oficina_original -- **UNIÓN CORREGIDA**
-- Aplicación de la regla de negocio
WHERE ped.estado = 'Entregado';