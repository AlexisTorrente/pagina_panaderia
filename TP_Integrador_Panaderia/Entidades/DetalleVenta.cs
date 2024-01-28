using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        private int NumeroFactura_DetalleVenta;
        private int NumeroLinea_DetalleVenta;
        Producto pro = new Producto();
        private int Cantidad_DetalleVenta;
        private decimal Precio_DetalleVenta;
        private string cantidadUnitaria_DetalleVenta;

        public DetalleVenta() 
        {
        }

        
        public int Cantidad_DetalleVenta_ { get => Cantidad_DetalleVenta; set => Cantidad_DetalleVenta = value; }
        public decimal Precio_DetalleVenta_ { get => Precio_DetalleVenta; set => Precio_DetalleVenta = value; }
        public int NumeroFactura_DetalleVenta_ { get => NumeroFactura_DetalleVenta; set => NumeroFactura_DetalleVenta = value; }
        public int NumeroLinea_DetalleVenta_ { get => NumeroLinea_DetalleVenta; set => NumeroLinea_DetalleVenta = value; }
        public Producto Pro { get => pro; set => pro = value; }
        public string cantidadUnitaria_DetalleVenta_ { get => cantidadUnitaria_DetalleVenta; set => cantidadUnitaria_DetalleVenta = value; }


    }
}
