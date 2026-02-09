-- Creación de la base de datos:

CREATE DATABASE IF NOT EXISTS Tienda_Tecnologia; 
USE Tienda_Tecnologia;

-- Creación de las tablas relacionales de la tabla de datos:

CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.sucursales(
	id_sucursal int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    provincia VARCHAR(60) NOT NULL, 
    direccion VARCHAR(60) NOT NULL,
    ventas_totales int NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.ventas(
	id_venta int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_vendedor int NOT NULL,
    id_producto int NOT NULL,
    fecha_venta date NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.vendedores(
	id_vendedor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_sucursal int NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.clientes(
	id_cliente int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.venta_clientes(
	id_cliente int NOT NULL,
    id_producto int NOT NULL,
    id_venta int NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.productos(
	id_producto int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre_producto VARCHAR(60) NOT NULL,
    id_proveedor int NOT NULL,
    precio_venta int NOT NULL,
    precio_compra int NOT NULL,
    stock int NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS Tienda_Tecnologia.proveedores(
	id_proveedor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_comercial VARCHAR(60) NOT NULL, 
    email_contacto VARCHAR(100) NOT NULL
 );
 
-- Creación de las claves foraneas:
ALTER TABLE  Tienda_Tecnologia.ventas
ADD FOREIGN KEY (id_vendedor) REFERENCES tienda_tecnologia.vendedores(id_vendedor);

ALTER TABLE  Tienda_Tecnologia.ventas
ADD FOREIGN KEY (id_producto) REFERENCES tienda_tecnologia.productos(id_producto);

ALTER TABLE  Tienda_Tecnologia.vendedores
ADD FOREIGN KEY (id_sucursal) REFERENCES tienda_tecnologia.sucursales(id_sucursal);

ALTER TABLE  Tienda_tecnologia.venta_clientes
ADD FOREIGN KEY (id_cliente) REFERENCES tienda_tecnologia.clientes(id_cliente);


ALTER TABLE  Tienda_Tecnologia.venta_clientes
ADD FOREIGN KEY (id_producto) REFERENCES tienda_tecnologia.productos(id_producto);

ALTER TABLE  Tienda_Tecnologia.venta_clientes
ADD FOREIGN KEY (id_venta) REFERENCES tienda_tecnologia.ventas(id_venta);

ALTER TABLE  Tienda_Tecnologia.productos
ADD FOREIGN KEY (id_proveedor) REFERENCES tienda_tecnologia.proveedores(id_proveedor);


-- DROP DATABASE tienda_tecnologia;