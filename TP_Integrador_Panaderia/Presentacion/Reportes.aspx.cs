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
    public partial class Reportes : System.Web.UI.Page
    {
        NegocioReportes negocioReportes = new NegocioReportes();

        protected void Page_Load(object sender, EventArgs e)
        {
            Empleado emp = (Empleado)Session["Usuario"];
            lblUsuario.Text = emp.NombreyApellido_Empleado_;

            lblVentaMax.Text = negocioReportes.ObtenerIDVentaMaxima();
            lblMontoMax.Text = negocioReportes.ObtenerMontoVentaMaxima();
            lblFechaVentaMax.Text = negocioReportes.ObtenerFechaVentaMaxima();
            lblClienteVentaMax.Text = negocioReportes.ObtenerNombreClienteVentaMaxima();
        }


        protected void btnAceptarFecha_Click(object sender, EventArgs e)
        {
            lblMontoFechas.Text = "";
            lblCantFechas.Text = "";
            if (string.IsNullOrWhiteSpace(txtDesdeFecha.Text) || string.IsNullOrWhiteSpace(txtHastaFecha.Text))
            //filtra por fecha, valida que se ingrese una fecha en "DESDE" y una fehca en "HASTA"
            {
                lblErrorFechas.Text = "Ingrese fechas válidas";
            }
            else
            {
                lblErrorFechas.Text = "";
                string fechaInicio = txtDesdeFecha.Text;
                string fechaFin = txtHastaFecha.Text;
                DateTime Desde = Convert.ToDateTime(fechaInicio);
                DateTime Hasta = Convert.ToDateTime(fechaFin);

                int resultado = DateTime.Compare(Desde, Hasta); // Compara que DESDE sea inferior a HASTA (por eso se pasaron como DATETIME)

                if (resultado > 0)
                {
                    lblErrorFechas.Text = "La fecha de inicio debe ser anterior o igual a la fecha de fin";
                }
                else
                {
                    lblErrorFechas.Text = "";
                    lblMontoFechas.Text = negocioReportes.ObtenerMontoVentasEntreFechas(fechaInicio, fechaFin);
                    lblCantFechas.Text = negocioReportes.ObtenerCantidadVentasEntreFechas(fechaInicio, fechaFin);

                }
            }
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

        protected void btnAceptarCliente_Click(object sender, EventArgs e)
        {
            lblMontoFechasCliente.Text = "";
            lblCantFechasCliente.Text = "";
            if (!string.IsNullOrWhiteSpace(txtDNICliente.Text))
            {
                if (ValidarNumero(txtDNICliente.Text)) // Valida el ingreso de un número
                {
                    lblErrorDNI.Text = "";
                    if (string.IsNullOrWhiteSpace(txtDesdeFechaCliente.Text) || string.IsNullOrWhiteSpace(txtHastaFechaCliente.Text))
                    //filtra por fecha, valida que se ingrese una fecha en "DESDE" y una fecha en "HASTA"
                    {
                        lblErrorFechasCliente.Text = "Ingrese fechas válidas";
                    }
                    else
                    {
                        lblErrorFechasCliente.Text = "";
                        string fechaInicio = txtDesdeFechaCliente.Text;
                        string fechaFin = txtHastaFechaCliente.Text;
                        string dni = txtDNICliente.Text;
                        DateTime Desde = Convert.ToDateTime(fechaInicio);
                        DateTime Hasta = Convert.ToDateTime(fechaFin);

                        int resultado = DateTime.Compare(Desde, Hasta); // Compara que DESDE sea inferior a HASTA (por eso se pasaron como DATETIME)

                        if (resultado > 0)
                        {
                            lblErrorFechasCliente.Text = "La fecha de inicio debe ser anterior o igual a la fecha de fin";
                        }
                        else
                        {
                            lblErrorFechasCliente.Text = "";
                            lblMontoFechasCliente.Text = negocioReportes.ObtenerMontoVentasEntreFechasParaCliente(fechaInicio, fechaFin, dni);
                            lblCantFechasCliente.Text = negocioReportes.ObtenerCantidadVentasEntreFechasParaCliente(fechaInicio, fechaFin, dni);
                        }
                    }
                }
                else
                {
                    lblErrorDNI.Text = "Ingrese un DNI numérico";
                    txtDNICliente.Text = "";
                }
            }
            else
            {
                lblErrorDNI.Text = "Ingrese un dato";
                txtDNICliente.Text = "";
            }
        }

        protected void btnAceptarProducto_Click(object sender, EventArgs e)
        {
            lblUnidadesVendidasProducto.Text = "";
            lblAcumUnidadesVendidasProducto.Text = "";
            if (!string.IsNullOrWhiteSpace(txtIDProducto.Text))
            {
                if (ValidarNumero(txtIDProducto.Text))
                {
                    lblErrorProducto.Text = "";
                    lblUnidadesVendidasProducto.Text = negocioReportes.ObtenerUnidadesVendidasProducto(txtIDProducto.Text);
                    lblAcumUnidadesVendidasProducto.Text = negocioReportes.ObtenerTotalRecaudadoUnidadesProducto(txtIDProducto.Text);
                }
                else
                {
                    lblErrorProducto.Text = "El ID debe ser un número";
                    txtIDProducto.Text = "";
                }
            }
            else
            {
                lblErrorProducto.Text = "Ingrese un dato";
                txtIDProducto.Text = "";
            }
        }
    }
}