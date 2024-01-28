using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Presentacion
{
    public partial class AgradecimientoCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_;
            // luego de 5 segundos redirige al usuario hacia la página de productos.
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('SeleccionProductos.aspx') }, 7000);", true);
        }
    }
}