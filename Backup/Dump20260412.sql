CREATE DATABASE  IF NOT EXISTS `tienda_tecnologia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda_tecnologia`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_tecnologia
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Nicolás','Moretti','nico.moretti@gmail.com'),(2,'Camila','Pereyra','cami.pereyra.94@outlook.com'),(3,'Mateo','Calcaterra','mcalcaterra@gmail.com'),(4,'Victoria',' Lagos','vickylagos_ar@yahoo.com.ar'),(5,'Ignacio','Iannone','nachoiannone@icloud.com'),(6,'Lucía',' Ferraro','lu.ferraro.dev@gmail.com'),(7,'Franco','Mazzoni','fran.mazzoni89@gmail.com'),(8,'Julieta','Soria','juli.soria@outlook.com'),(9,'Bruno','Di Paolo','bruno.dipaolo@gmail.com'),(10,'Abril','Mansilla','abril.mansilla.ok@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(60) NOT NULL,
  `id_proveedor` int NOT NULL,
  `precio_venta` decimal(12,2) NOT NULL,
  `precio_compra` decimal(12,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Monitor LED 24 CX',1,105.00,139.00,15),(2,'Impresora HP LaserJet M15w',2,145.00,185.00,8),(3,'Router TP-Link Archer AX55 Wi-Fi 6',3,85.00,115.00,25),(4,'Notebook Dell Vostro 3405',4,480.00,599.00,5),(5,'Placa de Video Gigabyte RTX 3060',5,320.00,395.00,10),(6,'Impresora Epson EcoTank L3250',6,210.00,265.00,12),(7,'Disco SSD Kingston NV2 1TB',7,55.00,79.00,50),(8,'Auriculares HyperX Cloud II',8,78.00,109.00,30),(9,'Monitor Dell 27 Profesional P2722H',9,240.00,310.00,6),(10,'Tablet Samsung Galaxy Tab A8',10,215.00,285.00,20);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_descuento` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN 
	IF NEW.stock > 55 THEN 
		UPDATE tienda_tecnologia.productos AS p SET p.precio_venta = p.precio_venta * 0.80 WHERE p.id_producto = NEW.id_producto; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_comercial` varchar(60) NOT NULL,
  `email_contacto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Air Computers','ventas@air-computers.com'),(2,'Microglobal','info@microglobal.com.ar'),(3,'Solution Box','ventas@solutionbox.com.ar'),(4,'PC Arts','ventas@pcarts.com'),(5,'Elit','ventas@elit.com.ar'),(6,'Stylus','ventas@stylus.com.ar'),(7,'Intcomex','ventas.ar@intcomex.com'),(8,'Distecna','info@distecna.com'),(9,'Corcisa','info@corcisa.com.ar'),(10,'Free','ventas@free-online.com.ar');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `ventas_totales` int NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Buenos Aires','Avenida Corrientes 4521',10500),(2,'Buenos Aires','Avenida del Libertador 10250',50615),(3,'Buenos Aires','Bulevar de la Independencia 890',5740),(4,'Buenos Aires','Pasaje del Sol 12',75900),(5,'Santa Fe','Calle 54 N° 732',25460),(6,'Santa Fe','Calle de la Ribera 55',12000),(7,'Santa Fe','Camino de los Artesanos s/n',20120),(8,'Santa Fe','Avenida de los Pioneros 450',11700),(9,'Cordoba','Calle Los Arrayanes 128',13600),(10,'Mendoza','Calle San Martín 345',6900);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Facundo','Solari','facu.solari88@gmail.com',4),(2,'Martina','Zabaleta','m.zabaleta@outlook.com',1),(3,'Bautista','Rossi','bau_rossi92@hotmail.com',3),(4,'Valentina','Gatti','valentina.gatti@yahoo.com.ar',7),(5,'Santiago','De Luca','santiago.deluca@icloud.com',5),(6,'Milagros','Benitez','mili_benitez_ok@gmail.com',6),(7,'Julian','Sampaoli','jsampaoli.dev@gmail.com',8),(8,'Delfina','Moyano','delfi.moyano@outlook.com',9),(9,'Mateo','Pedernera','mpedernera_arg@yahoo.com',10),(10,'Sofia','Villalba','sofivillalba.arq@gmail.com',2);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_clientes`
--

DROP TABLE IF EXISTS `venta_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_clientes` (
  `id_cliente` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_venta` int NOT NULL,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `venta_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `venta_clientes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `venta_clientes_ibfk_3` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_clientes`
--

LOCK TABLES `venta_clientes` WRITE;
/*!40000 ALTER TABLE `venta_clientes` DISABLE KEYS */;
INSERT INTO `venta_clientes` VALUES (1,5,4),(2,4,6),(3,2,9),(4,7,3),(5,1,1),(6,8,7),(7,3,2),(8,10,5),(9,6,10),(10,9,8),(2,3,11),(4,10,12),(7,6,13),(10,4,14);
/*!40000 ALTER TABLE `venta_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_vendedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_venta` date NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,2,8,'2025-01-15'),(2,3,5,'2025-03-22'),(3,4,5,'2025-04-20'),(4,1,9,'2025-05-02'),(5,7,7,'2025-06-18'),(6,10,10,'2025-07-09'),(7,6,5,'2025-08-12'),(8,8,1,'2025-08-30'),(9,4,5,'2025-09-01'),(10,6,2,'2025-09-12'),(11,4,3,'2025-10-25'),(12,9,10,'2025-11-02'),(13,9,6,'2025-11-14'),(14,5,4,'2025-12-01');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_agrega_venta` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN 
    DECLARE precioventa DECIMAL(12,2);
    DECLARE preciocompra DECIMAL(12,2);
    DECLARE idsucursal INT;
    
    SET idsucursal = (SELECT v.id_sucursal FROM tienda_tecnologia.vendedores AS v WHERE v.id_vendedor= NEW.id_vendedor); 
    
    UPDATE tienda_tecnologia.productos AS p SET p.stock= p.stock -1 WHERE p.id_producto = NEW.id_producto;
    UPDATE tienda_tecnologia.sucursales AS s SET s.ventas_totales = s.ventas_totales + 1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_proveedor_popular`
--

DROP TABLE IF EXISTS `view_proveedor_popular`;
/*!50001 DROP VIEW IF EXISTS `view_proveedor_popular`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_proveedor_popular` AS SELECT 
 1 AS `id`,
 1 AS `nombre_comercial`,
 1 AS `cantidad_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_vendedores`
--

DROP TABLE IF EXISTS `view_vendedores`;
/*!50001 DROP VIEW IF EXISTS `view_vendedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_vendedores` AS SELECT 
 1 AS `id_vendedor`,
 1 AS `nombre_vendedor`,
 1 AS `ganacias_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_venta_completa`
--

DROP TABLE IF EXISTS `view_venta_completa`;
/*!50001 DROP VIEW IF EXISTS `view_venta_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_venta_completa` AS SELECT 
 1 AS `id_venta`,
 1 AS `nombre_vendedor`,
 1 AS `nombre_cliente`,
 1 AS `nombre_producto`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'tienda_tecnologia'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_ganacia_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_ganacia_total`(_stock INT, _precio_compra DECIMAL(12,2), _precio_venta DECIMAL(12,2)) RETURNS decimal(12,2)
    DETERMINISTIC
BEGIN 
	DECLARE resultado DECIMAL(12,2);
    SET resultado = (_precio_venta - _precio_compra) * _stock; 
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_nombre_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre_completo`(_nombre VARCHAR(60), _apellido VARCHAR(60) ) RETURNS varchar(120) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
	DECLARE resultado VARCHAR(120);
    SET resultado =CONCAT(_nombre,' ',_apellido); 
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `precio_por_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_por_stock`(_stock INT, _ganancia_total DECIMAL(12,2)) RETURNS decimal(12,2)
    DETERMINISTIC
BEGIN 
	DECLARE resultado DECIMAL(12,2);
    SET resultado = _ganancia_total / _stock ; 
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_producto`(IN _nombre_producto VARCHAR(60), IN _proveedor VARCHAR(60), 
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_despido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_despido`(IN _nombre_vendedor VARCHAR(120))
BEGIN 
	
    DELETE FROM tienda_tecnologia.vendedores AS v WHERE fn_nombre_completo(v.nombre,v.apellido) = _nombre_vendedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_proveedor_popular`
--

/*!50001 DROP VIEW IF EXISTS `view_proveedor_popular`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_proveedor_popular` AS select `proveedor`.`id_proveedor` AS `id`,`proveedor`.`nombre_comercial` AS `nombre_comercial`,count(`vc`.`id_venta`) AS `cantidad_ventas` from ((`proveedores` `proveedor` join `productos` `producto` on((`proveedor`.`id_proveedor` = `producto`.`id_proveedor`))) join `venta_clientes` `vc` on((`producto`.`id_producto` = `vc`.`id_producto`))) group by `proveedor`.`id_proveedor` order by `cantidad_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_vendedores`
--

/*!50001 DROP VIEW IF EXISTS `view_vendedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_vendedores` AS select `vendedor`.`id_vendedor` AS `id_vendedor`,`fn_nombre_completo`(`vendedor`.`nombre`,`vendedor`.`apellido`) AS `nombre_vendedor`,sum(`producto`.`precio_venta`) AS `ganacias_total` from ((`vendedores` `vendedor` join `ventas` `v` on((`vendedor`.`id_vendedor` = `v`.`id_vendedor`))) join `productos` `producto` on((`v`.`id_producto` = `producto`.`id_producto`))) group by `vendedor`.`id_vendedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_venta_completa`
--

/*!50001 DROP VIEW IF EXISTS `view_venta_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_venta_completa` AS select `venta`.`id_venta` AS `id_venta`,`fn_nombre_completo`(`vendedor`.`nombre`,`vendedor`.`apellido`) AS `nombre_vendedor`,`fn_nombre_completo`(`cliente`.`nombre`,`cliente`.`apellido`) AS `nombre_cliente`,`producto`.`nombre_producto` AS `nombre_producto`,`venta`.`fecha_venta` AS `fecha` from ((((`ventas` `venta` join `vendedores` `vendedor` on((`venta`.`id_vendedor` = `vendedor`.`id_vendedor`))) join `venta_clientes` `vc` on((`venta`.`id_venta` = `vc`.`id_venta`))) join `clientes` `cliente` on((`vc`.`id_cliente` = `cliente`.`id_cliente`))) join `productos` `producto` on((`producto`.`id_producto` = `venta`.`id_producto`))) order by `venta`.`id_venta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-12 21:05:07
