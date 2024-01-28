USE BDPanaderia
GO

CREATE PROCEDURE spBuscarProducto
@nombreProducto VARCHAR(100)
AS
SELECT * FROM tblProductos WHERE nombre LIKE CONCAT('%', @nombreProducto,'%') AND habilitado = 1
GO 