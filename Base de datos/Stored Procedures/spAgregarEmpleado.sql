USE BDPanaderia
GO

CREATE PROCEDURE[dbo].[spAgregarEmpleado]
        (
        @DNI VARCHAR(50),
		@CUIT VARCHAR(50),
        @NOMBREYAPELLIDO VARCHAR(100),
		@DIRECCION VARCHAR(100),
		@TELEFONO VARCHAR(50),
		@EMAIL VARCHAR(50),
		@CONTRASEŅA VARCHAR(50),
		@FECHAINGRESO DATETIME
        )
        AS
        INSERT INTO tblEmpleados(dni, cuit, nombreYApellido, direccion, telefono, email, contraseņa, fechaIngreso) 
		VALUES( @DNI, @CUIT, @NOMBREYAPELLIDO, @DIRECCION, @TELEFONO, @EMAIL, @CONTRASEŅA, @FECHAINGRESO)	
        RETURN
        