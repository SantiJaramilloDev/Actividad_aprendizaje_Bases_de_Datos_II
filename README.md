# Proyecto: DW - Jardinería

Resumen
-------
Este repositorio contiene los scripts y dumps usados en la actividad de Bases de Datos II para construir un proceso ETL que extrae datos de la base de datos fuente `jardineria`, los carga en una capa de staging (`staging_jardineria`) y finalmente los transforma a un data mart / DW (`jardineria_dw`) con un esquema en estrella (dimensiones + tabla de hechos).

Requisitos
---------
- MariaDB / MySQL (probado con MariaDB 10.4.32).
- Cliente `mysql` disponible en la línea de comandos.
- Opcional: phpMyAdmin o Adminer para inspección visual de dumps.

Estructura del repositorio
-------------------------
- Actividad_1/
  - Creación de modelo estrella desde la base `jardineria`.

- Actividad_2/
  - script_creacion_db_staging.sql  -> DDL para crear la base `staging_jardineria` y las tablas `stg_*` (recomendado para crear el entorno de staging desde cero).
  - script_consultas_staging.sql    -> Sentencias INSERT ... SELECT que realizan el upsert (ON DUPLICATE KEY UPDATE) desde `jardineria` a `staging_jardineria`.
  - BK_staging_jardineria.sql       -> Dump de respaldo de la base `staging_jardineria` con datos (útil para restaurar directamente).

- Actividad_3/
  - jardineria.sql                  -> Dump completo de la base fuente `jardineria` (schema + datos). Cargar primero si partes desde cero.
  - staging_jardineria.sql          -> Dump de staging (schema + datos) alternativo al BK.
  - consultas_ETL.sql               -> Script que crea el data mart `jardineria_dw` (dimensiones + hechos) y poblaciones de ETL desde staging.
  - jardineria_dw.sql               -> Dump de la base `jardineria_dw` ya poblada (útil para restauración/inspección).
  - consultas_ETL.sql               -> (mismo que arriba) contiene correcciones y notas de unión.
