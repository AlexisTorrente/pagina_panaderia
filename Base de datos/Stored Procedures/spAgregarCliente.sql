USE BDPanaderia
GO

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