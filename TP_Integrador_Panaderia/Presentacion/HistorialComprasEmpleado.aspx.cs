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
    public partial class HistorialComprasEmpleado : System.Web.UI.Page
    {
        NegocioVentas negocioVentas = new NegocioVentas();

        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

            if (!IsPostBack)
            {
                grdHistorialComprasEmpleado.DataSource = negocioVentas.BuscarTablaVentas();
                grdHistorialComprasEmpleado.DataBind();
                Session["numeroFactura"] = "";
            }
        }

        /* Limpia los campos de los labels informativos */

        public void borrar_mensajes()
        {
            lblmensaje.Text = "";
            lblmensaje2.Text = "";
            lblMensaje1.Text = "";
        }
        public bool ValidarNumero(string num)
        {
            try
            {
                Int32.Parse(num);
                return true;
            }
            catch
            {
                return false;
            }
        }

        protected void btnFiltrarDNICliente_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtDNICliente.Text))
            {
                Venta vn = new Venta();
                string DNI = txtDNICliente.Text;
                vn.Cli.Dni_Cliente_ = DNI;

                if (ValidarNumero(DNI)) // Valida el ingreso de un numero
                {

                    if (negocioVentas.ExisteDNIEnVentas(vn)) //Valida su existencia
                    {
                        grdHistorialComprasEmpleado.DataSource = negocioVentas.MostrarTablaXdni(vn);
                        grdHistorialComprasEmpleado.DataBind();
                        borrar_mensajes();
                    }
                    else
                    {
                        lblmensaje.Text = "DNI inexistente";
                        txtDNICliente.Text = "";
                    }
                }
                else
                {
                    lblmensaje.Text = "Ingrese un DNI numérico";
                    txtDNICliente.Text = "";

                }

            }
            else {
                lblmensaje.Text = "Ingrese un dato";
                txtDNICliente.Text = "";
            }
        }

        protected void btnFiltrarIdVenta_Click(object sender, EventArgs e) //Filtra por ID 
        {
            if (!string.IsNullOrWhiteSpace(txtIdVenta.Text))
            {
                if (ValidarNumero(txtIdVenta.Text.ToString()) == true)
                {

                   Venta vn = new Venta();
                   string ID2 = txtIdVenta.Text;
                   int ID = Convert.ToInt32(txtIdVenta.Text);
                   vn.NumeroFactura_Venta_ = ID;


              

                    if (negocioVentas.ExisteIDEnVentas(vn))
                    {
                        grdHistorialComprasEmpleado.DataSource = negocioVentas.MostrarTablaXid(ID);
                        grdHistorialComprasEmpleado.DataBind();
                        borrar_mensajes();
                    }
                    else
                    {
                        lblmensaje2.Text = "ID inexistente";
                        txtIdVenta.Text = "";
                    }
                }else
                lblmensaje2.Text = "Ingrese numeros!";
                txtIdVenta.Text = "";
            }
            else
            {
                lblmensaje2.Text = "Ingrese un ID";
                txtIdVenta.Text = "";
            }
        }

        protected void btnFiltrarFecha_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDesdeFecha.Text) || string.IsNullOrWhiteSpace(txtHastaFecha.Text)) 
                //filtra por fecha, valida que se ingrese una fecha en "DESDE" y una fehca en "HASTA"
            {
                lblMensaje1.Text = "Ingrese fechas válidas";
            }
            else
            {
                borrar_mensajes();
                string fechaInicio = txtDesdeFecha.Text;
                string fechaFin = txtHastaFecha.Text;
                DateTime Desde = Convert.ToDateTime(fechaInicio); 
                DateTime Hasta = Convert.ToDateTime(fechaFin);

                int resultado = DateTime.Compare(Desde, Hasta); // Compara que DESDE sea inferior a HASTA (por eso se pasaron como DATETIME)

                if (resultado > 0)
                {
                    lblMensaje1.Text = "La fecha de inicio debe ser anterior o igual a la fecha de fin";
                }
                else
                {
                    //Vuelca los datos en la tabla a partir de las fechas ingresadas
                    borrar_mensajes();
                    grdHistorialComprasEmpleado.DataSource = negocioVentas.MostrarTablaFechas(fechaInicio, fechaFin);
                    grdHistorialComprasEmpleado.DataBind();
                }
            }
        }

        /* Método invocado al seleccionar el botón de tipo link en el gridview. A partir del click del usuario se obtiene la fila seleccionada
        * y de ella la segunda celda (la primera filaSeleccionada.Cells[0] se corresponde al botón) correspondiente al campo del número de factura.
        Se le asigna a la Session instanciada en la primera carga de la página el valor y se redirecciona a Detalles de Compra Empleado*/

        protected void grdHistorialComprasEmpleado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select") 
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow filaSeleccionada = grdHistorialComprasEmpleado.Rows[index];
                TableCell celdaNumeroFactura = filaSeleccionada.Cells[1];
                string numeroFactura = celdaNumeroFactura.Text;
                Session["numeroFactura"] = numeroFactura;
                Response.Redirect("~/DetallesCompraEmpleado.aspx");
            }
        }

        /* Busca todas las ventas y las carga en el gridview, además de despejar los mensajes*/

        protected void btnQuitarFiltros_Click(object sender, EventArgs e)
        {
            grdHistorialComprasEmpleado.DataSource = negocioVentas.BuscarTablaVentas();
            grdHistorialComprasEmpleado.DataBind();
            borrar_mensajes();
            txtDesdeFecha.Text = "";
            txtHastaFecha.Text = "";
            txtDNICliente.Text = "";
            txtIdVenta.Text = "";
        }

        protected void grdHistorialComprasEmpleado_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHistorialComprasEmpleado.PageIndex = e.NewPageIndex;
            grdHistorialComprasEmpleado.DataSource = negocioVentas.BuscarTablaVentas();
            grdHistorialComprasEmpleado.DataBind();
        }
    }
}