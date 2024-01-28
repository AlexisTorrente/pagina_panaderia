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
    public partial class Carrito : System.Web.UI.Page
    {
        NegocioDetallesVenta ned = new NegocioDetallesVenta();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["DatosDetalle"] = null;
            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_;

            //Le asigno a la grilla lo que tiene la session TablaCarrito
            DataTable dt = (DataTable)Session["TablaCarrito"];
            grdvProductosCarrito.DataSource = dt;
            grdvProductosCarrito.DataBind();
        }

        protected void grdvProductosCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e) 
        {
            //Cargo en un datatable lo que tiene la session Carrito y le borro la fila del indice donde se hizo click, y al final sobreescribo la session con la tabla actualizada
            DataTable dt = (DataTable)Session["TablaCarrito"];
            DataTable ts = (DataTable)Session["TablaStock"];
            dt.Rows.RemoveAt(e.RowIndex);
            ts.Rows.RemoveAt(e.RowIndex);
            grdvProductosCarrito.DataSource = dt;
            grdvProductosCarrito.DataBind();

            Session["TablaCarrito"] = dt;
            Session["TablaStock"] = ts;
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["TablaCarrito"];
            if (Session["TablaCarrito"] == null)
            {
                lblMensajeError.Text = "Error, debe tener productos agregados en el carrito para finalizar la compra.";
                return;
            }
            
            decimal vacio = 0;
            foreach(DataRow row in dt.Rows)
            {
                vacio += Convert.ToDecimal(row["Precio"]);
            }

            if(vacio == 0)
            {
                lblMensajeError.Text = "Error, debe tener productos agregados en el carrito para finalizar la compra.";
                return;
            }

            if (Session["DatosDetalle"] == null)
            {
                Session["DatosDetalle"] = ned.CrearTablaDetalleVenta();
            }

            //DataTable dt = (DataTable)Session["TablaCarrito"];

            foreach (DataRow dr in dt.Rows)
            {
                ned.agregarFilaDetalleVenta((DataTable)Session["DatosDetalle"],Convert.ToInt32(dr["ID Producto"]), Convert.ToInt32(dr["Cantidad"]), Convert.ToDecimal(dr["Precio"]));
            }
            
            Response.Redirect("FinalizarCompra.aspx");
        }
    }
}