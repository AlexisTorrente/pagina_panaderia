using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DatosFormaPago
    {
        AccesoDatos ad = new AccesoDatos();
        // obtiene los campos de la tabla forma pago
        public DataSet obtenerDataSetFormaPago()
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id, descripcion FROM tblFormasPago", cn);
            da.Fill(ds);
            cn.Close();
            return ds;
        }
    }
}
