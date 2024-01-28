using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Presentacion
{
    public partial class FinalizarCompra : System.Web.UI.Page
    {
        // se declaran los objetos de las clases
        NegocioFormaPago negocioFormaPago = new NegocioFormaPago();
        NegocioVentas nv = new NegocioVentas();
        NegocioDetallesVenta nd = new NegocioDetallesVenta();
        NegocioProductos np = new NegocioProductos();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Usuario"] == null)
            {
                Response.Redirect("LoginCliente.aspx");
            }

            if (Session["TablaCarrito"] == null)
            {
                Response.Redirect("Carrito.aspx");
            }

            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_;
            // se carga el listado de formas de pago
            if (!IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                negocioFormaPago.cargarDDL_Pago(ddlMetodoPago);

            }

            DataTable dt = (DataTable)Session["TablaCarrito"];
            // verifica si la variable carrito esta vacia, si lo está lo redirecciona al carrito
    
            decimal monto = 0;

            // recorre las filas de la tabla del carrito y multiplica la cantidad * precio, eso se va sumando
            // en la variable float declarada anteriormente. Luego esto se refleja en el total que aparece
            // en la pagina.
            foreach (DataRow row in dt.Rows)
            {
                monto += (Convert.ToInt32(row["Cantidad"]) * Convert.ToDecimal(row["Precio"].ToString()));

            }
            lblTotal.Text = monto.ToString();

            if (!IsPostBack)
            {
                Session["Opcion"] = "";
            }

        }


        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            Session["Opcion"] ="Comprar";            
            lblMensaje.Text = "¿Desea confirmar la compra?";
            btnSi.Visible = true;
            btnNo.Visible = true;
            btnConfirmarCompra.Visible = false;
            btnCancelarCompra.Visible = false;
      
        }

        protected void rblEntrega_SelectedIndexChanged(object sender, EventArgs e)
        {
            // aca si se selecciona en los radiobuttons la opcion "Otra" se hara visible el campo
            // textbox para que ingrese una direccion distinta, de lo contrario se oculta.
            if (rblEntrega.SelectedIndex == 2)
            {
                txtDireccionEntrega.Visible = true;
            }
            else
            {
                txtDireccionEntrega.Visible = false;
            }
            
           
        }

        protected void btnCancelarCompra_Click(object sender, EventArgs e)
        {
            Session["Opcion"] ="Cancelar";
            lblMensaje.Text = "¿Desea cancelar la compra?";
            btnSi.Visible = true;
            btnNo.Visible = true;
            btnCancelarCompra.Visible = false;
            btnConfirmarCompra.Visible = false;
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            if (Session["Opcion"].ToString() == "Cancelar")
            {
                Session["TablaCarrito"] = null;
                Session["DatosDetalle"] = null;
                Response.Redirect("SeleccionProductos.aspx");
            }
            else
            {
                if (Session["Opcion"].ToString() == "Comprar")
                {
                    string direc = "";
                    DataTable datosDetalle = (DataTable)Session["DatosDetalle"];
                    DataTable datosTablaStock = (DataTable)Session["TablaStock"];
                    Cliente cli = (Cliente)Session["Usuario"];
                    string dni_cli = cli.Dni_Cliente_;

                    // si en los radio buttons se selecciona el item "Otra", y este campo esta vacio, pedira que el usuario
                    // lo rellene, si el campo esta completo, se le asignara a la varible "direc" lo que este campo contenga.
                    if (rblEntrega.SelectedIndex == 2)
                    {
                        if (txtDireccionEntrega.Text.Trim() == "")
                        {
                            lblError.Text = "*Debe completar este campo";
                            return;
                        }
                        else
                        {
                            lblError.Text = "";
                            direc = txtDireccionEntrega.Text.Trim();
                        }
                    }

                    // se pregunta si el radiobutton seleccionado es el indice 1, si lo es, es decir que eligio retiro a
                    // domicilio, con lo cual se obtiene la direccion del cliente de la session usuario del cliente.
                    // si no, da por entendido que eligio la opcion de retirarlo por el local, por la variable direc
                    // se le asigna el value que contiene.

                    if (rblEntrega.SelectedIndex == 1)
                    {
                        direc = cli.Direccion_Cliente_;
                    }
                    else
                    {
                        if (rblEntrega.SelectedIndex == 0)
                        {
                            direc = rblEntrega.SelectedValue;
                        }
                    }

                    decimal monto = 0;
                    // Recorre todas las filas de la session["DatosDetalle"] y va multiplicando la cantidad por el precio
                    // de cada fila y se lo suma a la variable monto declarada anteriormente, para luego utilizarla
                    // para agregar el monto total de la venta. El resto es basicamente agregar los datos que contiene la variable
                    // session hacia la base de datos.
                    foreach (DataRow row in datosDetalle.Rows)
                    {
                        monto += (Convert.ToInt32(row["Cantidad"]) * Convert.ToDecimal(row["Precio"].ToString()));
                        bool agregoDetalle = nd.AgregarDetalleVenta(Convert.ToInt32(row["numeroFactura"]), Convert.ToInt32(row["ID"]), Convert.ToInt32(row["Cantidad"]), Convert.ToDecimal(row["Precio"].ToString()));
                        if (!agregoDetalle)
                        {
                            lblMensaje.Text = "Error al realizar la venta.";
                            return;
                        }

                    }

                    // lo que hace esto es modificar el stock del producto una vez realizada la venta.
                    foreach (DataRow dts in datosTablaStock.Rows)
                    {
                        bool modificoProd = np.ModificarProducto(Convert.ToInt32(dts["ID"]), (dts["cantidadUnitaria"]).ToString(), Convert.ToDecimal(dts["Precio"]), Convert.ToInt32(dts["stock"]));
                        if (!modificoProd)
                        {
                            lblMensaje.Text = "Error al realizar la venta.";
                            return;
                        }

                    }
                    // lo que hace es agregar dicha venta a la base de datos. luego se pone en null la tabla carrito
                    // y la de stock para que se pueda realizar otra venta si el usuario lo desea.
                    bool agregoVenta = nv.AgregarVenta(dni_cli, monto, Convert.ToInt32(ddlMetodoPago.SelectedValue), direc);
                    if (!agregoVenta)
                    {
                        lblMensaje.Text = "Error al realizar la venta.";
                        return;
                    }
                    else
                    {
                        lblMensaje.Text = "Se realizo la venta con éxito.";
                        Session["TablaCarrito"] = null;
                        Session["DatosDetalle"] = null;
                        Response.Redirect("AgradecimientoCompra.aspx");
                    }
                }
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            btnNo.Visible = false;
            btnSi.Visible = false;
            lblMensaje.Text = "";
            btnCancelarCompra.Visible = true;
            btnConfirmarCompra.Visible = true;
        }
    }
}