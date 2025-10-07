-- 1) Clientes
INSERT INTO staging_jardineria.stg_cliente
(source_id, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, empleado_rep_ventas_id, limite_credito, raw_row)
SELECT
  c.ID_cliente,
  TRIM(c.nombre_cliente),
  TRIM(c.nombre_contacto),
  TRIM(c.apellido_contacto),
  NULLIF(TRIM(c.telefono),''),
  NULLIF(TRIM(c.fax),''),
  TRIM(c.linea_direccion1),
  NULLIF(TRIM(c.linea_direccion2),''),
  NULLIF(TRIM(c.ciudad),''),
  NULLIF(TRIM(c.region),''),
  NULLIF(TRIM(c.pais),''),
  NULLIF(TRIM(c.codigo_postal),''),
  c.ID_empleado_rep_ventas,
  c.limite_credito,
  JSON_OBJECT('ID_cliente', c.ID_cliente, 'nombre_cliente', c.nombre_cliente)
FROM jardineria.cliente c
ON DUPLICATE KEY UPDATE
  nombre_cliente = VALUES(nombre_cliente),
  telefono = VALUES(telefono),
  raw_row = VALUES(raw_row);

-- 2) Productos
INSERT INTO staging_jardineria.stg_producto
(source_id, CodigoProducto, nombre, categoria_id, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor, raw_row)
SELECT
  p.ID_producto,
  p.CodigoProducto,
  TRIM(p.nombre),
  p.Categoria,
  NULLIF(TRIM(p.dimensiones),''),
  NULLIF(TRIM(p.proveedor),''),
  p.descripcion,
  p.cantidad_en_stock,
  p.precio_venta,
  p.precio_proveedor,
  JSON_OBJECT('ID_producto', p.ID_producto, 'nombre', p.nombre)
FROM jardineria.producto p
ON DUPLICATE KEY UPDATE
  nombre = VALUES(nombre),
  cantidad_en_stock = VALUES(cantidad_en_stock),
  precio_venta = VALUES(precio_venta),
  raw_row = VALUES(raw_row);

-- 3) Pedidos
INSERT INTO staging_jardineria.stg_pedido
(source_id, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, cliente_id, raw_row)
SELECT
  pd.ID_pedido,
  pd.fecha_pedido,
  pd.fecha_esperada,
  pd.fecha_entrega,
  TRIM(pd.estado),
  pd.comentarios,
  pd.ID_cliente,
  JSON_OBJECT('ID_pedido', pd.ID_pedido, 'estado', pd.estado)
FROM jardineria.pedido pd
ON DUPLICATE KEY UPDATE
  estado = VALUES(estado),
  fecha_entrega = VALUES(fecha_entrega),
  raw_row = VALUES(raw_row);

-- 4) Detalle pedido
INSERT INTO staging_jardineria.stg_detalle_pedido
(source_id, pedido_id, producto_id, cantidad, precio_unidad, numero_linea, raw_row)
SELECT
  dp.ID_detalle_pedido,
  dp.ID_pedido,
  dp.ID_producto,
  dp.cantidad,
  dp.precio_unidad,
  dp.numero_linea,
  JSON_OBJECT('ID_detalle_pedido', dp.ID_detalle_pedido, 'ID_pedido', dp.ID_pedido)
FROM jardineria.detalle_pedido dp
ON DUPLICATE KEY UPDATE
  cantidad = VALUES(cantidad),
  precio_unidad = VALUES(precio_unidad),
  raw_row = VALUES(raw_row);

-- 5) Pagos
INSERT INTO staging_jardineria.stg_pago
(source_id, cliente_id, forma_pago, id_transaccion, fecha_pago, total, raw_row)
SELECT
  pg.ID_pago,
  pg.ID_cliente,
  TRIM(pg.forma_pago),
  TRIM(pg.id_transaccion),
  pg.fecha_pago,
  pg.total,
  JSON_OBJECT('ID_pago', pg.ID_pago, 'total', pg.total)
FROM jardineria.pago pg
ON DUPLICATE KEY UPDATE
  total = VALUES(total),
  raw_row = VALUES(raw_row);

-- 6) Categoría, empleado, oficina (similar)
INSERT INTO staging_jardineria.stg_categoria_producto
(source_id, desc_categoria, descripcion_texto, descripcion_html, imagen, raw_row)
SELECT
  c.Id_Categoria, c.Desc_Categoria, c.descripcion_texto, c.descripcion_html, c.imagen,
  JSON_OBJECT('Id_Categoria', c.Id_Categoria)
FROM jardineria.Categoria_producto c
ON DUPLICATE KEY UPDATE desc_categoria = VALUES(desc_categoria), raw_row = VALUES(raw_row);

INSERT INTO staging_jardineria.stg_empleado
(source_id, nombre, apellido1, apellido2, extension, email, oficina_id, id_jefe, puesto, raw_row)
SELECT
  e.ID_empleado, e.nombre, e.apellido1, e.apellido2, e.extension, e.email, e.ID_oficina, e.ID_jefe, e.puesto,
  JSON_OBJECT('ID_empleado', e.ID_empleado)
FROM jardineria.empleado e
ON DUPLICATE KEY UPDATE email = VALUES(email), raw_row = VALUES(raw_row);

INSERT INTO staging_jardineria.stg_oficina
(source_id, descripcion, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2, raw_row)
SELECT
  o.ID_oficina, o.Descripcion, o.ciudad, o.pais, o.region, o.codigo_postal, o.telefono, o.linea_direccion1, o.linea_direccion2,
  JSON_OBJECT('ID_oficina', o.ID_oficina)
FROM jardineria.oficina o
ON DUPLICATE KEY UPDATE ciudad = VALUES(ciudad), raw_row = VALUES(raw_row);
