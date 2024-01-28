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
    public partial class Agregar_Producto : System.Web.UI.Page
    {
        NegocioProductos negocioProductos = new NegocioProductos();
        NegocioCategorias negocioCategorias = new NegocioCategorias();
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

            if (emp == null)
            {
                Response.Redirect("LoginEmpleado.aspx");
            }
            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                negocioCategorias.cargarDDL(ddlCategorias);
            }
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            lblMensaje.Visible = false;
            //Se llama al metodo "AgregarProducto" de la capa NegocioProducto enviandole como parametros los valores ingresados en los textbox.
            bool agrego = negocioProductos.AgregarProducto(txtNombre.Text, ddlCategorias.SelectedValue, txtCantidad.Text, txtPrecio.Text, txtStock.Text);

            if (agrego)
            {
                lblMensaje.Text = "Producto agregado con éxito";
            }
            else
            {
                lblMensaje.Text = "El producto ingresado ya existe";
            }
            lblMensaje.Visible = true;
            limpiarCampos();
        }

        protected void limpiarCampos()
        {
            txtNombre.Text = "";
            ddlCategorias.SelectedIndex = 0;
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
        }

    }
}