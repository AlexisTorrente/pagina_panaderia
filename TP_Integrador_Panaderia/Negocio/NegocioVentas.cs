using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;

namespace Negocio
{
    public class NegocioVentas
    {
        DatosVentas datosVentas = new DatosVentas();

        public Boolean ExisteDNIEnVentas(Venta vn)
        {
            return datosVentas.ExisteDNIventa(vn);
        }

        public DataTable MostrarTablaXdni(Venta vn)
        {
            return datosVentas.TraerTablaVentasXdni(vn);
        }

        public Boolean ExisteIDEnVentas(Venta vn)
        {
            return datosVentas.ExisteIDventa(vn);
        }

        public DataTable MostrarTablaXid(int ID)
        {
            return datosVentas.TraerTablaVentasID(ID);
        }

        public DataTable MostrarTablaFechas(string Desde, string Hasta)
        {
            return datosVentas.TraerTablaFechas(Desde, Hasta);
        }

        public DataTable MostrarTablaFechasDelCliente(string desde, string hasta, string dniCliente)
        {
            return datosVentas.TraerTablaFechasDelCliente(desde, hasta, dniCliente);
        }

        public DataTable BuscarTablaVentas()
        {
            return datosVentas.TraerTablaVentas();
        }

        public DataTable BuscarVentasDelCliente(string dniCliente)
        {
            return datosVentas.TraerVentasDelCliente(dniCliente);
        }

        /* Agrega la venta y devuelve si se afectó una única fila (la venta se agregó correctamente) */

        public bool AgregarVenta(string dni, decimal preciototal, int formaPago, string direccion)
        {
            int filasAfectadas = 0;

            Venta ven = new Venta();
            ven.Cli.Dni_Cliente_ = dni;
            ven.Precio_Total_Venta_ = preciototal;
            ven.Fecha_Venta_ = DateTime.Now;
            ven.Pago.Id_FormaPago = formaPago;
            ven.Direccion = direccion;

            filasAfectadas = datosVentas.agregarVenta(ven);


            return filasAfectadas == 1; // devuelve true si filasAfectadas es 1, sino false

        }
    }
}
