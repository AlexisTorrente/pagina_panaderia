use BDPanaderia
go

create trigger trResetearNumeroLinea
on tblVentas
after insert
as
DBCC CHECKIDENT ('tblDetallesVenta', reseed, 0);