using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;

namespace Datos
{
    public class DatosVentas
    {
        AccesoDatos ad = new AccesoDatos();

        /* Comprueba si existe el DNI del cliente de una venta enviada como argumento en la tabla de ventas */

        public Boolean ExisteDNIventa(Venta ven)
        {
            string consulta = "SELECT dniCliente FROM tblVentas WHERE dniCliente=" + ven.Cli.Dni_Cliente_;
            return ad.existe(consulta);
        }

        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) que coincidan con el DNI del cliente de una venta enviada como argumento */

        public DataTable TraerTablaVentasXdni(Venta vn)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id WHERE dniCliente =" + vn.Cli.Dni_Cliente_;
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Comprueba si existe el número de factura de una venta enviada como argumento en la tabla de ventas */

        public Boolean ExisteIDventa(Venta vn)
        {
            string consulta = "SELECT numeroFactura FROM tblVentas WHERE numeroFactura =" + vn.NumeroFactura_Venta_;
            return ad.existe(consulta);
        }

        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) que coincidan con un ID enviado como argumento */

        public DataTable TraerTablaVentasID(int ID)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id WHERE numeroFactura = " + ID;
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) cuya fecha de venta esté entre los valores enviados como argumentos */

        public DataTable TraerTablaFechas(string Desde, string Hasta)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id " +
                "WHERE CONVERT(date, [fechaVenta]) BETWEEN " + "'" + Desde + "'" + " AND " + "'" + Hasta + "'";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }


        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) cuya fecha de venta esté entre los valores enviados como argumentos para un
         * DNI de cliente en específico, también argumento*/


        public DataTable TraerTablaFechasDelCliente(string desde, string hasta, string dniCliente)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id " +
                "WHERE CONVERT(date, [fechaVenta]) BETWEEN " + "'" + desde + "'" + " AND " + "'" + hasta + "' AND V.dniCliente = " + dniCliente;
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) */

        public DataTable TraerTablaVentas()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Trae campos de la tabla de ventas (y la forma de pago de su respectiva tabla) asociados a un DNI de cliente enviado como argumento */

        public DataTable TraerVentasDelCliente(string dniCliente)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS [Número de Factura], dniCliente AS [DNI Cliente], precioTotal AS [Precio Total], " +
                "fechaVenta AS [Fecha de Venta], FP.descripcion AS [Forma de Pago], V.direccion AS [Dirección de Entrega] " +
                "FROM tblVentas AS V INNER JOIN tblFormasPago AS FP ON V.idFormaPago = FP.id WHERE V.dniCliente = " + dniCliente;
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Devuelve una tabla configurada por aquellos registros de la tabla ventas cuyo precio total es el máximo */

        public DataTable ObtenerRegistroVentaMaxima()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT numeroFactura AS ID, dniCliente AS DNI, precioTotal AS Monto, fechaVenta AS Fecha, idFormaPago AS [Forma Pago], direccion " +
                "FROM tblVentas WHERE precioTotal = (SELECT MAX(precioTotal) FROM tblVentas)";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt;
        }

        /* Devuelve el nombre del cliente de la venta máxima de la tabla generada con los registros máximos */

        public string ObtenerNombreClienteVentaMaxima()
        {
            DataTable dataTableRegistroMaximo = ObtenerRegistroVentaMaxima();
            string columnaDNI = "DNI";
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT nombreYApellido FROM tblClientes WHERE dni = " + dataTableRegistroMaximo.Rows[0][columnaDNI];
            DataTable dt = ad.ObtenerTabla("tblClientes", consulta, conexion);
            string columnaNombre = "nombreYApellido";
            conexion.Close();
            return dt.Rows[0][columnaNombre].ToString();
        }

        /* Devuelve la cantidad de ventas para el mes y el año actual del sistema */

        public string ObtenerCantidadVentasMesActual()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT COUNT(numeroFactura) FROM tblVentas WHERE MONTH(fechaVenta) = MONTH(CURRENT_TIMESTAMP) AND YEAR(fechaventa) = YEAR(CURRENT_TIMESTAMP)";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();
        }

        /* Devuelve la cantidad de ventas para el año actual del sistema */

        public string ObtenerCantidadVentasAnioActual()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT COUNT(numeroFactura) FROM tblVentas WHERE YEAR(fechaVenta) = YEAR(CURRENT_TIMESTAMP)";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();
        }

        /* Devuelve el monto del total de ventas para el mes y el año actual del sistema */

        public string ObtenerTotalVentasMesActual()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT SUM(precioTotal) FROM tblVentas WHERE MONTH(fechaVenta) = MONTH(CURRENT_TIMESTAMP) AND YEAR(fechaventa) = YEAR(CURRENT_TIMESTAMP)";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();
        }

        /* Devuelve el monto del total de ventas para el año actual del sistema */

        public string ObtenerTotalVentasAnioActual()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT SUM(precioTotal) FROM tblVentas WHERE YEAR(fechaVenta) = YEAR(CURRENT_TIMESTAMP)";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();
        }

        // obtiene el maximo numero de factura +1, asi se simula el proximo numero de factura que tendra la venta.
        public string ObtenerMaximaId()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT MAX(numeroFactura)+1 FROM tblVentas";
            DataTable dt = ad.ObtenerTabla("tblVentas", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();

        }

        // arma los parametros para venta
        private void ArmarParametrosVentaAgregar(ref SqlCommand Comando, Venta ven)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@dni", SqlDbType.VarChar);
            SqlParametros.Value = ven.Cli.Dni_Cliente_;
            SqlParametros = Comando.Parameters.Add("@precioTotal", SqlDbType.Decimal);
            SqlParametros.Value = ven.Precio_Total_Venta_;
            SqlParametros = Comando.Parameters.Add("@fechaVenta", SqlDbType.DateTime);
            SqlParametros.Value = ven.Fecha_Venta_;
            SqlParametros = Comando.Parameters.Add("@idFormaPago", SqlDbType.Int);
            SqlParametros.Value = ven.Pago.Id_FormaPago;
            SqlParametros = Comando.Parameters.Add("@direccion", SqlDbType.VarChar);
            SqlParametros.Value = ven.Direccion;
        }
        
        // se utiliza para ejecutar el procedimiento almacenado
        public int agregarVenta(Venta ven)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosVentaAgregar(ref comando, ven);
            return ad.EjecutarProcedimientoAlmacenado(comando, "spAgregarVenta");
        }
    }
}
