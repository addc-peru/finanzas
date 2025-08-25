CREATE SCHEMA IF NOT EXISTS workspace.finanzas;

CREATE TABLE IF NOT EXISTS workspace.finanzas.bronze_clientes (
  id_cliente STRING,
  documento STRING,
  representante STRING,
  celular STRING, :param_1
  correo STRING,
  fecha_inscripcion STRING,
  fecha_carga TIMESTAMP
)
USING delta;


CREATE TABLE workspace.finanzas.bronze_transacciones (
  id_cliente STRING,
  tipo_transaccion STRING,
  moneda STRING,
  monto STRING,
  fecha_transaccion STRING,
  fecha_carga TIMESTAMP
)
USING delta;


CREATE TABLE workspace.finanzas.silver_clientes (
  id_cliente STRING,
  documento STRING,
  nombre_completo STRING,
  fecha_carga TIMESTAMP
)
USING delta;


CREATE TABLE workspace.finanzas.silver_transacciones (
  id_cliente STRING,
  fecha_transaccion DATE,
  hora_transaccion STRING,
  moneda STRING,
  monto_PEN DOUBLE,
  deposito_PEN DOUBLE,
  retiro_PEN DOUBLE,
  fecha_carga TIMESTAMP
)
USING delta;


CREATE TABLE workspace.finanzas.gold_fact_transacciones (
  id_cliente STRING,
  documento STRING,
  nombre_completo STRING,
  fecha_transaccion DATE,
  deposito FLOAT,
  retiro FLOAT,
  fecha_carga TIMESTAMP
)
USING delta;