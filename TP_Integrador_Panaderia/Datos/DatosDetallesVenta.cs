using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DatosDetallesVenta
    {
        AccesoDatos accesoDatos = new AccesoDatos();

        /* Devuelve una tabla con los campos de los detalles de venta (además de nombre y cantidad unitaria asociados de la tabla productos) de un
         * número de factura enviado como argumento*/

        public DataTable TraerDetallesVentaDeVenta(int numeroFactura)
        {
            SqlConnection conexion = accesoDatos.ObtenerConexion();
            string consulta = "SELECT DV.numeroFactura AS [Número de Factura], DV.numeroLinea AS [Número de Línea], P.nombre AS Producto, " +
                "DV.cantidad AS Cantidad, P.cantidadUnitaria AS [Cantidad Unitaria], DV.precio AS Monto FROM tblDetallesVenta AS DV " +
                "INNER JOIN tblProductos AS P ON DV.idProducto = P.id WHERE DV.numeroFactura = " + numeroFactura;
            DataTable dt = accesoDatos.ObtenerTabla("tblDetallesVenta", consulta, conexion);
            conexion.Close();
            return dt;
        }

        public DataTable TraerTodasCantidadesVendidasYPrecioVentaDeProducto(string idProducto)
        {
            SqlConnection conexion = accesoDatos.ObtenerConexion();
            string consulta = "SELECT cantidad, precio FROM tblDetallesVenta WHERE idProducto = " + idProducto;
            DataTable dt = accesoDatos.ObtenerTabla("tblDetallesVenta", consulta, conexion);
            conexion.Close();
            return dt;
        }

        // arma los parametros para detalle de ventas
        private void ArmarParametrosDetalleVentas(ref SqlCommand Comando, DetalleVenta dv)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@numeroFactura", SqlDbType.Int);
            SqlParametros.Value = dv.NumeroFactura_DetalleVenta_;
            SqlParametros = Comando.Parameters.Add("@idProducto", SqlDbType.Int);
            SqlParametros.Value = dv.Pro.Id_Producto_;
            SqlParametros = Comando.Parameters.Add("@cantidad", SqlDbType.Int);
            SqlParametros.Value = dv.Cantidad_DetalleVenta_;
            SqlParametros = Comando.Parameters.Add("@precio", SqlDbType.Decimal);
            SqlParametros.Value = dv.Precio_DetalleVenta_;
        }


        // se utiliza para ejecutar el procedimiento almacenado 
        public int agregarDetalleVenta(DetalleVenta dv)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDetalleVentas(ref comando, dv);
            return accesoDatos.EjecutarProcedimientoAlmacenado(comando, "spAgregarDetalleVenta");
        }
    }
}
