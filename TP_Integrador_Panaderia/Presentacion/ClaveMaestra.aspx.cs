using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class ClaveMaestra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");
        }

        protected void btnConfirmarCM_Click(object sender, EventArgs e)
        {
            if (txtClaveMaestra.Text == "Programacion2021")
            {
                Response.Redirect("Registroempleado.aspx");
            }
            else
            {
                lblMensajeCM.Text = "Clave maestra incorrecta";
                txtClaveMaestra.Text = "";
            }
        }
    }
}