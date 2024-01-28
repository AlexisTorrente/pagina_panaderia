using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Negocio
{
    public class NegocioDetallesVenta
    {
        DatosDetallesVenta datosDetallesVenta = new DatosDetallesVenta();
        DatosVentas datosVentas = new DatosVentas();

        public DataTable BuscarDetallesVentaDeVenta (int numeroFactura)
        {
            return datosDetallesVenta.TraerDetallesVentaDeVenta(numeroFactura);
        }

        /* Agrega el detalle de la venta y devuelve true si se afectó una única fila (agregado correctamente) */
        public bool AgregarDetalleVenta(int numeroFactura, int ID, int cantidad, decimal precio)
        {
            int filasAfectadas = 0;

            DetalleVenta dv = new DetalleVenta();
            dv.NumeroFactura_DetalleVenta_ = numeroFactura;
            dv.Pro.Id_Producto_= ID;
            dv.Cantidad_DetalleVenta_ = cantidad;
            dv.Precio_DetalleVenta_ = precio;

            filasAfectadas = datosDetallesVenta.agregarDetalleVenta(dv);
            return filasAfectadas == 1; // Devuelve true si filasAfectas es igual a 1, sino false

        }

        // crea la tabla detalle de ventas utilizada en la session["DetalleVenta"]

        public DataTable CrearTablaDetalleVenta()
        {
            DataTable dt = new DataTable();
            DataColumn NumeroFac = new DataColumn("numeroFactura", System.Type.GetType("System.String"));
            dt.Columns.Add(NumeroFac);
            DataColumn IDproducto = new DataColumn("ID", System.Type.GetType("System.String"));
            dt.Columns.Add(IDproducto);
            DataColumn Cantidad = new DataColumn("cantidad", System.Type.GetType("System.String"));
            dt.Columns.Add(Cantidad);
            DataColumn Precio = new DataColumn("Precio", System.Type.GetType("System.String"));
            dt.Columns.Add(Precio);


            return dt;
        }

        // agrega las filas para la session["DetalleVenta"]

        public void agregarFilaDetalleVenta(DataTable tabla, int ID, int cantidad, decimal Precio)
        {

            DataRow dr = tabla.NewRow();
            dr["numeroFactura"] = datosVentas.ObtenerMaximaId();
            dr["ID"] = ID;
            dr["Cantidad"] = cantidad;
            dr["Precio"] = Precio;
            tabla.Rows.Add(dr);

        }
    }

   
}
