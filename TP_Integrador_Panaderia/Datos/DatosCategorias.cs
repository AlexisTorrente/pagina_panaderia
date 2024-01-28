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
    public class DatosCategorias
    {
        AccesoDatos ad = new AccesoDatos();

        public DataSet obtenerDataSetCategorias()
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ad.ObtenerConexion();
            SqlDataAdapter da = ad.ObtenerAdaptador("SELECT id, nombre FROM tblCategorias", cn);
            da.Fill(ds);
            cn.Close();
            return ds;
        }
    }
}
