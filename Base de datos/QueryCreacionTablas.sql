CREATE DATABASE BDPanaderia
GO

USE BDPanaderia
GO

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
	  ('Baguette', 1, '500g', 50 , 1000, 1, '~/Imagenes/Productojpg/baguette.jpg'),
	  ('Pan integral', 1, '500g', 50, 1000, 1, '~/Imagenes/Productojpg/panintegral.jpg'),
	  ('Figaza', 1, '500g', 50, 1000, 1, '~/Imagenes/Productojpg/figaza.jpg'),
	  ('Flauta', 1, '500g', 50, 1000, 1, '~/Imagenes/Productojpg/flauta.jpg'),
	  ('Librito', 1, '2 Libritos', 50, 1000, 1, '~/Imagenes/Productojpg/librito.jpg'),

	  ('Medialuna', 2, 'Docena', 50, 1000, 1, '~/Imagenes/Productojpg/medialunas.jpg'),
	  ('Vigilante', 2, 'Docena', 50, 1000, 1, '~/Imagenes/Productojpg/vigilante.jpg'),
	  ('Cañoncito', 2, 'Docena', 50, 1000, 1, '~/Imagenes/Productojpg/cañoncito.jpg'),
	  ('Tortita negra', 2, 'Docena', 50, 1000, 1, '~/Imagenes/Productojpg/tortasnegras.jpg'),
	  ('Medialuna de grasa', 2, 'Docena', 50, 1000, 1, '~/Imagenes/Productojpg/grasa.jpg'),

	  ('Relleno simple', 3, '1 Alfajor', 50, 1000, 1, '~/Imagenes/Productojpg/simple.jpg'),
	  ('Maicena', 3, '1 Alfajor', 50, 1000, 1, '~/Imagenes/Productojpg/maicena.jpg'),
	  ('Bañado', 3, '1 Alfajor', 50, 1000, 1, '~/Imagenes/Productojpg/bañado.jpg'),
	  ('Membrillo', 3, '1 Alfajor', 50, 1000, 1, '~/Imagenes/Productojpg/membrillo.jpg'),
	  ('Relleno triple', 3, '1 Alfajor', 50, 1000, 1, '~/Imagenes/Productojpg/triple.jpg'),

	  ('Cheesecake', 4, '1 Torta', 50, 1000, 1, '~/Imagenes/Productojpg/cheesecake.jpg'),
	  ('Havanet', 4, '1 Torta', 50, 1000, 1, '~/Imagenes/Productojpg/havanet.jpg'),
	  ('Rogel', 4, '1 Torta', 50, 1000, 1, '~/Imagenes/Productojpg/rogel.jpg'),
	  ('Balcarce', 4, '1 Torta', 50, 1000, 1, '~/Imagenes/Productojpg/balcarce.jpg'),
	  ('Lemon pie', 4, '1 Torta', 50, 1000, 1, '~/Imagenes/Productojpg/lemonpie.jpg'),

	  ('Chipá', 5, '1 Chipá', 50, 1000, 1, '~/Imagenes/Productojpg/chipa.jpg'),
	  ('Brownie', 5, '1 Brownie', 50, 1000, 1, '~/Imagenes/Productojpg/brownie.jpg'),
	  ('Palmerita', 5, '1 Palmerita', 50, 1000, 1, '~/Imagenes/Productojpg/palmerita.jpg'),
	  ('Fosforito', 5, '1 Fosforito', 50, 1000, 1, '~/Imagenes/Productojpg/fosforito.jpg'),
	  ('Budín', 5, '1 Budín', 50, 1000, 1, '~/Imagenes/Productojpg/budin.jpg')	  
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
	 ('42687230', 'Felipe Rocha', 'Lima 1620', '1130263709', 'felirocha@gmail.com', 'feli', '20-42687230-8', GETDATE()),
	 ('39100664', 'Eduardo Granado', 'Calle Falsa 123', '1159652689', 'edug@gmail.com', 'edu', '20-39100664-5', GETDATE())
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

INSERT INTO tblVentas
VALUES('22644272',500,GETDATE(),1,'Retiro en el local')
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

INSERT INTO tblDetallesVenta
VALUES(1,1,10,50)
GO