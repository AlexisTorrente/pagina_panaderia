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
    public partial class SeleccionProductos : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();
        NegocioDetallesVenta ned = new NegocioDetallesVenta();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente cliente = (Cliente)Session["Usuario"];
            lblUsuario.Text = cliente.NombreyApellido_Cliente_;

            if (!IsPostBack)
            {
                
            }
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            String Nombre = txtBuscarProducto.Text;

            if (!string.IsNullOrEmpty(txtBuscarProducto.Text))
            {
                if (neg.ExisteEnBD(Nombre) == true)
                {
                    Session["nombre"] = Nombre; //Creamos una sesion y guardamos el texto ingresado para posteriormente buscarlo
                    lblMensaje.Text = "";

                }
                else
                {
                    lblMensaje.Text = "El producto no existe.";
                    txtBuscarProducto.Text = "";
                }
            }
            else
            {
                lblMensaje.Text = "Debe ingresar el nombre de un producto!";
                txtBuscarProducto.Text = "";

            }
        }

        protected void btnTodosLosProductos_Click(object sender, EventArgs e)
        {
            Session["Categoria"] = null; //Ponemos las session en null, esto quiere decir que el botón provoca que se borren
            Session["Nombre"] = null;   // los datos de la session que contiene la categoria elegida y la session con el producto que se busca
            lblMensaje.Text = "";

        }


        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            if (Session["Nombre"] == null && Session["Categoria"] == null)
            {
               lvProductos.DataSource = neg.MostrarTodosLosProductos(); //Si no hay nada en las session mostrame todo
               lvProductos.DataBind();
            }
            else
            {
                if (Session["Nombre"] == null)
                {
                    //Si no se puso nada en nombre entonces mostrame la categoria elegida 
                    lvProductos.DataSource = neg.MostrarProductoPorCategoria(Session["Categoria"].ToString());
                    lvProductos.DataBind();


                }
                else if (Session["Nombre"] != null) 
                {
                    //Si session nombre es diferente a nulo traeme su contenido
                    lvProductos.DataSource = neg.MostrarProductoPorNombre(Session["Nombre"].ToString());
                    lvProductos.DataBind();

                    Session["Nombre"] = null; //se borra después de traer por si se quiere ver una categoría

                }

            }

            txtBuscarProducto.Text = "";

        }

        protected void btnCategoria_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Evento Categoria")
            {
                String Nombre = e.CommandArgument.ToString();
                Session["Categoria"] = Nombre;
                lblMensaje.Text = "";


            }
        }
                public bool ValidarNumero(String num)
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
        protected void Button2_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Evento AgregarAlCarrito") //Se manda al carrito el producto que se selecciono, se verifica si se ingreso algún dato
            {
                String Argumento = e.CommandArgument.ToString();
                String[] Datos = Argumento.Split('-');
                String ID = Datos[0];
                String Nombre = Datos[1];
                String IDCategoría = Datos[2];
                String CantidadUnitaria = Datos[3];
                String PrecioUnitario = Datos[4];
                String Stock = Datos[5];
                String Imagen = Datos[6];
                String Habilitacion = Datos[7];
                String Cantidad;

                if (Session["TablaCarrito"] == null)
                {
                    Session["TablaCarrito"] = neg.CrearTablaCarrito();
                }

                if (Session["TablaStock"] == null)
                {
                    Session["TablaStock"] = neg.CrearTablaStock();
                }

                //Esto se hace para que solo considere el textbox en el itemtemplate que se hizo click
                System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;
                TextBox cant = (TextBox)btn.Parent.Controls[11];

                if (!string.IsNullOrWhiteSpace(cant.Text))
                {
                    Cantidad = cant.Text;

                }
                else
                {
                    Cantidad = "1";
                }

                int StockActual = Convert.ToInt32(neg.TraerStock(ID));

                int CantidadTotal = neg.EstaLlevando((DataTable)Session["TablaCarrito"], ID, Cantidad);

                if (Convert.ToInt32(Cantidad) <= StockActual)
                {
                    if (CantidadTotal <= StockActual)
                    {

                        neg.agregarFila((DataTable)Session["TablaCarrito"], Convert.ToInt32(ID), Nombre, CantidadUnitaria, Convert.ToInt32(Cantidad), Convert.ToDecimal(PrecioUnitario));
                        neg.agregarFilaTablaStock((DataTable)Session["TablaStock"], Convert.ToInt32(ID), CantidadUnitaria, Convert.ToInt32(Cantidad), Convert.ToDecimal(PrecioUnitario));
                        cant.Text = "";
                         lblMensaje.Text = "Se agrego al carrito con exito.";

                    }
                    else
                    {
                        lblMensaje.Text = "*Stock insuficiente";
                    }
                }
                else
                {

                    lblMensaje.Text = "*Stock Insuficiente";
                }

            }
        }
    }
}