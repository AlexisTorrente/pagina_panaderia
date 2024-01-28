CREATE DATABASE BDPanaderia
GO

USE BDPanaderia
GO

---CREACION DE TABLAS E INSERCIÓN DE DATOS.

CREATE TABLE tblCategorias(
id int IDENTITY(1,1) NOT NULL,
nombre varchar(100) NOT NULL,
descripcion varchar(100) NOT NULL,
habilitado bit NOT NULL,
CONSTRAINT PK_CATEGORIAS PRIMARY KEY (id)
)
GO

INSERT INTO tblCategorias 
VALUES 
	  ('Pan', 'Panes caseros', 1),
	  ('Facturas', 'Facturas caseras', 1),
	  ('Alfajores', 'Alfajores caseros', 1),
	  ('Tortas', 'Tortas caseras', 1),
	  ('Otros', 'Productos varios', 1)
GO

CREATE TABLE tblProductos(
id int IDENTITY(1,1) NOT NULL,
nombre varchar(100) NOT NULL,
idCategoria int NOT NULL,
cantidadUnitaria varchar(50) NOT NULL,
precioUnitario decimal(8, 2) NOT NULL,
stock int NOT NULL, 
habilitado bit NOT NULL,
imagenURL varchar(60),
CONSTRAINT PK_PRODUCTOS PRIMARY KEY (id),
CONSTRAINT FK_PRODUCTOS_CATEGORIAS FOREIGN KEY (idCategoria)
REFERENCES tblCategorias(id)
)
GO

INSERT INTO tblProductos
VALUES 
	  ('Baguette', 1, '500g', 150 , 1000, 1, '~/Imagenes/Productojpg/baguette.jpg'),
	  ('Pan integral', 1, '500g', 250, 1000, 1, '~/Imagenes/Productojpg/panintegral.jpg'),
	  ('Figaza', 1, '500g', 45, 1000, 1, '~/Imagenes/Productojpg/figaza.jpg'),
	  ('Flauta', 1, '500g', 45, 1000, 1, '~/Imagenes/Productojpg/flauta.jpg'),
	  ('Librito', 1, '2 unidades', 20, 1000, 1, '~/Imagenes/Productojpg/librito.jpg'),

	  ('Medialuna', 2, 'Docena', 150, 1000, 1, '~/Imagenes/Productojpg/medialunas.jpg'),
	  ('Vigilante', 2, 'Docena', 150, 1000, 1, '~/Imagenes/Productojpg/vigilante.jpg'),
	  ('Cañoncito', 2, 'Docena', 200, 1000, 1, '~/Imagenes/Productojpg/cañoncito.jpg'),
	  ('Tortita negra', 2, 'Docena', 150, 1000, 1, '~/Imagenes/Productojpg/tortasnegras.jpg'),
	  ('Medialuna de grasa', 2, 'Docena', 150, 1000, 1, '~/Imagenes/Productojpg/grasa.jpg'),

	  ('Relleno simple', 3, 'c/u', 60, 1000, 1, '~/Imagenes/Productojpg/simple.jpg'),
	  ('Maicena', 3, 'c/u', 50, 1000, 1, '~/Imagenes/Productojpg/maicena.jpg'),
	  ('Bañado', 3, 'c/u', 60, 1000, 1, '~/Imagenes/Productojpg/bañado.jpg'),
	  ('Membrillo', 3, 'c/u', 60, 1000, 1, '~/Imagenes/Productojpg/membrillo.jpg'),
	  ('Relleno triple', 3, 'c/u', 80, 1000, 1, '~/Imagenes/Productojpg/triple.jpg'),

	  ('Cheesecake', 4, '1 unidad', 1200, 1000, 1, '~/Imagenes/Productojpg/cheesecake.jpg'),
	  ('Havanet', 4, '1 unidad', 1000, 1000, 1, '~/Imagenes/Productojpg/havanet.jpg'),
	  ('Rogel', 4, '1 unidad', 1650, 1000, 1, '~/Imagenes/Productojpg/rogel.jpg'),
	  ('Balcarce', 4, '1 unidad', 1300, 1000, 1, '~/Imagenes/Productojpg/balcarce.jpg'),
	  ('Lemon pie', 4, '1 unidad', 700, 1000, 1, '~/Imagenes/Productojpg/lemonpie.jpg'),

	  ('Chipá', 5, 'c/u', 10, 1000, 1, '~/Imagenes/Productojpg/chipa.jpg'),
	  ('Brownie', 5, 'c/u', 50, 1000, 1, '~/Imagenes/Productojpg/brownie.jpg'),
	  ('Palmerita', 5, 'c/u', 20, 1000, 1, '~/Imagenes/Productojpg/palmerita.jpg'),
	  ('Fosforito', 5, 'c/u', 50, 1000, 1, '~/Imagenes/Productojpg/fosforito.jpg'),
	  ('Budín', 5, '1 unidad', 100, 1000, 1, '~/Imagenes/Productojpg/budin.jpg')	  
GO

CREATE TABLE tblClientes(
dni varchar(50) NOT NULL,
nombreYApellido varchar(100) NOT NULL,
direccion varchar(100) NOT NULL,
telefono varchar(50) NOT NULL,
email varchar(50) NOT NULL,
contraseña varchar(50) NOT NULL,
CONSTRAINT PK_CLIENTES PRIMARY KEY (dni)
)
GO

INSERT INTO tblClientes
VALUES 
	 ('22644272','Pedro Gonzales','Juncal 2454','4742-4457','pedrogonzales@gmail.com','pedro'),
	 ('25678985','Elena Rodriguez','Corrientes 550','1130246599','elenarodriguez@gmail.com','elena'),
	 ('36554787', 'Carlos Bertoni','Santa Fe 1245','1157625088','carlosbertoni@gmail.com','carlos'),
	 ('40663213','Carla Dominguez','Libertador 13544','1557619908','carladominguez@gmail.com','carla'),
	 ('7844256','Jose Gomez','Irigoyen 232','4717-5454','josegomez@gmail.com','jose')
GO

CREATE TABLE tblEmpleados(
dni varchar(50) NOT NULL,
nombreYApellido varchar(100) NOT NULL,
direccion varchar(100) NOT NULL,
telefono varchar(50) NOT NULL,
email varchar(50) NOT NULL,
contraseña varchar(50) NOT NULL,
cuit varchar(50) NOT NULL,
fechaIngreso datetime NOT NULL,
CONSTRAINT PK_EMPLEADOS PRIMARY KEY (dni)
)
GO

INSERT INTO tblEmpleados
VALUES 
	 ('42687230', 'Felipe Rocha', 'Calle feli 123', '1130263709', 'feli@gmail.com', 'feli', '20-42687230-8', GETDATE()),
	 ('39100664', 'Eduardo Granado', 'Calle edu 123', '1159652689', 'edug@gmail.com', 'edu', '20-39100664-5', GETDATE()),
	 ('42903969', 'Gaston Sosa', 'Calle gasti 123', '1126348755', 'gasti@gmail.com', 'gasti', '20-42903969-5', GETDATE()),
	 ('42576103', 'Francisco Madoery', 'Calle fran 123', '1144788896', 'fran@gmail.com', 'fran', '20-42576103-5', GETDATE()),
	 ('43858291', 'Alexis Torrente', 'Calle alex 123', '1169625315', 'alex@gmail.com', 'alex', '20-43858291-5', GETDATE())
GO

CREATE TABLE tblFormasPago(
id int IDENTITY(1,1) NOT NULL,
descripcion varchar(50) NOT NULL,
CONSTRAINT PK_FORMAPAGO PRIMARY KEY (id)
)
GO

INSERT INTO tblFormasPago
VALUES 
	 ('Efectivo'),
	 ('Crédito'),
	 ('Débito')
GO

CREATE TABLE tblVentas(
numeroFactura int IDENTITY(1,1) NOT NULL,
dniCliente varchar(50) NOT NULL,
precioTotal decimal(8, 2) NOT NULL,
fechaVenta datetime NOT NULL,
idFormaPago int NOT NULL,
direccion varchar(50) NOT NULL
CONSTRAINT PK_VENTAS PRIMARY KEY (numeroFactura),
CONSTRAINT FK_VENTAS FOREIGN KEY (dniCliente)
REFERENCES tblClientes(dni),
CONSTRAINT FK_VENTAS_FPAGO FOREIGN KEY (idFormaPago)
REFERENCES tblFormasPago(id)
)
GO


CREATE TABLE tblDetallesVenta(
numeroLinea int IDENTITY(1,1) NOT NULL,
numeroFactura int NOT NULL,
idProducto int NOT NULL,
cantidad int NOT NULL,
precio decimal(8, 2) NOT NULL,
CONSTRAINT PK_DETALLESVENTA PRIMARY KEY (numeroLinea, numeroFactura),
CONSTRAINT FK_DETALLESVENTA FOREIGN KEY (idProducto)
REFERENCES tblProductos(id)
)
GO

----CREACION DE STORED PROCEDURES
CREATE PROCEDURE spAgregarCliente(
@dni varchar(10),
@nombreYApellido varchar(100),
@direccion varchar(50),
@telefono varchar(50),
@email varchar(50),
@contraseña varchar(50)
)
as
begin
INSERT INTO tblClientes
VALUES (@dni, @nombreYApellido, @direccion, @telefono, @email, @contraseña)
end
GO

CREATE PROCEDURE spAgregarDetalleVenta(
@numeroFactura int,
@idProducto int,
@cantidad int,
@precio decimal(8,2)
)
as
begin
INSERT INTO tblDetallesVenta
VALUES (@numeroFactura, @idProducto, @cantidad, @precio)
end
GO

CREATE PROCEDURE[dbo].[spAgregarEmpleado]
        (
        @DNI VARCHAR(50),
		@CUIT VARCHAR(50),
        @NOMBREYAPELLIDO VARCHAR(100),
		@DIRECCION VARCHAR(100),
		@TELEFONO VARCHAR(50),
		@EMAIL VARCHAR(50),
		@CONTRASEÑA VARCHAR(50),
		@FECHAINGRESO DATETIME
        )
        AS
        INSERT INTO tblEmpleados(dni, cuit, nombreYApellido, direccion, telefono, email, contraseña, fechaIngreso) 
		VALUES( @DNI, @CUIT, @NOMBREYAPELLIDO, @DIRECCION, @TELEFONO, @EMAIL, @CONTRASEÑA, @FECHAINGRESO)	
        RETURN
GO

CREATE PROCEDURE spAgregarProducto(
@nombre varchar(100),
@idCategoria int,
@cantidadUnitaria varchar(50),
@precioUnitario money,
@stock int, 
@habilitado bit
)
as
INSERT INTO tblProductos(nombre, idCategoria, cantidadUnitaria, precioUnitario, stock, habilitado)
values (@nombre, @idCategoria, @cantidadUnitaria, @precioUnitario, @stock, @habilitado)
GO

CREATE PROCEDURE spAgregarVenta(
@dni varchar(10),
@precioTotal decimal(8,2),
@fechaVenta datetime,
@idFormaPago int,
@direccion varchar(50)
)
as
begin
INSERT INTO tblVentas
VALUES (@dni, @precioTotal, @fechaVenta, @idFormaPago,@direccion)
end
GO

CREATE PROCEDURE spBuscarProducto
@nombreProducto VARCHAR(100)
AS
SELECT * FROM tblProductos WHERE nombre LIKE CONCAT('%', @nombreProducto,'%') AND habilitado = 1
GO 

CREATE PROCEDURE spEliminarProducto(
@idProducto int,
@habilitado bit
)
as
UPDATE tblProductos
set habilitado = @habilitado WHERE id = @idProducto
GO

CREATE PROCEDURE spModificarProducto(
@idProducto int,
@cantidadUnitaria varchar(50),
@precioUnitario decimal(8,2),
@stock int
)

as

UPDATE tblProductos set
cantidadUnitaria = @cantidadUnitaria,
precioUnitario = @precioUnitario,
stock = @stock

WHERE id = @idProducto
GO

---TRIGGER
create trigger trResetearNumeroLinea
on tblVentas
after insert
as
DBCC CHECKIDENT ('tblDetallesVenta', reseed, 1);
GO

INSERT INTO tblVentas
VALUES
	('22644272',500,GETDATE(),1,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(1,1,10,50)
GO

alter trigger trResetearNumeroLinea
on tblVentas
after insert
as
DBCC CHECKIDENT ('tblDetallesVenta', reseed, 0);
GO

INSERT INTO tblVentas
VALUES
    ('25678985',300,GETDATE()-45,3,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
    (2,6,2,150)
GO

INSERT INTO tblVentas
VALUES
    ('25678985',1400,GETDATE()-310,2,'Envío a domicilio')
GO

INSERT INTO tblDetallesVenta
VALUES
	(3,20,2,700)
GO

INSERT INTO tblVentas
VALUES
	('40663213',180,GETDATE()-240,1,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(4,14,3,60)
GO


INSERT INTO tblVentas
VALUES
	('22644272',500,GETDATE()-230,1,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(5,22,10,50)
GO

INSERT INTO tblVentas
VALUES
	('25678985',300,GETDATE()-205,3,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(6,6,2,150)
GO

INSERT INTO tblVentas
VALUES
	('25678985',1400,GETDATE()-300,2,'Envío a domicilio')
GO


INSERT INTO tblDetallesVenta
VALUES
	(7,20,2,700)
GO

INSERT INTO tblVentas
VALUES
	('40663213',180,GETDATE()-250,1,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(8,14,3,60)
GO

INSERT INTO tblVentas
VALUES
	('40663213',180,GETDATE()-200,1,'Retiro en el local')
GO

INSERT INTO tblDetallesVenta
VALUES
	(9,14,3,60)
GO

INSERT INTO tblVentas
VALUES
	('22644272',500,GETDATE()-180,1,'Retiro en el local')
GO


INSERT INTO tblDetallesVenta
VALUES
	(10,22,10,50)
GO

INSERT INTO tblVentas
VALUES
	('25678985',1400,GETDATE()-295,2,'Envío a domicilio')
GO


INSERT INTO tblDetallesVenta
VALUES
	(11,20,2,700)
GO

INSERT INTO tblVentas
VALUES
	('25678985',1900,GETDATE()-293,2,'Envío a domicilio')
GO


INSERT INTO tblDetallesVenta
VALUES
	(12,20,2,700),
	(12,22,10,50)
GO