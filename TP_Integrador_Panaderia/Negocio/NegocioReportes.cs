using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Negocio
{
    public class NegocioReportes
    {
        DatosVentas datosVentas = new DatosVentas();
        DatosDetallesVenta datosDetallesVenta = new DatosDetallesVenta();

        /* Trae el ID de la venta máxima (número de factura) */

        public string ObtenerIDVentaMaxima()
        {
            DataTable dt = datosVentas.ObtenerRegistroVentaMaxima();
            string columna = "ID";
            string idVentaMaxima = dt.Rows[0][columna].ToString();
            return idVentaMaxima;
        }

        /* Trae el monto de la venta máxima (precio total) */

        public string ObtenerMontoVentaMaxima()
        {
            DataTable dt = datosVentas.ObtenerRegistroVentaMaxima();
            string columna = "Monto";
            string montoVentaMaxima = dt.Rows[0][columna].ToString();
            return montoVentaMaxima;
        }

        /* Trae la fecha de la venta máxima (fecha de venta) */

        public string ObtenerFechaVentaMaxima()
        {
            DataTable dt = datosVentas.ObtenerRegistroVentaMaxima();
            string columna = "Fecha";
            string fechaVentaMaxima = dt.Rows[0][columna].ToString();
            return fechaVentaMaxima;
        }

        /* Trae el nombre del cliente asociado a la venta máxima */

        public string ObtenerNombreClienteVentaMaxima()
        {
            return datosVentas.ObtenerNombreClienteVentaMaxima();
        }

        /* Devuelve el monto acumulado de las ventas entre fechas */

        public string ObtenerMontoVentasEntreFechas(string fechaInicio, string fechaFin)
        {
            decimal total = 0;
            DataTable dt = datosVentas.TraerTablaFechas(fechaInicio, fechaFin);
            foreach (DataRow fila in dt.Rows)
            {
                total += Convert.ToDecimal(fila["Precio Total"]);
            }
            return total.ToString();
        }

        /* Devuelve el monto acumulado de las ventas entre fechas para un DNI de cliente en específico*/

        public string ObtenerMontoVentasEntreFechasParaCliente(string fechaInicio, string fechaFin, string dni)
        {
            decimal total = 0;
            DataTable dt = datosVentas.TraerTablaFechasDelCliente(fechaInicio, fechaFin, dni);
            foreach (DataRow fila in dt.Rows)
            {
                total += Convert.ToDecimal(fila["Precio Total"]);
            }
            return total.ToString();
        }


        /* Devuelve la cantidad de ventas entre fechas */

        public string ObtenerCantidadVentasEntreFechas(string fechaInicio, string fechaFin)
        {
            int cantidad = 0;
            DataTable dt = datosVentas.TraerTablaFechas(fechaInicio, fechaFin);
            foreach (DataRow fila in dt.Rows)
            {
                cantidad += 1;
            }
            return cantidad.ToString();
        }

        /* Devuelve la cantidad de ventas entre fechas para un cliente en específico */

        public string ObtenerCantidadVentasEntreFechasParaCliente(string fechaInicio, string fechaFin, string dni)
        {
            int cantidad = 0;
            DataTable dt = datosVentas.TraerTablaFechasDelCliente(fechaInicio, fechaFin, dni);
            foreach (DataRow fila in dt.Rows)
            {
                cantidad += 1;
            }
            return cantidad.ToString();
        }

        /* Devuelve las unidades vendidas de un producto determinado en el registro histórico */

        public string ObtenerUnidadesVendidasProducto(string idProducto)
        {
            int cantidad = 0;
            DataTable dt = datosDetallesVenta.TraerTodasCantidadesVendidasYPrecioVentaDeProducto(idProducto);
            foreach (DataRow fila in dt.Rows)
            {
                cantidad += Convert.ToInt32(fila["cantidad"]);
            }
            return cantidad.ToString();
        }

        /* Devuelve el monto acumulado histórico por las unidades de un determinado producto */

        public string ObtenerTotalRecaudadoUnidadesProducto(string idProducto)
        {
            decimal total = 0;
            DataTable dt = datosDetallesVenta.TraerTodasCantidadesVendidasYPrecioVentaDeProducto(idProducto);
            foreach (DataRow fila in dt.Rows)
            {
                total += Convert.ToDecimal(fila["precio"]);
            }
            return total.ToString();
        }

        /* Calcula la cantidad de ventas en el mes actual del sistema */

        public string ObtenerCantidadVentasMesActual()
        {
            return datosVentas.ObtenerCantidadVentasMesActual();
        }

        /* Calcula la cantidad de ventas en el año actual del sistema */

        public string ObtenerCantidadVentasAnioActual()
        {
            return datosVentas.ObtenerCantidadVentasAnioActual();
        }

        /* Calcula el valor acumulado de las ventas en el mes actual del sistema */

        public string ObtenerTotalVentasMesActual()
        {
            return datosVentas.ObtenerTotalVentasMesActual();
        }

        /* Calcula el valor acumulado de las ventas en el año actual del sistema */

        public string ObtenerTotalVentasAnioActual()
        {
            return datosVentas.ObtenerTotalVentasAnioActual();
        }
    }
}
