using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data.SqlClient;
using System.Data;
using System.Threading;

namespace Presentacion
{
    public partial class EditarProducto : System.Web.UI.Page
    {
        NegocioProductos negProd = new NegocioProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (emp == null)
            {
                Response.Redirect("LoginEmpleado.aspx");
            }

            if (!IsPostBack)
            {
                //Se declara la variable "prod" de tipo Producto y se le asigna la variable Session cargada en ABMLProductos.aspx
                //con los datos del producto que se quiere editar.
                Producto prod = new Producto();
                prod = (Producto)Session["productoEditar"];

                //Se asigna carga el nombre en un label, y la cantidad, precio y stock en textbox para poder modificarlos
                lblNombreProducto.Text = prod.Nombre_Producto_;
                txtCantidadUnitaria.Text = prod.Cantidad_Unitaria_Producto_;
                txtPrecioUnitario.Text = (Convert.ToInt32(prod.Precio_Producto_)).ToString();
                txtStock.Text = prod.Stock_Producto_.ToString();
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Producto prod = new Producto();
            prod = (Producto)Session["productoEditar"];

            int idProducto = prod.Id_Producto_;
            string cantidadUnitaria = txtCantidadUnitaria.Text;
            decimal precioUnitario = Convert.ToDecimal(txtPrecioUnitario.Text);
            int stock = Convert.ToInt32(txtStock.Text);

            //Se llama al metodo ModificarProducto de la capa Negocio y se envia el id, cantidad, precio, y stock como parametros.
            bool modifico = negProd.ModificarProducto(idProducto, cantidadUnitaria, precioUnitario, stock);

            if (modifico)
            {
                lblMensaje.Text = "Producto modificado";
            }
            else
            {
                lblMensaje.Text = "No se pudo modificar";
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABML_Productos.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABML_Productos.aspx");
        }

    }
}