-- Comentarios con "--"

-- Instrucción para poder crear una Base de Datos
-- CREATE DATABASE [NOMBRE_BD]

CREATE DATABASE BD_SEMANA06_2
GO

CREATE DATABASE MIERROR_BD
GO

-- Instrucción para borrar BD
-- DROP DATABASE [NOMBRE_BD]
-- NOTA: LA OPERACION ES IRREVERSIBLE

DROP DATABASE MIERROR_BD
GO

-- Instruccion para poder SELECCCIONAR la Base de Datos a Trabajar.
-- USE [NOMBRE_BD]

USE BD_SEMANA06_2
GO

-- Instruccion para CREAR una Tabla Simple
-- CREATE TABLE [NOMBRE_TABLA]

CREATE TABLE TB_FACTURA
(
	IDFACTURA INT,
	FECHA DATETIME,
	MONTO_FACTURA DECIMAL(10,2)
)
GO

-- Instrucción para ELIMINAR una Tabla.
-- DROP TABLE [NOMBRE_TABLA]

DROP TABLE TB_FACTURA
GO

-- Creando Tabla Tipo_Documento
-- Va a tener CLAVE PRIMARIA o PRIMARY KEY o CLAVE PRINCIPAL (PK)
-- El valor de la CLAVE PRIMARIA va a ser SECUENCIAL AUTOGENERADA 
-- Los valores de la PK se van a crear SOLOS.

-- idTipoDocumento y descripcionTipoDocumento SON COLUMNAS de la TABLA
-- INT y VARCHAR son Tipos de Datos de Cada Columna
-- PRIMARY KEY : PERMITE INDICAR QUE LA COLUMNA idTipoDocumento ES CLAVE PRIMARIA
-- IDENTITY : INDICA QUE EL VALOR DE ESA COLUMNA ES AUTOGENERADA

CREATE TABLE TIPO_DOCUMENTO
(
	idTipoDocumento INT PRIMARY KEY IDENTITY,
	descripcionTipoDocumento VARCHAR(30)
)
GO

-- CON REFERENCES ASOCIAMOS LA TABLA QUE ESTA RELACIONADA CON CLIENTE
-- INDICANDO ADEMAS QUE LA COLUMNA ES CLAVE FORANEA O FOREIGN KEY (FK)

CREATE TABLE CLIENTE
(
	idCliente INT PRIMARY KEY IDENTITY, -- ES UNA CLAVE PRIMARIA AUTOGENERADA
	apellidoPaternoCliente VARCHAR(50),
	apellidoMaternoCliente VARCHAR(50),
	nombreCliente VARCHAR(50),
	direccion VARCHAR(100),
	idTipoDocumento INT REFERENCES TIPO_DOCUMENTO, -- ES UNA CLAVE FORANEA
	numeroDocumento VARCHAR(11)
)
GO

CREATE TABLE CATEGORIA
(
	idCategoria INT PRIMARY KEY IDENTITY,
	nombreCategoria VARCHAR(35)
)
GO

CREATE TABLE PRODUCTO
(
	idProducto INT PRIMARY KEY IDENTITY,
	nombreProducto VARCHAR(50),
	precio DECIMAL(10,2),
	idCategoria INT REFERENCES CATEGORIA
)
GO

CREATE TABLE TABLE_DUMMY
(
	ID INT,
	NOMBRE CHAR(50)
)
GO

-- Instrucción para Eliminar una TABLA
-- DROP TABLE [NOMBRE_TABLA]

DROP TABLE TABLE_DUMMY
GO

-- Agregando, Modificando o Eliminando Columnas de una TABLA
-- MODIFICAR:
-- ALTER TABLE [NOMBRE_TABLA]
-- ALTER COLUMN [NOMBRE_COLUMNA] [TIPO_DATO]
-- AGREGAR:
-- ALTER TABLE [NOMBRE_TABLA]
-- ADD [NOMBRE_COLUMNA] [TIPO_DATO]
-- ELIMINAR:
-- ALTER TABLE [NOMBRE_TABLA]
-- DROP COLUMNA [NOMBRE_COLUMNA]

-- MODIFICAR COLUMNA 
ALTER TABLE PRODUCTO
ALTER COLUMN nombreProducto VARCHAR(70)
GO

-- AGREGAR COLUMNA
-- SE ESTA ADICIONANDO UNA COLUMNA MAS
-- DEFAULT ES UN CONSTRAINT QUE PERMITE ASIGNAR UN VALOR POR DEFECTO
-- A UNA COLUMNA
-- GETDATE() ES UNA FUNCION DE SQL QUE PERMITE OBTENER LA FECHA Y LA 
-- HORA DEL SISTEMA

ALTER TABLE PRODUCTO
ADD fechaRegistro DATETIME DEFAULT GETDATE()
GO

-- ELIMINAR COLUMNA
ALTER TABLE PRODUCTO
ADD estado CHAR(1)
GO

ALTER TABLE PRODUCTO
DROP COLUMN estado
GO

-- CONSTRAINTS SQL SERVER
-- CONSTRAINTS : RESTRICCIONES EN GENERAL
-- PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT, NOT NULL

-- Para el Ejemplo:
-- El resultado debe almacenar unicamente 3 valores A(probado),
-- D(esaprobado), C(ondicionado)
-- fecha de la Evaluacion tiene que almacenar la fecha y la hora en la que
-- se genero la fila o registro (osea el momento en que se realizo la evaluación)
-- La columna codigo operacion NO puede repetirse

CREATE TABLE EVALUACION_CREDITICIA
(
	idEvaluacion INT PRIMARY KEY, -- Clave Primaria (PK)
	resultado CHAR(1),
	idCliente INT REFERENCES CLIENTE, -- Clave Foranea (FK)
	fechaEvaluacion DATETIME DEFAULT GETDATE(),
	codigoOperacion INT UNIQUE, -- Permite que el valor de la Columna NO se repita osea sea UNICA
	estado CHAR(1) NOT NULL, -- Indica que la columna siempre tenga un VALOR (osea que NO SEA NULA)
	CONSTRAINT chkResultado CHECK (resultado IN ('A','D','C'))
	-- Valida que la columna UNICAMENTE acepte valores A o D o C
)
GO

-- Supongamos que la tabla Evaluacion Crediticia tiene una Columna DNI
ALTER TABLE EVALUACION_CREDITICIA
ADD DNI CHAR(8)
GO

-- Validar que el DNI Acepte unicamente valores entre 0 y 9
ALTER TABLE EVALUACION_CREDITICIA
ADD CONSTRAINT REGLA_DNI CHECK ( DNI LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

-- Supongamos que la tabla Evaluacion Crediticia tiene una Columna Nota
ALTER TABLE EVALUACION_CREDITICIA
ADD notaEvaluacion INT
GO

-- Validar que la Nota este entre 0 y 20
ALTER TABLE EVALUACION_CREDITICIA
ADD CONSTRAINT REGLA_NOTA CHECK (notaEvaluacion >= 0 AND notaEvaluacion <= 20)
GO
