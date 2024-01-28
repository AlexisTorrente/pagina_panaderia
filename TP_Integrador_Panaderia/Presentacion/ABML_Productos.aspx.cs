using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Negocio;

namespace Presentacion
{
    public partial class ABML_Productos : System.Web.UI.Page
    {
        NegocioProductos negProd = new NegocioProductos();
        NegocioCategorias negCat = new NegocioCategorias();
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

            if(emp == null)
            {
                Response.Redirect("LoginEmpleado.aspx");
            }
            if (!IsPostBack)
            {
                negCat.cargarDDL(ddlCategoriasProductos);
                negProd.cargarGrillaTodos(grdProductos);
            }
        }

        protected void btnFiltrarNombreProducto_Click(object sender, EventArgs e)
        {
            negProd.cargarGrillaFiltro(grdProductos, txtFiltroNombreProducto.Text.Trim(), ddlCategoriasProductos.SelectedValue);
        }

        protected void btnFiltrarCategoriaProducto_Click(object sender, EventArgs e)
        {
            negProd.cargarGrillaFiltro(grdProductos, txtFiltroNombreProducto.Text.Trim(), ddlCategoriasProductos.SelectedValue);
        }

        protected void btnEditar_Command1(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoEditar")
            {
                //Se asigna el CommandArgument a la variable "argumento".
                String argumento = e.CommandArgument.ToString();
                //Se hace un "split" por cada '-' del argumento y se asignan a la variable "datos" segun su índice.
                String[] datos = argumento.Split('-');
                //Se asigna cada indice de "datos" a los diferentes strings (atributos de Producto)
                String idProducto = datos[0];
                String nombreProducto = datos[1];
                String cantidadUnitaria = datos[2];
                String precioUnitario = datos[3];
                String stock = datos[4];

                Producto prod = new Producto();

                //Se asigna cada string a su respectivo atributo de Producto.
                prod.Id_Producto_ = Convert.ToInt32(idProducto);
                prod.Nombre_Producto_ = nombreProducto;
                prod.Cantidad_Unitaria_Producto_ = cantidadUnitaria;
                prod.Precio_Producto_ = Convert.ToDecimal(precioUnitario);
                prod.Stock_Producto_ = Convert.ToInt32(stock);

                Session["productoEditar"] = prod;
                Response.Redirect("EditarProducto.aspx");
            }
        }

        protected void btnEliminarProducto_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoEliminar")
            {
                String producto = e.CommandArgument.ToString();

                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                lblProducto.Text = producto;
                lblMensaje.Visible = true;
                lblMensaje.Text = "¿Seguro que quiere eliminar el producto: " + lblProducto.Text + " ?";
            }
        }

        protected void btnHabilitarProducto_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoHabilitar")
            {
                int idProducto = Convert.ToInt32(e.CommandArgument.ToString());
                negProd.EstadoProducto(idProducto, true);
                negProd.cargarGrillaTodos(grdProductos);
            }
        }

        protected void grdProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdProductos.PageIndex = e.NewPageIndex;
            negProd.cargarGrillaTodos(grdProductos);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Visible = false;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            //Se confirma la eliminacion del producto
            String producto = lblProducto.Text;
            String[] datos = producto.Split('-');
            //Se toma el "id" del producto y se lo asigna a "idProducto"
            int idProducto = Convert.ToInt32(datos[0]);

            //Se llama al metodo "productoHabilitado" de Negocio.Producto para validar que no se haya eliminado anteriormente.
            bool habilitado = negProd.productoHabilitado(idProducto);
            if (habilitado)
            {
                //Si está habilitado, lo deshabilita actualizando el estado a "false"
                bool modifico = negProd.EstadoProducto(idProducto, false);

                if (modifico)
                {
                    lblMensaje.Text = "Producto eliminado con exito.";
                }
                else
                {
                    lblMensaje.Text = "No se pudo eliminar.";
                }
            }
            else
            {
                //Si ya estaba deshabilitado muestra un mensaje
                lblMensaje.Text = "Producto dado de baja anteriormente.";
            }

            lblMensaje.Visible = true;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;

            negProd.cargarGrillaTodos(grdProductos);
        }

        protected void btnAgregarProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar_Producto.aspx");
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            txtFiltroNombreProducto.Text = "";
            ddlCategoriasProductos.SelectedIndex = 0;
            negProd.cargarGrillaTodos(grdProductos);
        }

        protected void ddlCategoriasProductos_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtFiltroNombreProducto.Text = "";
        }


    }
}