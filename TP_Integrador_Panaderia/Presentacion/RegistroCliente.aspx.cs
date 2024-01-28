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
    public partial class RegistroCliente : System.Web.UI.Page
    {
        NegocioClientes negCli = new NegocioClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
           string nombreCompleto = txtNombre.Text.Trim() + " " + txtApellido.Text.Trim();
           bool agrego = negCli.AgregarCliente(txtDni.Text.Trim(), nombreCompleto, txtDireccion.Text.Trim(), txtNumeroTelefono.Text.Trim(), txtCorreo.Text.Trim(), txtClave.Text.Trim());

            if (agrego)
            {
                lblMensaje.Text = "Cliente agregado.";
                LimpiarCampos();
            }
            else
            {
                lblMensaje.Text = negCli.TipoError(txtDni.Text.Trim(), txtCorreo.Text.Trim());
                txtDni.Text = "";
                txtCorreo.Text = "";
            }
        }

        protected void LimpiarCampos()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDireccion.Text = "";
            txtNumeroTelefono.Text = "";
            txtCorreo.Text = "";
            txtClave.Text = "";
            txtRepetirClave.Text = "";
        }
    }
}