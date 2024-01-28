USE BDPanaderia
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