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
    public partial class HistorialComprasCliente : System.Web.UI.Page
    {
        NegocioVentas negocioVentas = new NegocioVentas();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_;

            if (!IsPostBack)
            {
                grdHistorialComprasCliente.DataSource = negocioVentas.BuscarVentasDelCliente(cliente.Dni_Cliente_);
                grdHistorialComprasCliente.DataBind();
                Session["numeroFactura"] = "";
            }
        }

        /* Método invocado al seleccionar el botón de tipo link en el gridview. A partir del click del usuario se obtiene la fila seleccionada
         * y de ella la segunda celda (la primera filaSeleccionada.Cells[0] se corresponde al botón) correspondiente al campo del número de factura.
         Se le asigna a la Session instanciada en la primera carga de la página el valor y se redirecciona a Detalles de Compra Cliente*/

        protected void grdHistorialComprasCliente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow filaSeleccionada = grdHistorialComprasCliente.Rows[index];
                TableCell celdaNumeroFactura = filaSeleccionada.Cells[1];
                string numeroFactura = celdaNumeroFactura.Text;
                Session["numeroFactura"] = numeroFactura;
                Response.Redirect("~/DetallesCompraCliente.aspx");
            }
        }

        /* Busca a partir del DNI del cliente, obtenido de la Session con el usuario, todas las ventas asociadas a él y las carga en el gridview, además
         * de despejar los mensajes*/

        protected void btnMostrarTodasCompras_Click(object sender, EventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            grdHistorialComprasCliente.DataSource = negocioVentas.BuscarVentasDelCliente(cliente.Dni_Cliente_);
            grdHistorialComprasCliente.DataBind();
            txtDesdeFecha.Text = "";
            txtHastaFecha.Text = "";
            lblMensaje1.Text = "";
        }

        /* Filtra por fecha de inicio y fin las ventas del cliente en la variable Session de usuario */

        protected void btnFiltrarFecha_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDesdeFecha.Text) || string.IsNullOrWhiteSpace(txtHastaFecha.Text))
            {
                lblMensaje1.Text = "Ingrese fechas válidas";
            }
            else
            {
                lblMensaje1.Text = "";
                string fechaInicio = txtDesdeFecha.Text;
                string fechaFin = txtHastaFecha.Text;
                DateTime Desde = Convert.ToDateTime(fechaInicio);
                DateTime Hasta = Convert.ToDateTime(fechaFin);

                int resultado = DateTime.Compare(Desde, Hasta); //A partir de la primera instancia

                if (resultado > 0)
                {
                    lblMensaje1.Text = "La fecha de inicio debe ser anterior o igual a la fecha de fin";
                }
                else
                {
                    Cliente cliente = (Cliente)Session["Usuario"];
                    lblMensaje1.Text = "";
                    grdHistorialComprasCliente.DataSource = negocioVentas.MostrarTablaFechasDelCliente(fechaInicio, fechaFin, cliente.Dni_Cliente_);
                    grdHistorialComprasCliente.DataBind();
                }
            }
        }

        protected void grdHistorialComprasCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            grdHistorialComprasCliente.PageIndex = e.NewPageIndex;
            grdHistorialComprasCliente.DataSource = negocioVentas.BuscarVentasDelCliente(cliente.Dni_Cliente_);
            grdHistorialComprasCliente.DataBind();
        }
    }
}