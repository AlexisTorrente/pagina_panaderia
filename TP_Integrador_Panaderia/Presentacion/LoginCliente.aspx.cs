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
    public partial class LoginCliente : System.Web.UI.Page
    {
        NegocioClientes negCli = new NegocioClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cliente cli = negCli.loginCliente(txtEmail.Text.Trim(), txtClave.Text.Trim());
            Session["Usuario"] = cli;
            if(Session["Usuario"] != null)
            {
                Response.Redirect("SeleccionProductos.aspx");
            }
            else
            {
                lblMensaje.Text = "Email o contraseña incorrectos.";
                txtEmail.Text = "";
            }

        }
    }
}