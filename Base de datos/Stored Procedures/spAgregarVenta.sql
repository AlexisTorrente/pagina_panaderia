USE BDPanaderia
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