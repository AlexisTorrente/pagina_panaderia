using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Negocio
{
    public class NegocioProductos
    {
        DatosProducto datosProd = new DatosProducto();

        public bool AgregarProducto(String nombre, String idCategoria, String cantidadUnitaria, String precioUnitario, String stock)
        {
            int filasAfectadas = 0;

            //Se declara una variable de tipo Producto y se carga cada atributo con su respectivo parametro recibido por el metodo.
            Producto prod = new Producto();
            prod.Nombre_Producto_ = nombre;
            prod.Cat.Id_Categoria_ = Convert.ToInt32(idCategoria);
            prod.Cantidad_Unitaria_Producto_ = cantidadUnitaria;
            prod.Precio_Producto_ = Convert.ToInt32(precioUnitario);
            prod.Stock_Producto_ = Convert.ToInt32(stock);
            prod.Estado_Producto_ = true;

            //Se llama al metodo "existePruducto" que devuelve true si existe, y false si no existe
            bool existe = datosProd.existeProducto(nombre, idCategoria);

            //Si no existe, lo agrega
            if (!existe)
            {
                filasAfectadas = datosProd.agregarProducto(prod);
            }

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool ModificarProducto(int idProducto, string cantidadUnitaria, decimal precioUnitario, int stock)
        {
            int filasAfectadas = 0;

            //Se declara una variable de tipo Producto y se carga cada atributo con su respectivo valor recibido. 
            Producto prod = new Producto();
            prod.Id_Producto_ = idProducto;
            prod.Cantidad_Unitaria_Producto_ = cantidadUnitaria;
            prod.Precio_Producto_ = precioUnitario;
            prod.Stock_Producto_ = stock;

            //Se llama al metodo "modificarProducto" de DatosProducto que devuelve la cantidad de filas afectadas en la BD.
            filasAfectadas = datosProd.modificarProducto(prod);

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool EstadoProducto(int idProducto, bool estado)
        {
            int filasAfectadas = 0;

            //Se declara una variable de tipo Producto y se carga cada atributo con su respectivo valor recibido. 
            Producto prod = new Producto();
            prod.Id_Producto_ = idProducto;
            prod.Estado_Producto_ = estado;

            //Se llama al metodo "eliminarProducto" de DatosProducto que devuelve la cantidad de filas afectadas en la BD.
            filasAfectadas = datosProd.estadoProducto(prod);

            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool productoHabilitado(int idProducto)
        {
            bool habilitado = datosProd.productoHabilitado(idProducto);
            return habilitado;
        }

        public void cargarGrillaTodos(GridView grillaProductos)
        {
            grillaProductos.DataSource = datosProd.obtenerProductosTodos();
            grillaProductos.DataBind();
        }

        public void cargarGrillaFiltro(GridView grillaProductos, String filtroNombre, String filtroCategoria)
        {
            //Priorizamos la busqueda-filtrado por Nombre, si la cadena no es vacia, filtra por nombre
            if (filtroNombre.Length != 0)
            {
                grillaProductos.DataSource = datosProd.obtenerProductosNombre(filtroNombre);
            }
            //Si la cadena es vacia, filtra por categoria
            else
            {
                if (filtroCategoria.Length != 0)
                {
                    grillaProductos.DataSource = datosProd.obtenerProductosCategoria(filtroCategoria);
                }
            }

            grillaProductos.DataBind();
        }

        // ---  Solo llaman a las respectivas tablas 
        public DataTable MostrarTodosLosProductos()
        {
            return datosProd.ListViewTodosLosProductos();
        }

        public DataTable MostrarProductoPorNombre(string nombreProducto)
        {
            return datosProd.ListViewProductosPorNombre(nombreProducto);
        }

        public DataTable MostrarProductoPorCategoria(string NameCategoria)
        {
            return datosProd.ListViewProductosPorCategoria(NameCategoria);
        }

           // Para ver el stock actual:

           public String TraerStock(String ID)
           {
               int Producto = Convert.ToInt32(ID);

               String stock = datosProd.ObtenerStock(Producto);

               return stock;
           } 
 
        public int EstaLlevando(DataTable tabla,string ID, string Cantidad) // Para ver si la cantidad es mayor al stock del producto
        {
            int NewCantidad = Convert.ToInt32(Cantidad);
            int Lleva = 0;

            foreach (DataRow r in tabla.Rows )
            {
                if (r["ID Producto"].Equals(ID)) //Solamente cuando hay iguales
                {
                    Lleva = NewCantidad + Convert.ToInt32(r["Cantidad"]); //Restamos para saber cuanto stock nos quedaría contando el que se puso anteriormente

                }
                else
                {
                    Lleva = NewCantidad;
                }
            } //si no hay uno igual, retorna el stock original
            return Lleva; 
        }


        public Boolean ExisteEnBD(string nombre)
        {
            Boolean existe = false;
            existe = datosProd.BuscarProductoEnBD(nombre);
            return existe;
        }
        // ---- 

        public DataTable CrearTablaCarrito()
        {
            DataTable dt = new DataTable();
            DataColumn IDproducto = new DataColumn("ID Producto", System.Type.GetType("System.String"));
            dt.Columns.Add(IDproducto);
            DataColumn Nombre = new DataColumn("Nombre", System.Type.GetType("System.String"));
            dt.Columns.Add(Nombre);
            DataColumn Contenido = new DataColumn("Contenido del paquete", System.Type.GetType("System.String"));
            dt.Columns.Add(Contenido);
            DataColumn Cantidad = new DataColumn("Cantidad", System.Type.GetType("System.String"));
            dt.Columns.Add(Cantidad);
            DataColumn Precio = new DataColumn("Precio", System.Type.GetType("System.String"));
            dt.Columns.Add(Precio);

            return dt;
        }

        public void agregarFila(DataTable tabla,int IDproducto, string Nombre, string Contenido, int Cantidad, decimal Precio)
        {
            int cant = 0;
            Boolean existe = false;
            Boolean SuperoStock = false;
           
            foreach(DataRow r in tabla.Rows) //Recorro el datarow para que si se ingresa algo al carrito por segunda vez se sume la cantidad
            {
                if (r["Nombre"].Equals(Nombre)) //Pregunta si hay igualdad entre lo ingresado y lo que hay en la tabla
                {
                    cant =Convert.ToInt32(r["Cantidad"]) + Cantidad; //Sumamos la cantidad ingresada a la que estaba previamente en la tabla
                    existe = true;  //Si son iguales es porque existe

                    if (cant <= Convert.ToInt32(datosProd.ObtenerStock(IDproducto))) //Pregunto si esta nueva cantidad es superior al stock actual del producto
                    {
                        r["Cantidad"] = cant; //Si es superior la reasigno al row de "cantidad"
                        SuperoStock = false;  // Falso: No supero al stock

                    }
                    else
                    {
                        SuperoStock = true; // Verdadero: Si supero al stock
                    }

                }
            }
     
        
            if (!existe) // entra si o si aca 
            {
                if (SuperoStock == false) //Pero solo puede guardar los datos cuando no supero al stock 
                {
                    DataRow dr = tabla.NewRow();
                    dr["ID Producto"] = IDproducto;
                    dr["Nombre"] = Nombre;
                    dr["Contenido del paquete"] = Contenido;
                    dr["Cantidad"] = Cantidad;
                    dr["Precio"] = Precio;
                    tabla.Rows.Add(dr);
                }
            }
                      
        }

        // crea la tabla para la session["TablaStock"]

        public DataTable CrearTablaStock()
        {
            DataTable dt = new DataTable();
            DataColumn ID = new DataColumn("ID", System.Type.GetType("System.String"));
            dt.Columns.Add(ID);
            DataColumn cantidadUnitaria = new DataColumn("cantidadUnitaria", System.Type.GetType("System.String"));
            dt.Columns.Add(cantidadUnitaria);
            DataColumn Precio = new DataColumn("Precio", System.Type.GetType("System.String"));
            dt.Columns.Add(Precio);
            DataColumn stock = new DataColumn("stock", System.Type.GetType("System.String"));
            dt.Columns.Add(stock);


            return dt;
        }

        // agrega las filas para la session["TablaStock"]

        public void agregarFilaTablaStock(DataTable tabla, int ID, string cantidadUnitaria,int cantidadComprada, decimal Precio)
        {

            DataRow dr = tabla.NewRow();
            dr["ID"] = ID;
            dr["cantidadUnitaria"] = cantidadUnitaria;
            dr["Precio"] = Precio;
            int stock = Convert.ToInt32(datosProd.ObtenerStock(ID));
            int stockActualizado = stock - cantidadComprada;
            dr["stock"] = stockActualizado;
            tabla.Rows.Add(dr);

        }
    }
}
