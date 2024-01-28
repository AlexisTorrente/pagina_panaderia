USE BDPanaderia
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