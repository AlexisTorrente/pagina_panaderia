using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        private int numeroFactura_Venta;
        Cliente cli = new Cliente();
        private decimal Precio_Total_Venta;
        private DateTime Fecha_Venta;
        FormaPago pago = new FormaPago();
        private string direccion;

        public Venta()
        {
        }

        public int NumeroFactura_Venta_ { get => numeroFactura_Venta; set => numeroFactura_Venta = value; }
        public Cliente Cli { get => cli; set => cli = value; }
        public decimal Precio_Total_Venta_ { get => Precio_Total_Venta; set => Precio_Total_Venta = value; }
        public DateTime Fecha_Venta_ { get => Fecha_Venta; set => Fecha_Venta = value; }
        public FormaPago Pago { get => pago; set => pago = value; }
        public string Direccion { get => direccion; set => direccion = value; }
    }
}

