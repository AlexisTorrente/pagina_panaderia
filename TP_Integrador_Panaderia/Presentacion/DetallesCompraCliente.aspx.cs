using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class DetallesCompraCliente : System.Web.UI.Page
    {
        NegocioDetallesVenta negocioDetallesVenta = new NegocioDetallesVenta();

        // Al cargar la página se busca y carga el gridview con los detalles de venta asociados a la venta (ID Venta/número de factura) guardada en la Session 

        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_; 
            grdDetallesDeCompras.DataSource = negocioDetallesVenta.BuscarDetallesVentaDeVenta(Convert.ToInt32(Session["numeroFactura"].ToString()));
            grdDetallesDeCompras.DataBind();
        }

        protected void grdDetallesDeCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDetallesDeCompras.PageIndex = e.NewPageIndex;
            grdDetallesDeCompras.DataSource = negocioDetallesVenta.BuscarDetallesVentaDeVenta(Convert.ToInt32(Session["numeroFactura"].ToString()));
            grdDetallesDeCompras.DataBind();
        }
    }
}