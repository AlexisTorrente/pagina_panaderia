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
    public partial class RegistroEmpleado : System.Web.UI.Page
    {
        NegocioEmpleados neg = new NegocioEmpleados();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");
        }

        public void ResetearCampos()
        {
            txtDni.Text = "";
            txtCuit.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtNumeroTelefono.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
            txtClave.Text = "";
            txtRepetirClave.Text = "";
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (txtRepetirClave.Text == "")
            {

                lblMensaje.Text = "Debe repetir la contraseña";

            }
            else
            {
                lblMensaje.Text = "";
                Boolean estado = false;
                //Intenta agregar el empleado, si lo agregó devuelve true, sino devuelve false
                estado = neg.AgregarEmpleado(txtDni.Text.ToString(), txtCuit.Text.ToString(), txtNombre.Text.ToString(), txtApellido.Text.ToString(), txtNumeroTelefono.Text.ToString(), txtDireccion.Text.ToString(), txtCorreo.Text.ToString(), txtClave.Text.ToString());

                if (estado)
                {
                    lblMensaje.Text = "El empleado se ha agregado con éxito";
                    ResetearCampos();
                }
                else
                {
                    lblMensaje.Text = neg.TipoError(txtDni.Text, txtCorreo.Text);
                    ResetearCampos();
                }
            }
        }

    }
}