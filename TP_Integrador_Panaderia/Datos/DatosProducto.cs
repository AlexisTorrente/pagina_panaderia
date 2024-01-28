using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DatosProducto
    {
        AccesoDatos ad = new AccesoDatos();

        public int agregarProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosProductoAgregar(ref cmd, prod);
            return ad.EjecutarProcedimientoAlmacenado(cmd, "spAgregarProducto");
        }

        public int modificarProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosProductoModificar(ref cmd, prod);
            return ad.EjecutarProcedimientoAlmacenado(cmd, "spModificarProducto");
        }

        public int estadoProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosProductoEliminar(ref cmd, prod);
            return ad.EjecutarProcedimientoAlmacenado(cmd, "spEliminarProducto");
        }

        public bool existeProducto(string nombre, string idCategoria)
        {
            string consulta = "SELECT * FROM tblProductos WHERE nombre='" + nombre + "' and idCategoria=" + idCategoria;
            return ad.existe(consulta);
        }
     
        public void armarParametrosProductoAgregar(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Producto_;
            SqlParametros = cmd.Parameters.Add("@idCategoria", SqlDbType.Int);
            SqlParametros.Value = prod.Cat.Id_Categoria_;
            SqlParametros = cmd.Parameters.Add("@cantidadUnitaria", SqlDbType.VarChar);
            SqlParametros.Value = prod.Cantidad_Unitaria_Producto_;
            SqlParametros = cmd.Parameters.Add("@precioUnitario", SqlDbType.Money);
            SqlParametros.Value = prod.Precio_Producto_;
            SqlParametros = cmd.Parameters.Add("@stock", SqlDbType.Int);
            SqlParametros.Value = prod.Stock_Producto_;
            SqlParametros = cmd.Parameters.Add("@habilitado", SqlDbType.Bit);
            SqlParametros.Value = prod.Estado_Producto_;
        }

        public void armarParametrosProductoModificar(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@idProducto", SqlDbType.Int);
            SqlParametros.Value = prod.Id_Producto_;
            SqlParametros = cmd.Parameters.Add("@cantidadUnitaria", SqlDbType.VarChar);
            SqlParametros.Value = prod.Cantidad_Unitaria_Producto_;
            SqlParametros = cmd.Parameters.Add("@precioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.Precio_Producto_;
            SqlParametros = cmd.Parameters.Add("@stock", SqlDbType.Int);
            SqlParametros.Value = prod.Stock_Producto_;

        }

        public void armarParametrosProductoEliminar(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@idProducto", SqlDbType.Int);
            SqlParametros.Value = prod.Id_Producto_;
            SqlParametros = cmd.Parameters.Add("@habilitado", SqlDbType.Bit);
            SqlParametros.Value = prod.Estado_Producto_;
        }

        public DataSet obtenerProductosTodos()
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id as [ID], nombre as [PRODUCTO], idCategoria as [CATEGORIA], cantidadUnitaria as [CANTIDAD POR UNIDAD], precioUnitario as [PRECIO UNITARIO], stock as [STOCK], habilitado as [HABILITADO]  FROM tblProductos", cn);
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet obtenerProductosNombre(String filtroNombre)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id as [ID], nombre as [PRODUCTO], idCategoria as [CATEGORIA], cantidadUnitaria as [CANTIDAD POR UNIDAD], precioUnitario as [PRECIO UNITARIO], stock as [STOCK], habilitado as [HABILITADO]  FROM tblProductos WHERE nombre LIKE '%" + filtroNombre + "%'", cn);
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        public DataSet obtenerProductosCategoria(String filtroCategoria)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id as [ID], nombre as [PRODUCTO], idCategoria as [CATEGORIA], cantidadUnitaria as [CANTIDAD POR UNIDAD], precioUnitario as [PRECIO UNITARIO], stock as [STOCK], habilitado as [HABILITADO]  FROM tblProductos WHERE idCategoria =" + filtroCategoria, cn);
            da.Fill(ds);
            cn.Close();
            return ds;
        }
        public DataTable ListViewProductosPorCategoria(String nameCategoria)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            String Consulta = "Select P.id,P.nombre, P.idCategoria,  P.cantidadUnitaria, P.precioUnitario, P.stock, P.habilitado, P.imagenURL FROM tblProductos as P INNER JOIN tblCategorias as ca ON ca.id = P.idCategoria WHERE P.habilitado = 'true' AND ca.nombre = '" + nameCategoria + "'";
            DataTable tabla = ad.ObtenerTabla("tblProductos", Consulta, conexion);
            conexion.Close();
            return tabla;

        }


        public bool productoHabilitado(int idProducto)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id as [ID], nombre as [PRODUCTO], idCategoria as [CATEGORIA], cantidadUnitaria as [CANTIDAD POR UNIDAD], precioUnitario as [PRECIO UNITARIO], stock as [STOCK], habilitado as [HABILITADO]  FROM tblProductos WHERE id =" + idProducto, cn);
            da.Fill(ds);
            cn.Close();
            bool habilitado = (bool)ds.Tables[0].Rows[0]["habilitado"];
            return habilitado;
        }

        public DataTable ListViewTodosLosProductos()
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string Consulta = "SELECT * FROM tblProductos WHERE habilitado = 1 ";
            DataTable tabla = ad.ObtenerTabla("tblProductos", Consulta, conexion);
            conexion.Close();
            return tabla;
        }

        public DataTable ListViewProductosPorNombre(string NombreProducto)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string Consulta = "Execute spBuscarProducto '" + NombreProducto + "' ";
            DataTable tabla = ad.ObtenerTabla("tblProductos", Consulta, conexion);
            conexion.Close();
            return tabla;
        }

        public Boolean BuscarProductoEnBD(string Nombre)
        {
            String consulta = "Select nombre from tblProductos where nombre = '" + Nombre + "'";
            return ad.existe(consulta);
        }

        // obtiene el stock actual del producto por medio de su ID

        public string ObtenerStock(int idProducto)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            string consulta = "SELECT P.stock FROM tblProductos AS P WHERE P.id =" + idProducto;
            DataTable dt = ad.ObtenerTabla("tblProductos", consulta, conexion);
            conexion.Close();
            return dt.Rows[0][0].ToString();

        }
    
    }
}
