using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Presentacion
{
    public partial class LoginEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            NegocioEmpleados Neg = new NegocioEmpleados();

            //Le asigno a la session Usuario el empleado que devuelve el método, si no existe ese empleado la session es null
            Session["Usuario"] = Neg.LoginEmpleado(txtUsuario.Text, txtClave.Text); 

            if (Session["Usuario"] != null)
            {
                Response.Redirect("ABML_Productos.aspx"); //Si existe se lo redirige al abml
            }
            else
            {
                lblMensaje.Text = "Email o contraseña incorrectos"; //sino se muestra mensaje error
            }
        }

    }
}