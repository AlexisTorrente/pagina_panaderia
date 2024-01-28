using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        private int Id_Producto;
        private string Nombre_Producto;
        Categoria cat = new Categoria();
        private string Cantidad_Unitaria_Producto;
        private decimal Precio_Producto;
        private int Stock_Producto;
        private bool Estado_Producto;

        public Producto()
        { 
        }

        public int Id_Producto_ { get => Id_Producto; set => Id_Producto = value; }
        public string Nombre_Producto_ { get => Nombre_Producto; set => Nombre_Producto = value; }
        
        public string Cantidad_Unitaria_Producto_ { get => Cantidad_Unitaria_Producto; set => Cantidad_Unitaria_Producto = value; }
        public decimal Precio_Producto_ { get => Precio_Producto; set => Precio_Producto = value; }
        public int Stock_Producto_ { get => Stock_Producto; set => Stock_Producto = value; }
        public bool Estado_Producto_ { get => Estado_Producto; set => Estado_Producto = value; }
        public Categoria Cat { get => cat; set => cat = value; }
    }
}
