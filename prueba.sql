-- Active: 1662595082257@@127.0.0.1@3306@prueba
CREATE DATABASE if not EXISTS prueba;
use prueba;

SELECT @@global.secure_file_priv;
/*Importacion de las tablas*/

#importacion tabla producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto`(
  	`Id` 		varchar(255)null,
  	`marca` 	VARCHAR(100)null,
  	`nombre` 	VARCHAR(250)null,
    `presentacion`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\producto.csv'
INTO TABLE `producto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;


show variables like "secure_file_priv";

#importacion tabla sucursal
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal`(
  	`id` 		varchar(255)null,
  	`comercioid` int(10)null,
    `banderaId` int(10)null,
  	`banderaDescripcion` 	VARCHAR(250)null,
    `comercioRazonSocial`	VARCHAR(250)null,
    `provincia`	VARCHAR(250)null,
    `localidad`	VARCHAR(250)null,
    `direccion`	VARCHAR(250)null,
    `lat`	VARCHAR(250)null,
    `lng`	VARCHAR(250)null,
    `sucursalNombre`	VARCHAR(250)null,
    `sucursalTipo`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sucursal.csv'
INTO TABLE `sucursal` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

#importacion tabla precios_semana_20200503
DROP TABLE IF EXISTS `precios_semana_20200503`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200503`(
  	`precio` 		varchar(255)null,
  	`producto_id` 	VARCHAR(250)null,
    `sucursal_id`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_20200503.csv'
INTO TABLE `precios_semana_20200503` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

#importacion precios_semana_20200503
DROP TABLE IF EXISTS `precios_semana_20200518`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200518`(
  	`precio` 		varchar(255)null,
  	`producto_id` 	VARCHAR(250)null,
    `sucursal_id`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_20200518.csv'
INTO TABLE `precios_semana_20200518` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

#importacion precios_semana_20200413
DROP TABLE IF EXISTS `precios_semana_20200413`;
CREATE TABLE IF NOT EXISTS `precios_semana_20200413`(
  	`precio` 		varchar(255)null,
  	`producto_id` 	VARCHAR(250)null,
    `sucursal_id`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_20200413.csv'
INTO TABLE `precios_semana_20200413` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

#importacion tabla precios_semanas_20200419_20200426
DROP TABLE IF EXISTS `precios_semanas_20200419_20200426`;
CREATE TABLE IF NOT EXISTS `precios_semanas_20200419_20200426`(
  	`precio` 		varchar(255)null,
  	`producto_id` 	VARCHAR(250)null,
    `sucursal_id`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semanas_20200419_20200426.csv'
INTO TABLE `precios_semanas_20200419_20200426` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

#importacion tabla precios
DROP TABLE IF EXISTS `precios`;
CREATE TABLE IF NOT EXISTS `precios`(
  	`precio` 		varchar(255)null,
  	`producto_id` 	VARCHAR(250)null,
    `sucursal_id`	VARCHAR(250)null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios.csv'
INTO TABLE `precios` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"'ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;




select * from producto;

#creacion de funcion UCWords
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS `UC_Words`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `UC_Words`( str VARCHAR(255) ) RETURNS varchar(255) CHARSET utf8
BEGIN  
  DECLARE c CHAR(1);  
  DECLARE s VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE bool INT DEFAULT 1;  
  DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  
  SET s = LCASE( str );  
  WHILE i < LENGTH( str ) DO  
     BEGIN  
       SET c = SUBSTRING( s, i, 1 );  
       IF LOCATE( c, punct ) > 0 THEN  
        SET bool = 1;  
      ELSEIF bool=1 THEN  
        BEGIN  
          IF c >= 'a' AND c <= 'z' THEN  
             BEGIN  
               SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));  
               SET bool = 0;  
             END;  
           ELSEIF c >= '0' AND c <= '9' THEN  
            SET bool = 0;  
          END IF;  
        END;  
      END IF;  
      SET i = i+1;  
    END;  
  END WHILE;  
  RETURN s;  
END$$
DELIMITER ;


#cambio de nombre a las columnas

#tabla producto:
select * from producto;
alter table producto change Id IdProducto varchar(255);
alter table producto change marca Marca varchar(255);
alter table producto change nombre Nombre varchar(255);
alter table producto change presentacion Presentacion varchar(255);

#tabla sucursal:
alter table sucursal change id IdSucursal varchar(255);
alter table sucursal change comercioid ComercioId varchar(255);
alter table sucursal change banderaid BanderaId varchar(255);
alter table sucursal change comercioRazonSocial ComercioRazonSocial varchar(255);
alter table sucursal change provincia Provincia varchar(255);
alter table sucursal change localidad Localidad varchar (255);
alter table sucursal change direccion Direccion varchar (255);
alter table sucursal change lat Latitud varchar(255);
alter table sucursal change lng Longitud varchar(255);
alter table sucursal change sucursalNombre SucursalNombre varchar(255);
alter table sucursal change sucursalTipo SucursalTipo varchar(255);
select * from sucursal;

#tabla precios_semana_20200503:
select * from precios_semana_20200503;
alter table precios_semana_20200503 change precio Precio VARCHAR(20);
alter table precios_semana_20200503 change producto_id IdProducto VARCHAR(255);
alter table precios_semana_20200503 change sucursal_id IdSucursal varchar(255);

#tabla precios_semana_20200518
select * from precios_semana_20200518;
alter table precios_semana_20200518 change precio Precio VARCHAR(20);
alter table precios_semana_20200518 change producto_id IdProducto VARCHAR(255);
alter table precios_semana_20200518 change sucursal_id IdSucursal varchar(255);

# tabla precios_semana_20200413
select * from precios_semana_20200413;
alter table precios_semana_20200413 change precio Precio VARCHAR(20);
alter table precios_semana_20200413 change producto_id IdProducto VARCHAR(255);
alter table precios_semana_20200413 change sucursal_id IdSucursal varchar(255);


#tabla precios_semanas_20200419_20200426
select * from precios_semanas_20200419_20200426;
alter table precios_semanas_20200419_20200426 change precio Precio VARCHAR(200);
alter table precios_semanas_20200419_20200426 change producto_id IdProducto VARCHAR(255);
alter table precios_semanas_20200419_20200426 change sucursal_id IdSucursal varchar(255);

#tabla precios

alter table precios change precio Precio VARCHAR(200);
alter table precios change producto_id IdProducto VARCHAR(255);
alter table precios change sucursal_id IdSucursal varchar(255);
select * from precios;


#normalizacion de las palabras con UcWords
select * from producto;
UPDATE producto SET 	Marca = UC_Words(TRIM(Marca)),
					Nombre = UC_Words(TRIM(Nombre));

select * from sucursal;
UPDATE sucursal SET 	BanderaId = UC_Words(TRIM(BanderaId)),
					ComercioRazonSocial = UC_Words(TRIM(ComercioRazonSocial)),
          Provincia = UC_Words(TRIM(Provincia)),
          Direccion = UC_Words(TRIM(Direccion)),
          SucursalNombre = UC_Words(TRIM(SucursalNombre)),
          SucursalTipo = UC_Words(TRIM(SucursalTipo));

#deteccion de outliers
#semana 20200503
select * from precios_semana_20200503;
SELECT IdProducto, avg(p.Precio) as promedio, avg(p.Precio) + (3 * stddev(p.Precio)) as maximo
		from precios_semana_20200503 p
    group by IdProducto
    ORDER BY maximo DESC;
select * from producto where IdProducto = '5000299284926';


select * from precios_semana_20200503;
SELECT IdProducto, avg(p.Precio) as promedio, avg(p.Precio) + (3 * stddev(p.Precio)) as maximo
		from precios_semana_20200503 p
    group by IdProducto
    ORDER BY maximo DESC;

select * from sucursal where IdProducto = '5000299284926';



select * from precios;
SELECT IdProducto, avg(p.Precio) as promedio, avg(p.Precio) + (3 * stddev(p.Precio)) as maximo
		from precios p
    group by IdProducto
    ORDER BY maximo DESC;


#consulta promedio sucursal 9-11-688
select * from precios;
select avg(precio) from precios
where IdSucursal LIKE '9-1-688%';

select * from precios;

select avg(precio) from precios
where IdSucursal LIKE '9-2-42%';






	
