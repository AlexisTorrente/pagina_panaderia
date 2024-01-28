USE BDPanaderia
GO

CREATE PROCEDURE spEliminarProducto(
@idProducto int,
@habilitado bit
)
as
UPDATE tblProductos
set habilitado = @habilitado WHERE id = @idProducto