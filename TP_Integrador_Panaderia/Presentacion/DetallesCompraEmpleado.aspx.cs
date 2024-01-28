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
    public partial class DetallesCompraEmpleado : System.Web.UI.Page
    {
        NegocioDetallesVenta negocioDetallesVenta = new NegocioDetallesVenta();

        // Al cargar la página se busca y carga el gridview con los detalles de venta asociados a la venta (ID Venta/número de factura) guardada en la Session 

        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

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