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
    precio_venta DECIMAL(12, 2) NOT NULL,
    precio_compra DECIMAL(12, 2) NOT NULL,
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



-- Inserción de registros 

INSERT INTO tienda_tecnologia.sucursales (provincia , direccion,ventas_totales) VALUES 
("Buenos Aires","Avenida Corrientes 4521",10500),
("Buenos Aires","Avenida del Libertador 10250",50615),
("Buenos Aires","Bulevar de la Independencia 890",5740),
("Buenos Aires","Pasaje del Sol 12",75900),
("Santa Fe", "Calle 54 N° 732", 25460),
("Santa Fe", "Calle de la Ribera 55", 12000),
("Santa Fe", "Camino de los Artesanos s/n", 20120),
("Santa Fe", "Avenida de los Pioneros 450", 11700),
("Cordoba","Calle Los Arrayanes 128", 13600),
("Mendoza", "Calle San Martín 345", 6900);

INSERT INTO tienda_tecnologia.vendedores (nombre,apellido, email,id_sucursal) VALUES 
("Facundo", "Solari","facu.solari88@gmail.com",4),
("Martina", "Zabaleta","m.zabaleta@outlook.com", 1), 
("Bautista", "Rossi","bau_rossi92@hotmail.com",3),
("Valentina", "Gatti","valentina.gatti@yahoo.com.ar",7),
("Santiago", "De Luca","santiago.deluca@icloud.com",5),
("Milagros","Benitez","mili_benitez_ok@gmail.com",6),
("Julian", "Sampaoli","jsampaoli.dev@gmail.com",8),
("Delfina", "Moyano","delfi.moyano@outlook.com",9),
("Mateo","Pedernera","mpedernera_arg@yahoo.com",10),
("Sofia", "Villalba","sofivillalba.arq@gmail.com",2);

-- SELECT * FROM tienda_tecnologia.sucursales;

INSERT INTO tienda_tecnologia.proveedores (nombre_comercial,email_contacto) VALUES
("Air Computers","ventas@air-computers.com"),
("Microglobal","info@microglobal.com.ar"),
("Solution Box","ventas@solutionbox.com.ar"),
("PC Arts","ventas@pcarts.com"),
("Elit","ventas@elit.com.ar"),
("Stylus","ventas@stylus.com.ar"),
("Intcomex","ventas.ar@intcomex.com"),
("Distecna","info@distecna.com"),
("Corcisa","info@corcisa.com.ar"),
("Free","ventas@free-online.com.ar");


INSERT INTO tienda_tecnologia.clientes (nombre,apellido,email) VALUES
("Nicolás", "Moretti",	"nico.moretti@gmail.com"),
("Camila","Pereyra","cami.pereyra.94@outlook.com"),
("Mateo", "Calcaterra","mcalcaterra@gmail.com"),
("Victoria"," Lagos","vickylagos_ar@yahoo.com.ar"),
("Ignacio","Iannone","nachoiannone@icloud.com"),
("Lucía"," Ferraro","lu.ferraro.dev@gmail.com"),
("Franco", "Mazzoni","fran.mazzoni89@gmail.com"),
("Julieta","Soria","juli.soria@outlook.com"),
("Bruno", "Di Paolo","bruno.dipaolo@gmail.com"),
("Abril","Mansilla","abril.mansilla.ok@gmail.com");

-- SELECT * FROM tienda_tecnologia.proveedores;

INSERT INTO tienda_tecnologia.productos (nombre_producto, id_proveedor,precio_venta, precio_compra,stock ) VALUES
("Monitor LED 24 CX",1,105.00, 139.00,15),
("Impresora HP LaserJet M15w",2,145.00,185.00,8), 
("Router TP-Link Archer AX55 Wi-Fi 6",3,85.00,115.00,25),
("Notebook Dell Vostro 3405",4, 480.00, 599.00,5),
("Placa de Video Gigabyte RTX 3060",5, 320.00,395.00,10),
("Impresora Epson EcoTank L3250",6,210.00,265.00,12),
("Disco SSD Kingston NV2 1TB",7,55.00, 79.00,50),
("Auriculares HyperX Cloud II",8,78.00, 109.00,30),
("Monitor Dell 27 Profesional P2722H",9,240.00, 310.00,6),
("Tablet Samsung Galaxy Tab A8",10,215.00, 285.00,20);

INSERT INTO tienda_tecnologia.ventas (id_vendedor,id_producto,fecha_venta) VALUES
(2,8,'2025-01-15'),
(3,5,'2025-03-22'),
(1,9,'2025-05-02'),
(7,7,'2025-06-18'),
(10,10,'2025-07-09'),
(8,1,'2025-08-30'),
(6,2,'2025-09-12'),
(4,3,'2025-10-25'),
(9,6,'2025-11-14'),
(5,4,'2025-12-01');

INSERT INTO tienda_tecnologia.venta_clientes(id_cliente,id_producto,id_venta) VALUES 
(1,5,4),
(2,4,6),
(3,2,9),
(4,7,3),
(5,1,1),
(6,8,7),
(7,3,2),
(8,10,5),
(9,6,10),
(10,9,8);


-- DROP DATABASE tienda_tecnologia;

CREATE VIEW tienda_tecnologia.view_venta_completa AS
	SELECT venta.id_venta AS id_venta, fn_nombre_completo(vendedor.nombre,vendedor.apellido) AS nombre_vendedor,
	 fn_nombre_completo(cliente.nombre,cliente.apellido) AS nombre_cliente,
    producto.nombre_producto AS nombre_producto,venta.fecha_venta AS fecha
    FROM tienda_tecnologia.ventas AS venta
        JOIN tienda_tecnologia.vendedores AS vendedor USING (id_vendedor)
        JOIN tienda_tecnologia.venta_clientes AS vc USING (id_venta)
        JOIN tienda_tecnologia.clientes AS cliente USING (id_cliente)
        JOIN tienda_tecnologia.productos  AS producto ON producto.id_producto = venta.id_producto
    ORDER BY venta.id_venta;
    
    -- Esta vista muestra todas las entidades involucradas en cada venta.
    
  --  SELECT * FROM tienda_tecnologia.view_venta_completa;
  
  CREATE VIEW tienda_tecnologia.view_vendedores AS 
	SELECT vendedor.id_vendedor AS id_vendedor,
    fn_nombre_completo(vendedor.nombre,vendedor.apellido) AS nombre_vendedor,
    SUM(producto.precio_venta) AS ganacias_total 
    FROM tienda_tecnologia.vendedores AS vendedor 
		JOIN tienda_tecnologia.ventas AS v USING(id_vendedor) 
        JOIN tienda_tecnologia.productos AS producto USING (id_producto) GROUP BY  vendedor.id_vendedor;

-- Esta vista muestra la ganacia total generada por cada vendedor 

CREATE VIEW tienda_tecnologia.view_proveedor_popular AS
    SELECT proveedor.id_proveedor AS id,
	proveedor.nombre_comercial AS nombre_comercial,
	COUNT(vc.id_venta) AS cantidad_ventas
    FROM tienda_tecnologia.proveedores AS  proveedor
        JOIN tienda_tecnologia.productos AS producto USING (id_proveedor)
        JOIN tienda_tecnologia.venta_clientes AS vc USING (id_producto)
    GROUP BY proveedor.id_proveedor
    ORDER BY cantidad_ventas DESC;

SELECT * FROM tienda_tecnologia.clientes AS c WHERE c.nombre = "pepe"; 
-- Esta vista muestra cuantas ventas hizo cada proveedor en la tienda, ordenados de mayor a menor.

-- Creación de funciones 

DELIMITER // 

CREATE FUNCTION tienda_tecnologia.fn_ganacia_total (_stock INT, _precio_compra DECIMAL(12,2), _precio_venta DECIMAL(12,2)) 
RETURNS DECIMAL(12,2) 
DETERMINISTIC
BEGIN 
	DECLARE resultado DECIMAL(12,2);
    SET resultado = (_precio_venta - _precio_compra) * _stock; 
    RETURN resultado;
END;//

-- Esta funcion devuelve la ganacia total que generaria un producto al vender todo su stock.
DELIMITER // 

CREATE FUNCTION tienda_tecnologia.fn_nombre_completo (_nombre VARCHAR(60), _apellido VARCHAR(60) ) 
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN 
	DECLARE resultado VARCHAR(120);
    SET resultado =CONCAT(_nombre,' ',_apellido); 
    RETURN resultado;
END;//
-- Esta funcion pide un nombre y un apellido y devuelve el nombre completo en un VARCHAR.

DELIMITER // 
CREATE FUNCTION tienda_tecnologia.precio_por_stock (_stock INT, _ganancia_total DECIMAL(12,2)) 
RETURNS DECIMAL(12,2) 
DETERMINISTIC
BEGIN 
	DECLARE resultado DECIMAL(12,2);
    SET resultado = _ganancia_total / _stock ; 
    RETURN resultado;
END;//

/*Esta funcion pide una cantidad de stock de un producto y la ganancia total esperada para ese producto, 
y devuelve el precio de venta que deberia tener para alcanzarlo*/

-- Creacion de procediimentos 

DELIMITER // 

CREATE PROCEDURE  tienda_tecnologia.sp_agregar_producto 
	(IN _nombre_producto VARCHAR(60), IN _proveedor VARCHAR(60), 
	IN _precio_venta DECIMAL(12,2),IN _precio_compra DECIMAL(12,2), IN _stock INT) 
BEGIN 
	DECLARE idproveedor INT;
    IF EXISTS (SELECT p.id_proveedor FROM tienda_tecnologia.proveedores AS p WHERE p.nombre_comercial = _proveedor) THEN 
		SET idproveedor = (SELECT p.id_proveedor FROM tienda_tecnologia.proveedores AS p WHERE p.nombre_comercial = _proveedor); 
		INSERT INTO tienda_tecnologia.productos (nombre_producto, id_proveedor, precio_venta, precio_compra, stock) VALUE 
			(_nombre_producto, idproveedor,_precio_venta,_precio_compra,_stock);
    ELSE 
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'no existe el proveedor';
	END IF;

END;//

-- Este procedimiento agrega un producto a la tabla de producto dada su informacion. 
DELIMITER //

CREATE PROCEDURE  tienda_tecnologia.sp_despido
	(IN _nombre_vendedor VARCHAR(120))
BEGIN 
	
    DELETE FROM tienda_tecnologia.vendedores AS v WHERE fn_nombre_completo(v.nombre,v.apellido) = _nombre_vendedor;
END;//

-- Este procedimiento elimina el registro de un vendedor dado su nombre completo.


