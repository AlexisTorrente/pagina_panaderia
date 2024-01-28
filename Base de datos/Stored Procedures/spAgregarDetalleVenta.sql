USE BDPanaderia
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