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
    public class NegocioCategorias
    {
        DatosCategorias datosCat = new DatosCategorias();
        public void cargarDDL(DropDownList ddlCategorias)
        {
            DataSet ds = datosCat.obtenerDataSetCategorias();

            foreach (DataRow Fila in ds.Tables[0].Rows)
            {
                ListItem item = new ListItem();              
                String idCat = Convert.ToString(Fila["id"]);
                String nombreCat = Convert.ToString(Fila["nombre"]);

                item.Value = idCat;
                item.Text = nombreCat;
                ddlCategorias.Items.Add(item);

            }
        }

    }
}
