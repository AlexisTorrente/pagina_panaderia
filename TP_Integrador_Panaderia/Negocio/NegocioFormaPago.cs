using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Datos;
using System.Web.UI.WebControls;
namespace Negocio
{
    public class NegocioFormaPago
    {
        DatosFormaPago datosFP = new DatosFormaPago();
        public void cargarDDL_Pago(DropDownList ddlCategorias)
        {
            DataSet ds = datosFP.obtenerDataSetFormaPago();

            foreach (DataRow Fila in ds.Tables[0].Rows)
            {
                ListItem item = new ListItem();
                String idFor = Convert.ToString(Fila["id"]);
                String nombreFor = Convert.ToString(Fila["descripcion"]);

                item.Value = idFor;
                item.Text = nombreFor;
                ddlCategorias.Items.Add(item);

            }
        }
    }
}
